// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'package:v2_test/models/animal.dart';

// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class AnimalMapper with MapperBase<Animal> {
  static MapperContainer container = MapperContainer(
    mappers: {AnimalMapper()},
    join: {
      DogMapper.container,
      CatMapper.container,
    },
  );

  @override
  AnimalMapperElement createElement(MapperContainer container) {
    return AnimalMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<Animal>;
  static final fromJson = container.fromJson<Animal>;
}

class AnimalMapperElement extends MapperElementBase<Animal> {
  AnimalMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  Animal decode(dynamic v) => checked(v, (Map<String, dynamic> map) {
    switch(map['type']) {
      case 'Cat': return CatMapper().createElement(container).decode(map);
      case 1: return DogMapper().createElement(container).decode(map);
      default: return fromMap(map);
    }
  });
  Animal fromMap(Map<String, dynamic> map) => throw MapperException.missingSubclass('Animal', 'type', '${map['type']}');

  @override Function get encoder => encode;
  dynamic encode(Animal v) => toMap(v);
  Map<String, dynamic> toMap(Animal a) => {'name': container.$enc(a.name, 'name')};

  @override String stringify(Animal self) => 'Animal(name: ${container.asString(self.name)})';
  @override int hash(Animal self) => container.hash(self.name);
  @override bool equals(Animal self, Animal other) => container.isEqual(self.name, other.name);
}

mixin AnimalMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AnimalCopyWith<Animal, Animal, Animal> get copyWith;
}

abstract class AnimalCopyWith<$R, $In extends Animal, $Out extends Animal> implements ObjectCopyWith<$R, $In, $Out> {
  AnimalCopyWith<$R2, $In, $Out2> _chain<$R2, $Out2 extends Animal>(Then<Animal, $Out2> t, Then<$Out2, $R2> t2);
  $R call();
}


class DogMapper with MapperBase<Dog> {
  static MapperContainer container = MapperContainer(
    mappers: {DogMapper()},
    join: {PersonMapper.container},
  );

  @override
  DogMapperElement createElement(MapperContainer container) {
    return DogMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<Dog>;
  static final fromJson = container.fromJson<Dog>;
}

class DogMapperElement extends MapperElementBase<Dog> {
  DogMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  Dog decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Dog fromMap(Map<String, dynamic> map) => Dog(container.$get(map, 'age'), container.$get(map, 'owner'));

  @override Function get encoder => encode;
  dynamic encode(Dog v) => toMap(v);
  Map<String, dynamic> toMap(Dog d) => {'age': container.$enc(d.age, 'age'), 'owner': container.$enc(d.owner, 'owner'), 'type': 1};

  @override String stringify(Dog self) => 'Dog(name: ${container.asString(self.name)}, age: ${container.asString(self.age)}, owner: ${container.asString(self.owner)})';
  @override int hash(Dog self) => container.hash(self.name) ^ container.hash(self.age) ^ container.hash(self.owner);
  @override bool equals(Dog self, Dog other) => container.isEqual(self.name, other.name) && container.isEqual(self.age, other.age) && container.isEqual(self.owner, other.owner);
}

mixin DogMappable {
  String toJson() => DogMapper.container.toJson(this as Dog);
  Map<String, dynamic> toMap() => DogMapper.container.toMap(this as Dog);
  DogCopyWith<Dog, Dog> get copyWith => _DogCopyWithImpl(this as Dog, $identity, $identity);
  @override String toString() => DogMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && DogMapper.container.isEqual(this, other));
  @override int get hashCode => DogMapper.container.hash(this);
}

extension DogObjectCopy<$R, $Out extends Animal> on ObjectCopyWith<$R, Dog, $Out> {
  DogCopyWith<$R, $Out> get asDog => base.as((v, t, t2) => _DogCopyWithImpl(v, t, t2));
}

abstract class DogCopyWith<$R, $Out extends Animal> implements AnimalCopyWith<$R, Dog, $Out> {
  DogCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends Animal>(Then<Dog, $Out2> t, Then<$Out2, $R2> t2);
  @override $R call({int? age, Person? owner});
}

class _DogCopyWithImpl<$R, $Out extends Animal> extends BaseCopyWith<$R, Dog, $Out> implements DogCopyWith<$R, $Out> {
  _DogCopyWithImpl(super.value, super.then, super.then2);
  @override DogCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends Animal>(Then<Dog, $Out2> t, Then<$Out2, $R2> t2) => _DogCopyWithImpl($value, t, t2);

  @override $R call({int? age, Person? owner}) => $then(Dog(age ?? $value.age, owner ?? $value.owner));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===


