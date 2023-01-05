import 'package:analyzer/dart/element/element.dart';
import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../elements/enum/target_enum_mapper_element.dart';
import '../utils.dart';
import 'class_mapper_generator.dart';

/// Generates code for a specific enum
class EnumMapperGenerator extends MapperGenerator<TargetEnumMapperElement> {
  EnumMapperGenerator(super.element);

  @override
  Future<String> generate() async {
    bool hasAllStringValues = target.mode == ValuesMode.named;
    var values = await Future.wait(target.element.fields //
        .where((f) => f.isEnumConstant)
        .mapIndexed((i, f) async {
      if (valueChecker.hasAnnotationOf(f)) {
        hasAllStringValues = false;
        return MapEntry(f.name, await getAnnotatedValue(f));
      } else {
        if (target.mode == ValuesMode.named) {
          return MapEntry(f.name, "'${target.caseStyle.transform(f.name)}'");
        } else {
          return MapEntry(f.name, i);
        }
      }
    }));

    return ''
        'class ${target.mapperName} extends EnumMapper<${target.prefixedClassName}> {\n'
        '  static MapperContainer container = MapperContainer(\n'
        '    mappers: {${target.mapperName}()},\n'
        '  );\n\n'
        '  static final fromValue = container.fromValue<${target.prefixedClassName}>;\n\n'
        '  @override\n'
        '  ${target.prefixedClassName} decode(dynamic value) {\n'
        '    switch (value) {\n'
        '      ${values.map((v) => "case ${v.value}: return ${target.prefixedClassName}.${v.key};").join("\n      ")}\n'
        '      default: ${_generateDefaultCase()}\n'
        '    }\n'
        '  }\n\n'
        '  @override\n'
        '  dynamic encode(${target.prefixedClassName} self) {\n'
        '    switch (self) {\n'
        '      ${values.map((v) => "case ${target.prefixedClassName}.${v.key}: return ${v.value};").join("\n      ")}\n'
        '    }\n'
        '  }\n'
        '}\n\n'
        'extension ${target.mapperName}Extension on ${target.prefixedClassName} {\n'
        '  ${hasAllStringValues ? 'String' : 'dynamic'} toValue() => ${target.mapperName}.container.toValue(this)${hasAllStringValues ? ' as String' : ''};\n'
        '}';
  }

  String _generateDefaultCase() {
    if (target.defaultValue != null) {
      return 'return ${target.prefixedClassName}.values[${target.defaultValue}];';
    }
    return 'throw MapperException.unknownEnumValue(value);';
  }

  Future<String> getAnnotatedValue(FieldElement f) async {
    var node = await getResolvedAnnotationNode(f, MappableValue, 0);
    return node!.toSource();
  }
}
