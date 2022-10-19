import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../imports_builder.dart';
import 'class_mapper_config.dart';
import 'parameter_config.dart';

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

  static Iterable<CopyParamConfig> collectFrom(
      List<ParameterConfig> params,
      ClassMapperConfig config,
      ImportsBuilder imports,
      GetConfig getConfig) sync* {
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

        yield ListCopyParamConfig(
          param,
          itemConfig?.uniqueClassName ?? 'Object',
          imports,
          hasSubConfigs,
        );
      } else if (param.parameter.type.isDartCoreMap) {
        var it = param.parameter.type as InterfaceType;
        var valueElement = it.typeArguments[1].element2;
        var valueConfig = resolveElement(valueElement);

        var hasSubConfigs = config.subConfigs.isNotEmpty;

        yield MapCopyParamConfig(
          param,
          valueConfig?.uniqueClassName ?? 'Object',
          imports,
          hasSubConfigs,
        );
      } else {
        var classElement = param.parameter.type.element2;
        var classConfig = resolveElement(classElement);

        if (classConfig != null) {
          yield CopyParamConfig(param, classConfig.uniqueClassName, imports);
        }
      }
    }
  }
}

class ListCopyParamConfig extends CopyParamConfig {
  ListCopyParamConfig(ParameterConfig param, this.itemName,
      ImportsBuilder imports, this.forceNullable)
      : super(param, 'List', imports);

  final String itemName;
  final bool forceNullable;

  @override
  String get implName => '${name}CopyWith';

  String get itemImplName =>
      itemName == 'Object' ? 'ObjectCopyWith' : '_${itemName}CopyWithImpl';

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

  String get valueImplName =>
      valueName == 'Object' ? 'ObjectCopyWith' : '_${valueName}CopyWithImpl';

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
