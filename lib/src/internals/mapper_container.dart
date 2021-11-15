import 'dart:convert';

import '../core/mappers.dart';
import 'default_mappers.dart';
import 'mapper_utils.dart';
import 'type_info.dart';

abstract class MapperContainer {
  final Map<String, BaseMapper> _mappers = {};

  MapperContainer(Set<BaseMapper> mappers) {
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
  }

  T fromValue<T>(dynamic value) {
    if (value.runtimeType == T || value == null) {
      return value as T;
    } else {
      TypeInfo typeInfo;
      if (value is Map<String, dynamic> && value['__type'] != null) {
        typeInfo = TypeInfo.fromType(value['__type'] as String);
      } else {
        typeInfo = TypeInfo.fromType<T>();
      }
      var mapper = _mappers[typeInfo.type];
      if (mapper != null) {
        try {
          return genericCall(typeInfo, mapper.decoder, value, _mappers) as T;
        } catch (e) {
          throw MapperException(
              'Error on decoding type $T: ${e is MapperException ? e.message : e}');
        }
      } else {
        throw MapperException(
            'Cannot decode value $value of type ${value.runtimeType} to type $T. Unknown type. Did you forgot to include the class or register a custom mapper?');
      }
    }
  }

  dynamic toValue(dynamic value) {
    if (value == null) return null;
    var typeInfo = TypeInfo.fromValue(value);
    var mapper = _mappers[typeInfo.type] ??
        _mappers.values
            .cast<BaseMapper?>()
            .firstWhere((m) => m!.isFor(value), orElse: () => null);
    if (mapper != null) {
      var encoded = mapper.encoder.call(value);
      if (encoded is Map<String, dynamic>) {
        clearType(encoded);
        if (typeInfo.params.isNotEmpty) {
          typeInfo.type = typeOf(mapper.type);
          encoded['__type'] = typeInfo.toString();
        }
      }
      return encoded;
    } else {
      throw MapperException(
          'Cannot encode value $value of type ${value.runtimeType}. Unknown type. Did you forgot to include the class or register a custom mapper?');
    }
  }

  T fromMap<T>(Map<String, dynamic> map) => fromValue<T>(map);

  Map<String, dynamic> toMap(dynamic object) {
    var value = toValue(object);
    if (value is Map<String, dynamic>) {
      return value;
    } else {
      throw MapperException(
          'Cannot encode value of type ${object.runtimeType} to Map. Instead encoded to type ${value.runtimeType}.');
    }
  }

  T fromIterable<T>(Iterable<dynamic> iterable) => fromValue<T>(iterable);

  Iterable<dynamic> toIterable(dynamic object) {
    var value = toValue(object);
    if (value is Iterable<dynamic>) {
      return value;
    } else {
      throw MapperException(
          'Cannot encode value of type ${object.runtimeType} to Iterable. Instead encoded to type ${value.runtimeType}.');
    }
  }

  T fromJson<T>(String json) {
    return fromValue<T>(jsonDecode(json));
  }

  String toJson(dynamic object) {
    return jsonEncode(toValue(object));
  }

  bool isEqual(dynamic value, Object? other) {
    if (value == null || other == null) {
      return value == other;
    }
    var type = TypeInfo.fromValue(value);
    return _mappers[type.type]?.equals(value, other) ?? value == other;
  }

  int hash(dynamic value) {
    var type = TypeInfo.fromValue(value);
    return _mappers[type.type]?.hash(value) ?? value.hashCode;
  }

  String asString(dynamic value) {
    var type = TypeInfo.fromValue(value);
    return _mappers[type.type]?.stringify(value) ?? value.toString();
  }

  void use<T>(BaseMapper<T> mapper) => _mappers[typeOf<T>()] = mapper;
  BaseMapper<T>? unuse<T>() => _mappers.remove(typeOf<T>()) as BaseMapper<T>?;
  void useAll(List<BaseMapper> mappers) =>
      _mappers.addEntries(mappers.map((m) => MapEntry(typeOf(m.type), m)));

  BaseMapper<T>? get<T>([Type? type]) =>
      _mappers[typeOf<T>(type)] as BaseMapper<T>?;
  List<BaseMapper> getAll() => [..._mappers.values];
}
