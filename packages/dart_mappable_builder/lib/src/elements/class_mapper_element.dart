import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../builder_options.dart';
import '../generators/class_mapper_generator.dart';
import '../mapper_resource.dart';
import '../utils.dart';
import 'mapper_element.dart';
import 'mapper_param_element.dart';

class ClassMapperElement extends MapperElement<ClassElement> {
  ClassMapperElement(super.parent, super.element, super.options, super.index);

  @override
  ClassMapperGenerator get generator => ClassMapperGenerator(this);

  late String className = element.name;
  late String uniqueClassName =
      '$className${nameIndex != 0 ? '$nameIndex' : ''}';
  late String prefixedClassName = className;

  late String selfTypeParam = '$className$typeParams';
  late String superPrefixedClassName =
      superTarget?.superPrefixedClassName ?? prefixedClassName;

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

  List<ClassMapperElement> subTargets = [];
  ClassMapperElement? superTarget;

  late List<MapperParamElement> params;

  @override
  // ignore: overridden_fields
  late Future<void> finalize = () async {
    await super.finalize;

    for (var subclass in includeSubclasses) {
      var element = parent.getTargetForElement(subclass.element);

      if (element == null || element is! ClassMapperElement) {
        throw 'Cannot include subclass ${subclass.getDisplayString(withNullability: false)}, '
            'since it has no generated mapper.';
      }

      element.superTarget = this;
      subTargets.add(element);
    }

    await superTarget?.finalize;

    params = analyzeParams();
  }();

  @override
  DartObject? getAnnotation() =>
      classChecker.firstAnnotationOf(annotatedElement);

  ClassElement? getSuperElement() {
    var supertype = element.supertype;
    if (supertype == null || supertype.isDartCoreObject) {
      supertype = element.interfaces.firstOrNull;
    }

    if (supertype != null && !supertype.isDartCoreObject) {
      var element = supertype.element;
      if (element is ClassElement) return element;
    }
    return null;
  }

  void setSuperTarget(ClassMapperElement element) {
    superTarget = element;
    element.subTargets.add(this);
  }

  List<MapperParamElement> analyzeParams() {
    var params = <MapperParamElement>[];

    if (constructor == null) return params;

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
  }

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

    var getter = element.getGetter(param.name);
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

    return UnresolvedParamElement(
      param,
      'Cannot find field or getter related to this parameter.',
    );
  }

  ParameterElement? _findSuperParameter(ParameterElement param) {
    if (superTarget == null) return null;

    var node = constructor!.getNode();
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

  late ConstructorElement? constructor = element.constructors
          .where((c) => !c.isPrivate && constructorChecker.hasAnnotationOf(c))
          .firstOrNull ??
      element.constructors
          .where((c) => !c.isPrivate && !classChecker.hasAnnotationOf(c))
          .firstOrNull;

  late String? discriminatorKey =
      annotation?.getField('discriminatorKey')!.toStringValue() ??
          options.discriminatorKey ??
          superTarget?.discriminatorKey;

  late String? discriminatorValueCode = () {
    var discriminatorValueField = annotation?.getField('discriminatorValue');
    String? code;
    if (discriminatorValueField != null) {
      if (discriminatorValueField.type?.element?.name ==
              MappingFlags.useAsDefault.runtimeType.toString() &&
          discriminatorValueField.getField('index')!.toIntValue() == 0) {
        return 'default';
      } else {
        code = getAnnotationNode(
                annotatedElement, MappableClass, 'discriminatorValue')
            ?.toSource();
      }
    }
    if (code == null && superTarget != null && !element.isAbstract) {
      code = "'${element.name}'";
    }
    return code;
  }();

  late String? hookForClass = () {
    var hooks = annotation?.getField('hooks');
    if (hooks != null && !hooks.isNull) {
      var node = getAnnotationProperty(annotatedNode, MappableClass, 'hooks');
      if (node != null) {
        return node.toSource();
      }
    }
    return null;
  }();

  late List<String> typeParamsList = element.typeParameters
      .map((p) =>
          '${p.displayName}${p.bound != null ? ' extends ${parent.namespace.prefixedType(p.bound!)}' : ''}')
      .toList();

  late List<String> superTypeArgs = () {
    if (superTarget == null) return <String>[];
    return element.supertype?.typeArguments
            .map((a) => parent.namespace.prefixedType(a))
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

  late List<DartType> includeSubclasses =
      annotation?.getField('includeSubClasses')?.toTypeList() ?? [];

  late List<DartType> customMappers = () {
    var mappers =
        annotation?.getField('includeCustomMappers')?.toTypeList() ?? [];
    for (var mapper in mappers) {
      var mapperIndex = mapper is InterfaceType
          ? mapper.allSupertypes
              .indexWhere((t) => mapperChecker.isExactlyType(t))
          : -1;
      if (mapperIndex == -1) {
        throw UnsupportedError(
            'Classes supplied to invludeCustomMappers must extend the MapperBase class');
      }
    }
    return mappers;
  }();

  bool shouldGenerate(int method) {
    return (generateMethods & method) != 0;
  }

  late bool hasCallableConstructor = constructor != null &&
      !(element.isAbstract && constructor!.redirectedConstructor == null);

  late bool isAbstract = element.isAbstract;

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

  late List<String> joinConfigs = () {
    var joins = [...subTargets.map((c) => '${c.uniqueClassName}Mapper')];
    for (var param in params) {
      var e = param.parameter.type.element;
      var m = parent.getTargetForElement(e);
      if (m != null) {
        joins.add('${m.element.name}Mapper');
      }
    }
    return joins;
  }();
}

class FactoryConstructorMapperTarget extends ClassMapperElement {
  ConstructorElement factoryConstructor;

  FactoryConstructorMapperTarget(MapperElementGroup parent, this.factoryConstructor,
      MappableOptions options, int index)
      : super(
          parent,
          factoryConstructor.redirectedConstructor!.returnType.element
              as ClassElement,
          options,
          index,
        );

  @override
  Element get annotatedElement => factoryConstructor;

  @override
  ConstructorElement? get constructor =>
      factoryConstructor.redirectedConstructor!;
}
