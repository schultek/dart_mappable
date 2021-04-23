// ignore_for_file: unnecessary_cast, prefer_relative_imports, unused_element
import 'dart:convert';
import 'package:dart_mappable_example/main.dart';

// === GENERATED MAPPER CLASSES AND EXTENSIONS ===

class PersonMapper implements Mapper<Person> {
  PersonMapper._();

  Person fromValue(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Person fromMap(Map<String, dynamic> map) => Person(map.get('name'), age: map.getOpt('age') ?? 18, car: map.getOpt('car'));

  @override Map<String, dynamic> encode(Person p) => {'name': p.name, 'age': p.age, 'car': p.car?.toMap()};
  @override String stringify(Person self) => 'Person(name: ${self.name}, age: ${self.age}, car: ${self.car})';
  @override int hash(Person self) => self.name.hashCode ^ self.age.hashCode ^ self.car.hashCode;
  @override bool equals(Person self, Person other) => self.name == other.name && self.age == other.age && self.car == other.car;

  @override Function get decoder => fromValue;
  @override Function get typeFactory => (f) => f<Person>();
}

extension PersonExtension on Person {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Person copyWith({String? name, int? age, Car? car}) => Person(name ?? this.name, age: age ?? this.age, car: car ?? this.car);
}

class CarMapper implements Mapper<Car> {
  CarMapper._();

  Car fromValue(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Car fromMap(Map<String, dynamic> map) => Car(map.get('driven_km'), map.get('brand'));

  @override Map<String, dynamic> encode(Car c) => {'driven_km': c.drivenKm, 'brand': c.brand.toStringValue()};
  @override String stringify(Car self) => 'Car(miles: ${self.miles}, brand: ${self.brand})';
  @override int hash(Car self) => self.drivenKm.hashCode ^ self.brand.hashCode;
  @override bool equals(Car self, Car other) => self.drivenKm == other.drivenKm && self.brand == other.brand;

  @override Function get decoder => fromValue;
  @override Function get typeFactory => (f) => f<Car>();
}

extension CarExtension on Car {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Car copyWith({int? drivenKm, Brand? brand}) => Car(drivenKm ?? this.drivenKm, brand ?? this.brand);
}

class BoxMapper implements Mapper<Box> {
  BoxMapper._();

  Box<T> fromValue<T>(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap<T>(map));
  Box<T> fromMap<T>(Map<String, dynamic> map) => Box(map.get('size'), content: map.get('content'));

  @override Map<String, dynamic> encode(Box b) => {'size': b.size, 'content': Mapper.toValue(b.content)};
  @override String stringify(Box self) => 'Box(size: ${self.size}, content: ${self.content})';
  @override int hash(Box self) => self.size.hashCode ^ self.content.hashCode;
  @override bool equals(Box self, Box other) => self.size == other.size && self.content == other.content;

  @override Function get decoder => fromValue;
  @override Function get typeFactory => <T>(f) => f<Box<T>>();
}

extension BoxExtension<T> on Box<T> {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Box<T> copyWith({int? size, T? content}) => Box(size ?? this.size, content: content ?? this.content);
}

class ConfettiMapper implements Mapper<Confetti> {
  ConfettiMapper._();

  Confetti fromValue(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Confetti fromMap(Map<String, dynamic> map) => Confetti(map.get('color'));

  @override Map<String, dynamic> encode(Confetti c) => {'color': c.color};
  @override String stringify(Confetti self) => 'Confetti(color: ${self.color})';
  @override int hash(Confetti self) => self.color.hashCode;
  @override bool equals(Confetti self, Confetti other) => self.color == other.color;

  @override Function get decoder => fromValue;
  @override Function get typeFactory => (f) => f<Confetti>();
}

extension ConfettiExtension on Confetti {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Confetti copyWith({String? color}) => Confetti(color ?? this.color);
}


extension BrandMapper on Brand {
  static Brand fromString(String value) {
    switch (value) {
      case 'toyota': return Brand.Toyota;
      case 'audi': return Brand.Audi;
      case 'bmw': return Brand.BMW;
      default: throw MapperException('Cannot parse String $value to enum Brand');
    }
  }
  String toStringValue() {
    switch (this) {
      case Brand.Toyota: return 'toyota';
      case Brand.Audi: return 'audi';
      case Brand.BMW: return 'bmw';
    }
  }
}



// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <String, Mapper>{
  // primitive mappers
  'dynamic': _PrimitiveMapper((dynamic v) => v),
  'String':  _PrimitiveMapper<String>((dynamic v) => v.toString()),
  'int':     _PrimitiveMapper<int>((dynamic v) => num.parse(v.toString()).round()),
  'double':  _PrimitiveMapper<double>((dynamic v) => double.parse(v.toString())),
  'num':     _PrimitiveMapper<num>((dynamic v) => num.parse(v.toString())),
  'bool':    _PrimitiveMapper<bool>((dynamic v) => v is num ? v != 0 : v.toString() == 'true'),
  'DateTime':_DateTimeMapper(),
  'List':    _ListMapper(),
  'Map':     _MapMapper(),
  // generated mappers
  'Person': PersonMapper._(),
  'Car': CarMapper._(),
  'Box': BoxMapper._(),
  'Confetti': ConfettiMapper._(),

  'Brand': _EnumMapper<Brand>(BrandMapper.fromString, (Brand b) => b.toStringValue()),

};

// === GENERATED UTILITY CLASSES ===

abstract class Mapper<T> {
  dynamic encode(T self);
  Function get decoder;
  Function get typeFactory;
  
  String stringify(T self);
  int hash(T self);
  bool equals(T self, T other);

  Mapper._();

  static T fromValue<T>(dynamic value) {
    if (value.runtimeType == T) {
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
    var type = baseType(value.runtimeType);
    if (_mappers[type] != null) {
      return _mappers[type]!.equals(value, other);
    } else {
      throw MapperException(
          'Cannot compare value of type $type for equality. Unknown type. Did you forgot to include the class or register a custom mapper?');
    }
  }

  static String asString(dynamic value) {
    var type = baseType(value.runtimeType);
    if (_mappers[type] != null) {
      return _mappers[type]!.stringify(value);
    } else {
      throw MapperException(
          'Cannot stringify value of type $type. Unknown type. Did you forgot to include the class or register a custom mapper?');
    }
  }

  static void use<T>(Mapper<T> mapper) => _mappers[baseType<T>()] = mapper;
 
  static String baseType<T>([Type? t]) {
    var input = (t ?? T).toString();
    return input.split('<')[0];
  }
}

void clearType(Map<String, dynamic> map) {
  map.removeWhere((key, _) => key == '_type');
  map.values.whereType<Map<String, dynamic>>().forEach(clearType);
  map.values.whereType<List>().forEach((l) => l.whereType<Map<String, dynamic>>().forEach(clearType));
}

abstract class Mappable<T> {
  Mapper? get _mapper => _mappers[Mapper.baseType(runtimeType)];

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
