import 'package:analyzer/dart/element/element.dart';
import 'package:dart_mappable/dart_mappable.dart';

class EnumMapperConfig {
  final EnumElement element;

  final ValuesMode mode;
  final CaseStyle? caseStyle;
  final int? defaultValue;

  final int? importPrefix;
  final int nameIndex;

  EnumMapperConfig({
    required this.element,
    required this.mode,
    required this.caseStyle,
    required this.defaultValue,
    required this.importPrefix,
    required this.nameIndex,
  });

  String get className => element.name;
  String get prefixedClassName =>
      '${importPrefix != null ? 'p$importPrefix.' : ''}$className';
  String get mapperName => '$className${nameIndex != 0 ? '$nameIndex' : ''}Mapper';
  String get paramName => className[0].toLowerCase();
}
