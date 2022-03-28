import 'package:dart_mappable/dart_mappable.dart';

import '../config/enum_mapper_config.dart';

/// Generates code for a specific enum
class EnumMapperGenerator {
  EnumMapperConfig config;

  EnumMapperGenerator(this.config);

  String generate() {
    var values = config.element.fields
        .where((f) => f.isEnumConstant)
        .map((f) => MapEntry(f.name, config.caseStyle.transform(f.name)));

    return ''
        'class ${config.mapperName} extends EnumMapper<${config.className}> {\n'
        '  ${config.mapperName}._();\n\n'
        '  @override'
        '  ${config.className} fromString(String value) {\n'
        '    switch (value) {\n'
        '      ${values.map((v) => "case '${v.value}': return ${config.className}.${v.key};").join("\n      ")}\n'
        '      default: ${_generateDefaultCase()}\n'
        '    }\n'
        '  }\n\n'
        '  @override'
        '  String toStringValue(${config.className} value) {\n'
        '    switch (value) {\n'
        '      ${values.map((v) => "case ${config.className}.${v.key}: return '${v.value}';").join("\n      ")}\n'
        '    }\n'
        '  }\n'
        '}\n\n'
        'extension ${config.mapperName}Extension on ${config.className} {\n'
        '  String toStringValue() => Mapper.toValue(this) as String;\n'
        '}';
  }

  String _generateDefaultCase() {
    if (config.defaultValue != null) {
      return 'return ${config.className}.values[${config.defaultValue}];';
    }
    return 'throw MapperException.unknownEnumValue(value);';
  }
}
