// ignore_for_file: unused_element
import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'polymorphism_test.dart' as p0;


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <MapperElementBase>{
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

class AnimalMapper extends MapperElementBase<p0.Animal> {
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

  @override Function get encoder => encode;
  dynamic encode(p0.Animal v) => toMap(v);
  Map<String, dynamic> toMap(p0.Animal a) => {'name': Mapper.i.$enc(a.name, 'name')};

  @override String stringify(p0.Animal self) => 'Animal(name: ${Mapper.asString(self.name)})';
  @override int hash(p0.Animal self) => Mapper.hash(self.name);
  @override bool equals(p0.Animal self, p0.Animal other) => Mapper.isEqual(self.name, other.name);

  @override Function get typeFactory => (f) => f<p0.Animal>();
}

mixin AnimalMappable implements MappableMixin {
  String toJson();
  Map<String, dynamic> toMap();
  AnimalCopyWith<p0.Animal, p0.Animal, p0.Animal> get copyWith;
}

abstract class AnimalCopyWith<$R, $In extends p0.Animal, $Out extends p0.Animal> implements ObjectCopyWith<$R, $In, $Out> {
  AnimalCopyWith<$R2, $In, $Out2> _chain<$R2, $Out2 extends p0.Animal>(Then<p0.Animal, $Out2> t, Then<$Out2, $R2> t2);
  $R call();
}


class CatMapper extends MapperElementBase<p0.Cat> {
  CatMapper._();

  @override Function get decoder => decode;
  p0.Cat decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Cat fromMap(Map<String, dynamic> map) => p0.Cat(Mapper.i.$get(map, 'name'), Mapper.i.$get(map, 'color'));

  @override Function get encoder => encode;
  dynamic encode(p0.Cat v) => toMap(v);
  Map<String, dynamic> toMap(p0.Cat c) => {'name': Mapper.i.$enc(c.name, 'name'), 'color': Mapper.i.$enc(c.color, 'color'), 'type': 'Cat'};

  @override String stringify(p0.Cat self) => 'Cat(name: ${Mapper.asString(self.name)}, color: ${Mapper.asString(self.color)})';
  @override int hash(p0.Cat self) => Mapper.hash(self.name) ^ Mapper.hash(self.color);
  @override bool equals(p0.Cat self, p0.Cat other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.color, other.color);

  @override Function get typeFactory => (f) => f<p0.Cat>();
}

mixin CatMappable implements MappableMixin {
  String toJson() => Mapper.toJson(this as p0.Cat);
  Map<String, dynamic> toMap() => Mapper.toMap(this as p0.Cat);
  CatCopyWith<p0.Cat, p0.Cat> get copyWith => _CatCopyWithImpl(this as p0.Cat, $identity, $identity);
  @override String toString() => Mapper.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && Mapper.isEqual(this, other));
  @override int get hashCode => Mapper.hash(this);
}

extension CatObjectCopy<$R, $Out extends p0.Animal> on ObjectCopyWith<$R, p0.Cat, $Out> {
  CatCopyWith<$R, $Out> get asCat => base.as((v, t, t2) => _CatCopyWithImpl(v, t, t2));
}

abstract class CatCopyWith<$R, $Out extends p0.Animal> implements AnimalCopyWith<$R, p0.Cat, $Out> {
  CatCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p0.Animal>(Then<p0.Cat, $Out2> t, Then<$Out2, $R2> t2);
  @override $R call({String? name, String? color});
}

class _CatCopyWithImpl<$R, $Out extends p0.Animal> extends BaseCopyWith<$R, p0.Cat, $Out> implements CatCopyWith<$R, $Out> {
  _CatCopyWithImpl(super.value, super.then, super.then2);
  @override CatCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p0.Animal>(Then<p0.Cat, $Out2> t, Then<$Out2, $R2> t2) => _CatCopyWithImpl($value, t, t2);

  @override $R call({String? name, String? color}) => $then(p0.Cat(name ?? $value.name, color ?? $value.color));
}

class DogMapper extends MapperElementBase<p0.Dog> {
  DogMapper._();

  @override Function get decoder => decode;
  p0.Dog decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Dog fromMap(Map<String, dynamic> map) => p0.Dog(Mapper.i.$get(map, 'age'));

  @override Function get encoder => encode;
  dynamic encode(p0.Dog v) => toMap(v);
  Map<String, dynamic> toMap(p0.Dog d) => {'age': Mapper.i.$enc(d.age, 'age'), 'type': 1};

  @override String stringify(p0.Dog self) => 'Dog(name: ${Mapper.asString(self.name)}, age: ${Mapper.asString(self.age)})';
  @override int hash(p0.Dog self) => Mapper.hash(self.name) ^ Mapper.hash(self.age);
  @override bool equals(p0.Dog self, p0.Dog other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.age, other.age);

  @override Function get typeFactory => (f) => f<p0.Dog>();
}

mixin DogMappable implements MappableMixin {
  String toJson() => Mapper.toJson(this as p0.Dog);
  Map<String, dynamic> toMap() => Mapper.toMap(this as p0.Dog);
  DogCopyWith<p0.Dog, p0.Dog> get copyWith => _DogCopyWithImpl(this as p0.Dog, $identity, $identity);
  @override String toString() => Mapper.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && Mapper.isEqual(this, other));
  @override int get hashCode => Mapper.hash(this);
}

extension DogObjectCopy<$R, $Out extends p0.Animal> on ObjectCopyWith<$R, p0.Dog, $Out> {
  DogCopyWith<$R, $Out> get asDog => base.as((v, t, t2) => _DogCopyWithImpl(v, t, t2));
}

abstract class DogCopyWith<$R, $Out extends p0.Animal> implements AnimalCopyWith<$R, p0.Dog, $Out> {
  DogCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p0.Animal>(Then<p0.Dog, $Out2> t, Then<$Out2, $R2> t2);
  @override $R call({int? age});
}

class _DogCopyWithImpl<$R, $Out extends p0.Animal> extends BaseCopyWith<$R, p0.Dog, $Out> implements DogCopyWith<$R, $Out> {
  _DogCopyWithImpl(super.value, super.then, super.then2);
  @override DogCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p0.Animal>(Then<p0.Dog, $Out2> t, Then<$Out2, $R2> t2) => _DogCopyWithImpl($value, t, t2);

  @override $R call({int? age}) => $then(p0.Dog(age ?? $value.age));
}

class NullAnimalMapper extends MapperElementBase<p0.NullAnimal> {
  NullAnimalMapper._();

  @override Function get decoder => decode;
  p0.NullAnimal decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.NullAnimal fromMap(Map<String, dynamic> map) => p0.NullAnimal(Mapper.i.$get(map, 'name'));

  @override Function get encoder => encode;
  dynamic encode(p0.NullAnimal v) => toMap(v);
  Map<String, dynamic> toMap(p0.NullAnimal n) => {'name': Mapper.i.$enc(n.name, 'name'), 'type': null};

  @override String stringify(p0.NullAnimal self) => 'NullAnimal(name: ${Mapper.asString(self.name)})';
  @override int hash(p0.NullAnimal self) => Mapper.hash(self.name);
  @override bool equals(p0.NullAnimal self, p0.NullAnimal other) => Mapper.isEqual(self.name, other.name);

  @override Function get typeFactory => (f) => f<p0.NullAnimal>();
}

mixin NullAnimalMappable implements MappableMixin {
  String toJson() => Mapper.toJson(this as p0.NullAnimal);
  Map<String, dynamic> toMap() => Mapper.toMap(this as p0.NullAnimal);
  NullAnimalCopyWith<p0.NullAnimal, p0.NullAnimal> get copyWith => _NullAnimalCopyWithImpl(this as p0.NullAnimal, $identity, $identity);
  @override String toString() => Mapper.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && Mapper.isEqual(this, other));
  @override int get hashCode => Mapper.hash(this);
}

extension NullAnimalObjectCopy<$R, $Out extends p0.Animal> on ObjectCopyWith<$R, p0.NullAnimal, $Out> {
  NullAnimalCopyWith<$R, $Out> get asNullAnimal => base.as((v, t, t2) => _NullAnimalCopyWithImpl(v, t, t2));
}

abstract class NullAnimalCopyWith<$R, $Out extends p0.Animal> implements AnimalCopyWith<$R, p0.NullAnimal, $Out> {
  NullAnimalCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p0.Animal>(Then<p0.NullAnimal, $Out2> t, Then<$Out2, $R2> t2);
  @override $R call({String? name});
}

class _NullAnimalCopyWithImpl<$R, $Out extends p0.Animal> extends BaseCopyWith<$R, p0.NullAnimal, $Out> implements NullAnimalCopyWith<$R, $Out> {
  _NullAnimalCopyWithImpl(super.value, super.then, super.then2);
  @override NullAnimalCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p0.Animal>(Then<p0.NullAnimal, $Out2> t, Then<$Out2, $R2> t2) => _NullAnimalCopyWithImpl($value, t, t2);

  @override $R call({String? name}) => $then(p0.NullAnimal(name ?? $value.name));
}

class DefaultAnimalMapper extends MapperElementBase<p0.DefaultAnimal> {
  DefaultAnimalMapper._();

  @override Function get decoder => decode;
  p0.DefaultAnimal decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.DefaultAnimal fromMap(Map<String, dynamic> map) => p0.DefaultAnimal(Mapper.i.$get(map, 'name'), Mapper.i.$get(map, 'type'));

  @override Function get encoder => encode;
  dynamic encode(p0.DefaultAnimal v) => toMap(v);
  Map<String, dynamic> toMap(p0.DefaultAnimal d) => {'name': Mapper.i.$enc(d.name, 'name'), 'type': Mapper.i.$enc(d.type, 'type')};

  @override String stringify(p0.DefaultAnimal self) => 'DefaultAnimal(name: ${Mapper.asString(self.name)}, type: ${Mapper.asString(self.type)})';
  @override int hash(p0.DefaultAnimal self) => Mapper.hash(self.name) ^ Mapper.hash(self.type);
  @override bool equals(p0.DefaultAnimal self, p0.DefaultAnimal other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.type, other.type);

  @override Function get typeFactory => (f) => f<p0.DefaultAnimal>();
}

mixin DefaultAnimalMappable implements MappableMixin {
  String toJson() => Mapper.toJson(this as p0.DefaultAnimal);
  Map<String, dynamic> toMap() => Mapper.toMap(this as p0.DefaultAnimal);
  DefaultAnimalCopyWith<p0.DefaultAnimal, p0.DefaultAnimal> get copyWith => _DefaultAnimalCopyWithImpl(this as p0.DefaultAnimal, $identity, $identity);
  @override String toString() => Mapper.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && Mapper.isEqual(this, other));
  @override int get hashCode => Mapper.hash(this);
}

extension DefaultAnimalObjectCopy<$R, $Out extends p0.Animal> on ObjectCopyWith<$R, p0.DefaultAnimal, $Out> {
  DefaultAnimalCopyWith<$R, $Out> get asDefaultAnimal => base.as((v, t, t2) => _DefaultAnimalCopyWithImpl(v, t, t2));
}

abstract class DefaultAnimalCopyWith<$R, $Out extends p0.Animal> implements AnimalCopyWith<$R, p0.DefaultAnimal, $Out> {
  DefaultAnimalCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p0.Animal>(Then<p0.DefaultAnimal, $Out2> t, Then<$Out2, $R2> t2);
  @override $R call({String? name, String? type});
}

class _DefaultAnimalCopyWithImpl<$R, $Out extends p0.Animal> extends BaseCopyWith<$R, p0.DefaultAnimal, $Out> implements DefaultAnimalCopyWith<$R, $Out> {
  _DefaultAnimalCopyWithImpl(super.value, super.then, super.then2);
  @override DefaultAnimalCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p0.Animal>(Then<p0.DefaultAnimal, $Out2> t, Then<$Out2, $R2> t2) => _DefaultAnimalCopyWithImpl($value, t, t2);

  @override $R call({String? name, String? type}) => $then(p0.DefaultAnimal(name ?? $value.name, type ?? $value.type));
}

class ZooMapper extends MapperElementBase<p0.Zoo> {
  ZooMapper._();

  @override Function get decoder => decode;
  p0.Zoo decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Zoo fromMap(Map<String, dynamic> map) => p0.Zoo(Mapper.i.$get(map, 'animal'), Mapper.i.$get(map, 'animals'), Mapper.i.$get(map, 'animals2'));

  @override Function get encoder => encode;
  dynamic encode(p0.Zoo v) => toMap(v);
  Map<String, dynamic> toMap(p0.Zoo z) => {'animal': Mapper.i.$enc(z.animal, 'animal'), 'animals': Mapper.i.$enc(z.animals, 'animals'), 'animals2': Mapper.i.$enc(z.animals2, 'animals2')};

  @override String stringify(p0.Zoo self) => 'Zoo(animal: ${Mapper.asString(self.animal)}, animals: ${Mapper.asString(self.animals)}, animals2: ${Mapper.asString(self.animals2)})';
  @override int hash(p0.Zoo self) => Mapper.hash(self.animal) ^ Mapper.hash(self.animals) ^ Mapper.hash(self.animals2);
  @override bool equals(p0.Zoo self, p0.Zoo other) => Mapper.isEqual(self.animal, other.animal) && Mapper.isEqual(self.animals, other.animals) && Mapper.isEqual(self.animals2, other.animals2);

  @override Function get typeFactory => (f) => f<p0.Zoo>();
}

mixin ZooMappable implements MappableMixin {
  String toJson() => Mapper.toJson(this as p0.Zoo);
  Map<String, dynamic> toMap() => Mapper.toMap(this as p0.Zoo);
  ZooCopyWith<p0.Zoo> get copyWith => _ZooCopyWithImpl(this as p0.Zoo, $identity, $identity);
  @override String toString() => Mapper.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && Mapper.isEqual(this, other));
  @override int get hashCode => Mapper.hash(this);
}

extension ZooObjectCopy<$R> on ObjectCopyWith<$R, p0.Zoo, p0.Zoo> {
  ZooCopyWith<$R> get asZoo => base.as((v, t, t2) => _ZooCopyWithImpl(v, t, t2));
}

abstract class ZooCopyWith<$R> implements ObjectCopyWith<$R, p0.Zoo, p0.Zoo> {
  ZooCopyWith<$R2> _chain<$R2>(Then<p0.Zoo, p0.Zoo> t, Then<p0.Zoo, $R2> t2);
  AnimalCopyWith<$R, p0.Animal, p0.Animal> get animal;
  ListCopyWith<$R, p0.Animal, AnimalCopyWith<$R, p0.Animal, p0.Animal>> get animals;
  MapCopyWith<$R, String, p0.Animal, AnimalCopyWith<$R, p0.Animal, p0.Animal>> get animals2;
  $R call({p0.Animal? animal, List<p0.Animal>? animals, Map<String, p0.Animal>? animals2});
}

class _ZooCopyWithImpl<$R> extends BaseCopyWith<$R, p0.Zoo, p0.Zoo> implements ZooCopyWith<$R> {
  _ZooCopyWithImpl(super.value, super.then, super.then2);
  @override ZooCopyWith<$R2> _chain<$R2>(Then<p0.Zoo, p0.Zoo> t, Then<p0.Zoo, $R2> t2) => _ZooCopyWithImpl($value, t, t2);

  @override AnimalCopyWith<$R, p0.Animal, p0.Animal> get animal => $value.animal.copyWith._chain($identity, (v) => call(animal: v));
  @override ListCopyWith<$R, p0.Animal, AnimalCopyWith<$R, p0.Animal, p0.Animal>> get animals => ListCopyWith($value.animals, (v, t) => v.copyWith._chain($identity, t), (v) => call(animals: v));
  @override MapCopyWith<$R, String, p0.Animal, AnimalCopyWith<$R, p0.Animal, p0.Animal>> get animals2 => MapCopyWith($value.animals2, (v, t) => v.copyWith._chain($identity, t), (v) => call(animals2: v));
  @override $R call({p0.Animal? animal, List<p0.Animal>? animals, Map<String, p0.Animal>? animals2}) => $then(p0.Zoo(animal ?? $value.animal, animals ?? $value.animals, animals2 ?? $value.animals2));
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

  static dynamic toValue<T>(T value) => i.toValue<T>(value);
  static Map<String, dynamic> toMap<T>(T object) => i.toMap<T>(object);
  static Iterable<dynamic> toIterable<T>(T object) => i.toIterable<T>(object);
  static String toJson<T>(T object) => i.toJson<T>(object);

  static bool isEqual(dynamic value, Object? other) => i.isEqual(value, other);
  static int hash(dynamic value) => i.hash(value);
  static String asString(dynamic value) => i.asString(value);

  static void use<T>(MapperElementBase<T> mapper) => i.use<T>(mapper);
  static MapperElementBase<T>? unuse<T>() => i.unuse<T>();
  static void useAll(List<MapperElementBase> mappers) => i.useAll(mappers);

  static MapperElementBase<T>? get<T>([Type? type]) => i.get<T>(type);
  static List<MapperElementBase> getAll() => i.getAll();
}

extension _ChainedCopyWith<Result, In, Out> on ObjectCopyWith<Result, In, Out> {
  BaseCopyWith<Result, In, Out> get base => this as BaseCopyWith<Result, In, Out>;
}
