import '../../core/case_style.dart';
import '../config/enum_mapper_config.dart';

/// Generates code for a specific enum
class EnumMapperGenerator {
  EnumMapperConfig config;

  EnumMapperGenerator(this.config);

  String get instanceLiteral {
    return 'EnumMapper<${config.className}>(${config.mapperName}.fromString, (${config.className} ${config.paramName}) => ${config.paramName}.toStringValue()),\n';
  }

  String generate() {
    var values = config.element.fields
        .where((f) => f.isEnumConstant)
        .map((f) => MapEntry(f.name, config.caseStyle.transform(f.name)));

    return ''
        'extension ${config.mapperName} on ${config.className} {\n'
        '  static ${config.className} fromString(String value) {\n'
        '    switch (value) {\n'
        '      ${values.map((v) => "case '${v.value}': return ${config.className}.${v.key};").join("\n      ")}\n'
        '      default: ${_generateDefaultCase()}\n'
        '    }\n'
        '  }\n'
        '\n'
        '  String toStringValue() {\n'
        '    switch (this) {\n'
        '      ${values.map((v) => "case ${config.className}.${v.key}: return '${v.value}';").join("\n      ")}\n'
        '    }\n'
        '  }\n'
        '}';
  }

  String _generateDefaultCase() {
    if (config.defaultValue != null) {
      return 'return ${config.className}.values[${config.defaultValue}];';
    }
    return "throw MapperException('Cannot parse String \$value to enum ${config.className}');";
  }
}
