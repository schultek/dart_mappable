import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../builder_options.dart';
import '../utils.dart';
import 'enum_mapper_config.dart';
import 'mapper_targets.dart';

class EnumMapperTarget extends MapperTarget<EnumElement> {
  EnumMapperTarget(EnumElement element, MappableOptions options, int? prefix, int index)
      : super(element, options, prefix, index);

  late EnumMapperConfig config = _buildConfig();
  EnumMapperConfig _buildConfig() {
    return EnumMapperConfig(
      element: element,
      mode: mode,
      caseStyle: caseStyle,
      defaultValue: defaultValue,
      importPrefix: importPrefix,
      nameIndex: nameIndex,
    );
  }

  @override
  DartObject? getAnnotation() =>
      enumChecker.firstAnnotationOf(annotatedElement);

  ValuesMode get mode => annotation != null
      ? ValuesMode.values[
          annotation?.getField('mode')?.getField('index')?.toIntValue() ?? 0]
      : ValuesMode.named;

  CaseStyle? get caseStyle =>
      annotation != null && !annotation!.getField('caseStyle')!.isNull
          ? caseStyleFromAnnotation(annotation!.getField('caseStyle')!)
          : options.enumCaseStyle;

  int? get defaultValue =>
      annotation?.getField('defaultValue')!.getField('index')?.toIntValue();
}
