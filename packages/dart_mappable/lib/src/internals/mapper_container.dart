import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
// ignore: implementation_imports
import 'package:type_plus/src/types_registry.dart' show TypeRegistry;
import 'package:type_plus/type_plus.dart' hide typeOf;

import '../../dart_mappable.dart';

@sealed
abstract class MapperContainer {
  factory MapperContainer(
      {Set<MapperBase>? mappers,
      Set<MapperContainer>? join}) = MapperContainerBase;

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
  void useAll(List<MapperBase> mappers);

  MapperBase<T>? get<T>([Type? type]);
  List<MapperBase> getAll();

  void join(MapperContainer container);
  void joinAll(Iterable<MapperContainer> containers);

  MapperBase? _mapperFor(dynamic value, [Set<MapperContainer>? parents]);
  MapperBase? _mapperForType(Type type, [Set<MapperContainer>? parents]);
}

class DelegatingMapperContainer implements MapperContainer {
  DelegatingMapperContainer(this.wrapper);

  final MapperContainer Function() wrapper;

  MapperContainer get wrapped => wrapper();

  @override
  String asString(value) => wrapped.asString(value);

  @override
  T fromIterable<T>(Iterable iterable) => wrapped.fromIterable<T>(iterable);

  @override
  T fromJson<T>(String json) => wrapped.fromJson<T>(json);

  @override
  T fromMap<T>(Map<String, dynamic> map) => wrapped.fromMap<T>(map);

  @override
  T fromValue<T>(value) => wrapped.fromValue<T>(value);

  @override
  MapperBase<T>? get<T>([Type? type]) => wrapped.get<T>(type);

  @override
  List<MapperBase> getAll() => wrapped.getAll();

  @override
  int hash(value) => wrapped.hash(value);

  @override
  bool isEqual(value, Object? other) => wrapped.isEqual(value, other);

  @override
  void join(MapperContainer container) => wrapped.join(container);

  @override
  Iterable toIterable<T>(T object) => wrapped.toIterable<T>(object);

  @override
  String toJson<T>(T object) => wrapped.toJson<T>(object);

  @override
  Map<String, dynamic> toMap<T>(T object) => wrapped.toMap<T>(object);

  @override
  toValue<T>(T value) => wrapped.toValue<T>(value);

  @override
  MapperBase<T>? unuse<T>() => wrapped.unuse<T>();

  @override
  void use<T>(MapperBase<T> mapper) => wrapped.use<T>(mapper);

  @override
  void useAll(List<MapperBase> mappers) => wrapped.useAll(mappers);

  @override
  void joinAll(Iterable<MapperContainer> containers) =>
      wrapped.joinAll(containers);
  @override
  MapperBase? _mapperFor(value, [Set<MapperContainer>? parents]) => wrapped._mapperFor(value, parents);

  @override
  MapperBase? _mapperForType(Type type, [Set<MapperContainer>? parents]) =>
      wrapped._mapperForType(type, parents);
}

class MapperContainerBase implements MapperContainer, TypeProvider {
  MapperContainerBase(
      {Set<MapperBase>? mappers, Set<MapperContainer>? join}) {
    TypePlus.register(this);
    joinAll(join ?? []);
    useAll([
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
      ...?mappers,
    ]);
  }

  final Map<String, MapperBase> _mappers = {};

  final Map<Type, String> _typeIds = {};

  final Set<MapperContainer> _children = {};

  @override
  MapperBase? _mapperFor(dynamic value, [Set<MapperContainer>? parents]) {
    if (parents != null && parents.contains(this)) return null;
    bool isType<T>() => value is T;
    var mapper = _mappers[value.runtimeType.baseId] ??
        _mappers.values
            .where((m) => m.type != dynamic && m.type != Object)
            .where((m) => isType.callWith(typeArguments: [m.type]) as bool)
            .firstOrNull;
    return mapper ?? _children
        .map((c) => c._mapperFor(value, {...?parents, this}))
        .whereType<MapperBase>()
        .firstOrNull;
  }

  @override
  MapperBase? _mapperForType(Type type, [Set<MapperContainer>? parents]) {
    if (parents != null && parents.contains(this)) return null;
    var mapper = _mappers[type.baseId];
    return mapper ?? _children
        .map((c) => c._mapperForType(type, {...?parents, this}))
        .whereType<MapperBase>()
        .firstOrNull;
  }

  @override
  Function? getFactoryById(String id) {
    return _mappers[id]?.typeFactory;
  }

  @override
  List<Function> getFactoriesByName(String name) {
    return _mappers.values
        .where((m) => m.type.name == name)
        .map((m) => m.typeFactory)
        .toList();
  }

  @override
  String idOf(Type type) {
    return _typeIds[type] ?? type.name;
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
          } on ArgumentError catch (e) {
            throw ArgumentError(
                'Failed to call [decoder] function of ${element.runtimeType}: ${e.message}');
          }
        } catch (e) {
          throw MapperException.chain(MapperMethod.decode, '($type)', e);
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
    var type = value.runtimeType;
    var element = _mapperFor(value)?.createElement(this);
    if (element != null) {
      try {
        try {
          var typeArgs = T.args;
          // in case T is dynamic
          var fallback = element.mapper.type.base.args;
          if (typeArgs.length != fallback.length) {
            typeArgs = fallback;
          }
          return element.encoder
              .callWith(parameters: [value], typeArguments: typeArgs);
        } on ArgumentError catch (e) {
          throw ArgumentError(
              'Failed to call [encoder] function of ${element.runtimeType}: ${e.message}');
        }
      } catch (e) {
        throw MapperException.chain(MapperMethod.encode, '($type)', e);
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
  T fromJson<T>(String json) {
    return fromValue<T>(jsonDecode(json));
  }

  @override
  String toJson<T>(T object) {
    return jsonEncode(toValue<T>(object));
  }

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
        () => '[$value]');
  }

  @override
  int hash(dynamic value) {
    return guardMappable(value, (e) => e.hash(value), () => value.hashCode,
        MapperMethod.hash, () => '[$value]');
  }

  @override
  String asString(dynamic value) {
    return guardMappable(
        value,
        (e) => e.stringify(value),
        () => value.toString(),
        MapperMethod.stringify,
        () => '(Instance of \'${value.runtimeType}\')');
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
      if (value is MappableMixin) {
        throw MapperException.unallowedMappable();
      } else {
        return fallback();
      }
    }
  }

  @override
  void use<T>(MapperBase<T> mapper) => useAll([mapper]);

  @override
  MapperBase<T>? unuse<T>() => _mappers.remove(T.baseId) as MapperBase<T>?;

  @override
  void useAll(List<MapperBase> mappers) {
    _typeIds.addEntries(mappers.map((m) => MapEntry(m.type, m.id)));
    _mappers.addEntries(mappers.map((m) {
      return MapEntry(TypeRegistry.instance.idOf(m.type)!, m);
    }));
  }

  @override
  MapperBase<T>? get<T>([Type? type]) =>
      _mappers[(type ?? T).baseId] as MapperBase<T>?;

  @override
  List<MapperBase> getAll() => [..._mappers.values];

  @override
  void join(MapperContainer container) {
    _children.add(container);
  }

  @override
  void joinAll(Iterable<MapperContainer> containers) {
    _children.addAll(containers);
  }
}
