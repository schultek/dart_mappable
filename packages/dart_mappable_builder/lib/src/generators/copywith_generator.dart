import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../config/class_mapper_config.dart';
import '../config/parameter_config.dart';
import '../imports_builder.dart';
import '../utils.dart';

typedef GetConfig = ClassMapperConfig? Function(Element? e);

class CopyParamConfig {
  CopyParamConfig(this.param, this.name, this.imports);

  final ParameterConfig param;
  final String name;
  final ImportsBuilder imports;

  String get implName => '_${name}CopyWithImpl';

  ParameterElement get p => param.parameter;
  PropertyInducingElement get a => param.accessor;

  String get fieldTypeParams => p.type is InterfaceType
      ? (p.type as InterfaceType)
          .typeArguments
          .map((t) => ', ${imports.prefixedType(t)}')
          .join()
      : '';

  String get invocation => ', (v) => call(${param.superName}: v)';
}

class ListCopyParamConfig extends CopyParamConfig {
  ListCopyParamConfig(ParameterConfig param, this.itemName,
      ImportsBuilder imports, this.forceNullable)
      : super(param, 'List', imports);

  final String itemName;
  final bool forceNullable;

  @override
  String get implName => '${name}CopyWith';

  String get itemImplName => itemName == 'Object' ? 'ObjectCopyWith' : '_${itemName}CopyWithImpl';

  @override
  String get fieldTypeParams {
    var typeArg = (p.type as InterfaceType).typeArguments.first;
    var typeArgNullable =
        typeArg.nullabilitySuffix == NullabilitySuffix.question;

    if (itemName == 'Object') {
      return super.fieldTypeParams +
          ', ${itemName}CopyWith<\$R${super.fieldTypeParams}>${typeArgNullable || forceNullable ? '?' : ''}';
    }

    var typeParams = typeArg is InterfaceType
        ? typeArg.typeArguments
            .map((t) => ', ${imports.prefixedType(t)}')
            .join()
        : '';
    return super.fieldTypeParams +
        ', ${itemName}CopyWith<\$R$typeParams>${typeArgNullable ? '?' : ''}';
  }

  @override
  String get invocation {
    var typeArg = (p.type as InterfaceType).typeArguments.first;
    var typeArgNullable =
        typeArg.nullabilitySuffix == NullabilitySuffix.question;

    return ', (v, t) => ${typeArgNullable ? 'v == null ? null : ' : ''}$itemImplName(v, t)${super.invocation}';
  }
}

class MapCopyParamConfig extends CopyParamConfig {
  MapCopyParamConfig(ParameterConfig param, this.valueName,
      ImportsBuilder imports, this.forceNullable)
      : super(param, 'Map', imports);

  final String valueName;
  final bool forceNullable;

  @override
  String get implName => '${name}CopyWith';

  String get valueImplName => valueName == 'Object' ? 'ObjectCopyWith' : '_${valueName}CopyWithImpl';

  @override
  String get fieldTypeParams {
    var valueTypeArg = (p.type as InterfaceType).typeArguments[1];
    var typeArgNullable =
        valueTypeArg.nullabilitySuffix == NullabilitySuffix.question;

    if (valueName == 'Object') {
      return super.fieldTypeParams +
          ', ${valueName}CopyWith<\$R, ${imports.prefixedType(valueTypeArg)}>${typeArgNullable || forceNullable ? '?' : ''}';
    }

    var typeParams = valueTypeArg is InterfaceType
        ? valueTypeArg.typeArguments
            .map((t) => ', ${imports.prefixedType(t)}')
            .join()
        : '';
    return super.fieldTypeParams +
        ', ${valueName}CopyWith<\$R$typeParams>${typeArgNullable ? '?' : ''}';
  }

  @override
  String get invocation {
    var typeArg = (p.type as InterfaceType).typeArguments[1];
    var typeArgNullable =
        typeArg.nullabilitySuffix == NullabilitySuffix.question;

    return ', (v, t) => ${typeArgNullable ? 'v == null ? null : ' : ''}$valueImplName(v, t)${super.invocation}';
  }
}

class CopyWithGenerator {
  final ClassMapperConfig config;
  final ImportsBuilder imports;

  CopyWithGenerator(this.config, this.imports);

  String generateCopyWithExtension() {
    if (!config.shouldGenerate(GenerateMethods.copy)) return '';
    if (config.hasCallableConstructor &&
        config.superConfig == null &&
        config.subConfigs.isEmpty) {
      return '  ${_generateCopyWith()}\n';
    } else {
      return '';
    }
  }

  String generateCopyWithMixin(GetConfig getConfig) {
    if (!config.shouldGenerate(GenerateMethods.copy)) return '';
    if (config.superConfig != null || config.subConfigs.isNotEmpty) {
      return '\n\n${_generateCopyWithMixin(getConfig)}';
    } else {
      return '';
    }
  }

  String generateCopyWithClasses(GetConfig getConfig) {
    if (!config.shouldGenerate(GenerateMethods.copy)) return '';
    if (config.hasCallableConstructor || config.subConfigs.isNotEmpty) {
      return '\n\n${_generateCopyWithClasses(getConfig)}';
    } else {
      return '';
    }
  }

  String _generateCopyWith() {
    var classTypeParams = config.element.typeParameters.isNotEmpty
        ? ', ${config.element.typeParameters.map((p) => p.name).join(', ')}'
        : '';

    return '${config.uniqueClassName}CopyWith<${config.prefixedClassName}${config.typeParams}$classTypeParams> get copyWith => _${config.uniqueClassName}CopyWithImpl(this, \$identity);';
  }

  String _generateCopyWithMixin(GetConfig getConfig) {
    var classTypeParams = config.element.typeParameters.isNotEmpty
        ? ', ${config.element.typeParameters.map((p) => p.name).join(', ')}'
        : '';

    var valueTypeParam = config.subConfigs.isNotEmpty
        ? ', ${config.prefixedClassName}${config.typeParams}'
        : '';

    var snippet =
        '${config.uniqueClassName}CopyWith<${config.prefixedClassName}${config.typeParams}$valueTypeParam$classTypeParams> get copyWith';

    if (config.hasCallableConstructor) {
      snippet +=
          ' => _${config.uniqueClassName}CopyWithImpl(this as ${config.prefixedClassName}${config.typeParams}, \$identity);';
    } else {
      snippet += ';';
    }

    return 'mixin ${config.uniqueClassName}Mixin${config.typeParamsDeclaration} {\n'
        '  $snippet\n'
        '}';
  }

  String _generateCopyWithClasses(GetConfig getConfig) {
    var classTypeParamsDef = config.typeParamsList.map((p) => ', $p').join();
    var classTypeParams =
        config.element.typeParameters.map((p) => ', ${p.name}').join();

    var snippets = <String>[];

    var selfTypeParam = '${config.prefixedClassName}${config.typeParams}';
    var valueTypeParam = config.subConfigs.isNotEmpty ? ', $selfTypeParam' : '';

    if (config.hasCallableConstructor) {
      snippets.add(
          'extension ${config.uniqueClassName}ObjectCopy<\$R$classTypeParamsDef> on ObjectCopyWith<\$R, $selfTypeParam> {\n'
          '  ${config.uniqueClassName}CopyWith<\$R$valueTypeParam$classTypeParams> get ${CaseStyle.camelCase.transform(config.className)} => chain(_${config.uniqueClassName}CopyWithImpl.new);\n'
          '}\n\n');
    }

    var implementsStmt = '';
    var objTypeParamDef = '';
    var objTypeParam = '';

    if (config.superConfig != null) {
      var superClassTypeParams = config.superTypeArgs.map((a) => ', $a').join();
      implementsStmt =
          ' implements ${config.superConfig!.uniqueClassName}CopyWith<\$R, $selfTypeParam$superClassTypeParams>';
    } else {
      objTypeParamDef =
          config.subConfigs.isNotEmpty ? ', \$V extends $selfTypeParam' : '';
      objTypeParam =
          config.subConfigs.isNotEmpty ? ', \$V' : ', $selfTypeParam';
      implementsStmt = ' implements ObjectCopyWith<\$R$objTypeParam>';
    }

    snippets.add(''
        'abstract class ${config.uniqueClassName}CopyWith<\$R$objTypeParamDef$classTypeParamsDef>$implementsStmt {\n');

    var copyParams = <CopyParamConfig>[];

    for (var param in config.params) {
      if (param is UnresolvedParameterConfig) {
        continue;
      }

      ClassMapperConfig? resolveElement(Element? element) {
        var classConfig = getConfig(element);
        if (classConfig != null &&
            classConfig.hasCallableConstructor &&
            classConfig.shouldGenerate(GenerateMethods.copy)) {
          return classConfig;
        }
        return null;
      }

      if (param.parameter.type.isDartCoreList) {
        var it = param.parameter.type as InterfaceType;
        var itemElement = it.typeArguments.first.element2;
        var itemConfig = resolveElement(itemElement);

        var hasSubConfigs = config.subConfigs.isNotEmpty;

        copyParams.add(ListCopyParamConfig(
          param,
          itemConfig?.uniqueClassName ?? 'Object',
          imports,
          hasSubConfigs,
        ));
      } else if (param.parameter.type.isDartCoreMap) {
        var it = param.parameter.type as InterfaceType;
        var valueElement = it.typeArguments[1].element2;
        var valueConfig = resolveElement(valueElement);

        var hasSubConfigs = config.subConfigs.isNotEmpty;

        copyParams.add(MapCopyParamConfig(
          param,
          valueConfig?.uniqueClassName ?? 'Object',
          imports,
          hasSubConfigs,
        ));
      } else {
        var classElement = param.parameter.type.element2;
        var classConfig = resolveElement(classElement);

        if (classConfig != null) {
          copyParams.add(
              CopyParamConfig(param, classConfig.uniqueClassName, imports));
        }
      }
    }

    for (var param in copyParams) {
      var isOverridden =
          config.superConfig != null && param.param is SuperParameterConfig;
      snippets.add(
          '  ${isOverridden ? '@override ' : ''}${param.name}CopyWith<\$R${param.fieldTypeParams}>${param.a.type.isNullable ? '?' : ''} get ${param.a.name};\n');
    }

    snippets.add(
        '  ${config.superConfig != null ? '@override ' : ''}\$R call(${_generateCopyWithParams()});\n');

    snippets.add('}\n');

    if (config.hasCallableConstructor) {
      snippets.add('\n'
          'class _${config.uniqueClassName}CopyWithImpl<\$R$classTypeParamsDef> '
          'extends BaseCopyWith<$selfTypeParam, \$R> implements ${config.uniqueClassName}CopyWith'
          '<\$R${objTypeParamDef.isNotEmpty ? ', $selfTypeParam' : ''}$classTypeParams> {\n'
          '  _${config.uniqueClassName}CopyWithImpl(super.value, super.then);\n'
          '\n');

      for (var param in copyParams) {
        snippets.add(
            '  @override ${param.name}CopyWith<\$R${param.fieldTypeParams}>${param.a.type.isNullable ? '?' : ''} get ${param.a.name} => ');

        if (param.a.type.isNullable) {
          snippets.add(
              '\$value.${param.a.name} != null ? ${param.implName}(\$value.${param.a.name}!${param.invocation}) : null;\n');
        } else {
          snippets.add(
              '${param.implName}(\$value.${param.a.name}${param.invocation});\n');
        }
      }

      snippets.add(
          '  @override \$R call(${_generateCopyWithParams(implVersion: true)}) => \$then(${config.prefixedClassName}${config.constructor!.name != '' ? '.${config.constructor!.name}' : ''}(${_generateCopyWithConstructorParams()}));\n'
          '}');
    }

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
        var name = param.superName;
        var isDynamic = p.type.isDynamic;
        if (implVersion && (p.type.isNullable || isDynamic)) {
          params.add('Object? $name = \$none');
        } else {
          params.add('$type${isDynamic ? '' : '?'} $name');
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
        var name = param.superName;
        var a = param.accessor;
        if (p.type.isNullable || p.type.isDynamic) {
          str += 'or($name, \$value.${a.name})';
        } else {
          str += '$name ?? \$value.${a.name}';
        }
      }

      params.add(str);
    }
    return params.join(', ');
  }
}
