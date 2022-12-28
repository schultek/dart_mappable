import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../mapper_group.dart';
import '../utils.dart';
import 'alias_class_mapper_element.dart';
import 'class_mapper_element.dart';
import 'mapper_param_element.dart';

class CopyParamElement {
  static Iterable<CopyParamElement> collectFrom(
      List<MapperParamElement> params, ClassMapperElement target) sync* {
    for (var param in target.params) {
      if (param is UnresolvedParamElement) {
        continue;
      }

      ClassMapperElement? resolveElement(Element? element) {
        var classTarget = target.parent.getMapperForElement(element);

        if (classTarget is! ClassMapperElement ||
            !classTarget.shouldGenerate(GenerateMethods.copy)) return null;
        if (classTarget is AliasClassMapperElement &&
            element == classTarget.targetElement) return null;
        if (classTarget.hasCallableConstructor ||
            classTarget.superTarget != null ||
            classTarget.subTargets.isNotEmpty) {
          return classTarget;
        }
        return null;
      }

      CopyParamElement makeCollectionConfig(int valueIndex, String name) {
        var it = param.parameter.type as InterfaceType;
        var itemType = it.typeArguments[valueIndex];
        var itemElement = itemType.element;

        if (itemElement is TypeParameterElement) {
          itemElement = itemElement.bound?.element;
        }

        var itemConfig = resolveElement(itemElement);

        var forceNullable = target.subTargets.isNotEmpty;

        var itemHasSubConfigs =
            true; //itemConfig?.subTargets.isNotEmpty ?? false;
        var itemHasSuperTarget = itemConfig?.superTarget != null;

        var itemPrefixedName = itemConfig != null
            ? target.parent.prefixOfElement(itemConfig.element) +
                itemConfig.uniqueClassName
            : 'Object';

        return CollectionCopyParamElement(
          parent: target.parent,
          param: param,
          name: name,
          itemName: itemPrefixedName,
          itemHasSubConfigs: itemHasSubConfigs,
          itemHassuperTarget: itemHasSuperTarget,
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
          var hasSubConfigs = true; //classConfig.subTargets.isNotEmpty;
          var hasSuperTarget = classConfig.superTarget != null;

          var prefixedName =
              target.parent.prefixOfElement(classConfig.element) +
                  classConfig.uniqueClassName;

          yield CopyParamElement(
            parent: target.parent,
            param: param,
            name: prefixedName,
            hasSubConfigs: hasSubConfigs,
            hassuperTarget: hasSuperTarget,
          );
        }
      }
    }
  }

  CopyParamElement({
    required this.parent,
    required this.param,
    required this.name,
    this.hasSubConfigs = false,
    this.hassuperTarget = false,
  });

  final MapperElementGroup parent;
  final MapperParamElement param;
  final String name;
  final bool hasSubConfigs;
  final bool hassuperTarget;

  late ParameterElement p = param.parameter;
  late PropertyInducingElement a = param.accessor;

  String get fieldTypeParams => p.type is InterfaceType
      ? (p.type as InterfaceType)
          .typeArguments
          .map((t) => ', ${parent.prefixedType(t)}')
          .join()
      : '';

  String get invocationThen => '(v) => call(${param.superName}: v)';

  String get subTypeParam => hasSubConfigs
      ? ', ${parent.prefixedType(p.type, withNullability: false)}'
      : '';
  String get superTypeParam => hasSubConfigs || hassuperTarget
      ? ', ${parent.prefixedType(p.type, withNullability: false)}'
      : '';

  String get invocation {
    return '\$value.${a.name}${a.type.isNullable ? '?' : ''}.copyWith.chain(\$identity, $invocationThen)';
  }
}

class CollectionCopyParamElement extends CopyParamElement {
  CollectionCopyParamElement({
    required super.parent,
    required super.param,
    required super.name,
    required this.itemName,
    required this.itemHasSubConfigs,
    required this.itemHassuperTarget,
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
      ? ', ${parent.prefixedType(itemType, withNullability: false)}'
      : '';
  late String itemOptSuperTypeParam = itemHasSubConfigs || itemHassuperTarget
      ? ', ${parent.prefixedType(itemType, withNullability: false)}'
      : '';

  @override
  String get fieldTypeParams {
    if (itemName == 'Object') {
      var objectTypeParam = ', ${parent.prefixedType(itemType)}';
      return '${super.fieldTypeParams}, ObjectCopyWith<\$R$objectTypeParam$objectTypeParam>${itemTypeNullable || forceNullable ? '?' : ''}';
    }

    var typeParams = itemType is InterfaceType
        ? (itemType as InterfaceType)
            .typeArguments
            .map((t) => ', ${parent.prefixedType(t)}')
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
      var isBounded = itemType is TypeParameterType;

      itemInvocation = isBounded ? '\$cast' : '\$identity';
      itemInvocation =
          'v${itemTypeNullable ? '?' : ''}.copyWith.chain<\$R${super.fieldTypeParams}>($itemInvocation, t)';

      if (isBounded) {
        itemInvocation = '\$cast($itemInvocation)';
      }

      itemInvocation = '(v, t) => $itemInvocation';
    }

    var result =
        '${name}CopyWith(\$value.${a.name}${a.type.isNullable ? '!' : ''}, $itemInvocation, $invocationThen)';
    if (a.type.isNullable) {
      result = '\$value.${a.name} != null ? $result : null';
    }
    return result;
  }
}
