import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../utils.dart';
import '../mapper_element.dart';
import '../param/mapper_field_element.dart';
import '../param/mapper_param_element.dart';
import 'mixins/param_elements_mixin.dart';
import 'mixins/type_params_mixin.dart';

class ConstructorMapperElement {
  const ConstructorMapperElement(this.element, this.node);

  final ConstructorElement? element;
  final AstNode? node;

  static Future<ConstructorMapperElement> fromClass(
      ClassElement element) async {
    var constructor = getConstructorFor(element);
    return ConstructorMapperElement.from(constructor);
  }

  static Future<ConstructorMapperElement> from(
      ConstructorElement? constructor) async {
    var node = await constructor?.getResolvedNode();
    return ConstructorMapperElement(constructor, node);
  }
}

/// Element interface for all class mappers.
///
///
/// Subtypes are:
///
/// - Annotated not in lib: DependentClassMapperElement
/// - Annotated in lib: TargetClassMapperElement
///   - As alias: AliasClassMapperElement
///   - As factory: FactoryConstructorMapperElement
///
///
abstract class ClassMapperElement extends InterfaceMapperElement<ClassElement>
    with ParamElementsMixin, TypeParamsMixin {
  ClassMapperElement(super.parent, super.element, super.options,
      super.annotation, this.constructor);

  @override
  final ConstructorMapperElement constructor;

  @override
  late final String className = element.name;

  List<ClassMapperElement> subElements = [];
  @override
  ClassMapperElement? extendsElement;
  @override
  List<ClassMapperElement> interfaceElements = [];

  @override
  ClassMapperElement? get superElement =>
      extendsElement ?? interfaceElements.firstOrNull;

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

  @override
  late List<ClassMapperFieldElement> fields = () {
    var fields = <Element, ClassMapperFieldElement>{};

    for (var p in params) {
      fields[p.accessor ?? p.parameter] =
          ClassMapperFieldElement(p, p.accessor, this);
    }

    for (var f in allFields) {
      if (!fields.containsKey(f) &&
          !fields.keys
              .any((e) => e is PropertyInducingElement && e.name == f.name)) {
        fields[f] = ClassMapperFieldElement(null, f, this);
      }
    }

    return fields.values.toList();
  }();

  late String uniqueId =
      annotation.value?.read('uniqueId')?.toStringValue() ?? className;

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
      annotation.value?.read('discriminatorKey')?.toStringValue() ??
          options.discriminatorKey ??
          superElement?.discriminatorKey;

  late String? discriminatorValueCode =
      annotation.annotation?.getPropertyNode('discriminatorValue')?.toSource();

  late String? hookForClass = () {
    var hook = annotation.value?.read('hook');
    if (hook != null && !hook.isNull) {
      var node = annotation.annotation?.getPropertyNode('hook');
      if (node != null) {
        return node.toSource();
      }
    }
    return null;
  }();

  @override
  // ignore: overridden_fields
  late final CaseStyle? caseStyle = super.caseStyle ?? superElement?.caseStyle;

  late bool ignoreNull = annotation.value?.read('ignoreNull')?.toBoolValue() ??
      options.ignoreNull ??
      superElement?.ignoreNull ??
      false;

  late int generateMethods =
      annotation.value?.read('generateMethods')?.toIntValue() ??
          options.generateMethods ??
          GenerateMethods.all;

  late bool generateMixin = annotation.value != null;

  List<ClassElement> getSubClasses() {
    return annotation.value
            ?.read('includeSubClasses')
            ?.toTypeList()
            ?.map((t) => t.element)
            .whereType<ClassElement>()
            .toList() ??
        [];
  }

  bool shouldGenerate(int method) {
    return (generateMethods & method) != 0;
  }

  late bool hasCallableConstructor = constructor.element != null &&
      !(isAbstract && constructor.element!.redirectedConstructor == null);

  late bool isAbstract = element.isAbstract;

  late List<ClassMapperParamElement> copySafeParams = (() {
    if (subElements.isEmpty) return params;

    var safeParams = <ClassMapperParamElement>[];

    bool isCopySafe(ClassMapperParamElement param) {
      return subElements.every((e) => e.copySafeParams.any((subParam) {
            if (subParam is SuperParamElement &&
                (subParam.superParameter.parameter.declaration ==
                        param.parameter.declaration ||
                    subParam.superParameter.accessor?.declaration ==
                        param.accessor?.declaration)) {
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

ConstructorElement? getConstructorFor(ClassElement element) {
  var constructors = element.constructors.where((c) => !c.isPrivate);
  return constructors.where(constructorChecker.hasAnnotationOf).firstOrNull ??
      constructors.where((c) => !classChecker.hasAnnotationOf(c)).firstOrNull;
}
