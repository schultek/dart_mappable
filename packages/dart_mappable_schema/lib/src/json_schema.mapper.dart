// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'json_schema.dart';

class JsonSchemaMapper extends ClassMapperBase<JsonSchema> {
  JsonSchemaMapper._();

  static JsonSchemaMapper? _instance;
  static JsonSchemaMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = JsonSchemaMapper._());
      JsonSchemaTypeMapper.ensureInitialized();
      JsonSchemaItemsMapper.ensureInitialized();
      JsonSchemaMapper.ensureInitialized();
      JsonSchemaAdditionalPropertiesMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'JsonSchema';

  static String? _$id(JsonSchema v) => v.id;
  static const Field<JsonSchema, String> _f$id = Field(
    'id',
    _$id,
    key: r'$id',
    opt: true,
  );
  static String? _$schema(JsonSchema v) => v.schema;
  static const Field<JsonSchema, String> _f$schema = Field(
    'schema',
    _$schema,
    key: r'$schema',
    opt: true,
  );
  static String? _$ref(JsonSchema v) => v.ref;
  static const Field<JsonSchema, String> _f$ref = Field(
    'ref',
    _$ref,
    key: r'$ref',
    opt: true,
  );
  static String? _$title(JsonSchema v) => v.title;
  static const Field<JsonSchema, String> _f$title = Field(
    'title',
    _$title,
    opt: true,
  );
  static String? _$description(JsonSchema v) => v.description;
  static const Field<JsonSchema, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static JsonSchemaType? _$type(JsonSchema v) => v.type;
  static const Field<JsonSchema, JsonSchemaType> _f$type = Field(
    'type',
    _$type,
    opt: true,
  );
  static List<Object?>? _$enumValues(JsonSchema v) => v.enumValues;
  static const Field<JsonSchema, List<Object?>> _f$enumValues = Field(
    'enumValues',
    _$enumValues,
    opt: true,
  );
  static JsonSchemaItems? _$items(JsonSchema v) => v.items;
  static const Field<JsonSchema, JsonSchemaItems> _f$items = Field(
    'items',
    _$items,
    opt: true,
  );
  static Map<String, JsonSchema>? _$properties(JsonSchema v) => v.properties;
  static const Field<JsonSchema, Map<String, JsonSchema>> _f$properties = Field(
    'properties',
    _$properties,
    opt: true,
  );
  static List<String>? _$required(JsonSchema v) => v.required;
  static const Field<JsonSchema, List<String>> _f$required = Field(
    'required',
    _$required,
    opt: true,
  );
  static JsonSchemaAdditionalProperties? _$additionalProperties(JsonSchema v) =>
      v.additionalProperties;
  static const Field<JsonSchema, JsonSchemaAdditionalProperties>
  _f$additionalProperties = Field(
    'additionalProperties',
    _$additionalProperties,
    opt: true,
  );
  static Map<String, JsonSchema>? _$patternProperties(JsonSchema v) =>
      v.patternProperties;
  static const Field<JsonSchema, Map<String, JsonSchema>> _f$patternProperties =
      Field('patternProperties', _$patternProperties, opt: true);
  static Map<String, JsonSchema>? _$definitions(JsonSchema v) => v.definitions;
  static const Field<JsonSchema, Map<String, JsonSchema>> _f$definitions =
      Field('definitions', _$definitions, opt: true);
  static List<JsonSchema>? _$allOf(JsonSchema v) => v.allOf;
  static const Field<JsonSchema, List<JsonSchema>> _f$allOf = Field(
    'allOf',
    _$allOf,
    opt: true,
  );
  static List<JsonSchema>? _$anyOf(JsonSchema v) => v.anyOf;
  static const Field<JsonSchema, List<JsonSchema>> _f$anyOf = Field(
    'anyOf',
    _$anyOf,
    opt: true,
  );
  static List<JsonSchema>? _$oneOf(JsonSchema v) => v.oneOf;
  static const Field<JsonSchema, List<JsonSchema>> _f$oneOf = Field(
    'oneOf',
    _$oneOf,
    opt: true,
  );
  static JsonSchema? _$not(JsonSchema v) => v.not;
  static const Field<JsonSchema, JsonSchema> _f$not = Field(
    'not',
    _$not,
    opt: true,
  );
  static JsonSchema? _$ifSchema(JsonSchema v) => v.ifSchema;
  static const Field<JsonSchema, JsonSchema> _f$ifSchema = Field(
    'ifSchema',
    _$ifSchema,
    opt: true,
  );
  static JsonSchema? _$thenSchema(JsonSchema v) => v.thenSchema;
  static const Field<JsonSchema, JsonSchema> _f$thenSchema = Field(
    'thenSchema',
    _$thenSchema,
    opt: true,
  );
  static JsonSchema? _$elseSchema(JsonSchema v) => v.elseSchema;
  static const Field<JsonSchema, JsonSchema> _f$elseSchema = Field(
    'elseSchema',
    _$elseSchema,
    opt: true,
  );
  static num? _$multipleOf(JsonSchema v) => v.multipleOf;
  static const Field<JsonSchema, num> _f$multipleOf = Field(
    'multipleOf',
    _$multipleOf,
    opt: true,
  );
  static num? _$maximum(JsonSchema v) => v.maximum;
  static const Field<JsonSchema, num> _f$maximum = Field(
    'maximum',
    _$maximum,
    opt: true,
  );
  static bool? _$exclusiveMaximum(JsonSchema v) => v.exclusiveMaximum;
  static const Field<JsonSchema, bool> _f$exclusiveMaximum = Field(
    'exclusiveMaximum',
    _$exclusiveMaximum,
    opt: true,
  );
  static num? _$minimum(JsonSchema v) => v.minimum;
  static const Field<JsonSchema, num> _f$minimum = Field(
    'minimum',
    _$minimum,
    opt: true,
  );
  static bool? _$exclusiveMinimum(JsonSchema v) => v.exclusiveMinimum;
  static const Field<JsonSchema, bool> _f$exclusiveMinimum = Field(
    'exclusiveMinimum',
    _$exclusiveMinimum,
    opt: true,
  );
  static int? _$maxLength(JsonSchema v) => v.maxLength;
  static const Field<JsonSchema, int> _f$maxLength = Field(
    'maxLength',
    _$maxLength,
    opt: true,
  );
  static int? _$minLength(JsonSchema v) => v.minLength;
  static const Field<JsonSchema, int> _f$minLength = Field(
    'minLength',
    _$minLength,
    opt: true,
  );
  static String? _$pattern(JsonSchema v) => v.pattern;
  static const Field<JsonSchema, String> _f$pattern = Field(
    'pattern',
    _$pattern,
    opt: true,
  );
  static String? _$format(JsonSchema v) => v.format;
  static const Field<JsonSchema, String> _f$format = Field(
    'format',
    _$format,
    opt: true,
  );
  static int? _$maxItems(JsonSchema v) => v.maxItems;
  static const Field<JsonSchema, int> _f$maxItems = Field(
    'maxItems',
    _$maxItems,
    opt: true,
  );
  static int? _$minItems(JsonSchema v) => v.minItems;
  static const Field<JsonSchema, int> _f$minItems = Field(
    'minItems',
    _$minItems,
    opt: true,
  );
  static bool? _$uniqueItems(JsonSchema v) => v.uniqueItems;
  static const Field<JsonSchema, bool> _f$uniqueItems = Field(
    'uniqueItems',
    _$uniqueItems,
    opt: true,
  );
  static List<Object?>? _$contains(JsonSchema v) => v.contains;
  static const Field<JsonSchema, List<Object?>> _f$contains = Field(
    'contains',
    _$contains,
    opt: true,
  );
  static int? _$maxProperties(JsonSchema v) => v.maxProperties;
  static const Field<JsonSchema, int> _f$maxProperties = Field(
    'maxProperties',
    _$maxProperties,
    opt: true,
  );
  static int? _$minProperties(JsonSchema v) => v.minProperties;
  static const Field<JsonSchema, int> _f$minProperties = Field(
    'minProperties',
    _$minProperties,
    opt: true,
  );
  static List<String>? _$dependencies(JsonSchema v) => v.dependencies;
  static const Field<JsonSchema, List<String>> _f$dependencies = Field(
    'dependencies',
    _$dependencies,
    opt: true,
  );
  static Object? _$defaultValue(JsonSchema v) => v.defaultValue;
  static const Field<JsonSchema, Object> _f$defaultValue = Field(
    'defaultValue',
    _$defaultValue,
    key: r'default',
    opt: true,
  );

  @override
  final MappableFields<JsonSchema> fields = const {
    #id: _f$id,
    #schema: _f$schema,
    #ref: _f$ref,
    #title: _f$title,
    #description: _f$description,
    #type: _f$type,
    #enumValues: _f$enumValues,
    #items: _f$items,
    #properties: _f$properties,
    #required: _f$required,
    #additionalProperties: _f$additionalProperties,
    #patternProperties: _f$patternProperties,
    #definitions: _f$definitions,
    #allOf: _f$allOf,
    #anyOf: _f$anyOf,
    #oneOf: _f$oneOf,
    #not: _f$not,
    #ifSchema: _f$ifSchema,
    #thenSchema: _f$thenSchema,
    #elseSchema: _f$elseSchema,
    #multipleOf: _f$multipleOf,
    #maximum: _f$maximum,
    #exclusiveMaximum: _f$exclusiveMaximum,
    #minimum: _f$minimum,
    #exclusiveMinimum: _f$exclusiveMinimum,
    #maxLength: _f$maxLength,
    #minLength: _f$minLength,
    #pattern: _f$pattern,
    #format: _f$format,
    #maxItems: _f$maxItems,
    #minItems: _f$minItems,
    #uniqueItems: _f$uniqueItems,
    #contains: _f$contains,
    #maxProperties: _f$maxProperties,
    #minProperties: _f$minProperties,
    #dependencies: _f$dependencies,
    #defaultValue: _f$defaultValue,
  };
  @override
  final bool ignoreNull = true;

  static JsonSchema _instantiate(DecodingData data) {
    return JsonSchema(
      id: data.dec(_f$id),
      schema: data.dec(_f$schema),
      ref: data.dec(_f$ref),
      title: data.dec(_f$title),
      description: data.dec(_f$description),
      type: data.dec(_f$type),
      enumValues: data.dec(_f$enumValues),
      items: data.dec(_f$items),
      properties: data.dec(_f$properties),
      required: data.dec(_f$required),
      additionalProperties: data.dec(_f$additionalProperties),
      patternProperties: data.dec(_f$patternProperties),
      definitions: data.dec(_f$definitions),
      allOf: data.dec(_f$allOf),
      anyOf: data.dec(_f$anyOf),
      oneOf: data.dec(_f$oneOf),
      not: data.dec(_f$not),
      ifSchema: data.dec(_f$ifSchema),
      thenSchema: data.dec(_f$thenSchema),
      elseSchema: data.dec(_f$elseSchema),
      multipleOf: data.dec(_f$multipleOf),
      maximum: data.dec(_f$maximum),
      exclusiveMaximum: data.dec(_f$exclusiveMaximum),
      minimum: data.dec(_f$minimum),
      exclusiveMinimum: data.dec(_f$exclusiveMinimum),
      maxLength: data.dec(_f$maxLength),
      minLength: data.dec(_f$minLength),
      pattern: data.dec(_f$pattern),
      format: data.dec(_f$format),
      maxItems: data.dec(_f$maxItems),
      minItems: data.dec(_f$minItems),
      uniqueItems: data.dec(_f$uniqueItems),
      contains: data.dec(_f$contains),
      maxProperties: data.dec(_f$maxProperties),
      minProperties: data.dec(_f$minProperties),
      dependencies: data.dec(_f$dependencies),
      defaultValue: data.dec(_f$defaultValue),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static JsonSchema fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<JsonSchema>(map);
  }

  static JsonSchema fromJson(String json) {
    return ensureInitialized().decodeJson<JsonSchema>(json);
  }
}

mixin JsonSchemaMappable {
  String toJson() {
    return JsonSchemaMapper.ensureInitialized().encodeJson<JsonSchema>(
      this as JsonSchema,
    );
  }

  Map<String, dynamic> toMap() {
    return JsonSchemaMapper.ensureInitialized().encodeMap<JsonSchema>(
      this as JsonSchema,
    );
  }

  JsonSchemaCopyWith<JsonSchema, JsonSchema, JsonSchema> get copyWith =>
      _JsonSchemaCopyWithImpl<JsonSchema, JsonSchema>(
        this as JsonSchema,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return JsonSchemaMapper.ensureInitialized().stringifyValue(
      this as JsonSchema,
    );
  }

  @override
  bool operator ==(Object other) {
    return JsonSchemaMapper.ensureInitialized().equalsValue(
      this as JsonSchema,
      other,
    );
  }

  @override
  int get hashCode {
    return JsonSchemaMapper.ensureInitialized().hashValue(this as JsonSchema);
  }
}

extension JsonSchemaValueCopy<$R, $Out>
    on ObjectCopyWith<$R, JsonSchema, $Out> {
  JsonSchemaCopyWith<$R, JsonSchema, $Out> get $asJsonSchema =>
      $base.as((v, t, t2) => _JsonSchemaCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class JsonSchemaCopyWith<$R, $In extends JsonSchema, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  JsonSchemaTypeCopyWith<$R, JsonSchemaType, JsonSchemaType>? get type;
  ListCopyWith<$R, Object?, ObjectCopyWith<$R, Object?, Object?>?>?
  get enumValues;
  JsonSchemaItemsCopyWith<$R, JsonSchemaItems, JsonSchemaItems>? get items;
  MapCopyWith<
    $R,
    String,
    JsonSchema,
    JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>
  >?
  get properties;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get required;
  JsonSchemaAdditionalPropertiesCopyWith<
    $R,
    JsonSchemaAdditionalProperties,
    JsonSchemaAdditionalProperties
  >?
  get additionalProperties;
  MapCopyWith<
    $R,
    String,
    JsonSchema,
    JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>
  >?
  get patternProperties;
  MapCopyWith<
    $R,
    String,
    JsonSchema,
    JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>
  >?
  get definitions;
  ListCopyWith<$R, JsonSchema, JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>>?
  get allOf;
  ListCopyWith<$R, JsonSchema, JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>>?
  get anyOf;
  ListCopyWith<$R, JsonSchema, JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>>?
  get oneOf;
  JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>? get not;
  JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>? get ifSchema;
  JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>? get thenSchema;
  JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>? get elseSchema;
  ListCopyWith<$R, Object?, ObjectCopyWith<$R, Object?, Object?>?>?
  get contains;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get dependencies;
  $R call({
    String? id,
    String? schema,
    String? ref,
    String? title,
    String? description,
    JsonSchemaType? type,
    List<Object?>? enumValues,
    JsonSchemaItems? items,
    Map<String, JsonSchema>? properties,
    List<String>? required,
    JsonSchemaAdditionalProperties? additionalProperties,
    Map<String, JsonSchema>? patternProperties,
    Map<String, JsonSchema>? definitions,
    List<JsonSchema>? allOf,
    List<JsonSchema>? anyOf,
    List<JsonSchema>? oneOf,
    JsonSchema? not,
    JsonSchema? ifSchema,
    JsonSchema? thenSchema,
    JsonSchema? elseSchema,
    num? multipleOf,
    num? maximum,
    bool? exclusiveMaximum,
    num? minimum,
    bool? exclusiveMinimum,
    int? maxLength,
    int? minLength,
    String? pattern,
    String? format,
    int? maxItems,
    int? minItems,
    bool? uniqueItems,
    List<Object?>? contains,
    int? maxProperties,
    int? minProperties,
    List<String>? dependencies,
    Object? defaultValue,
  });
  JsonSchemaCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _JsonSchemaCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, JsonSchema, $Out>
    implements JsonSchemaCopyWith<$R, JsonSchema, $Out> {
  _JsonSchemaCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<JsonSchema> $mapper =
      JsonSchemaMapper.ensureInitialized();
  @override
  JsonSchemaTypeCopyWith<$R, JsonSchemaType, JsonSchemaType>? get type =>
      $value.type?.copyWith.$chain((v) => call(type: v));
  @override
  ListCopyWith<$R, Object?, ObjectCopyWith<$R, Object?, Object?>?>?
  get enumValues => $value.enumValues != null
      ? ListCopyWith(
          $value.enumValues!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(enumValues: v),
        )
      : null;
  @override
  JsonSchemaItemsCopyWith<$R, JsonSchemaItems, JsonSchemaItems>? get items =>
      $value.items?.copyWith.$chain((v) => call(items: v));
  @override
  MapCopyWith<
    $R,
    String,
    JsonSchema,
    JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>
  >?
  get properties => $value.properties != null
      ? MapCopyWith(
          $value.properties!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(properties: v),
        )
      : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get required =>
      $value.required != null
      ? ListCopyWith(
          $value.required!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(required: v),
        )
      : null;
  @override
  JsonSchemaAdditionalPropertiesCopyWith<
    $R,
    JsonSchemaAdditionalProperties,
    JsonSchemaAdditionalProperties
  >?
  get additionalProperties => $value.additionalProperties?.copyWith.$chain(
    (v) => call(additionalProperties: v),
  );
  @override
  MapCopyWith<
    $R,
    String,
    JsonSchema,
    JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>
  >?
  get patternProperties => $value.patternProperties != null
      ? MapCopyWith(
          $value.patternProperties!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(patternProperties: v),
        )
      : null;
  @override
  MapCopyWith<
    $R,
    String,
    JsonSchema,
    JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>
  >?
  get definitions => $value.definitions != null
      ? MapCopyWith(
          $value.definitions!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(definitions: v),
        )
      : null;
  @override
  ListCopyWith<$R, JsonSchema, JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>>?
  get allOf => $value.allOf != null
      ? ListCopyWith(
          $value.allOf!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(allOf: v),
        )
      : null;
  @override
  ListCopyWith<$R, JsonSchema, JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>>?
  get anyOf => $value.anyOf != null
      ? ListCopyWith(
          $value.anyOf!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(anyOf: v),
        )
      : null;
  @override
  ListCopyWith<$R, JsonSchema, JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>>?
  get oneOf => $value.oneOf != null
      ? ListCopyWith(
          $value.oneOf!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(oneOf: v),
        )
      : null;
  @override
  JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>? get not =>
      $value.not?.copyWith.$chain((v) => call(not: v));
  @override
  JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>? get ifSchema =>
      $value.ifSchema?.copyWith.$chain((v) => call(ifSchema: v));
  @override
  JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>? get thenSchema =>
      $value.thenSchema?.copyWith.$chain((v) => call(thenSchema: v));
  @override
  JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>? get elseSchema =>
      $value.elseSchema?.copyWith.$chain((v) => call(elseSchema: v));
  @override
  ListCopyWith<$R, Object?, ObjectCopyWith<$R, Object?, Object?>?>?
  get contains => $value.contains != null
      ? ListCopyWith(
          $value.contains!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(contains: v),
        )
      : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get dependencies => $value.dependencies != null
      ? ListCopyWith(
          $value.dependencies!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(dependencies: v),
        )
      : null;
  @override
  $R call({
    Object? id = $none,
    Object? schema = $none,
    Object? ref = $none,
    Object? title = $none,
    Object? description = $none,
    Object? type = $none,
    Object? enumValues = $none,
    Object? items = $none,
    Object? properties = $none,
    Object? required = $none,
    Object? additionalProperties = $none,
    Object? patternProperties = $none,
    Object? definitions = $none,
    Object? allOf = $none,
    Object? anyOf = $none,
    Object? oneOf = $none,
    Object? not = $none,
    Object? ifSchema = $none,
    Object? thenSchema = $none,
    Object? elseSchema = $none,
    Object? multipleOf = $none,
    Object? maximum = $none,
    Object? exclusiveMaximum = $none,
    Object? minimum = $none,
    Object? exclusiveMinimum = $none,
    Object? maxLength = $none,
    Object? minLength = $none,
    Object? pattern = $none,
    Object? format = $none,
    Object? maxItems = $none,
    Object? minItems = $none,
    Object? uniqueItems = $none,
    Object? contains = $none,
    Object? maxProperties = $none,
    Object? minProperties = $none,
    Object? dependencies = $none,
    Object? defaultValue = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (schema != $none) #schema: schema,
      if (ref != $none) #ref: ref,
      if (title != $none) #title: title,
      if (description != $none) #description: description,
      if (type != $none) #type: type,
      if (enumValues != $none) #enumValues: enumValues,
      if (items != $none) #items: items,
      if (properties != $none) #properties: properties,
      if (required != $none) #required: required,
      if (additionalProperties != $none)
        #additionalProperties: additionalProperties,
      if (patternProperties != $none) #patternProperties: patternProperties,
      if (definitions != $none) #definitions: definitions,
      if (allOf != $none) #allOf: allOf,
      if (anyOf != $none) #anyOf: anyOf,
      if (oneOf != $none) #oneOf: oneOf,
      if (not != $none) #not: not,
      if (ifSchema != $none) #ifSchema: ifSchema,
      if (thenSchema != $none) #thenSchema: thenSchema,
      if (elseSchema != $none) #elseSchema: elseSchema,
      if (multipleOf != $none) #multipleOf: multipleOf,
      if (maximum != $none) #maximum: maximum,
      if (exclusiveMaximum != $none) #exclusiveMaximum: exclusiveMaximum,
      if (minimum != $none) #minimum: minimum,
      if (exclusiveMinimum != $none) #exclusiveMinimum: exclusiveMinimum,
      if (maxLength != $none) #maxLength: maxLength,
      if (minLength != $none) #minLength: minLength,
      if (pattern != $none) #pattern: pattern,
      if (format != $none) #format: format,
      if (maxItems != $none) #maxItems: maxItems,
      if (minItems != $none) #minItems: minItems,
      if (uniqueItems != $none) #uniqueItems: uniqueItems,
      if (contains != $none) #contains: contains,
      if (maxProperties != $none) #maxProperties: maxProperties,
      if (minProperties != $none) #minProperties: minProperties,
      if (dependencies != $none) #dependencies: dependencies,
      if (defaultValue != $none) #defaultValue: defaultValue,
    }),
  );
  @override
  JsonSchema $make(CopyWithData data) => JsonSchema(
    id: data.get(#id, or: $value.id),
    schema: data.get(#schema, or: $value.schema),
    ref: data.get(#ref, or: $value.ref),
    title: data.get(#title, or: $value.title),
    description: data.get(#description, or: $value.description),
    type: data.get(#type, or: $value.type),
    enumValues: data.get(#enumValues, or: $value.enumValues),
    items: data.get(#items, or: $value.items),
    properties: data.get(#properties, or: $value.properties),
    required: data.get(#required, or: $value.required),
    additionalProperties: data.get(
      #additionalProperties,
      or: $value.additionalProperties,
    ),
    patternProperties: data.get(
      #patternProperties,
      or: $value.patternProperties,
    ),
    definitions: data.get(#definitions, or: $value.definitions),
    allOf: data.get(#allOf, or: $value.allOf),
    anyOf: data.get(#anyOf, or: $value.anyOf),
    oneOf: data.get(#oneOf, or: $value.oneOf),
    not: data.get(#not, or: $value.not),
    ifSchema: data.get(#ifSchema, or: $value.ifSchema),
    thenSchema: data.get(#thenSchema, or: $value.thenSchema),
    elseSchema: data.get(#elseSchema, or: $value.elseSchema),
    multipleOf: data.get(#multipleOf, or: $value.multipleOf),
    maximum: data.get(#maximum, or: $value.maximum),
    exclusiveMaximum: data.get(#exclusiveMaximum, or: $value.exclusiveMaximum),
    minimum: data.get(#minimum, or: $value.minimum),
    exclusiveMinimum: data.get(#exclusiveMinimum, or: $value.exclusiveMinimum),
    maxLength: data.get(#maxLength, or: $value.maxLength),
    minLength: data.get(#minLength, or: $value.minLength),
    pattern: data.get(#pattern, or: $value.pattern),
    format: data.get(#format, or: $value.format),
    maxItems: data.get(#maxItems, or: $value.maxItems),
    minItems: data.get(#minItems, or: $value.minItems),
    uniqueItems: data.get(#uniqueItems, or: $value.uniqueItems),
    contains: data.get(#contains, or: $value.contains),
    maxProperties: data.get(#maxProperties, or: $value.maxProperties),
    minProperties: data.get(#minProperties, or: $value.minProperties),
    dependencies: data.get(#dependencies, or: $value.dependencies),
    defaultValue: data.get(#defaultValue, or: $value.defaultValue),
  );

  @override
  JsonSchemaCopyWith<$R2, JsonSchema, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _JsonSchemaCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class JsonSchemaTypeMapper extends ClassMapperBase<JsonSchemaType> {
  JsonSchemaTypeMapper._();

  static JsonSchemaTypeMapper? _instance;
  static JsonSchemaTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = JsonSchemaTypeMapper._());
      JsonSchemaTypeArrayMapper.ensureInitialized();
      JsonSchemaTypeSingleMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'JsonSchemaType';

  @override
  final MappableFields<JsonSchemaType> fields = const {};

  @override
  final MappingHook hook = const JsonSchemaTypeHook();
  static JsonSchemaType _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('JsonSchemaType');
  }

  @override
  final Function instantiate = _instantiate;

  static JsonSchemaType fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<JsonSchemaType>(map);
  }

  static JsonSchemaType fromJson(String json) {
    return ensureInitialized().decodeJson<JsonSchemaType>(json);
  }
}

mixin JsonSchemaTypeMappable {
  String toJson();
  Map<String, dynamic> toMap();
  JsonSchemaTypeCopyWith<JsonSchemaType, JsonSchemaType, JsonSchemaType>
  get copyWith;
}

abstract class JsonSchemaTypeCopyWith<$R, $In extends JsonSchemaType, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  JsonSchemaTypeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class JsonSchemaItemsMapper extends ClassMapperBase<JsonSchemaItems> {
  JsonSchemaItemsMapper._();

  static JsonSchemaItemsMapper? _instance;
  static JsonSchemaItemsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = JsonSchemaItemsMapper._());
      JsonSchemaItemsArrayMapper.ensureInitialized();
      JsonSchemaItemsSingleMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'JsonSchemaItems';

  @override
  final MappableFields<JsonSchemaItems> fields = const {};

  @override
  final MappingHook hook = const JsonSchemaItemsHook();
  static JsonSchemaItems _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('JsonSchemaItems');
  }

  @override
  final Function instantiate = _instantiate;

  static JsonSchemaItems fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<JsonSchemaItems>(map);
  }

  static JsonSchemaItems fromJson(String json) {
    return ensureInitialized().decodeJson<JsonSchemaItems>(json);
  }
}

mixin JsonSchemaItemsMappable {
  String toJson();
  Map<String, dynamic> toMap();
  JsonSchemaItemsCopyWith<JsonSchemaItems, JsonSchemaItems, JsonSchemaItems>
  get copyWith;
}

abstract class JsonSchemaItemsCopyWith<$R, $In extends JsonSchemaItems, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  JsonSchemaItemsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class JsonSchemaAdditionalPropertiesMapper
    extends ClassMapperBase<JsonSchemaAdditionalProperties> {
  JsonSchemaAdditionalPropertiesMapper._();

  static JsonSchemaAdditionalPropertiesMapper? _instance;
  static JsonSchemaAdditionalPropertiesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = JsonSchemaAdditionalPropertiesMapper._(),
      );
      JsonSchemaAdditionalPropertiesForBoolMapper.ensureInitialized();
      JsonSchemaAdditionalPropertiesForSchemaMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'JsonSchemaAdditionalProperties';

  @override
  final MappableFields<JsonSchemaAdditionalProperties> fields = const {};

  @override
  final MappingHook hook = const JsonSchemaAdditionalPropertiesHook();
  static JsonSchemaAdditionalProperties _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('JsonSchemaAdditionalProperties');
  }

  @override
  final Function instantiate = _instantiate;

  static JsonSchemaAdditionalProperties fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<JsonSchemaAdditionalProperties>(map);
  }

  static JsonSchemaAdditionalProperties fromJson(String json) {
    return ensureInitialized().decodeJson<JsonSchemaAdditionalProperties>(json);
  }
}

mixin JsonSchemaAdditionalPropertiesMappable {
  String toJson();
  Map<String, dynamic> toMap();
  JsonSchemaAdditionalPropertiesCopyWith<
    JsonSchemaAdditionalProperties,
    JsonSchemaAdditionalProperties,
    JsonSchemaAdditionalProperties
  >
  get copyWith;
}

abstract class JsonSchemaAdditionalPropertiesCopyWith<
  $R,
  $In extends JsonSchemaAdditionalProperties,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  JsonSchemaAdditionalPropertiesCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class JsonSchemaAdditionalPropertiesForBoolMapper
    extends SubClassMapperBase<JsonSchemaAdditionalPropertiesForBool> {
  JsonSchemaAdditionalPropertiesForBoolMapper._();

  static JsonSchemaAdditionalPropertiesForBoolMapper? _instance;
  static JsonSchemaAdditionalPropertiesForBoolMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = JsonSchemaAdditionalPropertiesForBoolMapper._(),
      );
      JsonSchemaAdditionalPropertiesMapper.ensureInitialized().addSubMapper(
        _instance!,
      );
    }
    return _instance!;
  }

  @override
  final String id = 'JsonSchemaAdditionalPropertiesForBool';

  static bool _$value(JsonSchemaAdditionalPropertiesForBool v) => v.value;
  static const Field<JsonSchemaAdditionalPropertiesForBool, bool> _f$value =
      Field('value', _$value);

  @override
  final MappableFields<JsonSchemaAdditionalPropertiesForBool> fields = const {
    #value: _f$value,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue =
      JsonSchemaAdditionalPropertiesForBool.checkType;
  @override
  late final ClassMapperBase superMapper =
      JsonSchemaAdditionalPropertiesMapper.ensureInitialized();

  @override
  final MappingHook superHook = const JsonSchemaAdditionalPropertiesHook();

  static JsonSchemaAdditionalPropertiesForBool _instantiate(DecodingData data) {
    return JsonSchemaAdditionalPropertiesForBool(data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static JsonSchemaAdditionalPropertiesForBool fromMap(
    Map<String, dynamic> map,
  ) {
    return ensureInitialized().decodeMap<JsonSchemaAdditionalPropertiesForBool>(
      map,
    );
  }

  static JsonSchemaAdditionalPropertiesForBool fromJson(String json) {
    return ensureInitialized()
        .decodeJson<JsonSchemaAdditionalPropertiesForBool>(json);
  }
}

mixin JsonSchemaAdditionalPropertiesForBoolMappable {
  String toJson() {
    return JsonSchemaAdditionalPropertiesForBoolMapper.ensureInitialized()
        .encodeJson<JsonSchemaAdditionalPropertiesForBool>(
          this as JsonSchemaAdditionalPropertiesForBool,
        );
  }

  Map<String, dynamic> toMap() {
    return JsonSchemaAdditionalPropertiesForBoolMapper.ensureInitialized()
        .encodeMap<JsonSchemaAdditionalPropertiesForBool>(
          this as JsonSchemaAdditionalPropertiesForBool,
        );
  }

  JsonSchemaAdditionalPropertiesForBoolCopyWith<
    JsonSchemaAdditionalPropertiesForBool,
    JsonSchemaAdditionalPropertiesForBool,
    JsonSchemaAdditionalPropertiesForBool
  >
  get copyWith =>
      _JsonSchemaAdditionalPropertiesForBoolCopyWithImpl<
        JsonSchemaAdditionalPropertiesForBool,
        JsonSchemaAdditionalPropertiesForBool
      >(this as JsonSchemaAdditionalPropertiesForBool, $identity, $identity);
  @override
  String toString() {
    return JsonSchemaAdditionalPropertiesForBoolMapper.ensureInitialized()
        .stringifyValue(this as JsonSchemaAdditionalPropertiesForBool);
  }

  @override
  bool operator ==(Object other) {
    return JsonSchemaAdditionalPropertiesForBoolMapper.ensureInitialized()
        .equalsValue(this as JsonSchemaAdditionalPropertiesForBool, other);
  }

  @override
  int get hashCode {
    return JsonSchemaAdditionalPropertiesForBoolMapper.ensureInitialized()
        .hashValue(this as JsonSchemaAdditionalPropertiesForBool);
  }
}

extension JsonSchemaAdditionalPropertiesForBoolValueCopy<$R, $Out>
    on ObjectCopyWith<$R, JsonSchemaAdditionalPropertiesForBool, $Out> {
  JsonSchemaAdditionalPropertiesForBoolCopyWith<
    $R,
    JsonSchemaAdditionalPropertiesForBool,
    $Out
  >
  get $asJsonSchemaAdditionalPropertiesForBool => $base.as(
    (v, t, t2) =>
        _JsonSchemaAdditionalPropertiesForBoolCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class JsonSchemaAdditionalPropertiesForBoolCopyWith<
  $R,
  $In extends JsonSchemaAdditionalPropertiesForBool,
  $Out
>
    implements JsonSchemaAdditionalPropertiesCopyWith<$R, $In, $Out> {
  @override
  $R call({bool? value});
  JsonSchemaAdditionalPropertiesForBoolCopyWith<$R2, $In, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _JsonSchemaAdditionalPropertiesForBoolCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, JsonSchemaAdditionalPropertiesForBool, $Out>
    implements
        JsonSchemaAdditionalPropertiesForBoolCopyWith<
          $R,
          JsonSchemaAdditionalPropertiesForBool,
          $Out
        > {
  _JsonSchemaAdditionalPropertiesForBoolCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<JsonSchemaAdditionalPropertiesForBool> $mapper =
      JsonSchemaAdditionalPropertiesForBoolMapper.ensureInitialized();
  @override
  $R call({bool? value}) =>
      $apply(FieldCopyWithData({if (value != null) #value: value}));
  @override
  JsonSchemaAdditionalPropertiesForBool $make(CopyWithData data) =>
      JsonSchemaAdditionalPropertiesForBool(data.get(#value, or: $value.value));

  @override
  JsonSchemaAdditionalPropertiesForBoolCopyWith<
    $R2,
    JsonSchemaAdditionalPropertiesForBool,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _JsonSchemaAdditionalPropertiesForBoolCopyWithImpl<$R2, $Out2>(
        $value,
        $cast,
        t,
      );
}

class JsonSchemaAdditionalPropertiesForSchemaMapper
    extends SubClassMapperBase<JsonSchemaAdditionalPropertiesForSchema> {
  JsonSchemaAdditionalPropertiesForSchemaMapper._();

  static JsonSchemaAdditionalPropertiesForSchemaMapper? _instance;
  static JsonSchemaAdditionalPropertiesForSchemaMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = JsonSchemaAdditionalPropertiesForSchemaMapper._(),
      );
      JsonSchemaAdditionalPropertiesMapper.ensureInitialized().addSubMapper(
        _instance!,
      );
      JsonSchemaMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'JsonSchemaAdditionalPropertiesForSchema';

  static JsonSchema _$schema(JsonSchemaAdditionalPropertiesForSchema v) =>
      v.schema;
  static const Field<JsonSchemaAdditionalPropertiesForSchema, JsonSchema>
  _f$schema = Field('schema', _$schema);

  @override
  final MappableFields<JsonSchemaAdditionalPropertiesForSchema> fields = const {
    #schema: _f$schema,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue =
      JsonSchemaAdditionalPropertiesForSchema.checkType;
  @override
  late final ClassMapperBase superMapper =
      JsonSchemaAdditionalPropertiesMapper.ensureInitialized();

  @override
  final MappingHook superHook = const JsonSchemaAdditionalPropertiesHook();

  static JsonSchemaAdditionalPropertiesForSchema _instantiate(
    DecodingData data,
  ) {
    return JsonSchemaAdditionalPropertiesForSchema(data.dec(_f$schema));
  }

  @override
  final Function instantiate = _instantiate;

  static JsonSchemaAdditionalPropertiesForSchema fromMap(
    Map<String, dynamic> map,
  ) {
    return ensureInitialized()
        .decodeMap<JsonSchemaAdditionalPropertiesForSchema>(map);
  }

  static JsonSchemaAdditionalPropertiesForSchema fromJson(String json) {
    return ensureInitialized()
        .decodeJson<JsonSchemaAdditionalPropertiesForSchema>(json);
  }
}

mixin JsonSchemaAdditionalPropertiesForSchemaMappable {
  String toJson() {
    return JsonSchemaAdditionalPropertiesForSchemaMapper.ensureInitialized()
        .encodeJson<JsonSchemaAdditionalPropertiesForSchema>(
          this as JsonSchemaAdditionalPropertiesForSchema,
        );
  }

  Map<String, dynamic> toMap() {
    return JsonSchemaAdditionalPropertiesForSchemaMapper.ensureInitialized()
        .encodeMap<JsonSchemaAdditionalPropertiesForSchema>(
          this as JsonSchemaAdditionalPropertiesForSchema,
        );
  }

  JsonSchemaAdditionalPropertiesForSchemaCopyWith<
    JsonSchemaAdditionalPropertiesForSchema,
    JsonSchemaAdditionalPropertiesForSchema,
    JsonSchemaAdditionalPropertiesForSchema
  >
  get copyWith =>
      _JsonSchemaAdditionalPropertiesForSchemaCopyWithImpl<
        JsonSchemaAdditionalPropertiesForSchema,
        JsonSchemaAdditionalPropertiesForSchema
      >(this as JsonSchemaAdditionalPropertiesForSchema, $identity, $identity);
  @override
  String toString() {
    return JsonSchemaAdditionalPropertiesForSchemaMapper.ensureInitialized()
        .stringifyValue(this as JsonSchemaAdditionalPropertiesForSchema);
  }

  @override
  bool operator ==(Object other) {
    return JsonSchemaAdditionalPropertiesForSchemaMapper.ensureInitialized()
        .equalsValue(this as JsonSchemaAdditionalPropertiesForSchema, other);
  }

  @override
  int get hashCode {
    return JsonSchemaAdditionalPropertiesForSchemaMapper.ensureInitialized()
        .hashValue(this as JsonSchemaAdditionalPropertiesForSchema);
  }
}

extension JsonSchemaAdditionalPropertiesForSchemaValueCopy<$R, $Out>
    on ObjectCopyWith<$R, JsonSchemaAdditionalPropertiesForSchema, $Out> {
  JsonSchemaAdditionalPropertiesForSchemaCopyWith<
    $R,
    JsonSchemaAdditionalPropertiesForSchema,
    $Out
  >
  get $asJsonSchemaAdditionalPropertiesForSchema => $base.as(
    (v, t, t2) =>
        _JsonSchemaAdditionalPropertiesForSchemaCopyWithImpl<$R, $Out>(
          v,
          t,
          t2,
        ),
  );
}

abstract class JsonSchemaAdditionalPropertiesForSchemaCopyWith<
  $R,
  $In extends JsonSchemaAdditionalPropertiesForSchema,
  $Out
>
    implements JsonSchemaAdditionalPropertiesCopyWith<$R, $In, $Out> {
  JsonSchemaCopyWith<$R, JsonSchema, JsonSchema> get schema;
  @override
  $R call({JsonSchema? schema});
  JsonSchemaAdditionalPropertiesForSchemaCopyWith<$R2, $In, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _JsonSchemaAdditionalPropertiesForSchemaCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, JsonSchemaAdditionalPropertiesForSchema, $Out>
    implements
        JsonSchemaAdditionalPropertiesForSchemaCopyWith<
          $R,
          JsonSchemaAdditionalPropertiesForSchema,
          $Out
        > {
  _JsonSchemaAdditionalPropertiesForSchemaCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<JsonSchemaAdditionalPropertiesForSchema> $mapper =
      JsonSchemaAdditionalPropertiesForSchemaMapper.ensureInitialized();
  @override
  JsonSchemaCopyWith<$R, JsonSchema, JsonSchema> get schema =>
      $value.schema.copyWith.$chain((v) => call(schema: v));
  @override
  $R call({JsonSchema? schema}) =>
      $apply(FieldCopyWithData({if (schema != null) #schema: schema}));
  @override
  JsonSchemaAdditionalPropertiesForSchema $make(CopyWithData data) =>
      JsonSchemaAdditionalPropertiesForSchema(
        data.get(#schema, or: $value.schema),
      );

  @override
  JsonSchemaAdditionalPropertiesForSchemaCopyWith<
    $R2,
    JsonSchemaAdditionalPropertiesForSchema,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _JsonSchemaAdditionalPropertiesForSchemaCopyWithImpl<$R2, $Out2>(
        $value,
        $cast,
        t,
      );
}

class JsonSchemaItemsArrayMapper
    extends SubClassMapperBase<JsonSchemaItemsArray> {
  JsonSchemaItemsArrayMapper._();

  static JsonSchemaItemsArrayMapper? _instance;
  static JsonSchemaItemsArrayMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = JsonSchemaItemsArrayMapper._());
      JsonSchemaItemsMapper.ensureInitialized().addSubMapper(_instance!);
      JsonSchemaMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'JsonSchemaItemsArray';

  static List<JsonSchema> _$schemas(JsonSchemaItemsArray v) => v.schemas;
  static const Field<JsonSchemaItemsArray, List<JsonSchema>> _f$schemas = Field(
    'schemas',
    _$schemas,
  );

  @override
  final MappableFields<JsonSchemaItemsArray> fields = const {
    #schemas: _f$schemas,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = JsonSchemaItemsArray.checkType;
  @override
  late final ClassMapperBase superMapper =
      JsonSchemaItemsMapper.ensureInitialized();

  @override
  final MappingHook superHook = const JsonSchemaItemsHook();

  static JsonSchemaItemsArray _instantiate(DecodingData data) {
    return JsonSchemaItemsArray(data.dec(_f$schemas));
  }

  @override
  final Function instantiate = _instantiate;

  static JsonSchemaItemsArray fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<JsonSchemaItemsArray>(map);
  }

  static JsonSchemaItemsArray fromJson(String json) {
    return ensureInitialized().decodeJson<JsonSchemaItemsArray>(json);
  }
}

mixin JsonSchemaItemsArrayMappable {
  String toJson() {
    return JsonSchemaItemsArrayMapper.ensureInitialized()
        .encodeJson<JsonSchemaItemsArray>(this as JsonSchemaItemsArray);
  }

  Map<String, dynamic> toMap() {
    return JsonSchemaItemsArrayMapper.ensureInitialized()
        .encodeMap<JsonSchemaItemsArray>(this as JsonSchemaItemsArray);
  }

  JsonSchemaItemsArrayCopyWith<
    JsonSchemaItemsArray,
    JsonSchemaItemsArray,
    JsonSchemaItemsArray
  >
  get copyWith =>
      _JsonSchemaItemsArrayCopyWithImpl<
        JsonSchemaItemsArray,
        JsonSchemaItemsArray
      >(this as JsonSchemaItemsArray, $identity, $identity);
  @override
  String toString() {
    return JsonSchemaItemsArrayMapper.ensureInitialized().stringifyValue(
      this as JsonSchemaItemsArray,
    );
  }

  @override
  bool operator ==(Object other) {
    return JsonSchemaItemsArrayMapper.ensureInitialized().equalsValue(
      this as JsonSchemaItemsArray,
      other,
    );
  }

  @override
  int get hashCode {
    return JsonSchemaItemsArrayMapper.ensureInitialized().hashValue(
      this as JsonSchemaItemsArray,
    );
  }
}

extension JsonSchemaItemsArrayValueCopy<$R, $Out>
    on ObjectCopyWith<$R, JsonSchemaItemsArray, $Out> {
  JsonSchemaItemsArrayCopyWith<$R, JsonSchemaItemsArray, $Out>
  get $asJsonSchemaItemsArray => $base.as(
    (v, t, t2) => _JsonSchemaItemsArrayCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class JsonSchemaItemsArrayCopyWith<
  $R,
  $In extends JsonSchemaItemsArray,
  $Out
>
    implements JsonSchemaItemsCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, JsonSchema, JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>>
  get schemas;
  @override
  $R call({List<JsonSchema>? schemas});
  JsonSchemaItemsArrayCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _JsonSchemaItemsArrayCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, JsonSchemaItemsArray, $Out>
    implements JsonSchemaItemsArrayCopyWith<$R, JsonSchemaItemsArray, $Out> {
  _JsonSchemaItemsArrayCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<JsonSchemaItemsArray> $mapper =
      JsonSchemaItemsArrayMapper.ensureInitialized();
  @override
  ListCopyWith<$R, JsonSchema, JsonSchemaCopyWith<$R, JsonSchema, JsonSchema>>
  get schemas => ListCopyWith(
    $value.schemas,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(schemas: v),
  );
  @override
  $R call({List<JsonSchema>? schemas}) =>
      $apply(FieldCopyWithData({if (schemas != null) #schemas: schemas}));
  @override
  JsonSchemaItemsArray $make(CopyWithData data) =>
      JsonSchemaItemsArray(data.get(#schemas, or: $value.schemas));

  @override
  JsonSchemaItemsArrayCopyWith<$R2, JsonSchemaItemsArray, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _JsonSchemaItemsArrayCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class JsonSchemaItemsSingleMapper
    extends SubClassMapperBase<JsonSchemaItemsSingle> {
  JsonSchemaItemsSingleMapper._();

  static JsonSchemaItemsSingleMapper? _instance;
  static JsonSchemaItemsSingleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = JsonSchemaItemsSingleMapper._());
      JsonSchemaItemsMapper.ensureInitialized().addSubMapper(_instance!);
      JsonSchemaMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'JsonSchemaItemsSingle';

  static JsonSchema _$schema(JsonSchemaItemsSingle v) => v.schema;
  static const Field<JsonSchemaItemsSingle, JsonSchema> _f$schema = Field(
    'schema',
    _$schema,
  );

  @override
  final MappableFields<JsonSchemaItemsSingle> fields = const {
    #schema: _f$schema,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = JsonSchemaItemsSingle.checkType;
  @override
  late final ClassMapperBase superMapper =
      JsonSchemaItemsMapper.ensureInitialized();

  @override
  final MappingHook superHook = const JsonSchemaItemsHook();

  static JsonSchemaItemsSingle _instantiate(DecodingData data) {
    return JsonSchemaItemsSingle(data.dec(_f$schema));
  }

  @override
  final Function instantiate = _instantiate;

  static JsonSchemaItemsSingle fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<JsonSchemaItemsSingle>(map);
  }

  static JsonSchemaItemsSingle fromJson(String json) {
    return ensureInitialized().decodeJson<JsonSchemaItemsSingle>(json);
  }
}

mixin JsonSchemaItemsSingleMappable {
  String toJson() {
    return JsonSchemaItemsSingleMapper.ensureInitialized()
        .encodeJson<JsonSchemaItemsSingle>(this as JsonSchemaItemsSingle);
  }

  Map<String, dynamic> toMap() {
    return JsonSchemaItemsSingleMapper.ensureInitialized()
        .encodeMap<JsonSchemaItemsSingle>(this as JsonSchemaItemsSingle);
  }

  JsonSchemaItemsSingleCopyWith<
    JsonSchemaItemsSingle,
    JsonSchemaItemsSingle,
    JsonSchemaItemsSingle
  >
  get copyWith =>
      _JsonSchemaItemsSingleCopyWithImpl<
        JsonSchemaItemsSingle,
        JsonSchemaItemsSingle
      >(this as JsonSchemaItemsSingle, $identity, $identity);
  @override
  String toString() {
    return JsonSchemaItemsSingleMapper.ensureInitialized().stringifyValue(
      this as JsonSchemaItemsSingle,
    );
  }

  @override
  bool operator ==(Object other) {
    return JsonSchemaItemsSingleMapper.ensureInitialized().equalsValue(
      this as JsonSchemaItemsSingle,
      other,
    );
  }

  @override
  int get hashCode {
    return JsonSchemaItemsSingleMapper.ensureInitialized().hashValue(
      this as JsonSchemaItemsSingle,
    );
  }
}

extension JsonSchemaItemsSingleValueCopy<$R, $Out>
    on ObjectCopyWith<$R, JsonSchemaItemsSingle, $Out> {
  JsonSchemaItemsSingleCopyWith<$R, JsonSchemaItemsSingle, $Out>
  get $asJsonSchemaItemsSingle => $base.as(
    (v, t, t2) => _JsonSchemaItemsSingleCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class JsonSchemaItemsSingleCopyWith<
  $R,
  $In extends JsonSchemaItemsSingle,
  $Out
>
    implements JsonSchemaItemsCopyWith<$R, $In, $Out> {
  JsonSchemaCopyWith<$R, JsonSchema, JsonSchema> get schema;
  @override
  $R call({JsonSchema? schema});
  JsonSchemaItemsSingleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _JsonSchemaItemsSingleCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, JsonSchemaItemsSingle, $Out>
    implements JsonSchemaItemsSingleCopyWith<$R, JsonSchemaItemsSingle, $Out> {
  _JsonSchemaItemsSingleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<JsonSchemaItemsSingle> $mapper =
      JsonSchemaItemsSingleMapper.ensureInitialized();
  @override
  JsonSchemaCopyWith<$R, JsonSchema, JsonSchema> get schema =>
      $value.schema.copyWith.$chain((v) => call(schema: v));
  @override
  $R call({JsonSchema? schema}) =>
      $apply(FieldCopyWithData({if (schema != null) #schema: schema}));
  @override
  JsonSchemaItemsSingle $make(CopyWithData data) =>
      JsonSchemaItemsSingle(data.get(#schema, or: $value.schema));

  @override
  JsonSchemaItemsSingleCopyWith<$R2, JsonSchemaItemsSingle, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _JsonSchemaItemsSingleCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class JsonSchemaTypeArrayMapper
    extends SubClassMapperBase<JsonSchemaTypeArray> {
  JsonSchemaTypeArrayMapper._();

  static JsonSchemaTypeArrayMapper? _instance;
  static JsonSchemaTypeArrayMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = JsonSchemaTypeArrayMapper._());
      JsonSchemaTypeMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'JsonSchemaTypeArray';

  static List<String> _$values(JsonSchemaTypeArray v) => v.values;
  static const Field<JsonSchemaTypeArray, List<String>> _f$values = Field(
    'values',
    _$values,
  );

  @override
  final MappableFields<JsonSchemaTypeArray> fields = const {#values: _f$values};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = JsonSchemaTypeArray.checkType;
  @override
  late final ClassMapperBase superMapper =
      JsonSchemaTypeMapper.ensureInitialized();

  @override
  final MappingHook superHook = const JsonSchemaTypeHook();

  static JsonSchemaTypeArray _instantiate(DecodingData data) {
    return JsonSchemaTypeArray(data.dec(_f$values));
  }

  @override
  final Function instantiate = _instantiate;

  static JsonSchemaTypeArray fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<JsonSchemaTypeArray>(map);
  }

  static JsonSchemaTypeArray fromJson(String json) {
    return ensureInitialized().decodeJson<JsonSchemaTypeArray>(json);
  }
}

mixin JsonSchemaTypeArrayMappable {
  String toJson() {
    return JsonSchemaTypeArrayMapper.ensureInitialized()
        .encodeJson<JsonSchemaTypeArray>(this as JsonSchemaTypeArray);
  }

  Map<String, dynamic> toMap() {
    return JsonSchemaTypeArrayMapper.ensureInitialized()
        .encodeMap<JsonSchemaTypeArray>(this as JsonSchemaTypeArray);
  }

  JsonSchemaTypeArrayCopyWith<
    JsonSchemaTypeArray,
    JsonSchemaTypeArray,
    JsonSchemaTypeArray
  >
  get copyWith =>
      _JsonSchemaTypeArrayCopyWithImpl<
        JsonSchemaTypeArray,
        JsonSchemaTypeArray
      >(this as JsonSchemaTypeArray, $identity, $identity);
  @override
  String toString() {
    return JsonSchemaTypeArrayMapper.ensureInitialized().stringifyValue(
      this as JsonSchemaTypeArray,
    );
  }

  @override
  bool operator ==(Object other) {
    return JsonSchemaTypeArrayMapper.ensureInitialized().equalsValue(
      this as JsonSchemaTypeArray,
      other,
    );
  }

  @override
  int get hashCode {
    return JsonSchemaTypeArrayMapper.ensureInitialized().hashValue(
      this as JsonSchemaTypeArray,
    );
  }
}

extension JsonSchemaTypeArrayValueCopy<$R, $Out>
    on ObjectCopyWith<$R, JsonSchemaTypeArray, $Out> {
  JsonSchemaTypeArrayCopyWith<$R, JsonSchemaTypeArray, $Out>
  get $asJsonSchemaTypeArray => $base.as(
    (v, t, t2) => _JsonSchemaTypeArrayCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class JsonSchemaTypeArrayCopyWith<
  $R,
  $In extends JsonSchemaTypeArray,
  $Out
>
    implements JsonSchemaTypeCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get values;
  @override
  $R call({List<String>? values});
  JsonSchemaTypeArrayCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _JsonSchemaTypeArrayCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, JsonSchemaTypeArray, $Out>
    implements JsonSchemaTypeArrayCopyWith<$R, JsonSchemaTypeArray, $Out> {
  _JsonSchemaTypeArrayCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<JsonSchemaTypeArray> $mapper =
      JsonSchemaTypeArrayMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get values =>
      ListCopyWith(
        $value.values,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(values: v),
      );
  @override
  $R call({List<String>? values}) =>
      $apply(FieldCopyWithData({if (values != null) #values: values}));
  @override
  JsonSchemaTypeArray $make(CopyWithData data) =>
      JsonSchemaTypeArray(data.get(#values, or: $value.values));

  @override
  JsonSchemaTypeArrayCopyWith<$R2, JsonSchemaTypeArray, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _JsonSchemaTypeArrayCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class JsonSchemaTypeSingleMapper
    extends SubClassMapperBase<JsonSchemaTypeSingle> {
  JsonSchemaTypeSingleMapper._();

  static JsonSchemaTypeSingleMapper? _instance;
  static JsonSchemaTypeSingleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = JsonSchemaTypeSingleMapper._());
      JsonSchemaTypeMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'JsonSchemaTypeSingle';

  static String _$value(JsonSchemaTypeSingle v) => v.value;
  static const Field<JsonSchemaTypeSingle, String> _f$value = Field(
    'value',
    _$value,
  );

  @override
  final MappableFields<JsonSchemaTypeSingle> fields = const {#value: _f$value};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = JsonSchemaTypeSingle.checkType;
  @override
  late final ClassMapperBase superMapper =
      JsonSchemaTypeMapper.ensureInitialized();

  @override
  final MappingHook superHook = const JsonSchemaTypeHook();

  static JsonSchemaTypeSingle _instantiate(DecodingData data) {
    return JsonSchemaTypeSingle(data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static JsonSchemaTypeSingle fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<JsonSchemaTypeSingle>(map);
  }

  static JsonSchemaTypeSingle fromJson(String json) {
    return ensureInitialized().decodeJson<JsonSchemaTypeSingle>(json);
  }
}

mixin JsonSchemaTypeSingleMappable {
  String toJson() {
    return JsonSchemaTypeSingleMapper.ensureInitialized()
        .encodeJson<JsonSchemaTypeSingle>(this as JsonSchemaTypeSingle);
  }

  Map<String, dynamic> toMap() {
    return JsonSchemaTypeSingleMapper.ensureInitialized()
        .encodeMap<JsonSchemaTypeSingle>(this as JsonSchemaTypeSingle);
  }

  JsonSchemaTypeSingleCopyWith<
    JsonSchemaTypeSingle,
    JsonSchemaTypeSingle,
    JsonSchemaTypeSingle
  >
  get copyWith =>
      _JsonSchemaTypeSingleCopyWithImpl<
        JsonSchemaTypeSingle,
        JsonSchemaTypeSingle
      >(this as JsonSchemaTypeSingle, $identity, $identity);
  @override
  String toString() {
    return JsonSchemaTypeSingleMapper.ensureInitialized().stringifyValue(
      this as JsonSchemaTypeSingle,
    );
  }

  @override
  bool operator ==(Object other) {
    return JsonSchemaTypeSingleMapper.ensureInitialized().equalsValue(
      this as JsonSchemaTypeSingle,
      other,
    );
  }

  @override
  int get hashCode {
    return JsonSchemaTypeSingleMapper.ensureInitialized().hashValue(
      this as JsonSchemaTypeSingle,
    );
  }
}

extension JsonSchemaTypeSingleValueCopy<$R, $Out>
    on ObjectCopyWith<$R, JsonSchemaTypeSingle, $Out> {
  JsonSchemaTypeSingleCopyWith<$R, JsonSchemaTypeSingle, $Out>
  get $asJsonSchemaTypeSingle => $base.as(
    (v, t, t2) => _JsonSchemaTypeSingleCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class JsonSchemaTypeSingleCopyWith<
  $R,
  $In extends JsonSchemaTypeSingle,
  $Out
>
    implements JsonSchemaTypeCopyWith<$R, $In, $Out> {
  @override
  $R call({String? value});
  JsonSchemaTypeSingleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _JsonSchemaTypeSingleCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, JsonSchemaTypeSingle, $Out>
    implements JsonSchemaTypeSingleCopyWith<$R, JsonSchemaTypeSingle, $Out> {
  _JsonSchemaTypeSingleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<JsonSchemaTypeSingle> $mapper =
      JsonSchemaTypeSingleMapper.ensureInitialized();
  @override
  $R call({String? value}) =>
      $apply(FieldCopyWithData({if (value != null) #value: value}));
  @override
  JsonSchemaTypeSingle $make(CopyWithData data) =>
      JsonSchemaTypeSingle(data.get(#value, or: $value.value));

  @override
  JsonSchemaTypeSingleCopyWith<$R2, JsonSchemaTypeSingle, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _JsonSchemaTypeSingleCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

