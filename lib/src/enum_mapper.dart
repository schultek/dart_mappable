import 'package:analyzer/dart/element/element.dart';
import 'package:indent/indent.dart';

import 'builder_options.dart';
import 'case_style.dart';
import 'utils.dart';

/// Generates code for a specific enum
class EnumMapper {
  ClassElement element;

  late final CaseStyle? caseStyle;
  late final int? defaultValue;

  String get className => element.name;
  String get mapperName => '${className}Mapper';
  String get paramName => className[0].toLowerCase();

  EnumMapper(this.element, LibraryOptions options) {
    var annotation = enumChecker.firstAnnotationOf(element);

    caseStyle = annotation?.getField('caseStyle')!.toStringValue() != null
        ? CaseStyle.fromString(
            annotation!.getField('caseStyle')!.toStringValue())
        : options.caseStyle;

    defaultValue =
        annotation?.getField('defaultValue')!.getField('index')?.toIntValue();
  }

  String generateExtensionCode() {
    var values = element.fields
        .where((f) => f.isEnumConstant)
        .map((f) => MapEntry(f.name, toCaseStyle(f.name, caseStyle)));

    return '''
      extension $mapperName on $className {
        static $className fromString(String value) {
          switch (value) {
            ${values.map((v) => "case '${v.value}': return $className.${v.key};").join("\n            ")}
            default: ${_generateDefaultCase()}
          }
        }
        String toStringValue() {
          switch (this) {
            ${values.map((v) => "case $className.${v.key}: return '${v.value}';").join("\n            ")}
          }
        }
      }
    '''
        .unindent();
  }

  String _generateDefaultCase() {
    if (defaultValue != null) {
      return 'return $className.values[$defaultValue];';
    }
    return "throw MapperException('Cannot parse String \$value to enum $className');";
  }
}
