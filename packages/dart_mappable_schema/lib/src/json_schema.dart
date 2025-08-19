import 'package:dart_mappable/dart_mappable.dart';

import 'json_schema_hook.dart';

part 'json_schema.mapper.dart';

@MappableClass(ignoreNull: true)
final class JsonSchema with JsonSchemaMappable {
  @MappableField(key: r'$id')
  final String? id;

  @MappableField(key: r'$schema')
  final String? schema;

  @MappableField(key: r'$ref')
  final String? ref;

  final String? title;
  final String? description;

  final JsonSchemaType? type;
  final List<Object?>? enumValues;

  final JsonSchemaItems? items;
  final Map<String, JsonSchema>? properties;
  final List<String>? required;
  final JsonSchemaAdditionalProperties? additionalProperties;
  final Map<String, JsonSchema>? patternProperties;

  // draft-07: definitions
  final Map<String, JsonSchema>? definitions;

  // draft-07: allOf, anyOf, oneOf, not
  final List<JsonSchema>? allOf;
  final List<JsonSchema>? anyOf;
  final List<JsonSchema>? oneOf;

  final JsonSchema? not;

  // draft-07: if, then, else
  final JsonSchema? ifSchema;
  final JsonSchema? thenSchema;
  final JsonSchema? elseSchema;

  // draft-07: numeric
  final num? multipleOf;
  final num? maximum;
  final bool? exclusiveMaximum;
  final num? minimum;
  final bool? exclusiveMinimum;

  // draft-07: string
  final int? maxLength;
  final int? minLength;
  final String? pattern;
  final String? format;

  // draft-07: array
  final int? maxItems;
  final int? minItems;
  final bool? uniqueItems;
  final List<Object?>? contains;

  // draft-07: object
  final int? maxProperties;
  final int? minProperties;
  final List<String>? dependencies;

  @MappableField(key: 'default')
  final Object? defaultValue;

  JsonSchema({
    this.id,
    this.schema,
    this.ref,
    this.title,
    this.description,
    this.type,
    this.enumValues,
    this.items,
    this.properties,
    this.required,
    this.additionalProperties,
    this.patternProperties,
    this.definitions,
    this.allOf,
    this.anyOf,
    this.oneOf,
    this.not,
    this.ifSchema,
    this.thenSchema,
    this.elseSchema,
    this.multipleOf,
    this.maximum,
    this.exclusiveMaximum,
    this.minimum,
    this.exclusiveMinimum,
    this.maxLength,
    this.minLength,
    this.pattern,
    this.format,
    this.maxItems,
    this.minItems,
    this.uniqueItems,
    this.contains,
    this.maxProperties,
    this.minProperties,
    this.dependencies,
    this.defaultValue,
  });

  factory JsonSchema.allOf(
    List<JsonSchema> schemas, {
    String? description,
    String? title,
  }) => JsonSchema(title: title, description: description, allOf: schemas);

  factory JsonSchema.anyOf(
    List<JsonSchema> schemas, {
    String? description,
    String? title,
  }) => JsonSchema(title: title, description: description, anyOf: schemas);

  factory JsonSchema.array(
    JsonSchema itemSchema, {
    String? description,
    String? title,
    int? minItems,
    int? maxItems,
    bool? uniqueItems,
  }) => JsonSchema(
    title: title,
    description: description,
    type: JsonSchemaTypeSingle('array'),
    items: JsonSchemaItemsSingle(itemSchema),
    minItems: minItems,
    maxItems: maxItems,
    uniqueItems: uniqueItems,
  );

  factory JsonSchema.boolean({
    String? description,
    String? title,
    Object? defaultValue,
  }) => JsonSchema(
    title: title,
    description: description,
    type: JsonSchemaTypeSingle('boolean'),
    defaultValue: defaultValue,
  );

  factory JsonSchema.conditional({
    JsonSchema? ifSchema,
    JsonSchema? thenSchema,
    JsonSchema? elseSchema,
    String? description,
    String? title,
  }) => JsonSchema(
    title: title,
    description: description,
    ifSchema: ifSchema,
    thenSchema: thenSchema,
    elseSchema: elseSchema,
  );

  factory JsonSchema.enumeration(
    List<Object?> values, {
    String? description,
    String? title,
    Object? defaultValue,
  }) => JsonSchema(
    title: title,
    description: description,
    enumValues: values,
    defaultValue: defaultValue,
  );

  factory JsonSchema.integer({
    String? description,
    String? title,
    num? minimum,
    num? maximum,
    bool? exclusiveMinimum,
    bool? exclusiveMaximum,
    num? multipleOf,
    Object? defaultValue,
  }) => JsonSchema(
    title: title,
    description: description,
    type: JsonSchemaTypeSingle('integer'),
    minimum: minimum,
    maximum: maximum,
    exclusiveMinimum: exclusiveMinimum,
    exclusiveMaximum: exclusiveMaximum,
    multipleOf: multipleOf,
    defaultValue: defaultValue,
  );

  factory JsonSchema.not(
    JsonSchema schema, {
    String? description,
    String? title,
  }) => JsonSchema(title: title, description: description, not: schema);

  factory JsonSchema.nullType({
    String? description,
    String? title,
    Object? defaultValue,
  }) => JsonSchema(
    title: title,
    description: description,
    type: JsonSchemaTypeSingle('null'),
    defaultValue: defaultValue,
  );

  factory JsonSchema.number({
    String? description,
    String? title,
    num? minimum,
    num? maximum,
    bool? exclusiveMinimum,
    bool? exclusiveMaximum,
    num? multipleOf,
    Object? defaultValue,
  }) => JsonSchema(
    title: title,
    description: description,
    type: JsonSchemaTypeSingle('number'),
    minimum: minimum,
    maximum: maximum,
    exclusiveMinimum: exclusiveMinimum,
    exclusiveMaximum: exclusiveMaximum,
    multipleOf: multipleOf,
    defaultValue: defaultValue,
  );

  factory JsonSchema.object(
    Map<String, JsonSchema> properties, {
    String? schema,
    String? id,
    String? description,
    String? title,
    List<String>? required,
    JsonSchemaAdditionalProperties? additionalProperties,
    Map<String, JsonSchema>? patternProperties,
    int? minProperties,
    int? maxProperties,
    Map<String, JsonSchema>? definitions,
  }) => JsonSchema(
    schema: schema,
    id: id,
    title: title,
    description: description,
    type: JsonSchemaTypeSingle('object'),
    properties: properties,
    required: required,
    additionalProperties: additionalProperties,
    patternProperties: patternProperties,
    minProperties: minProperties,
    maxProperties: maxProperties,
    definitions: definitions,
  );

  factory JsonSchema.oneOf(
    List<JsonSchema> schemas, {
    String? description,
    String? title,
  }) => JsonSchema(title: title, description: description, oneOf: schemas);

  factory JsonSchema.refSchema(
    String ref, {
    String? title,
    String? description,
  }) => JsonSchema(ref: ref, title: title, description: description);

  factory JsonSchema.string({
    String? description,
    String? title,
    int? minLength,
    int? maxLength,
    String? pattern,
    String? format,
    Object? defaultValue,
    List<Object?>? enumValues,
  }) => JsonSchema(
    title: title,
    description: description,
    type: JsonSchemaTypeSingle('string'),
    minLength: minLength,
    maxLength: maxLength,
    pattern: pattern,
    format: format,
    defaultValue: defaultValue,
    enumValues: enumValues,
  );

  factory JsonSchema.tuple(
    List<JsonSchema> itemSchemas, {
    String? description,
    String? title,
    int? minItems,
    int? maxItems,
    bool? uniqueItems,
  }) => JsonSchema(
    title: title,
    description: description,
    type: JsonSchemaTypeSingle('array'),
    items: JsonSchemaItemsArray(itemSchemas),
    minItems: minItems,
    maxItems: maxItems,
    uniqueItems: uniqueItems,
  );

  static JsonSchema fromJson(String json) => JsonSchemaMapper.fromJson(json);

  static JsonSchema fromMap(Map<String, dynamic> map) =>
      JsonSchemaMapper.fromMap(map);
}

// additionalProperties: bool | schema
@MappableClass(hook: JsonSchemaAdditionalPropertiesHook())
sealed class JsonSchemaAdditionalProperties
    with JsonSchemaAdditionalPropertiesMappable {}

@MappableClass(
  discriminatorValue: JsonSchemaAdditionalPropertiesForBool.checkType,
)
final class JsonSchemaAdditionalPropertiesForBool
    extends JsonSchemaAdditionalProperties
    with JsonSchemaAdditionalPropertiesForBoolMappable {
  final bool value;
  JsonSchemaAdditionalPropertiesForBool(this.value);

  static bool checkType(dynamic value) {
    return value is bool;
  }
}

@MappableClass(
  discriminatorValue: JsonSchemaAdditionalPropertiesForSchema.checkType,
)
final class JsonSchemaAdditionalPropertiesForSchema
    extends JsonSchemaAdditionalProperties
    with JsonSchemaAdditionalPropertiesForSchemaMappable {
  final JsonSchema schema;
  JsonSchemaAdditionalPropertiesForSchema(this.schema);

  static bool checkType(dynamic value) {
    return value is Map<String, dynamic>;
  }
}

// items: schema | [schema]
@MappableClass(hook: JsonSchemaItemsHook())
sealed class JsonSchemaItems with JsonSchemaItemsMappable {}

@MappableClass(discriminatorValue: JsonSchemaItemsArray.checkType)
final class JsonSchemaItemsArray extends JsonSchemaItems
    with JsonSchemaItemsArrayMappable {
  final List<JsonSchema> schemas;
  JsonSchemaItemsArray(this.schemas);

  static bool checkType(dynamic value) {
    // tuple form encoded as an array of schemas
    return value is List;
  }
}

@MappableClass(discriminatorValue: JsonSchemaItemsSingle.checkType)
final class JsonSchemaItemsSingle extends JsonSchemaItems
    with JsonSchemaItemsSingleMappable {
  final JsonSchema schema;
  JsonSchemaItemsSingle(this.schema);

  static bool checkType(dynamic value) {
    // single item schema encoded as an object
    return value is Map<String, dynamic>;
  }
}

// type: string | [string]
@MappableClass(hook: JsonSchemaTypeHook())
sealed class JsonSchemaType with JsonSchemaTypeMappable {}

@MappableClass(discriminatorValue: JsonSchemaTypeArray.checkType)
final class JsonSchemaTypeArray extends JsonSchemaType
    with JsonSchemaTypeArrayMappable {
  final List<String> values;
  JsonSchemaTypeArray(this.values);

  static bool checkType(dynamic value) {
    // list of primitive strings: ["string", "null", ...]
    return value is List;
  }
}

@MappableClass(discriminatorValue: JsonSchemaTypeSingle.checkType)
final class JsonSchemaTypeSingle extends JsonSchemaType
    with JsonSchemaTypeSingleMappable {
  final String value;
  JsonSchemaTypeSingle(this.value);

  static bool checkType(dynamic value) {
    // primitive string form: "string" | "number" | ...
    return value is String;
  }
}
