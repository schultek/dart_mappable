import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../builder_options.dart';
import '../utils.dart';
import 'enum_mapper_config.dart';
import 'mapper_targets.dart';

class EnumMapperTarget extends MapperTarget {
  EnumMapperTarget(ClassElement element, MappableOptions options)
      : super(element, options);

  late EnumMapperConfig config = _buildConfig();
  EnumMapperConfig _buildConfig() {
    return EnumMapperConfig(
      element: element,
      caseStyle: caseStyle,
      defaultValue: defaultValue,
    );
  }

  @override
  DartObject? getAnnotation() =>
      enumChecker.firstAnnotationOf(annotatedElement);

  CaseStyle? get caseStyle =>
      annotation != null && !annotation!.getField('caseStyle')!.isNull
          ? caseStyleFromAnnotation(annotation!.getField('caseStyle')!)
          : options.enumCaseStyle;

  int? get defaultValue =>
      annotation?.getField('defaultValue')!.getField('index')?.toIntValue();
}
