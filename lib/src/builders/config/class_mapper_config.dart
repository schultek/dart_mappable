import 'package:analyzer/dart/element/element.dart';

import '../../../dart_mappable.dart';
import '../utils.dart';

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
  final Map<String, ParameterElement> superParams;
  final List<ClassMapperConfig> subConfigs;

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
    required this.superParams,
    required this.subConfigs,
  });

  String get className => element.name;
  String get mapperName => '${className}Mapper';

  String jsonKey(ParameterElement param) {
    String? field = fieldAnnotation(param)?.getField('key')!.toStringValue();
    if (field != null) return field;
    if (superConfig != null && superParams[param.name] != null) {
      return superConfig!.jsonKey(superParams[param.name]!);
    }
    return caseStyle.transform(param.name);
  }

  bool hasField(String field) {
    if (element.getGetter(field) != null) {
      return true;
    } else {
      return superConfig?.hasField(field) ?? false;
    }
  }

  bool shouldGenerate(int method) {
    return (generateMethods & method) != 0;
  }

  String? hookForParam(ParameterElement param) {
    var annotation = fieldAnnotation(param);
    if (annotation != null && !annotation.getField('hooks')!.isNull) {
      var annotatedElement = fieldChecker.hasAnnotationOf(param)
          ? param
          : (param as FieldFormalParameterElement).field!;

      return getAnnotationCode(annotatedElement, MappableField, 'hooks');
    } else if (superConfig != null && superParams[param.name] != null) {
      return superConfig!.hookForParam(superParams[param.name]!);
    }
  }

  late bool hasCallableConstructor = constructor != null &&
      !(element.isAbstract && constructor!.redirectedConstructor == null);

  late String typeParams = element.typeParameters.isNotEmpty
      ? '<${element.typeParameters.map((p) => p.name).join(', ')}>'
      : '';

  late String typeParamsDeclaration = element.typeParameters.isNotEmpty
      ? '<${element.typeParameters.map((p) => p.getDisplayString(withNullability: false)).join(', ')}>'
      : '';
}
