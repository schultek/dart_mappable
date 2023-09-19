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

/// Element interface for all class mappers.
abstract class ClassMapperElement extends MapperElement<ClassElement>
    with ParamElementsMixin, TypeParamsMixin {
  ClassMapperElement(super.parent, super.element, super.options);

  @override
  Future<void> init() async {
    await super.init();
    constructorNode = await constructor?.getResolvedNode();
    discriminatorValueCode = await _getDiscriminatorValueCode();
  }

  List<ClassMapperElement> subElements = [];
  @override
  ClassMapperElement? extendsElement;
  @override
  List<ClassMapperElement> interfaceElements = [];

  @override
  ClassMapperElement? get superElement =>
      extendsElement ?? interfaceElements.firstOrNull;

  @override
  late AstNode? constructorNode;

  late String selfTypeParam = '$prefixedClassName$typeParams';

  late Iterable<PropertyInducingElement> allFields = () sync* {
    yield* extendsElement?.allFields ?? [];

    for (var field in element.accessors) {
      if (field.isStatic) continue;
      if (!field.isGetter) continue;

      if (field.isPublic && field.isSynthetic) {
        yield field.variable;
      } else if (fieldChecker.hasAnnotationOf(field)) {
        yield field.variable;
      }
    }
  }();

  late List<MapperFieldElement> fields = () {
    var fields = <Element, MapperFieldElement>{};

    for (var p in params) {
      fields[p.accessor ?? p.parameter] =
          MapperFieldElement(p, p.accessor, this);
    }

    for (var f in allFields) {
      if (!fields.containsKey(f) &&
          !fields.keys
              .any((e) => e is PropertyInducingElement && e.name == f.name)) {
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
    if (discriminatorKey == null && discriminatorValueCode == null) {
      return false;
    }
    return isSubclass;
  }();

  late bool isSubclass = () {
    if (superElement == null) {
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

    bool isCopySafe(MapperParamElement param) {
      return subElements.every((e) => e.copySafeParams.any((subParam) {
            if (subParam is SuperParamElement &&
                (subParam.superParameter.parameter == param.parameter ||
                    subParam.superParameter.accessor == param.accessor)) {
              return true;
            }
            if (subParam is FieldParamElement &&
                subParam.superField == param.accessor) {
              return true;
            }
            return false;
          }));
    }

    for (var param in params) {
      if (isCopySafe(param)) {
        safeParams.add(param);
      }
    }

    return safeParams;
  })();

  late bool generateAsMixin =
      generateMixin && subElements.every((c) => c.generateAsMixin);
}
