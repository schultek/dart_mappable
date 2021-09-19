import 'package:analyzer/dart/element/element.dart';

import '../builder_options.dart';
import '../core/case_style.dart';
import '../utils.dart';

/// Generates code for a specific enum
class EnumMapperBuilder {
  ClassElement element;

  late final CaseStyle? caseStyle;
  late final int? defaultValue;

  String get className => element.name;
  String get mapperName => '${className}Mapper';
  String get paramName => className[0].toLowerCase();

  EnumMapperBuilder(this.element, LibraryOptions options) {
    var annotation = enumChecker.firstAnnotationOf(element);

    caseStyle = annotation != null && !annotation.getField('caseStyle')!.isNull
        ? caseStyleFromAnnotation(annotation.getField('caseStyle')!)
        : options.caseStyle;

    defaultValue =
        annotation?.getField('defaultValue')!.getField('index')?.toIntValue();
  }

  String generateExtensionCode() {
    var values = element.fields
        .where((f) => f.isEnumConstant)
        .map((f) => MapEntry(f.name, caseStyle.transform(f.name)));

    return ''
        'extension $mapperName on $className {\n'
        '  static $className fromString(String value) {\n'
        '    switch (value) {\n'
        '      ${values.map((v) => "case '${v.value}': return $className.${v.key};").join("\n      ")}\n'
        '      default: ${_generateDefaultCase()}\n'
        '    }\n'
        '  }\n'
        '\n'
        '  String toStringValue() {\n'
        '    switch (this) {\n'
        '      ${values.map((v) => "case $className.${v.key}: return '${v.value}';").join("\n      ")}\n'
        '    }\n'
        '  }\n'
        '}';
  }

  String _generateDefaultCase() {
    if (defaultValue != null) {
      return 'return $className.values[$defaultValue];';
    }
    return "throw MapperException('Cannot parse String \$value to enum $className');";
  }
}
