import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../utils.dart';
import 'class_mapper_config.dart';
import 'parameter_config.dart';

typedef GetConfig = ClassMapperConfig? Function(Element? e);

class CopyParamConfig {
  static Iterable<CopyParamConfig> collectFrom(
      List<ParameterConfig> params,
      ClassMapperConfig config,
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
        var itemElement = it.typeArguments[valueIndex].element;
        var itemConfig = resolveElement(itemElement);

        var forceNullable = config.subConfigs.isNotEmpty;

        var itemHasSubConfigs = itemConfig?.subConfigs.isNotEmpty ?? false;
        var itemHasSuperConfig = itemConfig?.superConfig != null;

        return CollectionCopyParamConfig(
          param: param,
          name: name,
          itemName: itemConfig?.uniqueClassName ?? 'Object',
          itemHasSubConfigs: itemHasSubConfigs,
          itemHasSuperConfig: itemHasSuperConfig,
          namespace: config.namespace,
          forceNullable: forceNullable,
          valueIndex: valueIndex,
        );
      }

      if (param.parameter.type.isDartCoreList) {
        yield makeCollectionConfig(0, 'List');
      } else if (param.parameter.type.isDartCoreMap) {
        yield makeCollectionConfig(1, 'Map');
      } else {
        var classElement = param.parameter.type.element;
        var classConfig = resolveElement(classElement);

        if (classConfig != null) {
          var hasSubConfigs = classConfig.subConfigs.isNotEmpty;
          var hasSuperConfig = classConfig.superConfig != null;

          yield CopyParamConfig(
            param: param,
            name: classConfig.uniqueClassName,
            hasSubConfigs: hasSubConfigs,
            hasSuperConfig: hasSuperConfig,
            namespace: config.namespace,
          );
        }
      }
    }
  }

  CopyParamConfig({
    required this.param,
    required this.name,
    this.hasSubConfigs = false,
    this.hasSuperConfig = false,
    required this.namespace,
  });

  final ParameterConfig param;
  final String name;
  final bool hasSubConfigs;
  final bool hasSuperConfig;
  final Namespace namespace;

  late ParameterElement p = param.parameter;
  late PropertyInducingElement a = param.accessor;

  String get fieldTypeParams => p.type is InterfaceType
      ? (p.type as InterfaceType)
          .typeArguments
          .map((t) => ', ${namespace.prefixedType(t)}')
          .join()
      : '';

  String get invocationThen => '(v) => call(${param.superName}: v)';

  String get subTypeParam => hasSubConfigs
      ? ', ${namespace.prefixedType(p.type, withNullability: false)}'
      : '';
  String get superTypeParam => hasSubConfigs || hasSuperConfig
      ? ', ${namespace.prefixedType(p.type, withNullability: false)}'
      : '';

  String get invocation {
    return '\$value.${a.name}${a.type.isNullable ? '?' : ''}.copyWith._chain(\$identity, $invocationThen)';
  }
}

class CollectionCopyParamConfig extends CopyParamConfig {
  CollectionCopyParamConfig({
    required super.param,
    required super.name,
    required this.itemName,
    required this.itemHasSubConfigs,
    required this.itemHasSuperConfig,
    required super.namespace,
    required this.forceNullable,
    required this.valueIndex,
  });

  final String itemName;
  final bool itemHasSubConfigs;
  final bool itemHasSuperConfig;
  final bool forceNullable;
  final int valueIndex;

  late String itemImplName =
      itemName == 'Object' ? 'ObjectCopyWith' : '_${itemName}CopyWithImpl';

  late DartType itemType = (p.type as InterfaceType).typeArguments[valueIndex];
  late bool itemTypeNullable =
      itemType.nullabilitySuffix == NullabilitySuffix.question;

  late String itemOptSubTypeParam = itemHasSubConfigs
      ? ', ${namespace.prefixedType(itemType, withNullability: false)}'
      : '';
  late String itemOptSuperTypeParam = itemHasSubConfigs || itemHasSuperConfig
      ? ', ${namespace.prefixedType(itemType, withNullability: false)}'
      : '';

  @override
  String get fieldTypeParams {
    if (itemName == 'Object') {
      var objectTypeParam = ', ${namespace.prefixedType(itemType)}';
      return '${super.fieldTypeParams}, ObjectCopyWith<\$R$objectTypeParam$objectTypeParam>${itemTypeNullable || forceNullable ? '?' : ''}';
    }

    var typeParams = itemType is InterfaceType
        ? (itemType as InterfaceType)
            .typeArguments
            .map((t) => ', ${namespace.prefixedType(t)}')
            .join()
        : '';

    return '${super.fieldTypeParams}, ${itemName}CopyWith<\$R$itemOptSubTypeParam$itemOptSuperTypeParam$typeParams>${itemTypeNullable ? '?' : ''}';
  }

  @override
  String get invocation {
    String itemInvocation;
    if (itemName == 'Object') {
      itemInvocation = '(v, t) => ObjectCopyWith(v, \$identity, t)';
    } else {
      itemInvocation =
          '(v, t) => v${itemTypeNullable ? '?' : ''}.copyWith._chain(\$identity, t)';
    }

    var result =
        '${name}CopyWith(\$value.${a.name}${a.type.isNullable ? '!' : ''}, $itemInvocation, $invocationThen)';
    if (a.type.isNullable) {
      result = '\$value.${a.name} != null ? $result : null';
    }
    return result;
  }
}
