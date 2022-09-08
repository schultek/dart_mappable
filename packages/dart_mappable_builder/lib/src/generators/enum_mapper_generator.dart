import 'package:analyzer/dart/element/element.dart';
import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../config/enum_mapper_config.dart';
import '../imports_builder.dart';
import '../utils.dart';

/// Generates code for a specific enum
class EnumMapperGenerator {
  final EnumMapperConfig config;
  final ImportsBuilder imports;

  EnumMapperGenerator(this.config, this.imports);

  Future<String> generate() async {
    bool hasAllStringValues = config.mode == ValuesMode.named;
    var values = await Future.wait(config.element.fields //
        .where((f) => f.isEnumConstant)
        .mapIndexed((i, f) async {
      if (valueChecker.hasAnnotationOf(f)) {
        hasAllStringValues = false;
        return MapEntry(f.name, await getAnnotatedValue(f));
      } else {
        if (config.mode == ValuesMode.named) {
          return MapEntry(f.name, "'${config.caseStyle.transform(f.name)}'");
        } else {
          return MapEntry(f.name, i);
        }
      }
    }));

    return ''
        'class ${config.mapperName} extends EnumMapper<${config.prefixedClassName}> {\n'
        '  ${config.mapperName}._();\n\n'
        '  @override'
        '  ${config.prefixedClassName} decode(dynamic value) {\n'
        '    switch (value) {\n'
        '      ${values.map((v) => "case ${v.value}: return ${config.prefixedClassName}.${v.key};").join("\n      ")}\n'
        '      default: ${_generateDefaultCase()}\n'
        '    }\n'
        '  }\n\n'
        '  @override'
        '  dynamic encode(${config.prefixedClassName} self) {\n'
        '    switch (self) {\n'
        '      ${values.map((v) => "case ${config.prefixedClassName}.${v.key}: return ${v.value};").join("\n      ")}\n'
        '    }\n'
        '  }\n'
        '}\n\n'
        'extension ${config.mapperName}Extension on ${config.prefixedClassName} {\n'
        '  dynamic toValue() => Mapper.toValue(this);\n'
        '${hasAllStringValues ? '  @Deprecated(\'Use \\\'toValue\\\' instead\')\n'
            '  String toStringValue() => Mapper.toValue(this) as String;\n' : ''}'
        '}';
  }

  String _generateDefaultCase() {
    if (config.defaultValue != null) {
      return 'return ${config.prefixedClassName}.values[${config.defaultValue}];';
    }
    return 'throw MapperException.unknownEnumValue(value);';
  }

  Future<String> getAnnotatedValue(FieldElement f) async {
    var node = await getResolvedAnnotationNode(f, MappableValue, 0);
    return getPrefixedNodeSource(node!, imports);
  }
}
