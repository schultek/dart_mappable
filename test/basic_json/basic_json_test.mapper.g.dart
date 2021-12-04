import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';

import 'basic_json_test.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <String, BaseMapper>{
  // primitive mappers
  _typeOf<dynamic>():  PrimitiveMapper((dynamic v) => v),
  _typeOf<String>():   PrimitiveMapper<String>((dynamic v) => v.toString()),
  _typeOf<int>():      PrimitiveMapper<int>((dynamic v) => num.parse(v.toString()).round()),
  _typeOf<double>():   PrimitiveMapper<double>((dynamic v) => double.parse(v.toString())),
  _typeOf<num>():      PrimitiveMapper<num>((dynamic v) => num.parse(v.toString())),
  _typeOf<bool>():     PrimitiveMapper<bool>((dynamic v) => v is num ? v != 0 : v.toString() == 'true'),
  _typeOf<DateTime>(): DateTimeMapper(),
  _typeOf<List>():     IterableMapper<List>(<T>(Iterable<T> i) => i.toList(), <T>(f) => f<List<T>>()),
  _typeOf<Set>():      IterableMapper<Set>(<T>(Iterable<T> i) => i.toSet(), <T>(f) => f<Set<T>>()),
  _typeOf<Map>():      MapMapper<Map>(<K, V>(Map<K, V> map) => map, <K, V>(f) => f<Map<K, V>>()),
  // class mappers
  _typeOf<Person>(): PersonMapper._(),
  _typeOf<Car>(): CarMapper._(),
  // enum mappers
  _typeOf<Brand>(): EnumMapper<Brand>(BrandMapper.fromString, (Brand b) => b.toStringValue()),
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class PersonMapper extends BaseMapper<Person> {
  PersonMapper._();

  @override Function get decoder => decode;
  Person decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Person fromMap(Map<String, dynamic> map) => Person(map.get('name'), age: map.getOpt('age') ?? 18, car: map.getOpt('car'));

  @override Function get encoder => (Person v) => encode(v);
  dynamic encode(Person v) => toMap(v);
  Map<String, dynamic> toMap(Person p) => {'name': Mapper.toValue(p.name), 'age': Mapper.toValue(p.age), 'car': Mapper.toValue(p.car)};

  @override String? stringify(Person self) => 'Person(name: ${Mapper.asString(self.name)}, age: ${Mapper.asString(self.age)}, car: ${Mapper.asString(self.car)})';
  @override int? hash(Person self) => Mapper.hash(self.name) ^ Mapper.hash(self.age) ^ Mapper.hash(self.car);
  @override bool? equals(Person self, Person other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.age, other.age) && Mapper.isEqual(self.car, other.car);

  @override Function get typeFactory => (f) => f<Person>();
}

extension PersonMapperExtension on Person {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  PersonCopyWith<Person> get copyWith => PersonCopyWith(this, _$identity);
}

abstract class PersonCopyWith<$R> {
  factory PersonCopyWith(Person value, Then<Person, $R> then) = _PersonCopyWithImpl<$R>;
  CarCopyWith<$R>? get car;
  $R call({String? name, int? age, Car? car});
}

class _PersonCopyWithImpl<$R> extends BaseCopyWith<Person, $R> implements PersonCopyWith<$R> {
  _PersonCopyWithImpl(Person value, Then<Person, $R> then) : super(value, then);

  @override CarCopyWith<$R>? get car => _value.car != null ? CarCopyWith(_value.car!, (v) => call(car: v)) : null;
  @override $R call({String? name, int? age, Object? car = _none}) => _then(Person(name ?? _value.name, age: age ?? _value.age, car: or(car, _value.car)));
}

class CarMapper extends BaseMapper<Car> {
  CarMapper._();

  @override Function get decoder => decode;
  Car decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Car fromMap(Map<String, dynamic> map) => Car(map.get('driven_km'), map.get('brand'));

  @override Function get encoder => (Car v) => encode(v);
  dynamic encode(Car v) => toMap(v);
  Map<String, dynamic> toMap(Car c) => {'driven_km': Mapper.toValue(c.drivenKm), 'brand': Mapper.toValue(c.brand)};

  @override String? stringify(Car self) => 'Car(miles: ${Mapper.asString(self.miles)}, brand: ${Mapper.asString(self.brand)})';
  @override int? hash(Car self) => Mapper.hash(self.drivenKm) ^ Mapper.hash(self.brand);
  @override bool? equals(Car self, Car other) => Mapper.isEqual(self.drivenKm, other.drivenKm) && Mapper.isEqual(self.brand, other.brand);

  @override Function get typeFactory => (f) => f<Car>();
}

extension CarMapperExtension on Car {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CarCopyWith<Car> get copyWith => CarCopyWith(this, _$identity);
}

abstract class CarCopyWith<$R> {
  factory CarCopyWith(Car value, Then<Car, $R> then) = _CarCopyWithImpl<$R>;
  $R call({int? drivenKm, Brand? brand});
}

class _CarCopyWithImpl<$R> extends BaseCopyWith<Car, $R> implements CarCopyWith<$R> {
  _CarCopyWithImpl(Car value, Then<Car, $R> then) : super(value, then);

  @override $R call({int? drivenKm, Brand? brand}) => _then(Car(drivenKm ?? _value.drivenKm, brand ?? _value.brand));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===

extension BrandMapper on Brand {
  static Brand fromString(String value) {
    switch (value) {
      case 'toyota': return Brand.Toyota;
      case 'audi': return Brand.Audi;
      case 'bmw': return Brand.BMW;
      default: return Brand.values[1];
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


// === GENERATED UTILITY CODE ===

class Mapper<T> {
  Mapper._();

  static T fromValue<T>(dynamic value) {
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
          return genericCall(typeInfo, mapper!.decoder!, value) as T;
        } catch (e) {
          throw MapperException('Error on decoding type $T: ${e is MapperException ? e.message : e}');
        }
      } else {
        throw MapperException('Cannot decode value $value of type ${value.runtimeType} to type $T. Unknown type. Did you forgot to include the class or register a custom mapper?');
      }
    }
  }

  static dynamic toValue(dynamic value) {
    if (value == null) return null;
    var typeInfo = TypeInfo.fromValue(value);
    var mapper = _mappers[typeInfo.type] ?? _mappers.values
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
  
  static T fromIterable<T>(Iterable<dynamic> iterable) => fromValue<T>(iterable);

  static Iterable<dynamic> toIterable(dynamic object) {
    var value = toValue(object);
    if (value is Iterable<dynamic>) {
      return value;
    } else {
      throw MapperException('Cannot encode value of type ${object.runtimeType} to Iterable. Instead encoded to type ${value.runtimeType}.');
    }
  }

  static T fromJson<T>(String json) {
    return fromValue<T>(jsonDecode(json));
  }
  
  static String toJson(dynamic object) {
    return jsonEncode(toValue(object));
  }

  static bool isEqual(dynamic value, Object? other) {
    if (value == null || other == null) {
      return value == other;
    } else if (value.runtimeType != other.runtimeType) {
      return false;
    }
    var type = TypeInfo.fromValue(value);
    return _mappers[type.type]?.equals(value, other) ?? value == other;
  }
  
  static int hash(dynamic value) {
    var type = TypeInfo.fromValue(value);
    return _mappers[type.type]?.hash(value) ?? value.hashCode;
  }

  static String asString(dynamic value) {
    var type = TypeInfo.fromValue(value);
    return _mappers[type.type]?.stringify(value) ?? value.toString();
  }

  static void use<T>(BaseMapper<T> mapper) => _mappers[_typeOf<T>()] = mapper;
  static BaseMapper<T>? unuse<T>() => _mappers.remove(_typeOf<T>()) as BaseMapper<T>?;
  static void useAll(List<BaseMapper> mappers) => _mappers.addEntries(mappers.map((m) => MapEntry(_typeOf(m.type), m)));
  
  static BaseMapper<T>? get<T>() => _mappers[_typeOf<T>()] as BaseMapper<T>?;
  static List<BaseMapper> getAll() => [..._mappers.values];
}

String _typeOf<T>([Type? t]) {
  var input = (t ?? T).toString();
  return input.split('<')[0];
}

void _clearType(Map<String, dynamic> map) {
  map.removeWhere((key, _) => key == '__type');
  map.values.whereType<Map<String, dynamic>>().forEach(_clearType);
  map.values.whereType<List>().forEach((l) => l.whereType<Map<String, dynamic>>().forEach(_clearType));
}

mixin Mappable {
  BaseMapper? get _mapper => _mappers[_typeOf(runtimeType)];

  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override String toString() => _mapper?.stringify(this) ?? super.toString();
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && (_mapper?.equals(this, other) ?? super == other));
  @override int get hashCode => _mapper?.hash(this) ?? super.hashCode;
}

T _checked<T, U>(dynamic v, T Function(U) fn) {
  if (v is U) {
    return fn(v);
  } else {
    throw MapperException('Cannot decode value of type ${v.runtimeType} to type $T, because a value of type $U is expected.');
  }
}

class DateTimeMapper extends SimpleMapper<DateTime> {

  @override
  DateTime decode(dynamic d) {
    if (d is String) {
      return DateTime.parse(d);
    } else if (d is num) {
      return DateTime.fromMillisecondsSinceEpoch(d.round());
    } else {
      throw MapperException('Cannot decode value of type ${d.runtimeType} to type DateTime, because a value of type String or num is expected.');
    }
  }
  
  @override
  String encode(DateTime self) {
    return self.toUtc().toIso8601String();
  }
}

class MapperEquality implements Equality {
  @override bool equals(dynamic e1, dynamic e2) => Mapper.isEqual(e1, e2);
  @override int hash(dynamic e) => Mapper.hash(e);
  @override bool isValidKey(Object? o) => true;
}

class IterableMapper<I extends Iterable> extends BaseMapper<I> with MapperEqualityMixin<I> {
  Iterable<U> Function<U>(Iterable<U> iterable) fromIterable;
  IterableMapper(this.fromIterable, this.typeFactory);

  @override Function get decoder => <T>(dynamic l) => _checked(l, (Iterable l) => fromIterable(l.map((v) => Mapper.fromValue<T>(v))));
  @override Function get encoder => (I self) => self.map((v) => Mapper.toValue(v)).toList();
  @override Function typeFactory;
  
  @override Equality equality = IterableEquality(MapperEquality());
}

class MapMapper<M extends Map> extends BaseMapper<M> with MapperEqualityMixin<M> {
  Map<K, V> Function<K, V>(Map<K, V> map) fromMap;
  MapMapper(this.fromMap, this.typeFactory);

  @override Function get decoder => <K, V>(dynamic m) => _checked(m,(Map m) => fromMap(m.map((key, value) => MapEntry(Mapper.fromValue<K>(key), Mapper.fromValue<V>(value)))));
  @override Function get encoder => (M self) => self.map((key, value) => MapEntry(Mapper.toValue(key), Mapper.toValue(value)));
  @override Function typeFactory;
  
  @override Equality equality = MapEquality(keys: MapperEquality(), values: MapperEquality());
}

class PrimitiveMapper<T> extends BaseMapper<T> {
  const PrimitiveMapper(this.decoder);
  
  @override final T Function(dynamic value) decoder;
  @override Function get encoder => (T value) => value;
  @override Function get typeFactory => (f) => f<T>();
  
  @override bool isFor(dynamic v) => v.runtimeType == T;
}

class EnumMapper<T> extends SimpleMapper<T> {
  EnumMapper(this._decoder, this._encoder);
  
  final T Function(String value) _decoder;
  final String Function(T value) _encoder;
  
  @override T decode(dynamic v) => _checked(v, _decoder);
  @override dynamic encode(T value) => _encoder(value);
}

dynamic genericCall(TypeInfo info, Function fn, dynamic value) {
  var params = [...info.params];

  dynamic call(dynamic Function<T>() next) {
    var t = params.removeAt(0);
    if (_mappers[t.type] != null) {
      return genericCall(t, _mappers[t.type]!.typeFactory ?? (f) => f(), next);
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
    throw MapperException('Cannot construct generic wrapper for type $info. Mapper only supports generic classes with up to 3 type arguments.');
  }
}

T _hookedDecode<T>(MappingHooks hooks, dynamic value, T Function(dynamic value) fn) {
  var v = hooks.beforeDecode(value);
  if (v is! T) v = fn(v);
  return hooks.afterDecode(v) as T;
}
dynamic _hookedEncode<T>(MappingHooks hooks, T value, dynamic Function(T value) fn) {
  var v = hooks.beforeEncode(value);
  if (v is T) v = fn(v);
  return hooks.afterEncode(v);
}

dynamic _toValue(dynamic value, {MappingHooks? hooks}) {
  if (hooks == null) {
    return Mapper.toValue(value);
  } else {
    return hooks.afterEncode(Mapper.toValue(hooks.beforeEncode(value)));
  }
}

extension MapGet on Map<String, dynamic> {
  T get<T>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      throw MapperException('Parameter $key is required.');
    }
    return Mapper.fromValue<T>(v);
  });

  T? getOpt<T>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      return null;
    }
    return Mapper.fromValue<T>(v);
  });

  List<T> getList<T>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      throw MapperException('Parameter $key is required.');
    } else if (v is! List) {
      throw MapperException('Parameter $v with key $key is not a List');
    }
    return v.map((dynamic item) => Mapper.fromValue<T>(item)).toList();
  });

  List<T>? getListOpt<T>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      return null;
    } else if (v is! List) {
      throw MapperException('Parameter $v with key $key is not a List');
    }
    return v.map((dynamic item) => Mapper.fromValue<T>(item)).toList();
  });

  Map<K, V> getMap<K, V>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      throw MapperException('Parameter $key is required.');
    } else if (v is! Map) {
      throw MapperException('Parameter $v with key $key is not a Map');
    }
    return v.map((dynamic key, dynamic value) => MapEntry(Mapper.fromValue<K>(key), Mapper.fromValue<V>(value)));
  });

  Map<K, V>? getMapOpt<K, V>(String key, {MappingHooks? hooks}) => hooked(hooks, key, (v) {
    if (v == null) {
      return null;
    } else if (v is! Map) {
      throw MapperException('Parameter $v with key $key is not a Map');
    }
    return v.map((dynamic key, dynamic value) => MapEntry(Mapper.fromValue<K>(key), Mapper.fromValue<V>(value)));
  });

  T hooked<T>(MappingHooks? hooks, String key, T Function(dynamic v) fn) {
    if (hooks == null) {
      return fn(this[key]);
    } else {
      return hooks.afterDecode(fn(hooks.beforeDecode(this[key]))) as T;
    }
  }
}

class _None { const _None(); }
const _none = _None();

T _$identity<T>(T value) => value;
typedef Then<$T, $R> = $R Function($T);

class BaseCopyWith<$T, $R> {
  BaseCopyWith(this._value, this._then);

  final $T _value;
  final Then<$T, $R> _then;
  
  T or<T>(Object? _v, T v) => _v == _none ? v : _v as T;
}

