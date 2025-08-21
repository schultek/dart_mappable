import 'package:dart_mappable/dart_mappable.dart';
import 'package:type_plus/type_plus.dart';

import 'json_schema.dart';

bool _fieldFactoryRegistered = false;

/// Build JSON Schema for type T. Scans referenced mappable classes first,
/// then builds schemas in a second phase to avoid deep recursion.
JsonSchema buildJsonSchemaFor<T extends Object>({
  String? id,
  String? schema = 'http://json-schema.org/draft-07/schema#',
  MapperContainer? container,
  Map<String, Type>? fieldTypeOverrides,
  bool includeNullForOptional = true,
}) {
  container ??= MapperContainer.globals;
  _registerFieldFactory();

  final rootMapper = container.get<T>() as ClassMapperBase<T>;

  // Index mappers and map base id -> subclasses
  final all = container.getAll();
  final Map<Type, ClassMapperBase<Object>> typeToClass = {};
  for (final m in all) {
    if (m is ClassMapperBase) {
      typeToClass[m.type] = m;
    }
  }
  final Map<String, List<SubClassMapperBase>> baseIdToSubs = {};
  for (final m in all) {
    if (m is SubClassMapperBase) {
      try {
        final sup = m.superMapper as ClassMapperBase?;
        if (sup != null) {
          baseIdToSubs.putIfAbsent(sup.id, () => []).add(m);
        }
      } catch (_) {}
    }
  }

  // Discovery: explicit stack DFS, track visited types
  final Set<Type> visited = {};
  final List<ClassMapperBase<Object>> stack = [rootMapper];
  while (stack.isNotEmpty) {
    final current = stack.removeLast();
    final t = current.type;
    if (!visited.add(t)) continue;

    // subclasses
    final subs = baseIdToSubs[current.id];
    if (subs != null) {
      stack.addAll(subs);
    }

    // field dependencies
    for (final f in current.fields.values) {
      final Type? fieldType = _resolveFieldValueType(f);
      _enqueueType(fieldType, typeToClass, stack, visited);
      // collection / generic inner types
      try {
        final base = fieldType?.base;
        if (base == List || base == Set) {
          final elem = fieldType!.args.isNotEmpty ? fieldType.args[0] : null;
          _enqueueType(elem, typeToClass, stack, visited);
        } else if (base == Map) {
          final valueType =
              fieldType!.args.length > 1 ? fieldType.args[1] : null;
          _enqueueType(valueType, typeToClass, stack, visited);
        }
      } catch (_) {}
    }
  }

  // Build: create schema for each visited type
  final Map<String, JsonSchema> built = {};
  for (final t in visited) {
    final mapper = typeToClass[t]!;
    built[mapper.id] = _buildClassSchema(
      mapper,
      isRoot: t == rootMapper.type,
      fieldTypeOverrides: fieldTypeOverrides ?? const {},
      includeNullForOptional: includeNullForOptional,
      typeToClass: typeToClass,
      baseIdToSubs: baseIdToSubs,
      builtSchemas: built,
      container: container,
    );
  }

  final rootSchema = built[rootMapper.id]!;
  final definitions = Map<String, JsonSchema>.from(built)
    ..remove(rootMapper.id);
  return definitions.isEmpty
      ? rootSchema.copyWith(id: id, schema: schema, title: rootMapper.id)
      : rootSchema.copyWith(
        id: id,
        schema: schema,
        title: rootMapper.id,
        definitions: definitions,
      );
}

// Build helpers

JsonSchema _buildClassSchema(
  ClassMapperBase<Object> mapper, {
  required bool isRoot,
  required Map<String, Type> fieldTypeOverrides,
  required bool includeNullForOptional,
  required Map<Type, ClassMapperBase<Object>> typeToClass,
  required Map<String, List<SubClassMapperBase>> baseIdToSubs,
  required Map<String, JsonSchema> builtSchemas,
  required MapperContainer container,
}) {
  final props = <String, JsonSchema>{};
  final required = <String>[];

  // field properties
  for (final f in mapper.fields.values) {
    final overrideKey = '${mapper.id}.${f.key}';
    Type? valueType = fieldTypeOverrides[overrideKey];
    valueType ??= _resolveFieldValueType(f);
    final defVal = f.def;
    var fieldSchema = _schemaForType(
      valueType,
      typeToClass: typeToClass,
      fieldTypeOverrides: fieldTypeOverrides,
      includeNullForOptional: includeNullForOptional,
      defValue: defVal,
      container: container,
    );
    if (includeNullForOptional && f.opt && defVal == null) {
      fieldSchema = JsonSchema.oneOf([fieldSchema, JsonSchema.nullType()]);
    }
    props[f.key] = fieldSchema;
    if (!f.opt) required.add(f.key);
  }

  // If self is a subclass add discriminator property
  if (mapper is SubClassMapperBase) {
    final discValue = mapper.discriminatorValue;
    if (discValue is String) {
      props[mapper.discriminatorKey] = JsonSchema.string(constValue: discValue);
      if (!required.contains(mapper.discriminatorKey)) {
        required.add(mapper.discriminatorKey);
      }
    }
  }

  // Polymorphic base: add oneOf + discriminator enum
  List<JsonSchema>? oneOf;
  final subs = baseIdToSubs[mapper.id];
  if (subs != null && subs.isNotEmpty) {
    final discKey = subs.first.discriminatorKey;
    final discValues =
        <String>{
          for (final s in subs)
            if (s.discriminatorValue is String) s.discriminatorValue as String,
        }.toList();
    // merge existing
    final existing = props[discKey];
    final merged =
        <String>{
          if (existing?.enumValues != null)
            ...existing!.enumValues!.whereType<String>(),
          ...discValues,
        }.toList();
    props[discKey] = JsonSchema.string(enumValues: merged);
    if (!required.contains(discKey)) required.add(discKey);
    oneOf = [
      for (final s in subs) JsonSchema.refSchema('#/definitions/${s.id}'),
    ];
  }

  return JsonSchema(
    title: isRoot ? mapper.id : null,
    type: JsonSchemaTypeSingle('object'),
    properties: props,
    required: required.isEmpty ? null : required,
    oneOf: oneOf,
    additionalProperties: JsonSchemaAdditionalPropertiesForBool(false),
  );
}

void _enqueueType(
  Type? t,
  Map<Type, ClassMapperBase<Object>> typeToClass,
  List<ClassMapperBase<Object>> stack,
  Set<Type> visited,
) {
  if (t == null) return;
  final ClassMapperBase<Object>? mapper = typeToClass[t];
  if (mapper == null) return;
  if (visited.contains(t)) return;
  stack.add(mapper);
}

void _registerFieldFactory() {
  if (_fieldFactoryRegistered) return;
  _fieldFactoryRegistered = true;
  TypePlus.addFactory(<M extends Object, V>(Function f) => f<Field<M, V>>());
}

Type? _resolveFieldValueType(Field<Object, Object?> field) {
  try {
    final args = field.runtimeType.args; // Field<M,V>
    if (args.length >= 2) return args[1];
  } catch (_) {}
  return null;
}

JsonSchema _schemaForType(
  Type? t, {
  required Map<Type, ClassMapperBase<Object>> typeToClass,
  required Map<String, Type> fieldTypeOverrides,
  required bool includeNullForOptional,
  required MapperContainer container,
  dynamic defValue,
}) {
  if (t == null) {
    return JsonSchema.object(
      const {},
      additionalProperties: JsonSchemaAdditionalPropertiesForBool(true),
    );
  }
  if (t == String) return JsonSchema.string(defaultValue: defValue as String?);
  if (t == int) return JsonSchema.integer(defaultValue: defValue as int?);
  if (t == double || t == num) {
    return JsonSchema.number(defaultValue: defValue as num?);
  }
  if (t == bool) return JsonSchema.boolean(defaultValue: defValue as bool?);
  if (t == DateTime) return JsonSchema.string(format: 'date-time');

  final base = t.base;
  if (base == List || base == Set) {
    final elem = t.args.isNotEmpty ? t.args[0] : null;
    return JsonSchema.array(
      _schemaForType(
        elem,
        typeToClass: typeToClass,
        fieldTypeOverrides: fieldTypeOverrides,
        includeNullForOptional: includeNullForOptional,
        container: container,
      ),
    );
  }
  if (base == Map) {
    final keyType = t.args.isNotEmpty ? t.args[0] : null;
    final valueType = t.args.length > 1 ? t.args[1] : null;
    if (keyType != String) {
      final entrySchema = JsonSchema.object(
        {
          'key': JsonSchema.string(),
          'value': _schemaForType(
            valueType,
            typeToClass: typeToClass,
            fieldTypeOverrides: fieldTypeOverrides,
            includeNullForOptional: includeNullForOptional,
            container: container,
          ),
        },
        required: ['key', 'value'],
      );
      return JsonSchema.array(entrySchema);
    }
    final vSchema = _schemaForType(
      valueType,
      typeToClass: typeToClass,
      fieldTypeOverrides: fieldTypeOverrides,
      includeNullForOptional: includeNullForOptional,
      container: container,
    );
    return JsonSchema.object(
      const {},
      additionalProperties: JsonSchemaAdditionalPropertiesForSchema(vSchema),
    );
  }

  // Mappable class -> $ref (definitions are built in the batch phase)
  final classMapper = typeToClass[t];
  if (classMapper != null) {
    return JsonSchema.refSchema('#/definitions/${classMapper.id}');
  }

  // Enum -> string enum
  try {
    // Simple linear lookup (enum count is typically small)
    // If needed, cache Type -> EnumMapper for performance
    final enumMapper = container.get(t);
    if (enumMapper is EnumMapper) {
      return JsonSchema.string(enumValues: enumMapper.enums.keys.toList());
    }
  } catch (_) {}

  // fallback any
  return JsonSchema();
}
