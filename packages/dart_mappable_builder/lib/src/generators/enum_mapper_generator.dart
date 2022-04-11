import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../config/enum_mapper_config.dart';
import '../utils.dart';

/// Generates code for a specific enum
class EnumMapperGenerator {
  EnumMapperConfig config;

  EnumMapperGenerator(this.config);

  String generate() {
    bool hasAllStringValues = config.mode == ValuesMode.named;
    var values =
        config.element.fields.where((f) => f.isEnumConstant).mapIndexed((i, f) {
      if (valueChecker.hasAnnotationOf(f)) {
        hasAllStringValues = false;
        return MapEntry(f.name, getAnnotationCode(f, MappableValue, 0)!);
      } else {
        if (config.mode == ValuesMode.named) {
          return MapEntry(f.name, "'${config.caseStyle.transform(f.name)}'");
        } else {
          return MapEntry(f.name, i);
        }
      }
    });

    return ''
        'class ${config.mapperName} extends EnumMapper<${config.className}> {\n'
        '  ${config.mapperName}._();\n\n'
        '  @override'
        '  ${config.className} decode(dynamic value) {\n'
        '    switch (value) {\n'
        '      ${values.map((v) => "case ${v.value}: return ${config.className}.${v.key};").join("\n      ")}\n'
        '      default: ${_generateDefaultCase()}\n'
        '    }\n'
        '  }\n\n'
        '  @override'
        '  dynamic encode(${config.className} value) {\n'
        '    switch (value) {\n'
        '      ${values.map((v) => "case ${config.className}.${v.key}: return ${v.value};").join("\n      ")}\n'
        '    }\n'
        '  }\n'
        '}\n\n'
        'extension ${config.mapperName}Extension on ${config.className} {\n'
        '  dynamic toValue() => Mapper.toValue(this);\n'
        '${hasAllStringValues ? '  @Deprecated(\'Use \\\'toValue\\\' instead\')\n'
            '  String toStringValue() => Mapper.toValue(this) as String;\n' : ''}'
        '}';
  }

  String _generateDefaultCase() {
    if (config.defaultValue != null) {
      return 'return ${config.className}.values[${config.defaultValue}];';
    }
    return 'throw MapperException.unknownEnumValue(value);';
  }
}
