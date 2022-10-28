import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../builder_options.dart';
import '../imports_builder.dart';
import '../utils.dart';
import 'class_mapper_config.dart';
import 'mapper_targets.dart';
import 'parameter_config.dart';

class ClassMapperTarget extends MapperTarget<ClassElement> {
  List<ClassMapperTarget> subTargets = [];
  ClassMapperTarget? superTarget;

  ClassMapperTarget(ClassElement element, MappableOptions options, int? prefix, int index)
      : super(element, options, prefix, index);

  @override
  DartObject? getAnnotation() =>
      classChecker.firstAnnotationOf(annotatedElement);

  ClassElement? getSuperElement() {
    var supertype = element.supertype;
    if (supertype == null || supertype.isDartCoreObject) {
      supertype = element.interfaces.firstOrNull;
    }

    if (supertype != null && !supertype.isDartCoreObject) {
      var element = supertype.element2;
      if (element is ClassElement) return element;
    }
    return null;
  }

  void setSuperTarget(ClassMapperTarget target) {
    superTarget = target;
    target.subTargets.add(this);
  }

  Future<ClassMapperConfig>? _config;
  Future<ClassMapperConfig> getConfig(ImportsBuilder imports) async {
    if (_config != null) return _config!;
    return _config = Future.sync(() async {
      var config = ClassMapperConfig(
        element: element,
        constructor: constructor,
        discriminatorKey: discriminatorKey,
        discriminatorValueCode: discriminatorValueCode,
        hookForClass: await hookForClass(imports),
        caseStyle: caseStyle,
        ignoreNull: ignoreNull,
        generateMethods: generateMethods,
        superConfig: await superTarget?.getConfig(imports),
        subConfigs: [],
        params: await analyzeParams(imports),
        typeParamsList: typeParamsList(imports),
        superTypeArgs: superTypeArgs(imports),
        importPrefix: importPrefix,
        nameIndex: nameIndex,
        generateMixin: generateMixin,
      );
      config.superConfig?.subConfigs.add(config);
      return config;
    });
  }

  Future<List<ParameterConfig>> analyzeParams(ImportsBuilder imports) async {
    var params = <ParameterConfig>[];

    if (constructor == null) return params;

    for (var param in constructor!.parameters) {
      params.add(await getParameterConfig(param, imports));
    }

    return params;
  }

  Future<ParameterConfig> getParameterConfig(
      ParameterElement param, ImportsBuilder imports) async {
    if (param is FieldFormalParameterElement) {
      return FieldParameterConfig(param, param.field!);
    }

    if (param is SuperFormalParameterElement) {
      if (param.superConstructorParameter == null) {
        return UnresolvedParameterConfig(
          param,
          'Cannot resolve formal super parameter',
        );
      }
      return SuperParameterConfig(
        param,
        await superTarget!
            .getParameterConfig(param.superConstructorParameter!, imports),
      );
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

    ParameterElement? superParameter =
        await _findSuperParameter(param, imports);
    if (superParameter != null) {
      var superConfig =
          await superTarget!.getParameterConfig(superParameter, imports);
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

  Future<ParameterElement?> _findSuperParameter(
      ParameterElement param, ImportsBuilder imports) async {
    var superConfig = await superTarget?.getConfig(imports);
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
      if (discriminatorValueField.type?.element2?.name ==
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
  }

  Future<String?> hookForClass(ImportsBuilder imports) async {
    var hooks = annotation?.getField('hooks');
    if (hooks != null && !hooks.isNull) {
      var node = await getResolvedAnnotationNode(
          annotatedElement, MappableClass, 'hooks');
      if (node != null) {
        return getPrefixedNodeSource(node, imports);
      }
    }
    return null;
  }

  List<String> typeParamsList(ImportsBuilder imports) {
    return element.typeParameters.map((p) => '${p.displayName}${p.bound != null ? ' extends ${imports.prefixedType(p.bound!)}' : ''}').toList();
  }

  List<String> superTypeArgs(ImportsBuilder imports) {
    if (superTarget == null) return [];
    return element.supertype?.typeArguments.map((a) => imports.prefixedType(a)).toList() ?? [];
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

  bool get generateMixin {
    return annotation != null && annotatedElement is! ConstructorElement;
  }
}

class FactoryConstructorMapperTarget extends ClassMapperTarget {
  ConstructorElement factoryConstructor;

  FactoryConstructorMapperTarget(
      this.factoryConstructor, MappableOptions options, int? prefix, int index)
      : super(factoryConstructor.redirectedConstructor!.returnType.element2 as ClassElement,
            options, prefix, index);

  @override
  Element get annotatedElement => factoryConstructor;

  @override
  ConstructorElement? get constructor =>
      factoryConstructor.redirectedConstructor!;
}
