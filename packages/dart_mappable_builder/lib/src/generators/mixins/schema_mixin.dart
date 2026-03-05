import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../elements/class/target_class_mapper_element.dart';
import '../../elements/field/class_mapper_field_element.dart';
import '../../utils.dart';
import '../generator.dart';

mixin SchemaMixin on MapperGenerator<TargetClassMapperElement> {
  late final toJsonSchemaName =
      element.options.renameMethods['toJsonSchema'] ?? 'toJsonSchema';

  void generateSchemaStaticMethod(StringBuffer output) {
    if (!element.shouldGenerate(GenerateMethods.schema)) {
      return;
    }

    output.write(
      '\n'
      '  static Map<String, dynamic> $toJsonSchemaName() {\n'
      '    ensureInitialized();\n'
      '    return JsonSchema.objectSchema(\n'
      '      properties: {\n',
    );

    for (var f in element.fields) {
      if (f.mode == ', mode: FieldMode.member') continue;

      var key = _fieldKey(f);
      var schemaExpr = _schemaExpression(f);

      output.write("        '$key': $schemaExpr,\n");
    }

    output.write(
      '      },\n'
      '      required: [\n',
    );

    for (var f in element.fields) {
      if (f.mode == ', mode: FieldMode.member') continue;
      if (f.opt != '') continue;

      var key = _fieldKey(f);
      output.write("        '$key',\n");
    }

    output.write(
      '      ],\n'
      '    );\n'
      '  }\n',
    );
  }

  String generateSchemaMixin() {
    if (!element.shouldGenerate(GenerateMethods.schema) || element.isAbstract) {
      return '';
    }

    return '''
      static Map<String, dynamic> $toJsonSchemaName() {
        return ${element.mapperName}.$toJsonSchemaName();
      }
    ''';
  }

  String generateSchemaExtension() {
    if (!element.shouldGenerate(GenerateMethods.schema)) {
      return '';
    }

    return '''
      static Map<String, dynamic> $toJsonSchemaName() {
        return ${element.mapperName}.$toJsonSchemaName();
      }
    ''';
  }

  String _fieldKey(ClassMapperFieldElement f) {
    // The key property has the form ", key: r'someKey'" or is empty.
    var keyProp = f.key;
    if (keyProp.isNotEmpty) {
      // Extract the actual key from ", key: r'someKey'"
      var match = RegExp(r"key: r'(.+?)'").firstMatch(keyProp);
      if (match != null) {
        return match.group(1)!;
      }
    }
    return f.name;
  }

  String _schemaExpression(ClassMapperFieldElement f) {
    var resolvedType = f.resolvedType;
    var isNullable = resolvedType.isNullable;

    return _typeToSchemaExpression(resolvedType, isNullable);
  }

  String _typeToSchemaExpression(DartType type, bool isNullable) {
    var nullableArg = isNullable ? 'nullable: true' : '';
    var nullableArgExtra = isNullable ? ', nullable: true' : '';

    // Strip nullability for matching.
    var baseType = type;
    if (type is InterfaceType && type.isDartCoreNull) {
      return 'JsonSchema.dynamic_(nullable: true)';
    }

    if (baseType is InterfaceType) {
      var className = baseType.element.name;

      // Check for primitive types.
      switch (className) {
        case 'String':
          return 'JsonSchema.string($nullableArg)';
        case 'int':
          return 'JsonSchema.integer($nullableArg)';
        case 'double':
        case 'num':
          return 'JsonSchema.number($nullableArg)';
        case 'bool':
          return 'JsonSchema.boolean($nullableArg)';
        case 'DateTime':
          return 'JsonSchema.dateTime($nullableArg)';
        case 'dynamic':
        case 'Object':
          return 'JsonSchema.dynamic_($nullableArg)';
      }

      // Check for collection types.
      if (_isListType(baseType) ||
          _isSetType(baseType) ||
          _isIterableType(baseType)) {
        var itemType =
            baseType.typeArguments.isNotEmpty
                ? baseType.typeArguments.first
                : null;
        var itemSchema =
            itemType != null
                ? _typeToSchemaExpression(itemType, itemType.isNullable)
                : 'JsonSchema.dynamic_()';
        return 'JsonSchema.array($itemSchema$nullableArgExtra)';
      }

      if (_isMapType(baseType)) {
        var valueType =
            baseType.typeArguments.length > 1
                ? baseType.typeArguments[1]
                : null;
        var valueSchema =
            valueType != null
                ? _typeToSchemaExpression(valueType, valueType.isNullable)
                : 'JsonSchema.dynamic_()';
        return 'JsonSchema.map($valueSchema$nullableArgExtra)';
      }

      // Check if it's an enum.
      if (baseType.element is EnumElement) {
        var enumElement = baseType.element as EnumElement;
        var values =
            enumElement.fields
                .where((f) => f.isEnumConstant)
                .map((f) => "'${f.name}'")
                .toList();
        return 'JsonSchema.enumSchema([${values.join(', ')}]$nullableArgExtra)';
      }

      // Check if it's a MappableClass (has a mapper).
      var mapperElement = element.parent.getMapperForElement(baseType.element);
      if (mapperElement != null) {
        return 'JsonSchema.object(${mapperElement.mapperName}.toJsonSchema()$nullableArgExtra)';
      }
    }

    if (type is DynamicType) {
      return 'JsonSchema.dynamic_()';
    }

    // Fallback - unknown type.
    return "{'type': 'object'}";
  }

  bool _isListType(InterfaceType type) {
    return type.element.name == 'List';
  }

  bool _isSetType(InterfaceType type) {
    return type.element.name == 'Set';
  }

  bool _isIterableType(InterfaceType type) {
    return type.element.name == 'Iterable';
  }

  bool _isMapType(InterfaceType type) {
    return type.element.name == 'Map';
  }
}
