import 'package:analyzer/dart/element/element.dart';
import 'package:indent/indent.dart';

import 'builder_options.dart';
import 'case_style.dart';

/// Generates code for a specific enum
class EnumMapper {
  String get className => element.name;
  String get mapperName => '${className}Mapper';
  String get paramName => className[0].toLowerCase();

  ClassElement element;
  EnumOptions options;

  EnumMapper(this.element, this.options);

  String generateExtensionCode() {
    var values = element.fields
        .where((f) => f.isEnumConstant)
        .map((f) => MapEntry(f.name, toCaseStyle(f.name, options.caseStyle)));

    return '''
      extension $mapperName on $className {
        static $className fromString(String value) {
          switch (value) {
            ${values.map((v) => "case '${v.value}': return $className.${v.key};").join("\n            ")}
            default: throw MapperException('Cannot parse String \$value to enum $className');
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
}
