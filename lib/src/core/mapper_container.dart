import 'dart:convert';

import 'mappers.dart';

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
      if (mapper?.decoder != null) {
        try {
          return _genericCall(typeInfo, mapper!.decoder!, value) as T;
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
    if (mapper != null && mapper.encoder != null) {
      var encoded = mapper.encoder!.call(value);
      if (encoded is Map<String, dynamic>) {
        _clearType(encoded);
        if (typeInfo.params.isNotEmpty) {
          typeInfo.type = _typeOf(mapper.type);
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

  void use<T>(BaseMapper<T> mapper) => _mappers[_typeOf<T>()] = mapper;
  BaseMapper<T>? unuse<T>() => _mappers.remove(_typeOf<T>()) as BaseMapper<T>?;
  void useAll(List<BaseMapper> mappers) =>
      _mappers.addEntries(mappers.map((m) => MapEntry(_typeOf(m.type), m)));

  BaseMapper<T>? get<T>([Type? type]) =>
      _mappers[_typeOf<T>(type)] as BaseMapper<T>?;
  List<BaseMapper> getAll() => [..._mappers.values];

  dynamic _genericCall(TypeInfo info, Function fn, dynamic value) {
    var params = [...info.params];

    dynamic call(dynamic Function<T>() next) {
      var t = params.removeAt(0);
      if (_mappers[t.type] != null) {
        return _genericCall(
            t, _mappers[t.type]!.typeFactory ?? (f) => f(), next);
      } else {
        throw MapperException('Cannot find generic wrapper for type $t.');
      }
    }

    if (params.isEmpty) {
      return fn(value);
    } else if (params.length == 1) {
      return call(<A>() => fn<A>(value));
    } else if (params.length == 2) {
      return call(<A>() => call(<B>() => fn<A, B>(value)));
    } else if (params.length == 3) {
      return call(<A>() => call(<B>() => call(<C>() => fn<A, B, C>(value))));
    } else {
      throw MapperException(
          'Cannot construct generic wrapper for type $info. Mapper only supports generic classes with up to 3 type arguments.');
    }
  }

  static T checked<T, U>(dynamic v, T Function(U) fn) {
    if (v is U) {
      return fn(v);
    } else {
      throw MapperException(
          'Cannot decode value of type ${v.runtimeType} to type $T, because a value of type $U is expected.');
    }
  }
}

String _typeOf<T>([Type? t]) {
  var input = (t ?? T).toString();
  return input.split('<')[0];
}

void _clearType(Map<String, dynamic> map) {
  map.removeWhere((key, _) => key == '__type');
  map.values.whereType<Map<String, dynamic>>().forEach(_clearType);
  map.values
      .whereType<List>()
      .forEach((l) => l.whereType<Map<String, dynamic>>().forEach(_clearType));
}

const _checked = MapperContainer.checked;

class DateTimeMapper extends SimpleMapper<DateTime> {
  @override
  DateTime decode(dynamic d) {
    if (d is String) {
      return DateTime.parse(d);
    } else if (d is num) {
      return DateTime.fromMillisecondsSinceEpoch(d.round());
    } else {
      throw MapperException(
          'Cannot decode value of type ${d.runtimeType} to type DateTime, because a value of type String or num is expected.');
    }
  }

  @override
  String encode(DateTime self) {
    return self.toUtc().toIso8601String();
  }
}

class MapperEquality implements Equality {
  final MapperContainer mapper;
  MapperEquality(this.mapper);

  @override
  bool equals(dynamic e1, dynamic e2) => mapper.isEqual(e1, e2);
  @override
  int hash(dynamic e) => mapper.hash(e);
  @override
  bool isValidKey(Object? o) => true;
}

class IterableMapper<I extends Iterable> extends BaseMapper<I>
    with MapperEqualityMixin<I> {
  Iterable<U> Function<U>(Iterable<U> iterable) fromIterable;
  final MapperContainer mapper;
  IterableMapper(this.fromIterable, this.typeFactory, this.mapper);

  @override
  Function get decoder => <T>(dynamic l) => _checked(
      l, (Iterable l) => fromIterable(l.map((v) => mapper.fromValue<T>(v))));
  @override
  Function get encoder =>
      (I self) => self.map((v) => mapper.toValue(v)).toList();
  @override
  Function typeFactory;

  @override
  late Equality equality = IterableEquality(MapperEquality(mapper));
}

class MapMapper<M extends Map> extends BaseMapper<M>
    with MapperEqualityMixin<M> {
  Map<K, V> Function<K, V>(Map<K, V> map) fromMap;
  final MapperContainer mapper;
  MapMapper(this.fromMap, this.typeFactory, this.mapper);

  @override
  Function get decoder => <K, V>(dynamic m) => _checked(
      m,
      (Map m) => fromMap(m.map((key, value) =>
          MapEntry(mapper.fromValue<K>(key), mapper.fromValue<V>(value)))));
  @override
  Function get encoder => (M self) => self.map(
      (key, value) => MapEntry(mapper.toValue(key), mapper.toValue(value)));
  @override
  Function typeFactory;

  @override
  late Equality equality =
      MapEquality(keys: MapperEquality(mapper), values: MapperEquality(mapper));
}

class PrimitiveMapper<T> extends BaseMapper<T> {
  const PrimitiveMapper(this.decoder);

  @override
  final T Function(dynamic value) decoder;
  @override
  Function get encoder => (T value) => value;
  @override
  Function get typeFactory => (f) => f<T>();

  @override
  bool isFor(dynamic v) => v.runtimeType == T;
}

class EnumMapper<T> extends SimpleMapper<T> {
  EnumMapper(this._decoder, this._encoder);

  final T Function(String value) _decoder;
  final String Function(T value) _encoder;

  @override
  T decode(dynamic v) => _checked(v, _decoder);
  @override
  dynamic encode(T value) => _encoder(value);
}
