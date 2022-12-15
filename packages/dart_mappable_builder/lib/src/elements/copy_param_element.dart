import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../utils.dart';
import 'class_mapper_element.dart';
import 'mapper_param_element.dart';

class CopyParamElement {
  static Iterable<CopyParamElement> collectFrom(
      List<MapperParamElement> params,
      ClassMapperElement target) sync* {
    for (var param in target.params) {
      if (param is UnresolvedParamElement) {
        continue;
      }

      ClassMapperElement? resolveElement(Element? element) {
        var classTarget = target.parent.getTargetForElement(element);
        if (classTarget is ClassMapperElement &&
            classTarget.shouldGenerate(GenerateMethods.copy) &&
            (classTarget.hasCallableConstructor ||
                classTarget.superTarget != null ||
                classTarget.subTargets.isNotEmpty)) {
          return classTarget;
        }
        return null;
      }

      CopyParamElement makeCollectionConfig(int valueIndex, String name) {
        var it = param.parameter.type as InterfaceType;
        var itemElement = it.typeArguments[valueIndex].element;
        var itemConfig = resolveElement(itemElement);

        var forceNullable = target.subTargets.isNotEmpty;

        var itemHasSubConfigs = itemConfig?.subTargets.isNotEmpty ?? false;
        var itemHassuperTarget = itemConfig?.superTarget != null;

        return CollectionCopyParamElement(
          param: param,
          name: name,
          itemName: itemConfig?.uniqueClassName ?? 'Object',
          itemHasSubConfigs: itemHasSubConfigs,
          itemHassuperTarget: itemHassuperTarget,
          namespace: target.parent.namespace,
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
          var hasSubConfigs = classConfig.subTargets.isNotEmpty;
          var hassuperTarget = classConfig.superTarget != null;

          yield CopyParamElement(
            param: param,
            name: classConfig.uniqueClassName,
            hasSubConfigs: hasSubConfigs,
            hassuperTarget: hassuperTarget,
            namespace: target.parent.namespace,
          );
        }
      }
    }
  }

  CopyParamElement({
    required this.param,
    required this.name,
    this.hasSubConfigs = false,
    this.hassuperTarget = false,
    required this.namespace,
  });

  final MapperParamElement param;
  final String name;
  final bool hasSubConfigs;
  final bool hassuperTarget;
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
  String get superTypeParam => hasSubConfigs || hassuperTarget
      ? ', ${namespace.prefixedType(p.type, withNullability: false)}'
      : '';

  String get invocation {
    return '\$value.${a.name}${a.type.isNullable ? '?' : ''}.copyWith.chain(\$identity, $invocationThen)';
  }
}

class CollectionCopyParamElement extends CopyParamElement {
  CollectionCopyParamElement({
    required super.param,
    required super.name,
    required this.itemName,
    required this.itemHasSubConfigs,
    required this.itemHassuperTarget,
    required super.namespace,
    required this.forceNullable,
    required this.valueIndex,
  });

  final String itemName;
  final bool itemHasSubConfigs;
  final bool itemHassuperTarget;
  final bool forceNullable;
  final int valueIndex;

  late DartType itemType = (p.type as InterfaceType).typeArguments[valueIndex];
  late bool itemTypeNullable =
      itemType.nullabilitySuffix == NullabilitySuffix.question;

  late String itemOptSubTypeParam = itemHasSubConfigs
      ? ', ${namespace.prefixedType(itemType, withNullability: false)}'
      : '';
  late String itemOptSuperTypeParam = itemHasSubConfigs || itemHassuperTarget
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
          '(v, t) => v${itemTypeNullable ? '?' : ''}.copyWith.chain(\$identity, t)';
    }

    var result =
        '${name}CopyWith(\$value.${a.name}${a.type.isNullable ? '!' : ''}, $itemInvocation, $invocationThen)';
    if (a.type.isNullable) {
      result = '\$value.${a.name} != null ? $result : null';
    }
    return result;
  }
}
