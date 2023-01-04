// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'polymorphism_test.dart';

class AnimalMapper extends MapperBase<Animal> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {AnimalMapper()},
      ))
        ..linkAll({
          CatMapper.container,
          DogMapper.container,
          NullAnimalMapper.container,
          DefaultAnimalMapper.container,
        }));

  @override
  AnimalMapperElement createElement(MapperContainer container) {
    return AnimalMapperElement._(this, container);
  }

  @override
  String get id => 'Animal';

  static final fromMap = container.fromMap<Animal>;
  static final fromJson = container.fromJson<Animal>;
}

class AnimalMapperElement extends MapperElementBase<Animal> {
  AnimalMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Animal decode(dynamic v) => checkedType(v, (Map<String, dynamic> map) {
        switch (map['type']) {
          case 'Cat':
            return CatMapper().createElement(container).decode(map);
          case 1:
            return DogMapper().createElement(container).decode(map);
          case null:
            return NullAnimalMapper().createElement(container).decode(map);
          default:
            return DefaultAnimalMapper().createElement(container).decode(map);
        }
      });
  Animal fromMap(Map<String, dynamic> map) =>
      throw MapperException.missingSubclass('Animal', 'type', '${map['type']}');

  @override
  Function get encoder => encode;
  dynamic encode(Animal v) => toMap(v);
  Map<String, dynamic> toMap(Animal a) =>
      {'name': container.$enc(a.name, 'name')};

  @override
  String stringify(Animal self) =>
      'Animal(name: ${container.asString(self.name)})';
  @override
  int hash(Animal self) => container.hash(self.name);
  @override
  bool equals(Animal self, Animal other) =>
      container.isEqual(self.name, other.name);
}

mixin AnimalMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AnimalCopyWith<Animal, Animal, Animal> get copyWith;
}

typedef AnimalCopyWithBound = Animal;

abstract class AnimalCopyWith<$R, $In extends Animal, $Out extends Animal>
    implements ObjectCopyWith<$R, $In, $Out> {
  AnimalCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Animal>(
      Then<Animal, $Out2> t, Then<$Out2, $R2> t2);
  $R call();
}

class CatMapper extends MapperBase<Cat> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {CatMapper()},
      ))
        ..linkAll({AnimalMapper.container}));

  @override
  CatMapperElement createElement(MapperContainer container) {
    return CatMapperElement._(this, container);
  }

  @override
  String get id => 'Cat';

  static final fromMap = container.fromMap<Cat>;
  static final fromJson = container.fromJson<Cat>;
}

class CatMapperElement extends MapperElementBase<Cat> {
  CatMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Cat decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Cat fromMap(Map<String, dynamic> map) =>
      Cat(container.$get(map, 'name'), container.$get(map, 'color'));

  @override
  Function get encoder => encode;
  dynamic encode(Cat v) => toMap(v);
  Map<String, dynamic> toMap(Cat c) => {
        'name': container.$enc(c.name, 'name'),
        'color': container.$enc(c.color, 'color'),
        'type': 'Cat'
      };

  @override
  String stringify(Cat self) =>
      'Cat(name: ${container.asString(self.name)}, color: ${container.asString(self.color)})';
  @override
  int hash(Cat self) => container.hash(self.name) ^ container.hash(self.color);
  @override
  bool equals(Cat self, Cat other) =>
      container.isEqual(self.name, other.name) &&
      container.isEqual(self.color, other.color);
}

mixin CatMappable {
  String toJson() => CatMapper.container.toJson(this as Cat);
  Map<String, dynamic> toMap() => CatMapper.container.toMap(this as Cat);
  CatCopyWith<Cat, Cat, Cat> get copyWith =>
      _CatCopyWithImpl(this as Cat, $identity, $identity);
  @override
  String toString() => CatMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          CatMapper.container.isEqual(this, other));
  @override
  int get hashCode => CatMapper.container.hash(this);
}

extension CatValueCopy<$R, $Out extends Animal>
    on ObjectCopyWith<$R, Cat, $Out> {
  CatCopyWith<$R, Cat, $Out> get asCat =>
      base.as((v, t, t2) => _CatCopyWithImpl(v, t, t2));
}

typedef CatCopyWithBound = Animal;

abstract class CatCopyWith<$R, $In extends Cat, $Out extends Animal>
    implements AnimalCopyWith<$R, $In, $Out> {
  CatCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Animal>(
      Then<Cat, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call({String? name, String? color});
}

class _CatCopyWithImpl<$R, $Out extends Animal>
    extends CopyWithBase<$R, Cat, $Out> implements CatCopyWith<$R, Cat, $Out> {
  _CatCopyWithImpl(super.value, super.then, super.then2);
  @override
  CatCopyWith<$R2, Cat, $Out2> chain<$R2, $Out2 extends Animal>(
          Then<Cat, $Out2> t, Then<$Out2, $R2> t2) =>
      _CatCopyWithImpl($value, t, t2);

  @override
  $R call({String? name, String? color}) =>
      $then(Cat(name ?? $value.name, color ?? $value.color));
}

class DogMapper extends MapperBase<Dog> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {DogMapper()},
      ))
        ..linkAll({AnimalMapper.container}));

  @override
  DogMapperElement createElement(MapperContainer container) {
    return DogMapperElement._(this, container);
  }

  @override
  String get id => 'Dog';

  static final fromMap = container.fromMap<Dog>;
  static final fromJson = container.fromJson<Dog>;
}

class DogMapperElement extends MapperElementBase<Dog> {
  DogMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Dog decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Dog fromMap(Map<String, dynamic> map) => Dog(container.$get(map, 'age'));

  @override
  Function get encoder => encode;
  dynamic encode(Dog v) => toMap(v);
  Map<String, dynamic> toMap(Dog d) =>
      {'age': container.$enc(d.age, 'age'), 'type': 1};

  @override
  String stringify(Dog self) =>
      'Dog(name: ${container.asString(self.name)}, age: ${container.asString(self.age)})';
  @override
  int hash(Dog self) => container.hash(self.name) ^ container.hash(self.age);
  @override
  bool equals(Dog self, Dog other) =>
      container.isEqual(self.name, other.name) &&
      container.isEqual(self.age, other.age);
}

mixin DogMappable {
  String toJson() => DogMapper.container.toJson(this as Dog);
  Map<String, dynamic> toMap() => DogMapper.container.toMap(this as Dog);
  DogCopyWith<Dog, Dog, Dog> get copyWith =>
      _DogCopyWithImpl(this as Dog, $identity, $identity);
  @override
  String toString() => DogMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          DogMapper.container.isEqual(this, other));
  @override
  int get hashCode => DogMapper.container.hash(this);
}

extension DogValueCopy<$R, $Out extends Animal>
    on ObjectCopyWith<$R, Dog, $Out> {
  DogCopyWith<$R, Dog, $Out> get asDog =>
      base.as((v, t, t2) => _DogCopyWithImpl(v, t, t2));
}

typedef DogCopyWithBound = Animal;

abstract class DogCopyWith<$R, $In extends Dog, $Out extends Animal>
    implements AnimalCopyWith<$R, $In, $Out> {
  DogCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Animal>(
      Then<Dog, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call({int? age});
}

class _DogCopyWithImpl<$R, $Out extends Animal>
    extends CopyWithBase<$R, Dog, $Out> implements DogCopyWith<$R, Dog, $Out> {
  _DogCopyWithImpl(super.value, super.then, super.then2);
  @override
  DogCopyWith<$R2, Dog, $Out2> chain<$R2, $Out2 extends Animal>(
          Then<Dog, $Out2> t, Then<$Out2, $R2> t2) =>
      _DogCopyWithImpl($value, t, t2);

  @override
  $R call({int? age}) => $then(Dog(age ?? $value.age));
}

class NullAnimalMapper extends MapperBase<NullAnimal> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {NullAnimalMapper()},
      ))
        ..linkAll({AnimalMapper.container}));

  @override
  NullAnimalMapperElement createElement(MapperContainer container) {
    return NullAnimalMapperElement._(this, container);
  }

  @override
  String get id => 'NullAnimal';

  static final fromMap = container.fromMap<NullAnimal>;
  static final fromJson = container.fromJson<NullAnimal>;
}

class NullAnimalMapperElement extends MapperElementBase<NullAnimal> {
  NullAnimalMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  NullAnimal decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  NullAnimal fromMap(Map<String, dynamic> map) =>
      NullAnimal(container.$get(map, 'name'));

  @override
  Function get encoder => encode;
  dynamic encode(NullAnimal v) => toMap(v);
  Map<String, dynamic> toMap(NullAnimal n) =>
      {'name': container.$enc(n.name, 'name'), 'type': null};

  @override
  String stringify(NullAnimal self) =>
      'NullAnimal(name: ${container.asString(self.name)})';
  @override
  int hash(NullAnimal self) => container.hash(self.name);
  @override
  bool equals(NullAnimal self, NullAnimal other) =>
      container.isEqual(self.name, other.name);
}

mixin NullAnimalMappable {
  String toJson() => NullAnimalMapper.container.toJson(this as NullAnimal);
  Map<String, dynamic> toMap() =>
      NullAnimalMapper.container.toMap(this as NullAnimal);
  NullAnimalCopyWith<NullAnimal, NullAnimal, NullAnimal> get copyWith =>
      _NullAnimalCopyWithImpl(this as NullAnimal, $identity, $identity);
  @override
  String toString() => NullAnimalMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          NullAnimalMapper.container.isEqual(this, other));
  @override
  int get hashCode => NullAnimalMapper.container.hash(this);
}

extension NullAnimalValueCopy<$R, $Out extends Animal>
    on ObjectCopyWith<$R, NullAnimal, $Out> {
  NullAnimalCopyWith<$R, NullAnimal, $Out> get asNullAnimal =>
      base.as((v, t, t2) => _NullAnimalCopyWithImpl(v, t, t2));
}

typedef NullAnimalCopyWithBound = Animal;

abstract class NullAnimalCopyWith<$R, $In extends NullAnimal,
    $Out extends Animal> implements AnimalCopyWith<$R, $In, $Out> {
  NullAnimalCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Animal>(
      Then<NullAnimal, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call({String? name});
}

class _NullAnimalCopyWithImpl<$R, $Out extends Animal>
    extends CopyWithBase<$R, NullAnimal, $Out>
    implements NullAnimalCopyWith<$R, NullAnimal, $Out> {
  _NullAnimalCopyWithImpl(super.value, super.then, super.then2);
  @override
  NullAnimalCopyWith<$R2, NullAnimal, $Out2> chain<$R2, $Out2 extends Animal>(
          Then<NullAnimal, $Out2> t, Then<$Out2, $R2> t2) =>
      _NullAnimalCopyWithImpl($value, t, t2);

  @override
  $R call({String? name}) => $then(NullAnimal(name ?? $value.name));
}

class DefaultAnimalMapper extends MapperBase<DefaultAnimal> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {DefaultAnimalMapper()},
      ))
        ..linkAll({AnimalMapper.container}));

  @override
  DefaultAnimalMapperElement createElement(MapperContainer container) {
    return DefaultAnimalMapperElement._(this, container);
  }

  @override
  String get id => 'DefaultAnimal';

  static final fromMap = container.fromMap<DefaultAnimal>;
  static final fromJson = container.fromJson<DefaultAnimal>;
}

class DefaultAnimalMapperElement extends MapperElementBase<DefaultAnimal> {
  DefaultAnimalMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  DefaultAnimal decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  DefaultAnimal fromMap(Map<String, dynamic> map) =>
      DefaultAnimal(container.$get(map, 'name'), container.$get(map, 'type'));

  @override
  Function get encoder => encode;
  dynamic encode(DefaultAnimal v) => toMap(v);
  Map<String, dynamic> toMap(DefaultAnimal d) => {
        'name': container.$enc(d.name, 'name'),
        'type': container.$enc(d.type, 'type')
      };

  @override
  String stringify(DefaultAnimal self) =>
      'DefaultAnimal(name: ${container.asString(self.name)}, type: ${container.asString(self.type)})';
  @override
  int hash(DefaultAnimal self) =>
      container.hash(self.name) ^ container.hash(self.type);
  @override
  bool equals(DefaultAnimal self, DefaultAnimal other) =>
      container.isEqual(self.name, other.name) &&
      container.isEqual(self.type, other.type);
}

mixin DefaultAnimalMappable {
  String toJson() =>
      DefaultAnimalMapper.container.toJson(this as DefaultAnimal);
  Map<String, dynamic> toMap() =>
      DefaultAnimalMapper.container.toMap(this as DefaultAnimal);
  DefaultAnimalCopyWith<DefaultAnimal, DefaultAnimal, DefaultAnimal>
      get copyWith => _DefaultAnimalCopyWithImpl(
          this as DefaultAnimal, $identity, $identity);
  @override
  String toString() => DefaultAnimalMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          DefaultAnimalMapper.container.isEqual(this, other));
  @override
  int get hashCode => DefaultAnimalMapper.container.hash(this);
}

extension DefaultAnimalValueCopy<$R, $Out extends Animal>
    on ObjectCopyWith<$R, DefaultAnimal, $Out> {
  DefaultAnimalCopyWith<$R, DefaultAnimal, $Out> get asDefaultAnimal =>
      base.as((v, t, t2) => _DefaultAnimalCopyWithImpl(v, t, t2));
}

typedef DefaultAnimalCopyWithBound = Animal;

abstract class DefaultAnimalCopyWith<$R, $In extends DefaultAnimal,
    $Out extends Animal> implements AnimalCopyWith<$R, $In, $Out> {
  DefaultAnimalCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Animal>(
      Then<DefaultAnimal, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call({String? name, String? type});
}

class _DefaultAnimalCopyWithImpl<$R, $Out extends Animal>
    extends CopyWithBase<$R, DefaultAnimal, $Out>
    implements DefaultAnimalCopyWith<$R, DefaultAnimal, $Out> {
  _DefaultAnimalCopyWithImpl(super.value, super.then, super.then2);
  @override
  DefaultAnimalCopyWith<$R2, DefaultAnimal, $Out2>
      chain<$R2, $Out2 extends Animal>(
              Then<DefaultAnimal, $Out2> t, Then<$Out2, $R2> t2) =>
          _DefaultAnimalCopyWithImpl($value, t, t2);

  @override
  $R call({String? name, String? type}) =>
      $then(DefaultAnimal(name ?? $value.name, type ?? $value.type));
}

class ZooMapper extends MapperBase<Zoo> {
  static MapperContainer container = MapperContainer(
    mappers: {ZooMapper()},
  )..linkAll({AnimalMapper.container});

  @override
  ZooMapperElement createElement(MapperContainer container) {
    return ZooMapperElement._(this, container);
  }

  @override
  String get id => 'Zoo';

  static final fromMap = container.fromMap<Zoo>;
  static final fromJson = container.fromJson<Zoo>;
}

class ZooMapperElement extends MapperElementBase<Zoo> {
  ZooMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Zoo decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Zoo fromMap(Map<String, dynamic> map) => Zoo(container.$get(map, 'animal'),
      container.$get(map, 'animals'), container.$get(map, 'animals2'));

  @override
  Function get encoder => encode;
  dynamic encode(Zoo v) => toMap(v);
  Map<String, dynamic> toMap(Zoo z) => {
        'animal': container.$enc(z.animal, 'animal'),
        'animals': container.$enc(z.animals, 'animals'),
        'animals2': container.$enc(z.animals2, 'animals2')
      };

  @override
  String stringify(Zoo self) =>
      'Zoo(animal: ${container.asString(self.animal)}, animals: ${container.asString(self.animals)}, animals2: ${container.asString(self.animals2)})';
  @override
  int hash(Zoo self) =>
      container.hash(self.animal) ^
      container.hash(self.animals) ^
      container.hash(self.animals2);
  @override
  bool equals(Zoo self, Zoo other) =>
      container.isEqual(self.animal, other.animal) &&
      container.isEqual(self.animals, other.animals) &&
      container.isEqual(self.animals2, other.animals2);
}

mixin ZooMappable {
  String toJson() => ZooMapper.container.toJson(this as Zoo);
  Map<String, dynamic> toMap() => ZooMapper.container.toMap(this as Zoo);
  ZooCopyWith<Zoo, Zoo, Zoo> get copyWith =>
      _ZooCopyWithImpl(this as Zoo, $identity, $identity);
  @override
  String toString() => ZooMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          ZooMapper.container.isEqual(this, other));
  @override
  int get hashCode => ZooMapper.container.hash(this);
}

extension ZooValueCopy<$R, $Out extends Zoo> on ObjectCopyWith<$R, Zoo, $Out> {
  ZooCopyWith<$R, Zoo, $Out> get asZoo =>
      base.as((v, t, t2) => _ZooCopyWithImpl(v, t, t2));
}

typedef ZooCopyWithBound = Zoo;

abstract class ZooCopyWith<$R, $In extends Zoo, $Out extends Zoo>
    implements ObjectCopyWith<$R, $In, $Out> {
  ZooCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Zoo>(
      Then<Zoo, $Out2> t, Then<$Out2, $R2> t2);
  AnimalCopyWith<$R, Animal, Animal> get animal;
  ListCopyWith<$R, Animal, AnimalCopyWith<$R, Animal, Animal>> get animals;
  MapCopyWith<$R, String, Animal, AnimalCopyWith<$R, Animal, Animal>>
      get animals2;
  $R call(
      {Animal? animal, List<Animal>? animals, Map<String, Animal>? animals2});
}

class _ZooCopyWithImpl<$R, $Out extends Zoo> extends CopyWithBase<$R, Zoo, $Out>
    implements ZooCopyWith<$R, Zoo, $Out> {
  _ZooCopyWithImpl(super.value, super.then, super.then2);
  @override
  ZooCopyWith<$R2, Zoo, $Out2> chain<$R2, $Out2 extends Zoo>(
          Then<Zoo, $Out2> t, Then<$Out2, $R2> t2) =>
      _ZooCopyWithImpl($value, t, t2);

  @override
  AnimalCopyWith<$R, Animal, Animal> get animal =>
      $value.animal.copyWith.chain($identity, (v) => call(animal: v));
  @override
  ListCopyWith<$R, Animal, AnimalCopyWith<$R, Animal, Animal>> get animals =>
      ListCopyWith(
          $value.animals,
          (v, t) => v.copyWith.chain<$R, Animal>($identity, t),
          (v) => call(animals: v));
  @override
  MapCopyWith<$R, String, Animal, AnimalCopyWith<$R, Animal, Animal>>
      get animals2 => MapCopyWith(
          $value.animals2,
          (v, t) => v.copyWith.chain<$R, Animal>($identity, t),
          (v) => call(animals2: v));
  @override
  $R call(
          {Animal? animal,
          List<Animal>? animals,
          Map<String, Animal>? animals2}) =>
      $then(Zoo(animal ?? $value.animal, animals ?? $value.animals,
          animals2 ?? $value.animals2));
}
