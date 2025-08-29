// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
// ignore: implementation_imports
import 'package:type_plus/src/types_registry.dart' show TypeRegistry;
import 'package:type_plus/type_plus.dart' hide typeOf;

import '../dart_mappable.dart';

const _containerIssueLink =
    'https://github.com/schultek/dart_mappable/issues/159';
const _containerDeprecationMessage =
    'If you are using this check out the following issue for discussion: $_containerIssueLink. '
    'May be removed in a future version.';

/// Additional options to be passed to [MapperContainer.toValue].
///
/// {@category Generics}
/// {@category Mapper Container}
class EncodingOptions {
  EncodingOptions({
    this.includeTypeId,
    this.inheritOptions = true,
    this.shallow,
    this.data,
  });

  /// Whether to include the type id of the encoding object.
  ///
  /// If set, this adds a '__type' property with the specific runtime type
  /// of the encoding object. If left untouched, the container automatically decides whether to include
  /// the type id based on the static and dynamic type of an object.
  ///
  /// The key can be changed from '__type' to something else by setting [MapperContainer.typeIdKey].
  final bool? includeTypeId;

  /// Whether to inherit this options for nested calls to [MapperContainer.toValue],
  /// like for encoding fields of a class.
  final bool inheritOptions;

  /// Whether to encode nested objects or just one level deep.
  final bool? shallow;

  /// Custom data object passed to the mapper.
  final Object? data;

  EncodingOptions copyWith({Object? data}) {
    return EncodingOptions(
      includeTypeId: includeTypeId,
      inheritOptions: inheritOptions,
      shallow: shallow,
      data: data ?? this.data,
    );
  }
}

/// Additional options to be passed to [MapperContainer.fromValue].
///
/// {@category Generics}
/// {@category Mapper Container}
class DecodingOptions {
  DecodingOptions({this.type, this.data});

  /// The target type to decode to, if different from the mappers type.
  final Type? type;

  /// Custom data object passed to the mapper.
  final Object? data;
}

/// The mapper container manages a set of mappers and is the main interface for
/// accessing mapping functionalities.
///
/// `MapperContainer`s are the backbone of `dart_mappable`. A `MapperContainer`s
/// job is to lookup the correct mapper for a given type or value and call its
/// respective method.
/// To find the mapper for a given type, the container first looks at its own
/// **set of mappers** and when there is no match it refers to its **linked containers**.
///
/// {@category Generics}
/// {@category Mapper Container}
@sealed
abstract class MapperContainer {
  @Deprecated(_containerDeprecationMessage)
  factory MapperContainer({
    Set<MapperBase>? mappers,
    Set<MapperContainer>? linked,
    Map<String, Function>? types,
  }) = _MapperContainerBase;

  /// A container that holds the standard set of mappers for all core types,
  /// including all primitives, List, Set, Map and DateTime.
  ///
  /// All other container will automatically be linked to this container.
  @Deprecated(
    'Use `MapperContainer.globals` instead. See $_containerIssueLink. '
    'May be removed in a future version.',
  )
  static final MapperContainer defaults = _MapperContainerBase._({
    PrimitiveMapper<Object>((v) => v, dynamic),
    PrimitiveMapper<Object>((v) => v, Object),
    PrimitiveMapper<String>((v) => v.toString()),
    PrimitiveMapper<int>((v) => num.parse(v.toString()).round()),
    PrimitiveMapper<double>((v) => double.parse(v.toString())),
    PrimitiveMapper<num>((v) => num.parse(v.toString()), num),
    PrimitiveMapper<bool>((v) => v is num ? v != 0 : v.toString() == 'true'),
    DateTimeMapper(),
    IterableMapper<List>(<T>(i) => i.toList(), <T>(f) => f<List<T>>()),
    SetMapper<Set>(<T>(i) => i.toSet(), <T>(f) => f<Set<T>>()),
    MapMapper<Map>(<K, V>(map) => map, <K, V>(f) => f<Map<K, V>>()),
    //RecordMapper(),
  });

  /// A container that holds all globally registered mappers.
  ///
  /// This container does not define any mappers itself. Rather each generated
  /// mapper will register itself with this container when calling `ensureInitialized()`.
  static final MapperContainer globals = _MapperContainerBase();

  /// The key of a special property that holds the type id of an encoded object.
  ///
  /// See also: [EncodingOptions.includeTypeId].
  static String typeIdKey = '__type';

  /// The core method to decode any value to a given type [T].
  T fromValue<T>(Object? value, [DecodingOptions? options]);

  /// The core method to encode any value.
  ///
  /// The value is expected to be of type [T]. When the exact type of the value
  /// is different, a type identifier may be added to the resulting encoded value.
  dynamic toValue<T>(T? value, [EncodingOptions? options]);

  /// Decodes a map to a given type [T].
  ///
  /// This is a typed wrapper around the [fromValue] method.
  T fromMap<T>(Map<String, dynamic> map);

  /// Encodes a value to a map.
  ///
  /// This is a typed wrapper around the [toValue] method.
  Map<dynamic, dynamic> toMap<T>(T object);

  /// Decodes an iterable to a given type [T].
  ///
  /// This is a typed wrapper around the [fromValue] method.
  T fromIterable<T>(Iterable<dynamic> iterable);

  /// Encodes a value to an iterable.
  ///
  /// This is a typed wrapper around the [toValue] method.
  Iterable<dynamic> toIterable<T>(T object);

  /// Decodes a json string to a given type [T].
  ///
  /// This is a typed wrapper around the [fromValue] method.
  T fromJson<T>(String json);

  /// Encodes a value to a json string.
  ///
  /// This is a typed wrapper around the [toValue] method.
  String toJson<T>(T object);

  /// Checks whether two values are deeply equal.
  bool isEqual(dynamic value, Object? other);

  /// Calculates the hash of a value.
  int hash(dynamic value);

  /// Returns the string representation of a value.
  String asString(dynamic value);

  /// Adds a new mapper to the set of mappers this container holds.
  void use<T extends Object>(MapperBase<T> mapper);

  /// Removes the mapper for type [T] this container currently holds.
  MapperBase<T>? unuse<T extends Object>();

  /// Adds a list of mappers to the set of mappers this container holds.
  void useAll(Iterable<MapperBase> mappers);

  /// Returns the current mapper for type [T] of this container.
  MapperBase<T>? get<T extends Object>([Type? type]);

  /// Returns all mapper this container currently holds.
  List<MapperBase> getAll();

  /// Links another container to this container.
  @Deprecated(_containerDeprecationMessage)
  void link(MapperContainer container);

  /// Links a list of containers to this container.
  @Deprecated(_containerDeprecationMessage)
  void linkAll(Iterable<MapperContainer> containers);
}

class _MapperContainerBase implements MapperContainer, TypeProvider {
  _MapperContainerBase._([
    Set<MapperBase>? mappers,
    Set<MapperContainer>? linked,
    Map<String, Function>? types,
  ]) {
    TypeRegistry.instance.register(this);
    if (types != null) {
      _types.addAll(types);
    }
    if (linked != null) {
      linkAll(linked);
    }
    useAll(mappers ?? {});
  }

  factory _MapperContainerBase({
    Set<MapperBase>? mappers,
    Set<MapperContainer>? linked,
    Map<String, Function>? types,
  }) {
    return _MapperContainerBase._(mappers ?? {}, {
      ...?linked,
      MapperContainer.defaults,
    }, types ?? {});
  }

  final Map<Type, MapperBase> _mappers = {};
  final Map<String, Function> _types = {};

  final Set<_MapperContainerBase> _parents = {};
  final Set<_MapperContainerBase> _children = {};

  final Map<Type, MapperBase?> _cachedMappers = {};
  final Map<Type, MapperBase?> _cachedTypeMappers = {};

  void _invalidateCachedMappers([Set<MapperContainer>? invalidated]) {
    // for avoiding hanging on circular links
    if (invalidated != null && invalidated.contains(this)) return;

    _cachedMappers.clear();
    _cachedTypeMappers.clear();
    _cachedInheritedMappers = null;
    for (var c in _parents) {
      c._invalidateCachedMappers({...?invalidated, this});
    }
  }

  Map<Type, MapperBase>? _cachedInheritedMappers;
  Map<Type, MapperBase> get _inheritedMappers {
    return _cachedInheritedMappers ??= _getInheritedMappers();
  }

  Map<Type, MapperBase> _getInheritedMappers([Set<MapperContainer>? parents]) {
    // for avoiding hanging on circular links
    if (parents != null && parents.contains(this)) return {};

    return {
      for (var c in _children) ...(c)._getInheritedMappers({...?parents, this}),
      ..._mappers,
    };
  }

  MapperBase? _mapperFor(dynamic value) {
    var type = value.runtimeType;
    if (_cachedMappers[type] != null) {
      return _cachedMappers[type];
    }
    var baseType = type.base;
    if (baseType == UnresolvedType) {
      baseType = type;
    }
    if (_cachedMappers[baseType] != null) {
      return _cachedMappers[baseType];
    }

    var mapper = //
        // direct type
        _mappers[baseType] ??
        // indirect type ie. subtype
        _mappers.values.where((m) => m.isFor(value)).firstOrNull ??
        // inherited direct type
        _inheritedMappers[baseType] ??
        // inherited indirect type ie. subclasses
        _inheritedMappers.values.where((m) => m.isFor(value)).firstOrNull;

    if (mapper != null) {
      if (mapper is ClassMapperBase) {
        mapper = mapper.subOrSelfFor(value) ?? mapper;
      }
      if (baseType == mapper.type) {
        _cachedMappers[baseType] = mapper;
      } else {
        _cachedMappers[type] = mapper;
      }
    }

    return mapper;
  }

  MapperBase? _mapperForType(Type type) {
    if (_cachedTypeMappers[type] case var m?) {
      return m;
    }
    var baseType = type.base;
    if (baseType == UnresolvedType) {
      baseType = type;
    }
    if (_cachedTypeMappers[baseType] case var m?) {
      return m;
    }
    var mapper =
        _mappers[baseType] ??
        _mappers.values.where((m) => m.isForType(type)).firstOrNull ??
        _inheritedMappers[baseType] ??
        _inheritedMappers.values.where((m) => m.isForType(type)).firstOrNull;

    if (mapper != null) {
      if (baseType == mapper.type) {
        _cachedTypeMappers[baseType] = mapper;
      } else {
        _cachedTypeMappers[type] = mapper;
      }
    }
    return mapper;
  }

  @override
  Function? getFactoryById(String id) {
    return _mappers.values.where((m) => m.id == id).firstOrNull?.typeFactory ??
        _types[id];
  }

  @override
  List<Function> getFactoriesByName(String name) {
    return [
      ..._mappers.values
          .where((m) => m.type.name == name)
          .map((m) => m.typeFactory),
      ..._types.values.where((f) => (f(<T>() => T) as Type).name == name),
    ];
  }

  @override
  String? idOf(Type type) {
    return _mappers[type]?.id ??
        _types.entries
            .where((e) => e.value(<T>() => T == type) as bool)
            .map((e) => e.key)
            .firstOrNull;
  }

  @override
  T fromValue<T>(Object? value, [DecodingOptions? options]) {
    if (value == null) {
      if (value is T) {
        return value;
      } else {
        throw MapperException.chain(
          MapperMethod.decode,
          '($T)',
          MapperException.unexpectedType(Null, 'Object'),
        );
      }
    }

    var type = options?.type ?? T;
    if (value is Map<dynamic, dynamic> &&
        value[MapperContainer.typeIdKey] != null) {
      type = TypePlus.fromId(value[MapperContainer.typeIdKey] as String);
      if (type == UnresolvedType) {
        var e = MapperException.unresolvedType(
          value[MapperContainer.typeIdKey] as String,
        );
        throw MapperException.chain(MapperMethod.decode, '($T)', e);
      }
    } else if (value is T) {
      return value as T;
    }

    var mapper = _mapperForType(type);
    if (mapper != null) {
      return mapper.decodeValue<T>(value, DecodingOptions(type: type), this);
    } else {
      throw MapperException.chain(
        MapperMethod.decode,
        '($type)',
        MapperException.unknownType(type),
      );
    }
  }

  @override
  dynamic toValue<T>(T? value, [EncodingOptions? options]) {
    if (value == null) return null;
    var mapper = _mapperFor(value);
    if (mapper != null) {
      return mapper.encodeValue<T>(value, options, this);
    } else {
      throw MapperException.chain(
        MapperMethod.encode,
        '[$value]',
        MapperException.unknownType(value.runtimeType),
      );
    }
  }

  @override
  T fromMap<T>(Map<dynamic, dynamic> map) => fromValue<T>(map);

  @override
  Map<dynamic, dynamic> toMap<T>(T object) {
    var value = toValue<T>(object);
    if (value is Map<dynamic, dynamic>) {
      return value;
    } else {
      throw MapperException.incorrectEncoding(
        object.runtimeType,
        'Map',
        value.runtimeType,
      );
    }
  }

  @override
  T fromIterable<T>(Iterable<dynamic> iterable) => fromValue<T>(iterable);

  @override
  Iterable<dynamic> toIterable<T>(T object) {
    var value = toValue<T>(object);
    if (value is Iterable<dynamic>) {
      return value;
    } else {
      throw MapperException.incorrectEncoding(
        object.runtimeType,
        'Iterable',
        value.runtimeType,
      );
    }
  }

  @override
  T fromJson<T>(String json) => fromValue<T>(jsonDecode(json));

  @override
  String toJson<T>(T object) => jsonEncode(toValue<T>(object));

  @override
  bool isEqual(Object? value, Object? other) {
    if (value == null) {
      return other == null;
    }
    var mapper = _mapperFor(value);
    if (mapper != null) {
      return mapper.equalsValue(value, other, this);
    } else {
      return value == other;
    }
  }

  @override
  int hash(Object? value) {
    if (value == null) {
      return value.hashCode;
    }
    var mapper = _mapperFor(value);
    if (mapper != null) {
      return mapper.hashValue(value, this);
    } else {
      return value.hashCode;
    }
  }

  @override
  String asString(Object? value) {
    if (value == null) {
      return value.toString();
    }
    var mapper = _mapperFor(value);
    if (mapper != null) {
      return mapper.stringifyValue(value, this);
    } else {
      return value.toString();
    }
  }

  T guardMappable<T>(
    Object value,
    T Function(MapperBase, Object, MappingContext) fn,
    T Function() fallback,
    MapperMethod method,
    String Function() hint,
  ) {
    var mapper = _mapperFor(value);
    if (mapper != null) {
      try {
        return fn(
          mapper,
          value,
          MappingContext(
            container: this,
            args: () {
              return value.runtimeType.args
                  .map((t) => t == UnresolvedType ? dynamic : t)
                  .toList();
            },
          ),
        );
      } catch (e, stacktrace) {
        Error.throwWithStackTrace(
          MapperException.chain(method, hint(), e),
          stacktrace,
        );
      }
    } else {
      return fallback();
    }
  }

  @override
  void use<T extends Object>(MapperBase<T> mapper) => useAll([mapper]);

  @override
  MapperBase<T>? unuse<T extends Object>() {
    var mapper = _mappers.remove(T.base) as MapperBase<T>?;
    _invalidateCachedMappers();
    return mapper;
  }

  @override
  void useAll(Iterable<MapperBase> mappers) {
    _mappers.addEntries(mappers.map((m) => MapEntry(m.type, m)));
    _invalidateCachedMappers();
  }

  @override
  MapperBase<T>? get<T extends Object>([Type? type]) {
    return _mappers[(type ?? T).base] as MapperBase<T>?;
  }

  @override
  List<MapperBase> getAll() {
    return [..._mappers.values];
  }

  @override
  void link(MapperContainer container) => linkAll({container});

  @override
  void linkAll(Iterable<MapperContainer> containers) {
    assert(containers.every((c) => c is _MapperContainerBase));
    for (var c in containers.cast<_MapperContainerBase>()) {
      _children.add(c);
      c._parents.add(this);
    }
    _invalidateCachedMappers();
  }
}
