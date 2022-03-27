import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import '../../../dart_mappable.dart';
import '../config/class_mapper_config.dart';
import '../utils.dart';

typedef GetConfig = ClassMapperConfig? Function(Element? e);

class CopyWithGenerator {
  String generateCopyWithExtension(
    ClassMapperConfig config,
  ) {
    if (config.hasCallableConstructor &&
        config.shouldGenerate(GenerateMethods.copy)) {
      return '  ${_generateCopyWith(config)}\n';
    } else {
      return '';
    }
  }

  String generateCopyWithClasses(
      ClassMapperConfig config, GetConfig getConfig) {
    if (config.hasCallableConstructor &&
        config.shouldGenerate(GenerateMethods.copy)) {
      return '\n\n' + _generateCopyWithClasses(config, getConfig);
    } else {
      return '';
    }
  }

  String _generateCopyWith(ClassMapperConfig config) {
    var classTypeParams = config.element.typeParameters.isNotEmpty
        ? ', ${config.element.typeParameters.map((p) => p.name).join(', ')}'
        : '';

    return '${config.className}CopyWith<${config.className}${config.typeParams}$classTypeParams> get copyWith => ${config.className}CopyWith(this, \$identity);';
  }

  String _generateCopyWithClasses(
      ClassMapperConfig config, GetConfig getConfig) {
    var copyFields = config.constructor!.parameters.map((param) {
      if (param is FieldFormalParameterElement || config.hasField(param.name)) {
        return param;
      } else if (config.superConfig != null &&
          config.superParams[param.name] != null) {
        return config.superParams[param.name];
      } else {
        return null;
      }
    }).map((p) {
      if (p?.type.isDartCoreList ?? false) {
        var it = p!.type as InterfaceType;
        return MapEntry(p, getConfig(it.typeArguments.first.element));
      } else if (p?.type.isDartCoreMap ?? false) {
        var it = p!.type as InterfaceType;
        return MapEntry(p, getConfig(it.typeArguments[1].element));
      } else {
        return MapEntry(p, getConfig(p?.type.element));
      }
    }).where((b) =>
        (b.value?.hasCallableConstructor ?? false) &&
        (b.value?.shouldGenerate(GenerateMethods.copy) ?? false));

    var classTypeParamsDef = config.element.typeParameters
        .map((p) => ', ${p.getDisplayString(withNullability: true)}')
        .join();
    var classTypeParams =
        config.element.typeParameters.map((p) => ', ${p.name}').join();

    var snippets = <String>[];

    snippets.add(''
        'abstract class ${config.className}CopyWith<\$R$classTypeParamsDef> {\n'
        '  factory ${config.className}CopyWith(${config.className}${config.typeParams} value, Then<${config.className}${config.typeParams}, \$R> then) = _${config.className}CopyWithImpl<\$R$classTypeParams>;\n');

    for (var b in copyFields) {
      var fieldTypeParams = b.key!.type is InterfaceType
          ? (b.key!.type as InterfaceType)
              .typeArguments
              .map((t) => ', ${t.getDisplayString(withNullability: true)}')
              .join()
          : '';
      var copyWithName = '${b.value!.className}CopyWith';

      if (b.key!.type.isDartCoreList) {
        var typeArg = (b.key!.type as InterfaceType).typeArguments.first;
        var typeParams = typeArg is InterfaceType
            ? typeArg.typeArguments
                .map((t) => ', ${t.getDisplayString(withNullability: true)}')
                .join()
            : '';
        fieldTypeParams += ', $copyWithName<\$R$typeParams>';
        copyWithName = 'ListCopyWith';
      } else if (b.key!.type.isDartCoreMap) {
        var it = b.key!.type as InterfaceType;

        var valueTypeArg = it.typeArguments[1];

        var typeParams = valueTypeArg is InterfaceType
            ? valueTypeArg.typeArguments
                .map((t) => ', ${t.getDisplayString(withNullability: true)}')
                .join()
            : '';
        fieldTypeParams += ', $copyWithName<\$R$typeParams>';
        copyWithName = 'MapCopyWith';
      }
      snippets.add(
          '  $copyWithName<\$R$fieldTypeParams>${b.key!.type.isNullable ? '?' : ''} get ${b.key!.name};\n');
    }

    snippets.add('  \$R call(${_generateCopyWithParams(config)});\n'
        '  \$R apply(${config.className}${config.typeParams} Function(${config.className}${config.typeParams}) transform);\n'
        '}\n\n'
        'class _${config.className}CopyWithImpl<\$R$classTypeParamsDef> extends BaseCopyWith<${config.className}${config.typeParams}, \$R> implements ${config.className}CopyWith<\$R$classTypeParams> {\n'
        '  _${config.className}CopyWithImpl(${config.className}${config.typeParams} value, Then<${config.className}${config.typeParams}, \$R> then) : super(value, then);\n'
        '\n');

    for (var b in copyFields) {
      var fieldTypeParams = b.key!.type is InterfaceType
          ? (b.key!.type as InterfaceType)
              .typeArguments
              .map((t) => ', ${t.getDisplayString(withNullability: true)}')
              .join()
          : '';
      var copyWithName = '${b.value!.className}CopyWith';
      var params = ', (v) => call(${b.key!.name}: v)';

      if (b.key!.type.isDartCoreList) {
        params = ', (v, t) => $copyWithName(v, t)$params';
        var typeArg = (b.key!.type as InterfaceType).typeArguments.first;
        var typeParams = typeArg is InterfaceType
            ? typeArg.typeArguments
                .map((t) => ', ${t.getDisplayString(withNullability: true)}')
                .join()
            : '';
        fieldTypeParams += ', $copyWithName<\$R$typeParams>';
        copyWithName = 'ListCopyWith';
      } else if (b.key!.type.isDartCoreMap) {
        params = ', (v, t) => $copyWithName(v, t)$params';
        var typeArg = (b.key!.type as InterfaceType).typeArguments[1];
        var typeParams = typeArg is InterfaceType
            ? typeArg.typeArguments
                .map((t) => ', ${t.getDisplayString(withNullability: true)}')
                .join()
            : '';
        fieldTypeParams += ', $copyWithName<\$R$typeParams>';
        copyWithName = 'MapCopyWith';
      }

      snippets.add(
          '  @override $copyWithName<\$R$fieldTypeParams>${b.key!.type.isNullable ? '?' : ''} get ${b.key!.name} => ');

      if (b.key!.type.isNullable) {
        snippets.add(
            '\$value.${b.key!.name} != null ? $copyWithName(\$value.${b.key!.name}!$params) : null;\n');
      } else {
        snippets.add('$copyWithName(\$value.${b.key!.name}$params);\n');
      }
    }

    snippets.add(
        '  @override \$R call(${_generateCopyWithParams(config, implVersion: true)}) => \$then(${config.element.name}${config.constructor!.name != '' ? '.${config.constructor!.name}' : ''}(${_generateCopyWithConstructorParams(config)}));\n'
        '}');

    return snippets.join();
  }

  String _generateCopyWithParams(ClassMapperConfig config,
      {bool implVersion = false}) {
    if (config.constructor!.parameters.isEmpty) return '';
    List<String> params = [];
    for (var param in config.constructor!.parameters) {
      var type = param.type.getDisplayString(withNullability: false);
      String paramDef(ParameterElement p) {
        var isDynamic = p.type.isDynamic;
        return implVersion && (p.type.isNullable || isDynamic)
            ? 'Object? ${p.name} = \$none'
            : '$type${isDynamic ? '' : '?'} ${p.name}';
      }

      if (param is FieldFormalParameterElement || config.hasField(param.name)) {
        params.add(paramDef(param));
      } else if (config.superConfig != null &&
          config.superParams[param.name] != null) {
        params.add(paramDef(config.superParams[param.name]!));
      } else {
        if (param.type.isNullable) {
          var isDynamic = param.type.isDynamic;
          params.add('$type${isDynamic ? '' : '?'} ${param.name}');
        } else {
          params.add('required $type ${param.name}');
        }
      }
    }
    return '{${params.join(', ')}}';
  }

  String _generateCopyWithConstructorParams(ClassMapperConfig config) {
    List<String> params = [];
    for (var param in config.constructor!.parameters) {
      var str = '';

      if (param.isNamed) {
        str = '${param.name}: ';
      }

      String paramString(ParameterElement p) {
        if (p.type.isNullable || p.type.isDynamic) {
          return 'or(${p.name}, \$value.${p.name})';
        } else {
          return '${p.name} ?? \$value.${p.name}';
        }
      }

      if (param is FieldFormalParameterElement || config.hasField(param.name)) {
        str += paramString(param);
      } else if (config.superConfig != null &&
          config.superParams[param.name] != null) {
        str += paramString(config.superParams[param.name]!);
      } else {
        str += param.name;
      }
      params.add(str);
    }
    return params.join(', ');
  }
}
