import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../utils.dart';
import '../mapper_element.dart';
import '../mapper_param_element.dart';
import 'none_class_mapper_element.dart';

abstract class ClassMapperElement extends MapperElement<ClassElement> {
  ClassMapperElement(super.parent, super.element, super.options);

  List<ClassMapperElement> subTargets = [];
  ClassMapperElement? superTarget;

  late AstNode? constructorNode;

  @override
  // ignore: overridden_fields
  late Future<void> analyze = () async {
    await super.analyze;
    constructorNode = await constructor?.getNode();
  }();

  late String selfTypeParam = '$prefixedClassName$typeParams';
  late String superPrefixedClassName = () {
    if (superTarget != null && superTarget is! NoneClassMapperElement) {
      if (superTarget!.element.isAccessibleIn(parent.library)) {
        return superTarget!.superPrefixedClassName;
      } else {
        return superTarget!.superPrefixedClassNameAlias;
      }
    } else {
      return prefixedClassName;
    }
  }();

  late String superPrefixedClassNameAlias = '${uniqueClassName}CopyWithBound';

  late Iterable<FieldElement> allPublicFields = () sync* {
    yield* superTarget?.allPublicFields ?? [];
    for (var field in element.fields) {
      if (!field.isStatic &&
          field.isPublic &&
          (field.getter?.isSynthetic ?? false)) {
        yield field;
      }
    }
  }();

  @override
  DartObject? getAnnotation() =>
      classChecker.firstAnnotationOf(annotatedElement);

  late String uniqueId =
      annotation?.getField('uniqueId')?.toStringValue() ?? className;

  late List<MapperParamElement> params = () {
    var params = <MapperParamElement>[];
    if (constructor == null) {
      return params;
    }

    for (var param in constructor!.parameters) {
      params.add(getParameterConfig(param));
    }

    var unresolved = params.whereType<UnresolvedParamElement>();
    if (unresolved.isNotEmpty) {
      print('\nClass $className defines constructor parameters that could not '
          'be resolved against any field or getter in the class.\nThis won\'t '
          'break your code, but may lead to unexpected behaviour when '
          'serializing this class. Also \'.copyWith()\' won\'t work on these '
          'parameters.\n\nThe following problematic parameters were detected:\n'
          '${unresolved.map((p) => '- ${p.parameter.name}: ${p.message}').join('\n')}\n\n'
          'Please make sure every constructor parameter can be resolved to a '
          'field or getter.\nIf you think this is a bug with dart_mappable '
          'and the listed parameters should be resolved correctly, please file '
          'an issue here: https://github.com/schultek/dart_mappable/issues\n');
    }

    return params;
  }();

  MapperParamElement getParameterConfig(ParameterElement param) {
    var dec = param.declaration;

    if (dec is FieldFormalParameterElement) {
      return FieldParamElement(param, dec.field!);
    }

    if (dec is SuperFormalParameterElement) {
      if (dec.superConstructorParameter == null) {
        return UnresolvedParamElement(
          param,
          'Cannot resolve formal super parameter',
        );
      }
      var superConfig =
          superTarget!.getParameterConfig(dec.superConstructorParameter!);
      if (superConfig is UnresolvedParamElement) {
        return UnresolvedParamElement(
          param,
          'Problem in super constructor: ${superConfig.message}',
        );
      } else {
        return SuperParamElement(param, superConfig);
      }
    }

    ParameterElement? superParameter = _findSuperParameter(param);
    if (superParameter != null) {
      var superConfig = superTarget!.getParameterConfig(superParameter);
      if (superConfig is UnresolvedParamElement) {
        return UnresolvedParamElement(
          param,
          'Problem in super constructor: ${superConfig.message}',
        );
      } else {
        return SuperParamElement(param, superConfig);
      }
    }

    var getter = element.lookUpGetter(param.name, parent.library);
    if (getter != null) {
      var getterType = getter.type.returnType;
      if (getterType == param.type) {
        return FieldParamElement(param, getter.variable);
      }

      if (!getterType.isNullable &&
          param.type.isNullable &&
          getterType.getDisplayString(withNullability: false) ==
              param.type.getDisplayString(withNullability: false)) {
        return FieldParamElement(param, getter.variable);
      }

      return UnresolvedParamElement(
        param,
        'Found getter or field related to this parameter, but it has a '
        'non-matching type. Expected ${param.type} but got ${getter.type.returnType}.',
      );
    }

    return UnresolvedParamElement(
      param,
      'Cannot find field or getter related to this parameter.',
    );
  }

  ParameterElement? _findSuperParameter(ParameterElement param) {
    if (superTarget == null) return null;

    var node = constructorNode;
    if (node is ConstructorDeclaration && node.initializers.isNotEmpty) {
      var last = node.initializers.last;
      if (last is SuperConstructorInvocation) {
        var superConstructorName = last.constructorName?.name ?? '';
        var superConstructor = superTarget!.element.constructors
            .firstWhere((c) => c.name == superConstructorName);

        var args = last.argumentList.arguments;
        var i = 0;
        for (var arg in args) {
          if (arg is SimpleIdentifier) {
            if (arg.name == param.name) {
              return superConstructor.parameters[i];
            }
          } else if (arg is NamedExpression) {
            var exp = arg.expression;
            if (exp is SimpleIdentifier) {
              if (exp.name == param.name) {
                var superName = arg.name.label.name;
                return superConstructor.parameters
                    .firstWhere((p) => p.isNamed && p.name == superName);
              }
            }
          }
          i++;
        }
      }
    }
    return null;
  }

  late ConstructorElement? constructor = targetElement.constructors
          .where((c) => !c.isPrivate && constructorChecker.hasAnnotationOf(c))
          .firstOrNull ??
      targetElement.constructors
          .where((c) => !c.isPrivate && !classChecker.hasAnnotationOf(c))
          .firstOrNull;

  late String? discriminatorKey =
      annotation?.getField('discriminatorKey')!.toStringValue() ??
          options.discriminatorKey ??
          superTarget?.discriminatorKey;

  late Future<String?> discriminatorValueCode = () async {
    var discriminatorValueField = annotation?.getField('discriminatorValue');
    String? code;
    if (discriminatorValueField != null) {
      if (discriminatorValueField.type?.element?.name ==
              MappingFlags.useAsDefault.runtimeType.toString() &&
          discriminatorValueField.getField('index')!.toIntValue() == 0) {
        return 'default';
      } else {
        code = (await getAnnotationNode(
                annotatedElement, MappableClass, 'discriminatorValue'))
            ?.toSource();
      }
    }
    if (code == null && superTarget != null && !isAbstract) {
      code = "'${element.name}'";
    }
    return code;
  }();

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

  late List<String> typeParamsList = element.typeParameters
      .map((p) =>
          '${p.displayName}${p.bound != null ? ' extends ${parent.prefixedType(p.bound!)}' : ''}')
      .toList();

  late List<String> superTypeArgs = () {
    if (superTarget == null) return <String>[];
    return element.supertype?.typeArguments
            .map((a) => parent.prefixedType(a))
            .toList() ??
        [];
  }();

  late CaseStyle? caseStyle =
      caseStyleFromAnnotation(annotation?.getField('caseStyle')) ??
          options.caseStyle;

  late bool ignoreNull = annotation?.getField('ignoreNull')!.toBoolValue() ??
      options.ignoreNull ??
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

  late bool isAbstract = targetElement.isAbstract;

  late String typeParams = element.typeParameters.isNotEmpty
      ? '<${element.typeParameters.map((p) => p.name).join(', ')}>'
      : '';

  late String superTypeParams = element.typeParameters.isNotEmpty
      ? '<${element.typeParameters.map((p) => element.supertype!.typeArguments.any((t) => t is TypeParameterType && t.element == p) ? p.name : 'dynamic').join(', ')}>'
      : '';

  late String typeParamsDeclaration =
      typeParamsList.isNotEmpty ? '<${typeParamsList.join(', ')}>' : '';

  late List<MapperParamElement> copySafeParams = (() {
    if (subTargets.isEmpty) return params;

    var safeParams = <MapperParamElement>[];

    for (var param in params) {
      if (subTargets.every((c) => c.copySafeParams
          .whereType<SuperParamElement>()
          .any((p) => p.superParameter.parameter == param.parameter))) {
        safeParams.add(param);
      }
    }

    return safeParams;
  })();

  late bool generateAsMixin =
      generateMixin && subTargets.every((c) => c.generateAsMixin);
}
