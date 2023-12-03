import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../mapper_group.dart';
import '../../utils.dart';
import '../class/class_mapper_element.dart';
import 'class_mapper_param_element.dart';

class CopyParamElement {
  static Iterable<CopyParamElement> collectFrom(
      List<ClassMapperParamElement> params, ClassMapperElement element) sync* {
    for (var param in element.params) {
      if (param.accessor == null) {
        continue;
      }
      if (!element.copySafeParams.contains(param)) {
        continue;
      }

      ClassMapperElement? resolveElement(Element? e) {
        if (e is TypeParameterElement && e.bound != null) {
          return resolveElement(e.bound!.element);
        }

        var classTarget = element.parent.getMapperForElement(e);

        if (classTarget is! ClassMapperElement ||
            !classTarget.shouldGenerate(GenerateMethods.copy)) return null;
        if (classTarget.hasCallableConstructor ||
            classTarget.superElement != null ||
            classTarget.subElements.isNotEmpty) {
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

        var itemPrefixedName = itemConfig != null
            ? element.parent.prefixOfElement(itemConfig.element) +
                itemConfig.uniqueClassName
            : 'Object';

        return CollectionCopyParamElement(
          parent: element.parent,
          param: param,
          name: name,
          itemName: itemPrefixedName,
          itemHasSuperElement: itemConfig?.superElement != null,
          forceNullable: element.subElements.isNotEmpty,
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
          var prefixedName =
              element.parent.prefixOfElement(classConfig.annotation.element) +
                  classConfig.uniqueClassName;

          yield CopyParamElement(
            parent: element.parent,
            param: param,
            name: prefixedName,
            hasSuperElement: classConfig.superElement != null,
          );
        }
      }
    }
  }

  CopyParamElement({
    required this.parent,
    required this.param,
    required this.name,
    this.hasSubConfigs = true,
    this.hasSuperElement = false,
  });

  final MapperElementGroup parent;
  final ClassMapperParamElement param;
  final String name;
  final bool hasSubConfigs;
  final bool hasSuperElement;

  late ParameterElement p = param.parameter;
  late PropertyInducingElement a = param.accessor!;

  String get fieldTypeParams => p.type is InterfaceType
      ? (p.type as InterfaceType)
          .typeArguments
          .map((t) => ', ${parent.prefixedType(t)}')
          .join()
      : '';

  String get invocationThen => '(v) => call(${param.superName}: v)';

  String get subTypeParam => hasSubConfigs
      ? ', ${parent.prefixedType(p.type, withNullability: false, resolveBounds: true)}'
      : '';
  String get superTypeParam => hasSubConfigs || hasSuperElement
      ? ', ${parent.prefixedType(p.type, withNullability: false)}'
      : '';

  String get invocation {
    var inv = '\$value.${a.name}';
    var nullMod = a.type.isNullable ? '?' : '';
    if (p.type != a.type) {
      inv =
          '($inv as ${parent.prefixedType(p.type, withNullability: false)}$nullMod)';
    }
    return '$inv$nullMod.copyWith.\$chain($invocationThen)';
  }
}

class CollectionCopyParamElement extends CopyParamElement {
  CollectionCopyParamElement({
    required super.parent,
    required super.param,
    required super.name,
    required this.itemName,
    required this.itemHasSuperElement,
    required this.forceNullable,
    required this.valueIndex,
  }) : super(hasSubConfigs: false);

  final String itemName;
  final bool itemHasSuperElement;
  final bool forceNullable;
  final int valueIndex;

  late DartType itemType = (p.type as InterfaceType).typeArguments[valueIndex];
  late bool itemTypeNullable =
      itemType.nullabilitySuffix == NullabilitySuffix.question;

  late String itemTypeParam =
      ', ${parent.prefixedType(itemType, withNullability: false)}';

  late String itemSelfTypeParams = () {
    return itemType is InterfaceType
        ? (itemType as InterfaceType)
            .typeArguments
            .map((t) => ', ${parent.prefixedType(t)}')
            .join()
        : '';
  }();

  @override
  String get fieldTypeParams {
    if (itemName == 'Object') {
      var objectTypeParam = ', ${parent.prefixedType(itemType)}';
      return '${super.fieldTypeParams}, ObjectCopyWith<\$R$objectTypeParam$objectTypeParam>${itemTypeNullable || forceNullable ? '?' : ''}';
    }

    return '${super.fieldTypeParams}, ${itemName}CopyWith<\$R$itemTypeParam$itemTypeParam$itemSelfTypeParams>${itemTypeNullable ? '?' : ''}';
  }

  @override
  String get invocation {
    String itemInvocation;
    if (itemName == 'Object') {
      itemInvocation = '(v, t) => ObjectCopyWith(v, \$identity, t)';
    } else {
      var isBounded = itemType is TypeParameterType;
      var nullMod = itemTypeNullable ? '?' : '';

      itemInvocation = 'v$nullMod.copyWith';

      if (isBounded) {
        itemInvocation =
            '($itemInvocation as ${itemName}CopyWith<$itemName$itemTypeParam$itemTypeParam$itemSelfTypeParams>$nullMod)$nullMod';
      }

      itemInvocation = '(v, t) => $itemInvocation.\$chain(t)';
    }

    var result =
        '${name}CopyWith(\$value.${a.name}${a.type.isNullable ? '!' : ''}, $itemInvocation, $invocationThen)';
    if (a.type.isNullable) {
      result = '\$value.${a.name} != null ? $result : null';
    }
    return result;
  }
}
