import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../builder_options.dart';
import '../utils.dart';
import 'class_mapper_config.dart';
import 'mapper_targets.dart';
import 'parameter_config.dart';

class ClassMapperTarget extends MapperTarget {
  List<ClassMapperTarget> subTargets = [];
  ClassMapperTarget? superTarget;

  ClassMapperTarget(ClassElement element, MappableOptions options)
      : super(element, options);

  @override
  DartObject? getAnnotation() =>
      classChecker.firstAnnotationOf(annotatedElement);

  ClassElement? getSuperElement() {
    var supertype = element.supertype;
    if (supertype == null || supertype.isDartCoreObject) {
      supertype = element.interfaces.firstOrNull;
    }

    if (supertype != null && !supertype.isDartCoreObject) {
      return supertype.element;
    }
    return null;
  }

  void setSuperTarget(ClassMapperTarget target) {
    superTarget = target;
    target.subTargets.add(this);
  }

  late ClassMapperConfig config = _buildConfig();
  ClassMapperConfig _buildConfig() {
    config = ClassMapperConfig(
      element: element,
      constructor: constructor,
      discriminatorKey: discriminatorKey,
      discriminatorValueCode: discriminatorValueCode,
      hookForClass: hookForClass,
      caseStyle: caseStyle,
      ignoreNull: ignoreNull,
      generateMethods: generateMethods,
      superConfig: superTarget?.config,
      subConfigs: [],
      params: analyzeParams(),
      requiredImports: requiredImports,
    );
    config.superConfig?.subConfigs.add(config);
    return config;
  }

  List<ParameterConfig> analyzeParams() {
    var params = <ParameterConfig>[];

    if (constructor == null) return params;

    for (var param in constructor!.parameters) {
      params.add(getParameterConfig(param));
    }

    return params;
  }

  ParameterConfig getParameterConfig(ParameterElement param) {
    if (param is FieldFormalParameterElement) {
      return FieldParameterConfig(param, param.field!);
    }

    var getter = element.getGetter(param.name);
    if (getter != null) {
      var getterType = getter.type.returnType;
      if (getterType == param.type) {
        return FieldParameterConfig(param, getter.variable);
      }

      if (!getterType.isNullable &&
          param.type.isNullable &&
          getterType.getDisplayString(withNullability: false) ==
              param.type.getDisplayString(withNullability: false)) {
        return FieldParameterConfig(param, getter.variable);
      }

      return UnresolvedParameterConfig(
        param,
        'Found getter or field related to this parameter, but it has a '
        'non-matching type. Expected ${param.type} but got ${getter.type.returnType}.',
      );
    }

    ParameterElement? superParameter = _findSuperParameter(param);
    if (superParameter != null) {
      var superConfig = superTarget!.getParameterConfig(superParameter);
      if (superConfig is UnresolvedParameterConfig) {
        return UnresolvedParameterConfig(
          param,
          'Problem in super constructor: ${superConfig.message}',
        );
      } else {
        return SuperParameterConfig(param, superConfig);
      }
    }

    return UnresolvedParameterConfig(
      param,
      'Cannot find field or getter related to this parameter.',
    );
  }

  ParameterElement? _findSuperParameter(ParameterElement param) {
    var superConfig = superTarget?.config;
    if (superConfig == null) return null;

    var node = constructor!.getNode();
    if (node is ConstructorDeclaration && node.initializers.isNotEmpty) {
      var last = node.initializers.last;
      if (last is SuperConstructorInvocation) {
        var superConstructorName = last.constructorName?.name ?? '';
        var superConstructor = superConfig.element.constructors
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

  ConstructorElement? get constructor =>
      element.constructors
          .where((c) => !c.isPrivate && constructorChecker.hasAnnotationOf(c))
          .firstOrNull ??
      element.constructors
          .where((c) => !c.isPrivate && !classChecker.hasAnnotationOf(c))
          .firstOrNull;

  String? get discriminatorKey =>
      annotation?.getField('discriminatorKey')!.toStringValue() ??
      options.discriminatorKey ??
      superTarget?.discriminatorKey;

  String? get discriminatorValueCode {
    var discriminatorValueField = annotation?.getField('discriminatorValue');
    String? code;
    if (discriminatorValueField != null) {
      if (discriminatorValueField.type?.element?.name ==
              MappingFlags.useAsDefault.runtimeType.toString() &&
          discriminatorValueField.getField('index')!.toIntValue() == 0) {
        return 'default';
      } else {
        code = readAnnotation('discriminatorValue');
      }
    }
    if (code == null && superTarget != null && !element.isAbstract) {
      code = "'${element.name}'";
    }
    return code;
  }

  String? get hookForClass {
    if (annotation != null && !annotation!.getField('hooks')!.isNull) {
      return readAnnotation('hooks');
    }
    return null;
  }

  CaseStyle? get caseStyle =>
      caseStyleFromAnnotation(annotation?.getField('caseStyle')) ??
      options.caseStyle;

  bool get ignoreNull {
    return annotation?.getField('ignoreNull')!.toBoolValue() ??
        options.ignoreNull ??
        false;
  }

  int get generateMethods {
    return annotation?.getField('generateMethods')!.toIntValue() ??
        options.generateMethods ??
        GenerateMethods.all;
  }

  List<Uri> get requiredImports {
    var hooks = annotation?.getField('hooks');
    if (hooks != null && !hooks.isNull) {
      var uri = hooks.type?.element?.library?.source.uri;
      return uri != null ? [uri] : [];
    }
    return [];
  }
}

class FactoryConstructorMapperTarget extends ClassMapperTarget {
  ConstructorElement factoryConstructor;

  FactoryConstructorMapperTarget(
      this.factoryConstructor, MappableOptions options)
      : super(factoryConstructor.redirectedConstructor!.returnType.element,
            options);

  @override
  Element get annotatedElement => factoryConstructor;

  @override
  ConstructorElement? get constructor =>
      factoryConstructor.redirectedConstructor!;
}
