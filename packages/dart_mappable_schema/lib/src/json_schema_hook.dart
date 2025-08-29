import 'package:dart_mappable/dart_mappable.dart';

import 'json_schema.dart';

class JsonSchemaAdditionalPropertiesHook extends MappingHook {
  const JsonSchemaAdditionalPropertiesHook();

  @override
  Object? afterDecode(Object? value) {
    if (value is bool) {
      return JsonSchemaAdditionalPropertiesForBool(value);
    }
    if (value is Map<String, dynamic>) {
      return JsonSchemaAdditionalPropertiesForSchema(JsonSchema.fromMap(value));
    }
    return value;
  }

  @override
  Object? beforeEncode(Object? value) {
    if (value is JsonSchemaAdditionalPropertiesForBool) {
      return value.value;
    }
    if (value is JsonSchemaAdditionalPropertiesForSchema) {
      return value.schema.toMap();
    }
    return value;
  }
}

class JsonSchemaItemsHook extends MappingHook {
  const JsonSchemaItemsHook();

  @override
  Object? afterDecode(Object? value) {
    if (value is Map<String, dynamic>) {
      return JsonSchemaItemsSingle(JsonSchema.fromMap(value));
    }
    if (value is List) {
      return JsonSchemaItemsArray(
        value
            .map((e) => JsonSchema.fromMap(e as Map<String, dynamic>))
            .toList(),
      );
    }
    return value;
  }

  @override
  Object? beforeEncode(Object? value) {
    if (value is JsonSchemaItemsSingle) {
      return value.schema.toMap();
    }
    if (value is JsonSchemaItemsArray) {
      return value.schemas.map((e) => e.toMap()).toList();
    }
    return value;
  }
}

class JsonSchemaTypeHook extends MappingHook {
  const JsonSchemaTypeHook();

  @override
  Object? afterDecode(Object? value) {
    final v = value;
    if (v is String) {
      return JsonSchemaTypeSingle(v);
    }
    if (v is List) {
      return JsonSchemaTypeArray(v.cast<String>());
    }
    return value;
  }

  @override
  Object? beforeEncode(Object? value) {
    if (value is JsonSchemaTypeSingle) {
      return value.value; // encode as single string
    }
    if (value is JsonSchemaTypeArray) {
      return value.values; // encode as list
    }
    return value;
  }
}
