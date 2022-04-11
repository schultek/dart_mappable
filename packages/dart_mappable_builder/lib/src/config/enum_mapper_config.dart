import 'package:analyzer/dart/element/element.dart';
import 'package:dart_mappable/dart_mappable.dart';

class EnumMapperConfig {
  final ClassElement element;

  final ValuesMode mode;
  final CaseStyle? caseStyle;
  final int? defaultValue;

  EnumMapperConfig({
    required this.element,
    required this.mode,
    required this.caseStyle,
    required this.defaultValue,
  });

  String get className => element.name;
  String get mapperName => '${className}Mapper';
  String get paramName => className[0].toLowerCase();
}
