import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';

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

  final int? importPrefix;
  final int nameIndex;

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
    required this.importPrefix,
    required this.nameIndex,
  }) {
    checkUnresolvedParameters();
  }

  String get className => element.name;
  String get prefixedClassName =>
      '${importPrefix != null ? 'p$importPrefix.' : ''}$className';
  String get uniqueClassName =>
      '$className${nameIndex != 0 ? '$nameIndex' : ''}';
  String get mapperName =>
      '$className${nameIndex != 0 ? nameIndex : ''}Mapper';

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

  late String typeParams = element.typeParameters.isNotEmpty
      ? '<${element.typeParameters.map((p) => p.name).join(', ')}>'
      : '';

  late String superTypeParams = element.typeParameters.isNotEmpty
      ? '<${element.typeParameters.map((p) => element.supertype!.typeArguments.any((t) => t is TypeParameterType && t.element2 == p) ? p.name : 'dynamic').join(', ')}>'
      : '';

  late String typeParamsDeclaration =
      typeParamsList.isNotEmpty ? '<${typeParamsList.join(', ')}>' : '';

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
