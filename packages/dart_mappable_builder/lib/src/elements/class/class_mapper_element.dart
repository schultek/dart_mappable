import 'package:analyzer/dart/element/element.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../utils.dart';
import '../constructor/constructor_mapper_element.dart';
import '../field/class_mapper_field_element.dart';
import '../mapper_element.dart';
import '../param/class_mapper_param_element.dart';
import 'mixins/inherited_elements_mixin.dart';
import 'mixins/param_elements_mixin.dart';
import 'mixins/type_params_mixin.dart';

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
    with InheritedElementsMixin, ParamElementsMixin, TypeParamsMixin {
  ClassMapperElement(super.parent, super.element, super.options,
      super.annotation, this.constructor);

  @override
  final ConstructorMapperElement constructor;

  bool shouldGenerate(int method) {
    return (generateMethods & method) != 0;
  }

  @override
  late final String className = element.name;

  late final String uniqueId =
      (annotation.value?.read('uniqueId')?.toStringValue() ?? className)
          .replaceAll('\$', '\\\$')
          .replaceAll("(?<!\\)'", "\\'");

  // --- Generator configuration ---

  late final bool generateMixin = annotation.value != null;

  late final bool generateAsMixin =
      generateMixin && subElements.every((c) => c.generateAsMixin);

  late final bool hasCallableConstructor = constructor.element != null &&
      !(isAbstract && constructor.element!.redirectedConstructor == null);

  late final bool isAbstract = element.isAbstract;

  // --- Element configuration ---

  @override
  late final CaseStyle? caseStyle = super.caseStyle ?? superElement?.caseStyle;

  late final bool ignoreNull =
      annotation.value?.read('ignoreNull')?.toBoolValue() ??
          options.ignoreNull ??
          superElement?.ignoreNull ??
          false;

  late final int generateMethods =
      annotation.value?.read('generateMethods')?.toIntValue() ??
          options.generateMethods ??
          GenerateMethods.all;

  late final String? hookForClass = () {
    var hook = annotation.value?.read('hook');
    if (hook != null && !hook.isNull) {
      var node = annotation.annotation?.getPropertyNode('hook');
      if (node != null) {
        return node.toSource();
      }
    }
    return null;
  }();

  // --- Element properties ---

  @override
  late final List<ClassMapperFieldElement> fields = () {
    var fields = <Element, ClassMapperFieldElement>{};

    for (var p in params) {
      fields[p.accessor ?? p.parameter] =
          ClassMapperFieldElement(p, p.accessor, this);
    }

    for (var f in _allFields) {
      if (!fields.containsKey(f) &&
          !fields.keys
              .any((e) => e is PropertyInducingElement && e.name == f.name)) {
        fields[f] = ClassMapperFieldElement(null, f, this);
      }
    }

    return fields.values.toList();
  }();

  late final List<ClassMapperParamElement> copySafeParams = (() {
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

  late final Iterable<PropertyInducingElement> _allFields = () sync* {
    yield* extendsElement?._allFields ?? [];

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
}
