import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../config/class_mapper_config.dart';
import '../config/parameter_config.dart';
import '../imports_builder.dart';
import '../utils.dart';

typedef GetConfig = ClassMapperConfig? Function(Element? e);

class CopyWithGenerator {
  final ClassMapperConfig config;
  final ImportsBuilder imports;

  CopyWithGenerator(this.config, this.imports);

  String generateCopyWithExtension() {
    if (config.hasCallableConstructor &&
        config.shouldGenerate(GenerateMethods.copy)) {
      return '  ${_generateCopyWith()}\n';
    } else {
      return '';
    }
  }

  String generateCopyWithClasses(GetConfig getConfig) {
    if (config.hasCallableConstructor &&
        config.shouldGenerate(GenerateMethods.copy)) {
      return '\n\n${_generateCopyWithClasses(getConfig)}';
    } else {
      return '';
    }
  }

  String _generateCopyWith() {
    var classTypeParams = config.element.typeParameters.isNotEmpty
        ? ', ${config.element.typeParameters.map((p) => p.name).join(', ')}'
        : '';

    return '${config.className}CopyWith<${config.prefixedClassName}${config.typeParams}$classTypeParams> get copyWith => ${config.className}CopyWith(this, \$identity);';
  }

  String _generateCopyWithClasses(GetConfig getConfig) {
    var classTypeParamsDef = config.element.typeParameters
        .map((p) => ', ${p.getDisplayString(withNullability: true)}')
        .join();
    var classTypeParams =
        config.element.typeParameters.map((p) => ', ${p.name}').join();

    var snippets = <String>[];

    snippets.add(''
        'abstract class ${config.className}CopyWith<\$R$classTypeParamsDef> {\n'
        '  factory ${config.className}CopyWith(${config.prefixedClassName}${config.typeParams} value, Then<${config.prefixedClassName}${config.typeParams}, \$R> then) = _${config.className}CopyWithImpl<\$R$classTypeParams>;\n');

    var copyParams = <ParameterConfig, ClassMapperConfig?>{};

    for (var param in config.params) {
      if (param is UnresolvedParameterConfig) {
        continue;
      }

      Element? classElement;
      if (param.parameter.type.isDartCoreList) {
        var it = param.parameter.type as InterfaceType;
        classElement = it.typeArguments.first.element;
      } else if (param.parameter.type.isDartCoreMap) {
        var it = param.parameter.type as InterfaceType;
        classElement = it.typeArguments[1].element;
      } else {
        classElement = param.parameter.type.element;
      }

      var classConfig = getConfig(classElement);
      if (classConfig != null &&
          classConfig.hasCallableConstructor &&
          classConfig.shouldGenerate(GenerateMethods.copy)) {
        copyParams[param] = classConfig;
      }
    }

    for (var param in copyParams.keys) {
      var p = param.parameter;
      var a = param.accessor;
      var classConfig = copyParams[param]!;

      var fieldTypeParams = p.type is InterfaceType
          ? (p.type as InterfaceType)
              .typeArguments
              .map((t) => ', ${imports.prefixedType(t)}')
              .join()
          : '';

      var copyWithName = '${classConfig.className}CopyWith';

      if (p.type.isDartCoreList) {
        var typeArg = (p.type as InterfaceType).typeArguments.first;
        var typeParams = typeArg is InterfaceType
            ? typeArg.typeArguments
                .map((t) => ', ${imports.prefixedType(t)}')
                .join()
            : '';

        fieldTypeParams += ', $copyWithName<\$R$typeParams>';
        copyWithName = 'ListCopyWith';
      } else if (p.type.isDartCoreMap) {
        var it = p.type as InterfaceType;

        var valueTypeArg = it.typeArguments[1];
        var typeParams = valueTypeArg is InterfaceType
            ? valueTypeArg.typeArguments
                .map((t) => ', ${imports.prefixedType(t)}')
                .join()
            : '';

        fieldTypeParams += ', $copyWithName<\$R$typeParams>';
        copyWithName = 'MapCopyWith';
      }
      snippets.add(
          '  $copyWithName<\$R$fieldTypeParams>${a.type.isNullable ? '?' : ''} get ${a.name};\n');
    }

    snippets.add('  \$R call(${_generateCopyWithParams()});\n'
        '  \$R apply(${config.prefixedClassName}${config.typeParams} Function(${config.prefixedClassName}${config.typeParams}) transform);\n'
        '}\n\n'
        'class _${config.className}CopyWithImpl<\$R$classTypeParamsDef> extends BaseCopyWith<${config.prefixedClassName}${config.typeParams}, \$R> implements ${config.className}CopyWith<\$R$classTypeParams> {\n'
        '  _${config.className}CopyWithImpl(${config.prefixedClassName}${config.typeParams} value, Then<${config.prefixedClassName}${config.typeParams}, \$R> then) : super(value, then);\n'
        '\n');

    for (var param in copyParams.keys) {
      var p = param.parameter;
      var a = param.accessor;
      var classConfig = copyParams[param]!;

      var fieldTypeParams = p.type is InterfaceType
          ? (p.type as InterfaceType)
              .typeArguments
              .map((t) => ', ${imports.prefixedType(t)}')
              .join()
          : '';
      var copyWithName = '${classConfig.className}CopyWith';
      var params = ', (v) => call(${p.name}: v)';

      if (p.type.isDartCoreList) {
        params = ', (v, t) => $copyWithName(v, t)$params';

        var typeArg = (p.type as InterfaceType).typeArguments.first;
        var typeParams = typeArg is InterfaceType
            ? typeArg.typeArguments
                .map((t) => ', ${imports.prefixedType(t)}')
                .join()
            : '';

        fieldTypeParams += ', $copyWithName<\$R$typeParams>';
        copyWithName = 'ListCopyWith';
      } else if (p.type.isDartCoreMap) {
        params = ', (v, t) => $copyWithName(v, t)$params';

        var typeArg = (p.type as InterfaceType).typeArguments[1];
        var typeParams = typeArg is InterfaceType
            ? typeArg.typeArguments
                .map((t) => ', ${imports.prefixedType(t)}')
                .join()
            : '';

        fieldTypeParams += ', $copyWithName<\$R$typeParams>';
        copyWithName = 'MapCopyWith';
      }

      snippets.add(
          '  @override $copyWithName<\$R$fieldTypeParams>${a.type.isNullable ? '?' : ''} get ${a.name} => ');

      if (a.type.isNullable) {
        snippets.add(
            '\$value.${a.name} != null ? $copyWithName(\$value.${a.name}!$params) : null;\n');
      } else {
        snippets.add('$copyWithName(\$value.${a.name}$params);\n');
      }
    }

    snippets.add(
        '  @override \$R call(${_generateCopyWithParams(implVersion: true)}) => \$then(${config.prefixedClassName}${config.constructor!.name != '' ? '.${config.constructor!.name}' : ''}(${_generateCopyWithConstructorParams()}));\n'
        '}');

    return snippets.join();
  }

  String _generateCopyWithParams({bool implVersion = false}) {
    if (config.params.isEmpty) return '';

    List<String> params = [];
    for (var param in config.params) {
      var p = param.parameter;

      var type = imports.prefixedType(p.type, withNullability: false);

      if (param is UnresolvedParameterConfig) {
        if (p.type.isNullable) {
          var isDynamic = p.type.isDynamic;
          params.add('$type${isDynamic ? '' : '?'} ${p.name}');
        } else {
          params.add('required $type ${p.name}');
        }
      } else {
        var isDynamic = p.type.isDynamic;
        if (implVersion && (p.type.isNullable || isDynamic)) {
          params.add('Object? ${p.name} = \$none');
        } else {
          params.add('$type${isDynamic ? '' : '?'} ${p.name}');
        }
      }
    }

    return '{${params.join(', ')}}';
  }

  String _generateCopyWithConstructorParams() {
    List<String> params = [];
    for (var param in config.params) {
      var p = param.parameter;
      var str = '';

      if (p.isNamed) {
        str = '${p.name}: ';
      }

      if (param is UnresolvedParameterConfig) {
        str += p.name;
      } else {
        var a = param.accessor;
        if (p.type.isNullable || p.type.isDynamic) {
          str += 'or(${p.name}, \$value.${a.name})';
        } else {
          str += '${p.name} ?? \$value.${a.name}';
        }
      }

      params.add(str);
    }
    return params.join(', ');
  }
}
