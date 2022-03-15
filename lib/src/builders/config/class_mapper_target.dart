import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:collection/collection.dart';

import '../../../dart_mappable.dart';
import '../builder_options.dart';
import '../utils.dart';
import 'class_mapper_config.dart';
import 'mapper_targets.dart';

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
      superParams: analyzeSuperParams(),
      subConfigs: [],
    );
    config.superConfig?.subConfigs.add(config);
    return config;
  }

  Map<String, ParameterElement> analyzeSuperParams() {
    var params = <String, ParameterElement>{};

    if (superTarget == null || constructor == null) return params;

    var node = constructor!.getNode();

    if (node is! ConstructorDeclaration || node.initializers.isEmpty) {
      return params;
    }

    var last = node.initializers.last;
    if (last is SuperConstructorInvocation) {
      var args = last.argumentList.arguments;
      var i = 0;
      for (var arg in args) {
        if (arg is SimpleIdentifier) {
          params[arg.name] = superTarget!.constructor!.parameters[i];
        } else if (arg is NamedExpression &&
            arg.expression is SimpleIdentifier) {
          params[(arg.expression as SimpleIdentifier).name] = superTarget!
              .constructor!.parameters
              .firstWhere((p) => p.isNamed && p.name == arg.name.label.name);
        }
        i++;
      }
    }

    return params;
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
