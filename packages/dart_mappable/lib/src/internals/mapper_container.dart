import 'dart:convert';

// ignore: implementation_imports
import 'package:type_plus/src/types_registry.dart' show TypeRegistry;
import 'package:type_plus/type_plus.dart' hide typeOf;

import '../../dart_mappable.dart';
import 'default_mappers.dart';
import 'mapper_utils.dart';

abstract class MapperContainer {
  factory MapperContainer(Set<BaseMapper> mappers) = _MapperContainerImpl;

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
  void use<T>(BaseMapper<T> mapper);
  BaseMapper<T>? unuse<T>();
  void useAll(List<BaseMapper> mappers);
  BaseMapper<T>? get<T>([Type? type]);
  List<BaseMapper> getAll();
}

class _MapperContainerImpl implements MapperContainer, TypeProvider {
  final Map<String, BaseMapper> _mappers = {};
  final Map<Type, String> _typeIds = {};

  _MapperContainerImpl(Set<BaseMapper> mappers) {
    TypePlus.register(this);
    useAll([
      PrimitiveMapper((v) => v),
      PrimitiveMapper<String>((v) => v.toString()),
      PrimitiveMapper<int>((v) => num.parse(v.toString()).round()),
      PrimitiveMapper<double>((v) => double.parse(v.toString())),
      PrimitiveMapper<num>((v) => num.parse(v.toString())),
      PrimitiveMapper<bool>((v) => v is num ? v != 0 : v.toString() == 'true'),
      DateTimeMapper(),
      IterableMapper<List>(<T>(i) => i.toList(), <T>(f) => f<List<T>>()),
      IterableMapper<Set>(<T>(i) => i.toSet(), <T>(f) => f<Set<T>>()),
      MapMapper<Map>(<K, V>(map) => map, <K, V>(f) => f<Map<K, V>>()),
      ...mappers,
    ]);
  }

  BaseMapper? _mapperFor(dynamic value) {
    bool isType<T>() => value is T;
    return _mappers[value.runtimeType.baseId] ??
        _mappers.values
            .where((m) => m.type != dynamic)
            .where((m) => isType.callWith(typeArguments: [m.type]) as bool)
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
      var mapper = _mappers[type.baseId];
      if (mapper != null) {
        try {
          try {
            return mapper.decoder
                .callWith(parameters: [value], typeArguments: type.args) as T;
          } on ArgumentError catch (e) {
            throw ArgumentError(
                'Failed to call [decoder] function of ${mapper.runtimeType}: ${e.message}');
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
    var mapper = _mapperFor(value);
    if (mapper != null) {
      try {
        try {
          var typeArgs = T.args;
          // in case T is dynamic
          var fallback = mapper.type.base.args;
          if (typeArgs.length != fallback.length) {
            typeArgs = fallback;
          }
          return mapper.encoder
              .callWith(parameters: [value], typeArguments: typeArgs);
        } on ArgumentError catch (e) {
          throw ArgumentError(
              'Failed to call [encoder] function of ${mapper.runtimeType}: ${e.message}');
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

    return guardMappable(value, (m) => m.isFor(other) && m.equals(value, other),
        () => value == other, MapperMethod.equals, () => '[$value]');
  }

  @override
  int hash(dynamic value) {
    return guardMappable(value, (m) => m.hash(value), () => value.hashCode,
        MapperMethod.hash, () => '[$value]');
  }

  @override
  String asString(dynamic value) {
    return guardMappable(
        value,
        (m) => m.stringify(value),
        () => value.toString(),
        MapperMethod.stringify,
        () => '(Instance of \'${value.runtimeType}\')');
  }

  T guardMappable<T>(
    dynamic value,
    T Function(BaseMapper) fn,
    T Function() fallback,
    MapperMethod method,
    String Function() hint,
  ) {
    var mapper = _mapperFor(value);
    if (mapper != null) {
      try {
        return fn(mapper);
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
  void use<T>(BaseMapper<T> mapper) => useAll([mapper]);

  @override
  BaseMapper<T>? unuse<T>() => _mappers.remove(T.baseId) as BaseMapper<T>?;

  @override
  void useAll(List<BaseMapper> mappers) {
    _typeIds.addEntries(mappers.map((m) => MapEntry(m.type, m.id)));
    _mappers.addEntries(mappers.map((m) {
      return MapEntry(TypeRegistry.instance.idOf(m.type)!, m);
    }));
    mappers.whereType<NeedsMapperContainer>().forEach((m) => m.mapper = this);
  }

  @override
  BaseMapper<T>? get<T>([Type? type]) =>
      _mappers[(type ?? T).baseId] as BaseMapper<T>?;

  @override
  List<BaseMapper> getAll() => [..._mappers.values];
}
