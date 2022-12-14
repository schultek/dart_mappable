import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../utils.dart';
import 'copy_param_config.dart';
import 'parameter_config.dart';

class ClassMapperConfig {
  final ClassElement element;
  final ConstructorElement? constructor;

  final String? discriminatorKey;
  final String? discriminatorValueCode;

  final String? hookForClass;
  final CaseStyle? caseStyle;
  final bool ignoreNull;

  final int generateMethods;

  final ClassMapperConfig? superConfig;
  final List<ClassMapperConfig> subConfigs;
  final List<ParameterConfig> params;
  final List<String> typeParamsList;
  final List<String> superTypeArgs;
  final List<DartType> includeCustomMappers;

  final int nameIndex;
  final bool generateMixin;
  final Namespace namespace;

  ClassMapperConfig({
    required this.element,
    required this.constructor,
    required this.discriminatorKey,
    required this.discriminatorValueCode,
    required this.hookForClass,
    required this.caseStyle,
    required this.ignoreNull,
    required this.generateMethods,
    required this.superConfig,
    required this.subConfigs,
    required this.params,
    required this.typeParamsList,
    required this.superTypeArgs,
    required this.nameIndex,
    required this.generateMixin,
    required this.includeCustomMappers,
    required this.namespace,
  }) {
    checkUnresolvedParameters();
  }

  late String className = element.name;
  late String uniqueClassName =
      '$className${nameIndex != 0 ? '$nameIndex' : ''}';
  late String prefixedClassName = className;

  late String selfTypeParam = '$className$typeParams';
  late String superPrefixedClassName =
      superConfig?.superPrefixedClassName ?? prefixedClassName;

  Iterable<FieldElement> get allPublicFields sync* {
    yield* superConfig?.allPublicFields ?? [];
    for (var field in element.fields) {
      if (!field.isStatic &&
          field.isPublic &&
          (field.getter?.isSynthetic ?? false)) {
        yield field;
      }
    }
  }

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

  late List<ParameterConfig> copySafeParams = (() {
    if (subConfigs.isEmpty) return params;

    var safeParams = <ParameterConfig>[];

    for (var param in params) {
      if (subConfigs.every((c) => c.copySafeParams
          .whereType<SuperParameterConfig>()
          .any((p) => p.superParameter.parameter == param.parameter))) {
        safeParams.add(param);
      }
    }

    return safeParams;
  })();

  late bool generateAsMixin =
      generateMixin && subConfigs.every((c) => c.generateAsMixin);

  late List<String> joinConfigs = () {
    var joins = [...subConfigs.map((c) => '${c.uniqueClassName}Mapper')];
    for (var param in params) {

      var e = param.parameter.type.element;

      if (e != null && (classChecker.hasAnnotationOf(e) || enumChecker.hasAnnotationOf(e))) {
        joins.add('${e.name}Mapper');
      }
    }
    return joins;
  }();

  late List<String> customMappers = includeCustomMappers.map((t) => '${t.getDisplayString(withNullability: false)}()').toList();



  void checkUnresolvedParameters() {
    var unresolved = params.whereType<UnresolvedParameterConfig>();
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
  }
}
