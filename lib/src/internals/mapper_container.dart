import 'dart:convert';

import 'package:type_plus/type_plus.dart' hide typeOf;

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
          throw MapperException(
              'Error on decoding type $type: ${e is MapperException ? e.message : e}');
        }
      } else {
        throw MapperException(
            'Cannot decode value $value of type ${value.runtimeType} to type $type. Unknown type. Did you forgot to include the class or register a custom mapper?');
      }
    }
  }

  @override
  dynamic toValue(dynamic value) {
    if (value == null) return null;
    var type = value.runtimeType;
    var mapper = _mapperFor(value);
    if (mapper != null) {
      var encoded = mapper.encoder.call(value);
      if (encoded is Map<String, dynamic>) {
        clearType(encoded);
        if (type.args.isNotEmpty) {
          encoded['__type'] = type.id;
        }
      }
      return encoded;
    } else {
      throw MapperException(
          'Cannot encode value $value of type $type. Unknown type. Did you forgot to include the class or register a custom mapper?');
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
      throw MapperException(
          'Cannot encode value of type ${object.runtimeType} to Map. Instead encoded to type ${value.runtimeType}.');
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
      throw MapperException(
          'Cannot encode value of type ${object.runtimeType} to Iterable. Instead encoded to type ${value.runtimeType}.');
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
    if (value == null || other == null) {
      return value == other;
    } else if (value.runtimeType != other.runtimeType) {
      return false;
    }
    return _mapperFor(value)?.equals(value, other) ?? value == other;
  }

  @override
  int hash(dynamic value) {
    return _mapperFor(value)?.hash(value) ?? value.hashCode;
  }

  @override
  String asString(dynamic value) {
    return _mapperFor(value)?.stringify(value) ?? value.toString();
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
