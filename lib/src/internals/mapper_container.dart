import 'dart:convert';

import 'package:type_plus/type_plus.dart' hide typeOf;

import '../core/mapper_exception.dart';
import '../core/mappers.dart';
import 'default_mappers.dart';
import 'mapper_utils.dart';

abstract class MapperContainer {
  factory MapperContainer(Set<BaseMapper> mappers) = _MapperContainerImpl;

  T fromValue<T>(dynamic value);
  dynamic toValue(dynamic value);
  T fromMap<T>(Map<String, dynamic> map);
  Map<String, dynamic> toMap(dynamic object);
  T fromIterable<T>(Iterable<dynamic> iterable);
  Iterable<dynamic> toIterable(dynamic object);
  T fromJson<T>(String json);
  String toJson(dynamic object);
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

  _MapperContainerImpl(Set<BaseMapper> mappers) {
    useAll([
      PrimitiveMapper((v) => v),
      PrimitiveMapper<String>((v) => v.toString()),
      PrimitiveMapper<int>((v) => num.parse(v.toString()).round()),
      PrimitiveMapper<double>((v) => double.parse(v.toString())),
      PrimitiveMapper<num>((v) => num.parse(v.toString())),
      PrimitiveMapper<bool>((v) => v is num ? v != 0 : v.toString() == 'true'),
      DateTimeMapper(),
      IterableMapper<List>(<T>(i) => i.toList(), <T>(f) => f<List<T>>(), this),
      IterableMapper<Set>(<T>(i) => i.toSet(), <T>(f) => f<Set<T>>(), this),
      MapMapper<Map>(<K, V>(map) => map, <K, V>(f) => f<Map<K, V>>(), this),
      ...mappers,
    ]);
    TypePlus.register(this);
  }

  BaseMapper _mapperFor(dynamic value, MapperMethod method) {
    bool isType<T>() => value is T;
    var mapper = _mappers[value.runtimeType.baseId] ??
        _mappers.values
            .where((m) => m.type != dynamic)
            .where((m) => isType.callWith(typeArguments: [m.type]) as bool)
            .firstOrNull;
    if (mapper == null) {
      throw MapperException.chain(
        method,
        '[$value]',
        MapperException.unknownType(value.runtimeType),
      );
    }
    return mapper;
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
    return type.name; // TODO support non-unique names
  }

  @override
  T fromValue<T>(dynamic value) {
    if (value.runtimeType == T || value == null) {
      return value as T;
    } else {
      var type = T;
      if (value is Map<String, dynamic> && value['__type'] != null) {
        type = TypePlus.fromId(value['__type'] as String);
      }
      var mapper = _mappers[type.baseId];
      if (mapper != null) {
        try {
          return mapper.decoder
              .callWith(parameters: [value], typeArguments: type.args) as T;
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
  dynamic toValue(dynamic value) {
    if (value == null) return null;
    var type = value.runtimeType;
    var mapper = _mapperFor(value, MapperMethod.encode);
    try {
      var encoded = mapper.encoder.call(value);
      if (encoded is Map<String, dynamic>) {
        clearType(encoded);
        if (type.args.isNotEmpty) {
          encoded['__type'] = type.id;
        }
      }
      return encoded;
    } catch (e) {
      throw MapperException.chain(MapperMethod.encode, '($type)', e);
    }
  }

  @override
  T fromMap<T>(Map<String, dynamic> map) => fromValue<T>(map);

  @override
  Map<String, dynamic> toMap(dynamic object) {
    var value = toValue(object);
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
  Iterable<dynamic> toIterable(dynamic object) {
    var value = toValue(object);
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
  String toJson(dynamic object) {
    return jsonEncode(toValue(object));
  }

  @override
  bool isEqual(dynamic value, Object? other) {
    if (value == null) {
      return other == null;
    } else if (value.runtimeType != other.runtimeType) {
      return false;
    }
    try {
      return _mapperFor(value, MapperMethod.equals).equals(value, other);
    } catch (e) {
      throw MapperException.chain(MapperMethod.equals, '[$value]', e);
    }
  }

  @override
  int hash(dynamic value) {
    try {
      return _mapperFor(value, MapperMethod.hash).hash(value);
    } catch (e) {
      throw MapperException.chain(MapperMethod.hash, '[$value]', e);
    }
  }

  @override
  String asString(dynamic value) {
    try {
      return _mapperFor(value, MapperMethod.stringify).stringify(value);
    } catch (e) {
      throw MapperException.chain(
          MapperMethod.stringify, '(Instance of ${value.runtimeType})', e);
    }
  }

  @override
  void use<T>(BaseMapper<T> mapper) => _mappers[idOf(T)] = mapper;
  @override
  BaseMapper<T>? unuse<T>() => _mappers.remove(T.baseId) as BaseMapper<T>?;
  @override
  void useAll(List<BaseMapper> mappers) => _mappers.addEntries(mappers.map((m) {
        return MapEntry(idOf(m.type), m);
      }));

  @override
  BaseMapper<T>? get<T>([Type? type]) =>
      _mappers[(type ?? T).baseId] as BaseMapper<T>?;
  @override
  List<BaseMapper> getAll() => [..._mappers.values];
}
