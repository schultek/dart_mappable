/// Utility class for generating JSON Schema representations.
///
/// This provides helpers for mapping Dart types to JSON Schema types.
/// The generated mapper code uses these helpers to construct the full schema.
class JsonSchema {
  JsonSchema._();

  /// JSON Schema for a `String` type.
  static Map<String, dynamic> string({
    bool nullable = false,
    String? description,
  }) {
    return _withNullable({'type': 'string'}, nullable, description);
  }

  /// JSON Schema for an `int` type.
  static Map<String, dynamic> integer({
    bool nullable = false,
    String? description,
  }) {
    return _withNullable({'type': 'integer'}, nullable, description);
  }

  /// JSON Schema for a `double` or `num` type.
  static Map<String, dynamic> number({
    bool nullable = false,
    String? description,
  }) {
    return _withNullable({'type': 'number'}, nullable, description);
  }

  /// JSON Schema for a `bool` type.
  static Map<String, dynamic> boolean({
    bool nullable = false,
    String? description,
  }) {
    return _withNullable({'type': 'boolean'}, nullable, description);
  }

  /// JSON Schema for a `DateTime` type.
  static Map<String, dynamic> dateTime({
    bool nullable = false,
    String? description,
  }) {
    return _withNullable(
      {'type': 'string', 'format': 'date-time'},
      nullable,
      description,
    );
  }

  /// JSON Schema for an `array` type (List, Set, Iterable).
  static Map<String, dynamic> array(
    Map<String, dynamic> items, {
    bool nullable = false,
    String? description,
  }) {
    return _withNullable(
      {'type': 'array', 'items': items},
      nullable,
      description,
    );
  }

  /// JSON Schema for a `Map<String, V>` type.
  static Map<String, dynamic> map(
    Map<String, dynamic> additionalProperties, {
    bool nullable = false,
    String? description,
  }) {
    return _withNullable(
      {'type': 'object', 'additionalProperties': additionalProperties},
      nullable,
      description,
    );
  }

  /// JSON Schema for an enum type.
  static Map<String, dynamic> enumSchema(
    List<dynamic> values, {
    bool nullable = false,
    String? description,
  }) {
    return _withNullable(
      {'type': 'string', 'enum': values},
      nullable,
      description,
    );
  }

  /// JSON Schema for a nested object type.
  ///
  /// This wraps a schema from another mapper's `toJsonSchema()` call,
  /// optionally adding nullable support.
  static Map<String, dynamic> object(
    Map<String, dynamic> schema, {
    bool nullable = false,
    String? description,
  }) {
    return _withNullable(schema, nullable, description);
  }

  /// JSON Schema for a dynamic/Object type (any value).
  static Map<String, dynamic> dynamic_({
    bool nullable = false,
    String? description,
  }) {
    return _withNullable({}, nullable, description);
  }

  /// Builds a complete object schema from properties and required fields.
  static Map<String, dynamic> objectSchema({
    required Map<String, dynamic> properties,
    required List<String> required,
  }) {
    return {
      'type': 'object',
      if (required.isNotEmpty) 'required': required,
      'properties': properties,
      'additionalProperties': false,
    };
  }

  static Map<String, dynamic> _withNullable(
    Map<String, dynamic> schema,
    bool nullable, [
    String? description,
  ]) {
    if (description != null) {
      schema = {...schema, 'description': description};
    }
    if (nullable) {
      return {...schema, 'nullable': true};
    }
    return schema;
  }
}
