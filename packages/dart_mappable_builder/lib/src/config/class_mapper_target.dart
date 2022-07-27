import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../builder_options.dart';
import '../imports_builder.dart';
import '../utils.dart';
import 'class_mapper_config.dart';
import 'mapper_targets.dart';
import 'parameter_config.dart';

class ClassMapperTarget extends MapperTarget {
  List<ClassMapperTarget> subTargets = [];
  ClassMapperTarget? superTarget;

  ClassMapperTarget(
      ClassElement element, MappableOptions options, String? prefix)
      : super(element, options, prefix);

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

  ClassMapperConfig? _config;
  ClassMapperConfig getConfig(ImportsBuilder imports) {
    if (_config != null) return _config!;
    _config = ClassMapperConfig(
      element: element,
      constructor: constructor,
      discriminatorKey: discriminatorKey,
      discriminatorValueCode: discriminatorValueCode,
      hookForClass: hookForClass(imports),
      caseStyle: caseStyle,
      ignoreNull: ignoreNull,
      generateMethods: generateMethods,
      superConfig: superTarget?.getConfig(imports),
      subConfigs: [],
      params: analyzeParams(imports),
      prefix: prefix,
    );
    _config!.superConfig?.subConfigs.add(_config!);
    return _config!;
  }

  List<ParameterConfig> analyzeParams(ImportsBuilder imports) {
    var params = <ParameterConfig>[];

    if (constructor == null) return params;

    for (var param in constructor!.parameters) {
      params.add(getParameterConfig(param, imports));
    }

    return params;
  }

  ParameterConfig getParameterConfig(
      ParameterElement param, ImportsBuilder imports) {
    if (param is FieldFormalParameterElement) {
      return FieldParameterConfig.from(param, param.field!, imports);
    }

    if (param is SuperFormalParameterElement) {
      if (param.superConstructorParameter == null) {
        return UnresolvedParameterConfig(
          param,
          'Cannot resolve formal super parameter',
        );
      }
      return SuperParameterConfig.from(
        param,
        superTarget!
            .getParameterConfig(param.superConstructorParameter!, imports),
        imports,
      );
    }

    var getter = element.getGetter(param.name);
    if (getter != null) {
      var getterType = getter.type.returnType;
      if (getterType == param.type) {
        return FieldParameterConfig.from(param, getter.variable, imports);
      }

      if (!getterType.isNullable &&
          param.type.isNullable &&
          getterType.getDisplayString(withNullability: false) ==
              param.type.getDisplayString(withNullability: false)) {
        return FieldParameterConfig.from(param, getter.variable, imports);
      }

      return UnresolvedParameterConfig(
        param,
        'Found getter or field related to this parameter, but it has a '
        'non-matching type. Expected ${param.type} but got ${getter.type.returnType}.',
      );
    }

    ParameterElement? superParameter = _findSuperParameter(param, imports);
    if (superParameter != null) {
      var superConfig =
          superTarget!.getParameterConfig(superParameter, imports);
      if (superConfig is UnresolvedParameterConfig) {
        return UnresolvedParameterConfig(
          param,
          'Problem in super constructor: ${superConfig.message}',
        );
      } else {
        return SuperParameterConfig.from(param, superConfig, imports);
      }
    }

    return UnresolvedParameterConfig(
      param,
      'Cannot find field or getter related to this parameter.',
    );
  }

  ParameterElement? _findSuperParameter(
      ParameterElement param, ImportsBuilder imports) {
    var superConfig = superTarget?.getConfig(imports);
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

  String? hookForClass(ImportsBuilder imports) {
    var hooks = annotation?.getField('hooks');
    if (hooks != null && !hooks.isNull) {
      var hook = readAnnotation('hooks');
      if (hook != null) {
        var uri = hooks.type?.element?.library?.source.uri;
        var prefix = imports.add(uri);

        if (prefix != null) {
          hook = '$prefix.$hook';
        }
      }
      return hook;
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
}

class FactoryConstructorMapperTarget extends ClassMapperTarget {
  ConstructorElement factoryConstructor;

  FactoryConstructorMapperTarget(
      this.factoryConstructor, MappableOptions options, String? prefix)
      : super(factoryConstructor.redirectedConstructor!.returnType.element,
            options, prefix);

  @override
  Element get annotatedElement => factoryConstructor;

  @override
  ConstructorElement? get constructor =>
      factoryConstructor.redirectedConstructor!;
}
