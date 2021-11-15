import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';

import 'polymorphism_test.dart';


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
  _typeOf<Animal>(): AnimalMapper._(),
  _typeOf<Cat>(): CatMapper._(),
  _typeOf<Dog>(): DogMapper._(),
  _typeOf<NullAnimal>(): NullAnimalMapper._(),
  _typeOf<DefaultAnimal>(): DefaultAnimalMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class AnimalMapper extends BaseMapper<Animal> {
  AnimalMapper._();

  @override Function get decoder => decode;
  Animal decode(dynamic v) => _checked(v, (Map<String, dynamic> map) {
    switch(map['type']) {
      case 'Cat': return CatMapper._().decode(map);
      case 1: return DogMapper._().decode(map);
      case null: return NullAnimalMapper._().decode(map);
      default: return DefaultAnimalMapper._().decode(map);
    }
  });
  Animal fromMap(Map<String, dynamic> map) => throw MapperException("Cannot instantiate class Animal, did you forgot to specify a subclass for [ type: '${map['type']}' ] or a default subclass?");

  @override Function get encoder => (Animal v) => encode(v);
  dynamic encode(Animal v) {
    if (v is Cat) { return CatMapper._().encode(v); }
    else if (v is Dog) { return DogMapper._().encode(v); }
    else if (v is NullAnimal) { return NullAnimalMapper._().encode(v); }
    else if (v is DefaultAnimal) { return DefaultAnimalMapper._().encode(v); }
    else { return toMap(v); }
  }
  Map<String, dynamic> toMap(Animal a) => {'name': Mapper.toValue(a.name)};

  @override String? stringify(Animal self) => 'Animal(name: ${Mapper.asString(self.name)})';
  @override int? hash(Animal self) => Mapper.hash(self.name);
  @override bool? equals(Animal self, Animal other) => Mapper.isEqual(self.name, other.name);

  @override Function get typeFactory => (f) => f<Animal>();
}

extension AnimalMapperExtension on Animal {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

class CatMapper extends BaseMapper<Cat> {
  CatMapper._();

  @override Function get decoder => decode;
  Cat decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Cat fromMap(Map<String, dynamic> map) => Cat(map.get('name'), map.get('color'));

  @override Function get encoder => (Cat v) => encode(v);
  dynamic encode(Cat v) => toMap(v);
  Map<String, dynamic> toMap(Cat c) => {'name': Mapper.toValue(c.name), 'color': Mapper.toValue(c.color), 'type': 'Cat'};

  @override String? stringify(Cat self) => 'Cat(name: ${Mapper.asString(self.name)}, color: ${Mapper.asString(self.color)})';
  @override int? hash(Cat self) => Mapper.hash(self.name) ^ Mapper.hash(self.color);
  @override bool? equals(Cat self, Cat other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.color, other.color);

  @override Function get typeFactory => (f) => f<Cat>();
}

extension CatMapperExtension on Cat {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CatCopyWith<Cat> get copyWith => CatCopyWith(this, _$identity);
}

abstract class CatCopyWith<$R> {
  factory CatCopyWith(Cat value, Then<Cat, $R> then) = _CatCopyWithImpl<$R>;
  $R call({String? name, String? color});
}

class _CatCopyWithImpl<$R> extends BaseCopyWith<Cat, $R> implements CatCopyWith<$R> {
  _CatCopyWithImpl(Cat value, Then<Cat, $R> then) : super(value, then);

  @override $R call({String? name, String? color}) => _then(Cat(name ?? _value.name, color ?? _value.color));
}

class DogMapper extends BaseMapper<Dog> {
  DogMapper._();

  @override Function get decoder => decode;
  Dog decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  Dog fromMap(Map<String, dynamic> map) => Dog(map.get('name'), map.get('age'));

  @override Function get encoder => (Dog v) => encode(v);
  dynamic encode(Dog v) => toMap(v);
  Map<String, dynamic> toMap(Dog d) => {'name': Mapper.toValue(d.name), 'age': Mapper.toValue(d.age), 'type': 1};

  @override String? stringify(Dog self) => 'Dog(name: ${Mapper.asString(self.name)}, age: ${Mapper.asString(self.age)})';
  @override int? hash(Dog self) => Mapper.hash(self.name) ^ Mapper.hash(self.age);
  @override bool? equals(Dog self, Dog other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.age, other.age);

  @override Function get typeFactory => (f) => f<Dog>();
}

extension DogMapperExtension on Dog {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DogCopyWith<Dog> get copyWith => DogCopyWith(this, _$identity);
}

abstract class DogCopyWith<$R> {
  factory DogCopyWith(Dog value, Then<Dog, $R> then) = _DogCopyWithImpl<$R>;
  $R call({String? name, int? age});
}

class _DogCopyWithImpl<$R> extends BaseCopyWith<Dog, $R> implements DogCopyWith<$R> {
  _DogCopyWithImpl(Dog value, Then<Dog, $R> then) : super(value, then);

  @override $R call({String? name, int? age}) => _then(Dog(name ?? _value.name, age ?? _value.age));
}

class NullAnimalMapper extends BaseMapper<NullAnimal> {
  NullAnimalMapper._();

  @override Function get decoder => decode;
  NullAnimal decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  NullAnimal fromMap(Map<String, dynamic> map) => NullAnimal(map.get('name'));

  @override Function get encoder => (NullAnimal v) => encode(v);
  dynamic encode(NullAnimal v) => toMap(v);
  Map<String, dynamic> toMap(NullAnimal n) => {'name': Mapper.toValue(n.name), 'type': null};

  @override String? stringify(NullAnimal self) => 'NullAnimal(name: ${Mapper.asString(self.name)})';
  @override int? hash(NullAnimal self) => Mapper.hash(self.name);
  @override bool? equals(NullAnimal self, NullAnimal other) => Mapper.isEqual(self.name, other.name);

  @override Function get typeFactory => (f) => f<NullAnimal>();
}

extension NullAnimalMapperExtension on NullAnimal {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  NullAnimalCopyWith<NullAnimal> get copyWith => NullAnimalCopyWith(this, _$identity);
}

abstract class NullAnimalCopyWith<$R> {
  factory NullAnimalCopyWith(NullAnimal value, Then<NullAnimal, $R> then) = _NullAnimalCopyWithImpl<$R>;
  $R call({String? name});
}

class _NullAnimalCopyWithImpl<$R> extends BaseCopyWith<NullAnimal, $R> implements NullAnimalCopyWith<$R> {
  _NullAnimalCopyWithImpl(NullAnimal value, Then<NullAnimal, $R> then) : super(value, then);

  @override $R call({String? name}) => _then(NullAnimal(name ?? _value.name));
}

class DefaultAnimalMapper extends BaseMapper<DefaultAnimal> {
  DefaultAnimalMapper._();

  @override Function get decoder => decode;
  DefaultAnimal decode(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap(map));
  DefaultAnimal fromMap(Map<String, dynamic> map) => DefaultAnimal(map.get('name'), map.get('type'));

  @override Function get encoder => (DefaultAnimal v) => encode(v);
  dynamic encode(DefaultAnimal v) => toMap(v);
  Map<String, dynamic> toMap(DefaultAnimal d) => {'name': Mapper.toValue(d.name), 'type': Mapper.toValue(d.type)};

  @override String? stringify(DefaultAnimal self) => 'DefaultAnimal(name: ${Mapper.asString(self.name)}, type: ${Mapper.asString(self.type)})';
  @override int? hash(DefaultAnimal self) => Mapper.hash(self.name) ^ Mapper.hash(self.type);
  @override bool? equals(DefaultAnimal self, DefaultAnimal other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.type, other.type);

  @override Function get typeFactory => (f) => f<DefaultAnimal>();
}

extension DefaultAnimalMapperExtension on DefaultAnimal {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DefaultAnimalCopyWith<DefaultAnimal> get copyWith => DefaultAnimalCopyWith(this, _$identity);
}

abstract class DefaultAnimalCopyWith<$R> {
  factory DefaultAnimalCopyWith(DefaultAnimal value, Then<DefaultAnimal, $R> then) = _DefaultAnimalCopyWithImpl<$R>;
  $R call({String? name, String? type});
}

class _DefaultAnimalCopyWithImpl<$R> extends BaseCopyWith<DefaultAnimal, $R> implements DefaultAnimalCopyWith<$R> {
  _DefaultAnimalCopyWithImpl(DefaultAnimal value, Then<DefaultAnimal, $R> then) : super(value, then);

  @override $R call({String? name, String? type}) => _then(DefaultAnimal(name ?? _value.name, type ?? _value.type));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




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

