/// A set of Mappers for primitive types
const defaultMappers = '''
  // primitive mappers
  typeOf<dynamic>():  _PrimitiveMapper((dynamic v) => v),
  typeOf<String>():   _PrimitiveMapper<String>((dynamic v) => v.toString()),
  typeOf<int>():      _PrimitiveMapper<int>((dynamic v) => num.parse(v.toString()).round()),
  typeOf<double>():   _PrimitiveMapper<double>((dynamic v) => double.parse(v.toString())),
  typeOf<num>():      _PrimitiveMapper<num>((dynamic v) => num.parse(v.toString())),
  typeOf<bool>():     _PrimitiveMapper<bool>((dynamic v) => v is num ? v != 0 : v.toString() == 'true'),
  typeOf<DateTime>(): _DateTimeMapper(),
  typeOf<List>():     _ListMapper(),
  typeOf<Map>():      _MapMapper(),
  // generated mappers''';

/// Declarations for the Mapper class
const mapperCode = r'''
abstract class Mapper<T> {
  dynamic encode(T self);
  Function get decoder;
  Function get typeFactory;
  
  String stringify(T self);
  int hash(T self);
  bool equals(T self, T other);

  Mapper._();

  static T fromValue<T>(dynamic value) {
    if (value.runtimeType == T || value == null) {
      return value as T;
    } else {
      TypeInfo typeInfo;
      if (value is Map<String, dynamic> && value['_type'] != null) {
        typeInfo = getTypeInfo(value['_type'] as String);
      } else {
        typeInfo = getTypeInfo<T>();
      }
      var mapper = _mappers[typeInfo.type];
      if (mapper != null) {
        return genericCall(typeInfo, mapper.decoder, value) as T;
      } else {
        throw MapperException('Cannot decode value $value of type ${value.runtimeType} to type $T. Unknown type. Did you forgot to include the class or register a custom mapper?');
      }
    }
  }

  static dynamic toValue(dynamic value) {
    if (value == null) return null;
    var typeInfo = getTypeInfoFor(value);
    if (_mappers[typeInfo.type] != null) {
      var encoded = _mappers[typeInfo.type]!.encode(value);
      if (encoded is Map<String, dynamic>) {
        clearType(encoded);
        if (typeInfo.params.isNotEmpty) {
          encoded['_type'] = typeInfo.toString();
        }
      }
      return encoded;
    } else {
      throw MapperException('Cannot encode value $value of type ${value.runtimeType}. Unknown type. Did you forgot to include the class or register a custom mapper?');
    }
  }

  static T fromMap<T>(Map<String, dynamic> map) => fromValue<T>(map);

  static Map<String, dynamic> toMap(dynamic object) {
    var value = toValue(object);
    if (value is Map<String, dynamic>) {
      return value;
    } else {
      throw MapperException('Cannot encode value of type ${object.runtimeType} to Map. Instead encoded to type ${value.runtimeType}.');
    }
  }

  static T fromJson<T>(String json) => fromValue<T>(jsonDecode(json));
  static String toJson(dynamic object) => jsonEncode(toValue(object));

  static bool isEqual(dynamic value, Object? other) {
    var type = typeOf(value.runtimeType);
    if (_mappers[type] != null) {
      return _mappers[type]!.equals(value, other);
    } else {
      throw MapperException(
          'Cannot compare value of type $type for equality. Unknown type. Did you forgot to include the class or register a custom mapper?');
    }
  }

  static String asString(dynamic value) {
    var type = typeOf(value.runtimeType);
    if (_mappers[type] != null) {
      return _mappers[type]!.stringify(value);
    } else {
      throw MapperException(
          'Cannot stringify value of type $type. Unknown type. Did you forgot to include the class or register a custom mapper?');
    }
  }

  static void use<T>(Mapper<T> mapper) => _mappers[typeOf<T>()] = mapper;
}

String typeOf<T>([Type? t]) {
  var input = (t ?? T).toString();
  return input.split('<')[0];
}

void clearType(Map<String, dynamic> map) {
  map.removeWhere((key, _) => key == '_type');
  map.values.whereType<Map<String, dynamic>>().forEach(clearType);
  map.values.whereType<List>().forEach((l) => l.whereType<Map<String, dynamic>>().forEach(clearType));
}

abstract class Mappable<T> {
  Mapper? get _mapper => _mappers[typeOf(runtimeType)];

  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override String toString() => _mapper?.stringify(this) ?? super.toString();
  @override bool operator ==(Object other) => _mapper != null ? identical(this, other) || runtimeType == other.runtimeType && _mapper!.equals(this, other) : super == other;
  @override int get hashCode => _mapper?.hash(this) ?? super.hashCode;
}

T checked<T, U>(dynamic v, T Function(U) fn) {
  if (v is U) {
    return fn(v);
  } else {
    throw MapperException('Cannot decode value of type ${v.runtimeType} to type $T, because a value of type $U is expected.');
  }
}

class _DateTimeMapper extends BaseMapper<DateTime> {
  @override Function get decoder => decode;

  DateTime decode(dynamic d) {
    if (d is String) {
      return DateTime.parse(d);
    } else if (d is num) {
      return DateTime.fromMillisecondsSinceEpoch(d.round());
    } else {
      throw MapperException('Cannot decode value of type ${d.runtimeType} to type DateTime, because a value of type String or num is expected.');
    }
  }
  
  @override String encode(DateTime self) => self.toUtc().toIso8601String();
}

class _ListMapper extends BaseMapper<List> {
  @override Function get decoder => decode;
  List<T> decode<T>(dynamic l) => checked(l, (List l) => l.map((v) => Mapper.fromValue<T>(v)).toList());

  @override List encode(List self) => self.map((v) => Mapper.toValue(v)).toList();
  @override Function get typeFactory => <T>(f) => f<List<T>>();
}

class _MapMapper extends BaseMapper<Map> {
  @override Function get decoder => decode;
  Map<K, V> decode<K, V>(dynamic m) => checked(m, (Map m) => m.map((key, value) =>
      MapEntry(Mapper.fromValue<K>(key), Mapper.fromValue<V>(value))));

  @override Map encode(Map self) => self.map((key, value) => MapEntry(Mapper.toValue(key), Mapper.toValue(value)));
  @override Function get typeFactory => <K, V>(f) => f<Map<K, V>>();
}

abstract class BaseMapper<T> implements Mapper<T> {
  @override bool equals(T self, Object? other) => self == other;
  @override int hash(T self) => self.hashCode;
  @override String stringify(T self) => self.toString();
  @override Function get typeFactory => (f) => f<T>();
}

class _PrimitiveMapper<T> with BaseMapper<T> implements Mapper<T> {
  const _PrimitiveMapper(this.decoder);
  
  final T Function(dynamic value) decoder;
  @override dynamic encode(T value) => value;
}

class _EnumMapper<T> with BaseMapper<T> implements Mapper<T> {
  _EnumMapper(this.strDecoder, this.encoder);
  
  Function get decoder => (dynamic v) => checked(v, strDecoder);
  
  final T Function(String value) strDecoder;
  final String Function(T value) encoder;

  @override String encode(T self) => encoder(self);
}

extension on Map<String, dynamic> {
  T get<T>(String key) {
    if (this[key] == null) {
      throw MapperException('Parameter $key is required.');
    }
    return Mapper.fromValue<T>(this[key]!);
  }

  T? getOpt<T>(String key) {
    if (this[key] == null) {
      return null;
    }
    return get<T>(key);
  }

  List<T> getList<T>(String key) {
    if (this[key] == null) {
      throw MapperException('Parameter $key is required.');
    } else if (this[key] is! List) {
      throw MapperException(
          'Parameter ${this[key]} with key $key is not a List');
    }
    List value = this[key] as List<dynamic>;
    return value.map((dynamic item) => Mapper.fromValue<T>(item)).toList();
  }

  List<T>? getListOpt<T>(String key) {
    if (this[key] == null) {
      return null;
    }
    return getList<T>(key);
  }

  Map<K, V> getMap<K, V>(String key) {
    if (this[key] == null) {
      throw MapperException('Parameter $key is required.');
    } else if (this[key] is! Map) {
      throw MapperException(
          'Parameter ${this[key]} with key $key is not a Map');
    }
    Map value = this[key] as Map<dynamic, dynamic>;
    return value.map((dynamic key, dynamic value) =>
        MapEntry(Mapper.fromValue<K>(key), Mapper.fromValue<V>(value)));
  }

  Map<K, V>? getMapOpt<K, V>(String key) {
    if (this[key] == null) {
      return null;
    }
    return getMap<K, V>(key);
  }
}

class MapperException implements Exception {
  final String message;
  const MapperException(this.message);

  @override
  String toString() => 'MapperException: $message';
}


class TypeInfo {
  String type = '';
  List<TypeInfo> params = [];
  TypeInfo? parent;

  @override
  String toString() => '$type${params.isNotEmpty ? '<${params.join(', ')}>' : ''}';
}

TypeInfo getTypeInfoFor(dynamic value) {
  var info = getTypeInfo(value.runtimeType.toString());
  if (value is List) {
    return info..type = 'List';
  } else if (value is Map) {
    return info..type = 'Map';
  } else {
    return info;
  }
}

TypeInfo getTypeInfo<T>([String? type]) {
  var typeString = type ?? T.toString();
  var curr = TypeInfo();

  for (var i = 0; i < typeString.length; i++) {
    var c = typeString[i];
    if (c == '<') {
      var t = TypeInfo();
      curr.params.add(t..parent = curr);
      curr = t;
    } else if (c == '>') {
      curr = curr.parent!;
    } else if (c == ' ') {
      continue;
    } else if (c == ',') {
      var t = TypeInfo();
      curr = curr.parent!;
      curr.params.add(t..parent = curr);
      curr = t;
    } else {
      curr.type += c;
    }
  }

  return curr;
}

void genericCall(TypeInfo info, Function fn, value) {
  var params = [...info.params];

  dynamic call(dynamic Function<T>() next) {
    var t = params.removeAt(0);
    if (_mappers[t.type] != null) {
      return genericCall(t, _mappers[t.type]!.typeFactory, next);
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
    throw MapperException('Mapper only supports generic classes with up to 3 type arguments.');
  }
}
''';
