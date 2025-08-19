import 'package:dart_mappable/dart_mappable.dart';
import 'package:type_plus/type_plus.dart';

import 'json_schema.dart';

JsonSchema buildJsonSchemaFor<T extends Object>({
  String? id,
  String? schema = 'http://json-schema.org/draft-07/schema#',
  MapperContainer? container,
  Map<String, Type>? fieldTypeOverrides,
  bool includeNullForOptional = true,
}) {
  container ??= MapperContainer.globals;
  _registerFieldFactory();
  final mapperBase = container.get<T>();
  if (mapperBase is! ClassMapperBase<T>) {
    throw ArgumentError(
      'Type $T has no ClassMapperBase (missing @MappableClass?)',
    );
  }
  final ctx = _BuilderContext(
    container: container,
    fieldTypeOverrides: fieldTypeOverrides ?? const {},
    includeNullForOptional: includeNullForOptional,
  );
  final root = ctx._schemaForMapper<Object>(
    mapperBase as ClassMapperBase<Object>,
    isRoot: true,
    id: id,
    schema: schema,
  );
  return ctx.definitions.isEmpty
      ? root
      : root.copyWith(definitions: ctx.definitions);
}

// ---------------- Internal Implementation ----------------

class _BuilderContext {
  final MapperContainer container;
  final Map<String, Type> fieldTypeOverrides;
  final bool includeNullForOptional;

  // collected definitions
  final Map<String, JsonSchema> definitions = {};
  final Set<Type> _visited = {};

  _BuilderContext({
    required this.container,
    required this.fieldTypeOverrides,
    required this.includeNullForOptional,
  });

  JsonSchema _schemaForMapper<T extends Object>(
    ClassMapperBase<T> mapper, {
    bool isRoot = false,
    String? id,
    String? schema,
  }) {
    final type = mapper.type;
    if (!isRoot) {
      // avoid rebuilding existing definition
      if (_visited.contains(type)) {
        return JsonSchema.refSchema('#/definitions/${mapper.id}');
      }
      _visited.add(type);
    }

    final properties = <String, JsonSchema>{};
    final required = <String>[];

    // fields
    for (final field in mapper.fields.values) {
      final key = field.key;
      final overrideKey = '${mapper.id}.$key';
      Type? valueType = fieldTypeOverrides[overrideKey];

      // Field<M,V> second generic argument is value type
      valueType ??= _extractFieldValueType(field);

      final defVal = field.def;
      var fieldSchema = _schemaForType(valueType, defValue: defVal);

      // optional -> allow null
      if (includeNullForOptional && field.opt) {
        fieldSchema = JsonSchema.oneOf([fieldSchema, JsonSchema.nullType()]);
      }

      properties[key] = fieldSchema;
      if (!field.opt) required.add(key);
    }

    final objectSchema = JsonSchema.object(
      properties,
      required: required.isEmpty ? null : required,
    );
    // If this mapper itself is a subclass, inject its discriminator fixed value so the variant schema is self-describing.
    try {
      if (mapper is SubClassMapperBase) {
        final dynamic dyn = mapper;
        final discKey = dyn.discriminatorKey;
        final discValue = dyn.discriminatorValue;
        if (discValue is String && discKey is String) {
          final existing = properties[discKey];
          if (existing == null) {
            properties[discKey] = JsonSchema.enumeration([discValue]);
            if (!required.contains(discKey)) required.add(discKey);
          } else if (existing.enumValues == null ||
              !existing.enumValues!.contains(discValue)) {
            properties[discKey] = JsonSchema.enumeration(
              {
                if (existing.enumValues != null) ...existing.enumValues!,
                discValue,
              }.toList(),
            );
          }
        }
      }
    } catch (_) {}
    // ----- Polymorphism (subclasses) -----
    // Detect subclasses (SubClassMapperBase) whose superMapper == current mapper.
    try {
      final subclasses = <SubClassMapperBase>[];
      for (final m in container.getAll()) {
        if (m is SubClassMapperBase) {
          try {
            final superMapper = m.superMapper as ClassMapperBase?;
            if (superMapper?.id == mapper.id) subclasses.add(m);
          } catch (_) {}
        }
      }

      if (subclasses.isNotEmpty) {
        final discKey = subclasses.first.discriminatorKey;
        final discValues = <String>{};
        for (final sub in subclasses) {
          final dv = sub.discriminatorValue;
          if (dv is String) discValues.add(dv);
          // build subclass definition
          _schemaForMapper<Object>(sub as ClassMapperBase<Object>);
        }
        // Add / merge discriminator property
        final existing = properties[discKey];
        final mergedValues = <Object?>{
          if (existing?.enumValues != null) ...existing!.enumValues!,
          ...discValues,
        }.toList();
        properties[discKey] = JsonSchema.enumeration(mergedValues);
        if (!required.contains(discKey)) required.add(discKey);

        final oneOfSchemas = subclasses
            .map((s) => JsonSchema.refSchema('#/definitions/${s.id}'))
            .toList();

        final polyObject = objectSchema.copyWith(
          oneOf: oneOfSchemas,
          properties: properties,
          required: required.isEmpty ? null : required,
        );

        if (!isRoot) {
          definitions[mapper.id] = polyObject;
          return JsonSchema.refSchema('#/definitions/${mapper.id}');
        }
        return polyObject.copyWith(title: mapper.id);
      }
    } catch (_) {}

    if (!isRoot) {
      definitions[mapper.id] = objectSchema;
      return JsonSchema.refSchema('#/definitions/${mapper.id}');
    }
    return objectSchema.copyWith(title: mapper.id, schema: schema, id: id);
  }

  JsonSchema _schemaForType(Type? t, {dynamic defValue}) {
    if (t == null) {
      return JsonSchema.object(
        const {},
        additionalProperties: JsonSchemaAdditionalPropertiesForBool(true),
      );
    }

    // Primitive
    if (t == String) return JsonSchema.string(defaultValue: defValue);
    if (t == int) return JsonSchema.integer(defaultValue: defValue);
    if (t == double || t == num) {
      return JsonSchema.number(defaultValue: defValue);
    }
    if (t == bool) return JsonSchema.boolean(defaultValue: defValue);
    if (t == DateTime) return JsonSchema.string(format: 'date-time');

    // collections
    final base = t.base;
    if (base == List || base == Set) {
      final elemType = t.args.isNotEmpty ? t.args[0] : null;
      final itemSchema = _schemaForType(elemType);
      return JsonSchema.array(itemSchema);
    }
    if (base == Map) {
      final keyType = t.args.isNotEmpty ? t.args[0] : null;
      final valueType = t.args.length > 1 ? t.args[1] : null;
      if (keyType != String) {
        final entrySchema = JsonSchema.object(
          {'key': JsonSchema.string(), 'value': _schemaForType(valueType)},
          required: ['key', 'value'],
        );
        return JsonSchema.array(entrySchema);
      }
      final valueSchema = _schemaForType(valueType);
      return JsonSchema.object(
        const {},
        additionalProperties: JsonSchemaAdditionalPropertiesForSchema(
          valueSchema,
        ),
      );
    }

    // nested mappable
    try {
      final mapper = container.getAll().whereType<ClassMapperBase>().firstWhere(
        (m) => m.type == t,
      );
      return _schemaForMapper<Object>(mapper);
    } catch (_) {}

    // fallback any
    return JsonSchema.anyOf([
      JsonSchema.string(),
      JsonSchema.number(),
      JsonSchema.boolean(),
      JsonSchema.object(
        const {},
        additionalProperties: JsonSchemaAdditionalPropertiesForBool(true),
      ),
      JsonSchema.array(
        JsonSchema.anyOf([
          JsonSchema.string(),
          JsonSchema.number(),
          JsonSchema.boolean(),
        ]),
      ),
      JsonSchema.nullType(),
    ]);
  }

  Type? _extractFieldValueType(Field<Object, Object?> field) {
    try {
      final args = field.runtimeType.args; // Field<M,V>
      if (args.length >= 2) return args[1];
    } catch (_) {}
    return null; // unresolved -> any fallback
  }
}

Type captureType<T>() => typeOf<T>();

bool _fieldFactoryRegistered = false;
void _registerFieldFactory() {
  if (_fieldFactoryRegistered) return;
  _fieldFactoryRegistered = true;
  TypePlus.addFactory(<M extends Object, V>(Function f) => f<Field<M, V>>());
}
