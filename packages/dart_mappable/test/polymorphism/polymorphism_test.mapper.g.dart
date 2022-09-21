import 'dart:core';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'polymorphism_test.dart' as p0;


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  AnimalMapper._(),
  CatMapper._(),
  DogMapper._(),
  NullAnimalMapper._(),
  DefaultAnimalMapper._(),
  ZooMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class AnimalMapper extends BaseMapper<p0.Animal> {
  AnimalMapper._();

  @override Function get decoder => decode;
  p0.Animal decode(dynamic v) => checked(v, (Map<String, dynamic> map) {
    switch(map['type']) {
      case 'Cat': return CatMapper._().decode(map);
      case 1: return DogMapper._().decode(map);
      case null: return NullAnimalMapper._().decode(map);
      default: return DefaultAnimalMapper._().decode(map);
    }
  });
  p0.Animal fromMap(Map<String, dynamic> map) => throw MapperException.missingSubclass('Animal', 'type', '${map['type']}');

  @override Function get encoder => (p0.Animal v) => encode(v);
  dynamic encode(p0.Animal v) {
    if (v is p0.NullAnimal) { return NullAnimalMapper._().encode(v); }
    else if (v is p0.Cat) { return CatMapper._().encode(v); }
    else if (v is p0.Dog) { return DogMapper._().encode(v); }
    else if (v is p0.DefaultAnimal) { return DefaultAnimalMapper._().encode(v); }
    else { return toMap(v); }
  }
  Map<String, dynamic> toMap(p0.Animal a) => {'name': Mapper.i.$enc(a.name, 'name')};

  @override String stringify(p0.Animal self) => 'Animal(name: ${Mapper.asString(self.name)})';
  @override int hash(p0.Animal self) => Mapper.hash(self.name);
  @override bool equals(p0.Animal self, p0.Animal other) => Mapper.isEqual(self.name, other.name);

  @override Function get typeFactory => (f) => f<p0.Animal>();
}

extension AnimalMapperExtension on p0.Animal {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AnimalCopyWith<p0.Animal> get copyWith => AnimalCopyWith(this, $identity);
}

abstract class AnimalCopyWith<$R> {
  factory AnimalCopyWith(p0.Animal value, Then<p0.Animal, $R> then) {
    if (value is p0.NullAnimal) { return NullAnimalCopyWith(value, then); }
    else if (value is p0.Cat) { return CatCopyWith(value, then); }
    else if (value is p0.Dog) { return DogCopyWith(value, then); }
    else if (value is p0.DefaultAnimal) { return DefaultAnimalCopyWith(value, then); }
    else { throw MapperException.unsupportedMethod(MapperMethod.copy, value.runtimeType); }
  }
  $R call({String? name});
}


class CatMapper extends BaseMapper<p0.Cat> {
  CatMapper._();

  @override Function get decoder => decode;
  p0.Cat decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Cat fromMap(Map<String, dynamic> map) => p0.Cat(Mapper.i.$get(map, 'name'), Mapper.i.$get(map, 'color'));

  @override Function get encoder => (p0.Cat v) => encode(v);
  dynamic encode(p0.Cat v) => toMap(v);
  Map<String, dynamic> toMap(p0.Cat c) => {'name': Mapper.i.$enc(c.name, 'name'), 'color': Mapper.i.$enc(c.color, 'color'), 'type': 'Cat'};

  @override String stringify(p0.Cat self) => 'Cat(name: ${Mapper.asString(self.name)}, color: ${Mapper.asString(self.color)})';
  @override int hash(p0.Cat self) => Mapper.hash(self.name) ^ Mapper.hash(self.color);
  @override bool equals(p0.Cat self, p0.Cat other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.color, other.color);

  @override Function get typeFactory => (f) => f<p0.Cat>();
}

extension CatMapperExtension on p0.Cat {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CatCopyWith<p0.Cat> get copyWith => CatCopyWith(this, $identity);
}

abstract class CatCopyWith<$R> implements AnimalCopyWith<$R> {
  factory CatCopyWith(p0.Cat value, Then<p0.Cat, $R> then) = _CatCopyWithImpl<$R>;
  @override $R call({String? name, String? color});
  $R apply(p0.Cat Function(p0.Cat) transform);
}

class _CatCopyWithImpl<$R> extends BaseCopyWith<p0.Cat, $R> implements CatCopyWith<$R> {
  _CatCopyWithImpl(p0.Cat value, Then<p0.Cat, $R> then) : super(value, then);

  @override $R call({String? name, String? color}) => $then(p0.Cat(name ?? $value.name, color ?? $value.color));
}

class DogMapper extends BaseMapper<p0.Dog> {
  DogMapper._();

  @override Function get decoder => decode;
  p0.Dog decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Dog fromMap(Map<String, dynamic> map) => p0.Dog(Mapper.i.$get(map, 'name'), Mapper.i.$get(map, 'age'));

  @override Function get encoder => (p0.Dog v) => encode(v);
  dynamic encode(p0.Dog v) => toMap(v);
  Map<String, dynamic> toMap(p0.Dog d) => {'name': Mapper.i.$enc(d.name, 'name'), 'age': Mapper.i.$enc(d.age, 'age'), 'type': 1};

  @override String stringify(p0.Dog self) => 'Dog(name: ${Mapper.asString(self.name)}, age: ${Mapper.asString(self.age)})';
  @override int hash(p0.Dog self) => Mapper.hash(self.name) ^ Mapper.hash(self.age);
  @override bool equals(p0.Dog self, p0.Dog other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.age, other.age);

  @override Function get typeFactory => (f) => f<p0.Dog>();
}

extension DogMapperExtension on p0.Dog {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DogCopyWith<p0.Dog> get copyWith => DogCopyWith(this, $identity);
}

abstract class DogCopyWith<$R> implements AnimalCopyWith<$R> {
  factory DogCopyWith(p0.Dog value, Then<p0.Dog, $R> then) = _DogCopyWithImpl<$R>;
  @override $R call({String? name, int? age});
  $R apply(p0.Dog Function(p0.Dog) transform);
}

class _DogCopyWithImpl<$R> extends BaseCopyWith<p0.Dog, $R> implements DogCopyWith<$R> {
  _DogCopyWithImpl(p0.Dog value, Then<p0.Dog, $R> then) : super(value, then);

  @override $R call({String? name, int? age}) => $then(p0.Dog(name ?? $value.name, age ?? $value.age));
}

class NullAnimalMapper extends BaseMapper<p0.NullAnimal> {
  NullAnimalMapper._();

  @override Function get decoder => decode;
  p0.NullAnimal decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.NullAnimal fromMap(Map<String, dynamic> map) => p0.NullAnimal(Mapper.i.$get(map, 'name'));

  @override Function get encoder => (p0.NullAnimal v) => encode(v);
  dynamic encode(p0.NullAnimal v) => toMap(v);
  Map<String, dynamic> toMap(p0.NullAnimal n) => {'name': Mapper.i.$enc(n.name, 'name'), 'type': null};

  @override String stringify(p0.NullAnimal self) => 'NullAnimal(name: ${Mapper.asString(self.name)})';
  @override int hash(p0.NullAnimal self) => Mapper.hash(self.name);
  @override bool equals(p0.NullAnimal self, p0.NullAnimal other) => Mapper.isEqual(self.name, other.name);

  @override Function get typeFactory => (f) => f<p0.NullAnimal>();
}

extension NullAnimalMapperExtension on p0.NullAnimal {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  NullAnimalCopyWith<p0.NullAnimal> get copyWith => NullAnimalCopyWith(this, $identity);
}

abstract class NullAnimalCopyWith<$R> implements AnimalCopyWith<$R> {
  factory NullAnimalCopyWith(p0.NullAnimal value, Then<p0.NullAnimal, $R> then) = _NullAnimalCopyWithImpl<$R>;
  @override $R call({String? name});
  $R apply(p0.NullAnimal Function(p0.NullAnimal) transform);
}

class _NullAnimalCopyWithImpl<$R> extends BaseCopyWith<p0.NullAnimal, $R> implements NullAnimalCopyWith<$R> {
  _NullAnimalCopyWithImpl(p0.NullAnimal value, Then<p0.NullAnimal, $R> then) : super(value, then);

  @override $R call({String? name}) => $then(p0.NullAnimal(name ?? $value.name));
}

class DefaultAnimalMapper extends BaseMapper<p0.DefaultAnimal> {
  DefaultAnimalMapper._();

  @override Function get decoder => decode;
  p0.DefaultAnimal decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.DefaultAnimal fromMap(Map<String, dynamic> map) => p0.DefaultAnimal(Mapper.i.$get(map, 'name'), Mapper.i.$get(map, 'type'));

  @override Function get encoder => (p0.DefaultAnimal v) => encode(v);
  dynamic encode(p0.DefaultAnimal v) => toMap(v);
  Map<String, dynamic> toMap(p0.DefaultAnimal d) => {'name': Mapper.i.$enc(d.name, 'name'), 'type': Mapper.i.$enc(d.type, 'type')};

  @override String stringify(p0.DefaultAnimal self) => 'DefaultAnimal(name: ${Mapper.asString(self.name)}, type: ${Mapper.asString(self.type)})';
  @override int hash(p0.DefaultAnimal self) => Mapper.hash(self.name) ^ Mapper.hash(self.type);
  @override bool equals(p0.DefaultAnimal self, p0.DefaultAnimal other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.type, other.type);

  @override Function get typeFactory => (f) => f<p0.DefaultAnimal>();
}

extension DefaultAnimalMapperExtension on p0.DefaultAnimal {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DefaultAnimalCopyWith<p0.DefaultAnimal> get copyWith => DefaultAnimalCopyWith(this, $identity);
}

abstract class DefaultAnimalCopyWith<$R> implements AnimalCopyWith<$R> {
  factory DefaultAnimalCopyWith(p0.DefaultAnimal value, Then<p0.DefaultAnimal, $R> then) = _DefaultAnimalCopyWithImpl<$R>;
  @override $R call({String? name, String? type});
  $R apply(p0.DefaultAnimal Function(p0.DefaultAnimal) transform);
}

class _DefaultAnimalCopyWithImpl<$R> extends BaseCopyWith<p0.DefaultAnimal, $R> implements DefaultAnimalCopyWith<$R> {
  _DefaultAnimalCopyWithImpl(p0.DefaultAnimal value, Then<p0.DefaultAnimal, $R> then) : super(value, then);

  @override $R call({String? name, String? type}) => $then(p0.DefaultAnimal(name ?? $value.name, type ?? $value.type));
}

class ZooMapper extends BaseMapper<p0.Zoo> {
  ZooMapper._();

  @override Function get decoder => decode;
  p0.Zoo decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Zoo fromMap(Map<String, dynamic> map) => p0.Zoo(Mapper.i.$get(map, 'animal'));

  @override Function get encoder => (p0.Zoo v) => encode(v);
  dynamic encode(p0.Zoo v) => toMap(v);
  Map<String, dynamic> toMap(p0.Zoo z) => {'animal': Mapper.i.$enc(z.animal, 'animal')};

  @override String stringify(p0.Zoo self) => 'Zoo(animal: ${Mapper.asString(self.animal)})';
  @override int hash(p0.Zoo self) => Mapper.hash(self.animal);
  @override bool equals(p0.Zoo self, p0.Zoo other) => Mapper.isEqual(self.animal, other.animal);

  @override Function get typeFactory => (f) => f<p0.Zoo>();
}

extension ZooMapperExtension on p0.Zoo {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ZooCopyWith<p0.Zoo> get copyWith => ZooCopyWith(this, $identity);
}

abstract class ZooCopyWith<$R> {
  factory ZooCopyWith(p0.Zoo value, Then<p0.Zoo, $R> then) = _ZooCopyWithImpl<$R>;
  $R call({p0.Animal? animal});
  $R apply(p0.Zoo Function(p0.Zoo) transform);
}

class _ZooCopyWithImpl<$R> extends BaseCopyWith<p0.Zoo, $R> implements ZooCopyWith<$R> {
  _ZooCopyWithImpl(p0.Zoo value, Then<p0.Zoo, $R> then) : super(value, then);

  @override $R call({p0.Animal? animal}) => $then(p0.Zoo(animal ?? $value.animal));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




// === GENERATED UTILITY CODE ===

class Mapper {
  Mapper._();

  static MapperContainer i = MapperContainer(_mappers);

  static T fromValue<T>(dynamic value) => i.fromValue<T>(value);
  static T fromMap<T>(Map<String, dynamic> map) => i.fromMap<T>(map);
  static T fromIterable<T>(Iterable<dynamic> iterable) => i.fromIterable<T>(iterable);
  static T fromJson<T>(String json) => i.fromJson<T>(json);

  static dynamic toValue(dynamic value) => i.toValue(value);
  static Map<String, dynamic> toMap(dynamic object) => i.toMap(object);
  static Iterable<dynamic> toIterable(dynamic object) => i.toIterable(object);
  static String toJson(dynamic object) => i.toJson(object);

  static bool isEqual(dynamic value, Object? other) => i.isEqual(value, other);
  static int hash(dynamic value) => i.hash(value);
  static String asString(dynamic value) => i.asString(value);

  static void use<T>(BaseMapper<T> mapper) => i.use<T>(mapper);
  static BaseMapper<T>? unuse<T>() => i.unuse<T>();
  static void useAll(List<BaseMapper> mappers) => i.useAll(mappers);

  static BaseMapper<T>? get<T>([Type? type]) => i.get<T>(type);
  static List<BaseMapper> getAll() => i.getAll();
}

mixin Mappable implements MappableMixin {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override
  String toString() {
    return _guard(() => Mapper.asString(this), super.toString);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            _guard(() => Mapper.isEqual(this, other), () => super == other));
  }

  @override
  int get hashCode {
    return _guard(() => Mapper.hash(this), () => super.hashCode);
  }

  T _guard<T>(T Function() fn, T Function() fallback) {
    try {
      return fn();
    } on MapperException catch (e) {
      if (e.isUnsupportedOrUnallowed()) {
        return fallback();
      } else {
        rethrow;
      }
    }
  }
}
