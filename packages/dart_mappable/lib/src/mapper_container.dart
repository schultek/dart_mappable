import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
// ignore: implementation_imports
import 'package:type_plus/src/types_registry.dart' show TypeRegistry;
import 'package:type_plus/type_plus.dart' hide typeOf;

import 'mappers/default_mappers.dart';
import 'mappers/mapper_base.dart';
import 'mapper_exception.dart';

/// {@category Generics}
/// {@category Mapper Container}
@sealed
abstract class MapperContainer {
  factory MapperContainer({
    Set<MapperBase>? mappers,
    Set<MapperContainer>? linked,
    Map<String, Function>? types,
  }) = MapperContainerBase;

  static final MapperContainer defaults = MapperContainerBase._({
    PrimitiveMapper<dynamic>((v) => v),
    PrimitiveMapper<Object>((Object? v) => v!),
    PrimitiveMapper<String>((v) => v.toString()),
    PrimitiveMapper<int>((v) => num.parse(v.toString()).round()),
    PrimitiveMapper<double>((v) => double.parse(v.toString())),
    PrimitiveMapper<num>((v) => num.parse(v.toString())),
    PrimitiveMapper<bool>((v) => v is num ? v != 0 : v.toString() == 'true'),
    DateTimeMapper(),
    IterableMapper<List>(<T>(i) => i.toList(), <T>(f) => f<List<T>>()),
    IterableMapper<Set>(<T>(i) => i.toSet(), <T>(f) => f<Set<T>>()),
    MapMapper<Map>(<K, V>(map) => map, <K, V>(f) => f<Map<K, V>>()),
  });

  T fromValue<T>(dynamic value);
  dynamic toValue<T>(T value);

  T fromMap<T>(Map<String, dynamic> map);
  Map<String, dynamic> toMap<T>(T object);

  T fromIterable<T>(Iterable<dynamic> iterable);
  Iterable<dynamic> toIterable<T>(T object);

  T fromJson<T>(String json);
  String toJson<T>(T object);

  bool isEqual(dynamic value, Object? other);
  int hash(dynamic value);
  String asString(dynamic value);

  void use<T>(MapperBase<T> mapper);
  MapperBase<T>? unuse<T>();
  void useAll(Iterable<MapperBase> mappers);

  MapperBase<T>? get<T>([Type? type]);
  List<MapperBase> getAll();

  void link(MapperContainer container);
  void linkAll(Iterable<MapperContainer> containers);
}

class MapperContainerBase implements MapperContainer, TypeProvider {
  MapperContainerBase._([
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

  factory MapperContainerBase({
    Set<MapperBase>? mappers,
    Set<MapperContainer>? linked,
    Map<String, Function>? types,
  }) {
    return MapperContainerBase._(
      mappers ?? {},
      {...?linked, MapperContainer.defaults},
      types ?? {},
    );
  }

  final Map<Type, MapperBase> _mappers = {};
  final Map<String, Function> _types = {};

  final Set<MapperContainerBase> _parents = {};
  final Set<MapperContainerBase> _children = {};

  final Map<Type, MapperBase?> _cachedMappers = {};

  void _invalidateCachedMappers([Set<MapperContainer>? invalidated]) {
    // for avoiding hanging on circular links
    if (invalidated != null && invalidated.contains(this)) return;

    _cachedMappers.clear();
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
    var baseType = value.runtimeType.base;
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
      _cachedMappers[baseType] = mapper;
    }

    return mapper;
  }

  MapperBase? _mapperForType(Type type) {
    var baseType = type.base;

    var mapper = _mappers[baseType] ??
        _mappers.values.where((m) => m.implType.base == baseType).firstOrNull ??
        _inheritedMappers[baseType] ??
        _inheritedMappers.values
            .where((m) => m.implType.base == baseType)
            .firstOrNull;

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
      ..._types.values.where((f) => (f(<T>() => T) as Type).name == name)
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
  T fromValue<T>(dynamic value) {
    if (value.runtimeType == T || value == null) {
      return value as T;
    } else {
      var type = T;
      if (value is Map<String, dynamic> && value['__type'] != null) {
        type = TypePlus.fromId(value['__type'] as String);
        if (type == UnresolvedType) {
          var e = MapperException.unresolvedType(value['__type'] as String);
          throw MapperException.chain(MapperMethod.decode, '($T)', e);
        }
      }
      var element = _mapperForType(type)?.createElement(this);
      if (element != null) {
        try {
          try {
            return element.decoder
                .callWith(parameters: [value], typeArguments: type.args) as T;
          } on ArgumentError catch (e, stacktrace) {
            Error.throwWithStackTrace(
              ArgumentError(
                  'Failed to call [decoder] function of ${element.runtimeType}: ${e.message}'),
              stacktrace,
            );
          }
        } catch (e, stacktrace) {
          Error.throwWithStackTrace(
            MapperException.chain(MapperMethod.decode, '($type)', e),
            stacktrace,
          );
        }
      } else {
        throw MapperException.chain(
            MapperMethod.decode, '($type)', MapperException.unknownType(type));
      }
    }
  }

  @override
  dynamic toValue<T>(T value) {
    if (value == null) return null;
    var element = _mapperFor(value)?.createElement(this);
    if (element != null) {
      try {
        try {
          Type type = T;
          String? typeId;
          if (value.runtimeType != type.nonNull) {
            if (value is! Map && value is! Iterable) {
              if (element.mapper.implType == element.mapper.type ||
                  value.runtimeType != element.mapper.implType) {
                typeId = value.runtimeType.id;
                type = value.runtimeType;
              }
            }
          }

          var typeArgs = type.args;

          var fallback = element.mapper.type.base.args;
          if (typeArgs.length != fallback.length) {
            typeArgs = fallback;
          }

          var result = element.encoder
              .callWith(parameters: [value], typeArguments: typeArgs);

          if (result is Map<String, dynamic> && typeId != null) {
            result['__type'] = typeId;
          }

          return result;
        } on ArgumentError catch (e, stacktrace) {
          Error.throwWithStackTrace(
            ArgumentError('Failed to call [encoder] function '
                'of ${element.runtimeType}: ${e.message}'),
            stacktrace,
          );
        }
      } catch (e, stacktrace) {
        Error.throwWithStackTrace(
          MapperException.chain(
              MapperMethod.encode, '(${value.runtimeType})', e),
          stacktrace,
        );
      }
    } else {
      throw MapperException.chain(
        MapperMethod.encode,
        '[$value]',
        MapperException.unknownType(value.runtimeType),
      );
    }
  }

  @override
  T fromMap<T>(Map<String, dynamic> map) => fromValue<T>(map);

  @override
  Map<String, dynamic> toMap<T>(T object) {
    var value = toValue<T>(object);
    if (value is Map<String, dynamic>) {
      return value;
    } else {
      throw MapperException.incorrectEncoding(
          object.runtimeType, 'Map', value.runtimeType);
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
          object.runtimeType, 'Iterable', value.runtimeType);
    }
  }

  @override
  T fromJson<T>(String json) => fromValue<T>(jsonDecode(json));

  @override
  String toJson<T>(T object) => jsonEncode(toValue<T>(object));

  @override
  bool isEqual(dynamic value, Object? other) {
    if (value == null) {
      return other == null;
    }

    return guardMappable(
      value,
      (e) => e.mapper.isFor(other) && e.equals(value, other),
      () => value == other,
      MapperMethod.equals,
      () => '[$value]',
    );
  }

  @override
  int hash(dynamic value) {
    return guardMappable(
      value,
      (e) => e.hash(value),
      () => value.hashCode,
      MapperMethod.hash,
      () => '[$value]',
    );
  }

  @override
  String asString(dynamic value) {
    return guardMappable(
      value,
      (e) => e.stringify(value),
      () => value.toString(),
      MapperMethod.stringify,
      () => '(Instance of \'${value.runtimeType}\')',
    );
  }

  T guardMappable<T>(
    dynamic value,
    T Function(MapperElementBase) fn,
    T Function() fallback,
    MapperMethod method,
    String Function() hint,
  ) {
    var element = _mapperFor(value)?.createElement(this);
    if (element != null) {
      try {
        return fn(element);
      } catch (e) {
        throw MapperException.chain(method, hint(), e);
      }
    } else {
      return fallback();
    }
  }

  @override
  void use<T>(MapperBase<T> mapper) => useAll([mapper]);

  @override
  MapperBase<T>? unuse<T>() {
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
  MapperBase<T>? get<T>([Type? type]) {
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
    assert(containers.every((c) => c is MapperContainerBase));
    for (var c in containers.cast<MapperContainerBase>()) {
      _children.add(c);
      c._parents.add(this);
    }
    _invalidateCachedMappers();
  }
}
