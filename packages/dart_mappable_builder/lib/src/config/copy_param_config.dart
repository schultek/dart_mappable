import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../imports_builder.dart';
import '../utils.dart';
import 'class_mapper_config.dart';
import 'parameter_config.dart';

typedef GetConfig = ClassMapperConfig? Function(Element? e);

class CopyParamConfig {
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
            classConfig.shouldGenerate(GenerateMethods.copy) &&
            (classConfig.hasCallableConstructor ||
                classConfig.superConfig != null ||
                classConfig.subConfigs.isNotEmpty)) {
          return classConfig;
        }
        return null;
      }

      CopyParamConfig makeCollectionConfig(int valueIndex, String name) {
        var it = param.parameter.type as InterfaceType;
        var itemElement = it.typeArguments[valueIndex].element2;
        var itemConfig = resolveElement(itemElement);

        var forceNullable = config.subConfigs.isNotEmpty;

        var itemHasSubConfigs = itemConfig?.subConfigs.isNotEmpty ?? false;
        var itemHasSuperConfig = itemConfig?.superConfig != null;
        var itemSubTypeParam = itemHasSubConfigs
            ? '${itemConfig!.prefixedClassName}${itemConfig.typeParams}'
            : null;
        var itemSuperTypeParam = itemHasSubConfigs || itemHasSuperConfig
            ? '${itemConfig!.prefixedClassName}${itemConfig.typeParams}'
            : null;

        return CollectionCopyParamConfig(
          param: param,
          name: name,
          itemName: itemConfig?.uniqueClassName ?? 'Object',
          itemSubTypeParam: itemSubTypeParam,
          itemSuperTypeParam: itemSuperTypeParam,
          imports: imports,
          forceNullable: forceNullable,
          valueIndex: valueIndex,
        );
      }

      if (param.parameter.type.isDartCoreList) {
        yield makeCollectionConfig(0, 'List');
      } else if (param.parameter.type.isDartCoreMap) {
        yield makeCollectionConfig(1, 'Map');
      } else {
        var classElement = param.parameter.type.element2;
        var classConfig = resolveElement(classElement);

        if (classConfig != null) {
          var hasSubConfigs = classConfig.subConfigs.isNotEmpty;
          var hasSuperConfig = classConfig.superConfig != null;

          var selfSubTypeParam = hasSubConfigs
              ? '${classConfig.prefixedClassName}${classConfig.typeParams}'
              : null;
          var selfSuperTypeParam = hasSubConfigs || hasSuperConfig
              ? '${classConfig.prefixedClassName}${classConfig.typeParams}'
              : null;


          yield CopyParamConfig(
            param: param,
            name: classConfig.uniqueClassName,
            selfSubTypeParam: selfSubTypeParam,
            selfSuperTypeParam: selfSuperTypeParam,
            imports: imports,
          );
        }
      }
    }
  }

  CopyParamConfig(
      {required this.param,
      required this.name,
        this.selfSubTypeParam,
      this.selfSuperTypeParam,
      required this.imports});

  final ParameterConfig param;
  final String name;
  final String? selfSubTypeParam;
  final String? selfSuperTypeParam;
  final ImportsBuilder imports;

  ParameterElement get p => param.parameter;
  PropertyInducingElement get a => param.accessor;

  String get fieldTypeParams => p.type is InterfaceType
      ? (p.type as InterfaceType)
          .typeArguments
          .map((t) => ', ${imports.prefixedType(t)}')
          .join()
      : '';

  String get invocationThen => '(v) => call(${param.superName}: v)';

  String get subTypeParam => selfSubTypeParam != null ? ', $selfSubTypeParam' : '';
  String get superTypeParam => selfSuperTypeParam != null ? ', $selfSuperTypeParam' : '';

  String get invocation {
    return '\$value.${a.name}${a.type.isNullable ? '?' : ''}.copyWith._chain($invocationThen, \$identity)';
  }
}

class CollectionCopyParamConfig extends CopyParamConfig {
  CollectionCopyParamConfig({
    required super.param,
    required super.name,
    required this.itemName,
    this.itemSubTypeParam,
    this.itemSuperTypeParam,
    required super.imports,
    required this.forceNullable,
    required this.valueIndex,
  });

  final String itemName;
  final String? itemSubTypeParam;
  final String? itemSuperTypeParam;
  final bool forceNullable;
  final int valueIndex;

  String get itemImplName =>
      itemName == 'Object' ? 'ObjectCopyWith' : '_${itemName}CopyWithImpl';

  String get itemOptSubTypeParam =>
      itemSubTypeParam != null ? ', $itemSubTypeParam' : '';
  String get itemOptSuperTypeParam =>
      itemSuperTypeParam != null ? ', $itemSuperTypeParam' : '';

  @override
  String get fieldTypeParams {
    var itemTypeArg = (p.type as InterfaceType).typeArguments[valueIndex];
    var typeArgNullable =
        itemTypeArg.nullabilitySuffix == NullabilitySuffix.question;

    if (itemName == 'Object') {
      var objectTypeParam = ', ${imports.prefixedType(itemTypeArg)}';
      return super.fieldTypeParams +
          ', ObjectCopyWith<\$R$objectTypeParam$objectTypeParam>${typeArgNullable || forceNullable ? '?' : ''}';
    }

    var typeParams = itemTypeArg is InterfaceType
        ? itemTypeArg.typeArguments
            .map((t) => ', ${imports.prefixedType(t)}')
            .join()
        : '';

    return super.fieldTypeParams +
        ', ${itemName}CopyWith<\$R$itemOptSubTypeParam$itemOptSuperTypeParam$typeParams>${typeArgNullable ? '?' : ''}';
  }

  @override
  String get invocation {
    var typeArg = (p.type as InterfaceType).typeArguments[valueIndex];
    var typeArgNullable =
        typeArg.nullabilitySuffix == NullabilitySuffix.question;

    String itemInvocation;
    if (itemName == 'Object') {
      itemInvocation = '(v, t) => ObjectCopyWith(v, t, \$identity)';
    } else {
      itemInvocation = '(v, t) => v${typeArgNullable ? '?' : ''}.copyWith._chain(t, \$identity)';
    }

    var result = '${name}CopyWith(\$value.${a.name}${a.type.isNullable ? '!' : ''}, $itemInvocation, $invocationThen)';
    if (a.type.isNullable) {
      result = '\$value.${a.name} != null ? $result : null';
    }
    return result;
  }
}

class ListCopyParamConfig extends CollectionCopyParamConfig {
  ListCopyParamConfig({
    required super.param,
    required super.itemName,
    required super.imports,
    required super.forceNullable,
  }) : super(name: 'List', valueIndex: 0);
}

class MapCopyParamConfig extends CollectionCopyParamConfig {
  MapCopyParamConfig({
    required super.param,
    required super.itemName,
    required super.imports,
    required super.forceNullable,
  }) : super(name: 'Map', valueIndex: 1);
}
