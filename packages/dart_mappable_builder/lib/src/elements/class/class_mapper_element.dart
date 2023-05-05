import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../utils.dart';
import '../mapper_element.dart';
import '../param/mapper_param_element.dart';
import 'mixins/param_elements_mixin.dart';
import 'mixins/type_params_mixin.dart';
import 'none_class_mapper_element.dart';

/// Element interface for all class mappers.
abstract class ClassMapperElement extends MapperElement<ClassElement>
    with ParamElementsMixin, TypeParamsMixin {
  ClassMapperElement(super.parent, super.element, super.options);

  @override
  Future<void> init() async {
    await super.init();
    constructorNode = await constructor?.getNode();
    discriminatorValueCode = await _getDiscriminatorValueCode();
  }

  List<ClassMapperElement> subElements = [];
  @override
  ClassMapperElement? superElement;

  @override
  late AstNode? constructorNode;

  late String selfTypeParam = '$prefixedClassName$typeParams';
  late String superPrefixedClassName = () {
    if (superElement != null && superElement is! NoneClassMapperElement) {
      if (superElement!.element.isAccessibleIn(parent.library)) {
        return superElement!.superPrefixedClassName;
      } else {
        return superElement!.superPrefixedClassNameAlias;
      }
    } else {
      return prefixedClassName;
    }
  }();

  late String superPrefixedClassNameAlias = '${uniqueClassName}CopyWithBound';

  late Iterable<FieldElement> allPublicFields = () sync* {
    yield* superElement?.allPublicFields ?? [];
    for (var field in element.fields) {
      if (!field.isStatic &&
          field.isPublic &&
          (field.getter?.isSynthetic ?? false)) {
        yield field;
      }
    }
  }();

  late List<MapperFieldElement> fields = () {
    var fields = <PropertyInducingElement, MapperFieldElement>{};

    for (var p in params) {
      fields[p.accessor] = MapperFieldElement(p, p.accessor, this);
    }

    for (var f in allPublicFields) {
      if (!fields.containsKey(f)) {
        fields[f] = MapperFieldElement(null, f, this);
      }
    }

    return fields.values.toList();
  }();

  @override
  DartObject? getAnnotation() =>
      classChecker.firstAnnotationOf(annotatedElement);

  late String uniqueId =
      annotation?.getField('uniqueId')?.toStringValue() ?? className;

  @override
  late ConstructorElement? constructor = element.constructors
          .where((c) => !c.isPrivate && constructorChecker.hasAnnotationOf(c))
          .firstOrNull ??
      element.constructors
          .where((c) => !c.isPrivate && !classChecker.hasAnnotationOf(c))
          .firstOrNull;

  late bool isDiscriminatingSubclass = () {
    if (superElement == null || superElement is NoneClassMapperElement) {
      return false;
    }
    if (discriminatorKey == null && discriminatorValueCode == null) {
      return false;
    }
    return true;
  }();

  late String? discriminatorKey =
      annotation?.getField('discriminatorKey')!.toStringValue() ??
          options.discriminatorKey ??
          superElement?.discriminatorKey;

  late String? discriminatorValueCode;

  Future<String?> _getDiscriminatorValueCode() async {
    return (await getAnnotationNode(
            annotatedElement, MappableClass, 'discriminatorValue'))
        ?.toSource();
  }

  late String? hookForClass = () {
    var hook = annotation?.getField('hook');
    if (hook != null && !hook.isNull) {
      var node = getAnnotationProperty(annotatedNode, MappableClass, 'hook');
      if (node != null) {
        return node.toSource();
      }
    }
    return null;
  }();

  late CaseStyle? caseStyle =
      caseStyleFromAnnotation(annotation?.getField('caseStyle')) ??
          options.caseStyle ??
          superElement?.caseStyle;

  late bool ignoreNull = annotation?.getField('ignoreNull')!.toBoolValue() ??
      options.ignoreNull ??
      superElement?.ignoreNull ??
      false;

  late int generateMethods =
      annotation?.getField('generateMethods')!.toIntValue() ??
          options.generateMethods ??
          GenerateMethods.all;

  late bool generateMixin = () {
    return annotation != null && annotatedElement is! ConstructorElement;
  }();

  List<ClassElement> getSubClasses() {
    return annotation
            ?.getField('includeSubClasses')
            ?.toTypeList()
            ?.map((t) => t.element)
            .whereType<ClassElement>()
            .toList() ??
        [];
  }

  bool shouldGenerate(int method) {
    return (generateMethods & method) != 0;
  }

  late bool hasCallableConstructor = constructor != null &&
      !(isAbstract && constructor!.redirectedConstructor == null);

  late bool isAbstract = element.isAbstract;

  late List<MapperParamElement> copySafeParams = (() {
    if (subElements.isEmpty) return params;

    var safeParams = <MapperParamElement>[];

    for (var param in params) {
      if (subElements.every((c) {
        return c.copySafeParams.whereType<SuperParamElement>().any((p) =>
            p.superParameter.parameter == param.parameter ||
            p.superParameter.accessor == param.accessor);
      })) {
        safeParams.add(param);
      }
    }

    return safeParams;
  })();

  late bool generateAsMixin =
      generateMixin && subElements.every((c) => c.generateAsMixin);
}
