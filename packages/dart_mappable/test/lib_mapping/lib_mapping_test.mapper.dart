// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'lib_mapping_test.dart';

class CakeMapper extends MapperBase<f.Cake> {
  static MapperContainer container = MapperContainer(
    mappers: {CakeMapper()},
    types: {'Cake': (f) => f<Cake>()},
  );

  @override
  CakeMapperElement createElement(MapperContainer container) {
    return CakeMapperElement._(this, container);
  }

  @override
  String get id => 'f.Cake';
  @override
  Type get implType => Cake;
  static final fromMap = container.fromMap<Cake>;
  static final fromJson = container.fromJson<Cake>;
}

class CakeMapperElement extends MapperElementBase<f.Cake> {
  CakeMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Cake decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Cake fromMap(Map<String, dynamic> map) => Cake(container.$get(map, 'type'));

  @override
  Function get encoder => encode;
  dynamic encode(f.Cake v) => toMap(v);
  Map<String, dynamic> toMap(f.Cake c) =>
      {'type': container.$enc(c.type, 'type')};

  @override
  String stringify(f.Cake self) => 'Cake()';
  @override
  int hash(f.Cake self) => 0;
  @override
  bool equals(f.Cake self, f.Cake other) => true;
}

mixin CakeMappable {
  String toJson() => CakeMapper.container.toJson(this as f.Cake);
  Map<String, dynamic> toMap() => CakeMapper.container.toMap(this as f.Cake);
  CakeCopyWith<f.Cake, f.Cake, f.Cake> get copyWith =>
      _CakeCopyWithImpl(this as f.Cake, $identity, $identity);
  @override
  String toString() => CakeMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          CakeMapper.container.isEqual(this, other));
  @override
  int get hashCode => CakeMapper.container.hash(this);
}

extension CakeValueCopy<$R, $Out extends f.Cake>
    on ObjectCopyWith<$R, f.Cake, $Out> {
  CakeCopyWith<$R, f.Cake, $Out> get asCake =>
      base.as((v, t, t2) => _CakeCopyWithImpl(v, t, t2));
}

typedef CakeCopyWithBound = f.Cake;

abstract class CakeCopyWith<$R, $In extends f.Cake, $Out extends f.Cake>
    implements ObjectCopyWith<$R, $In, $Out> {
  CakeCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends f.Cake>(
      Then<f.Cake, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? type});
}

class _CakeCopyWithImpl<$R, $Out extends f.Cake>
    extends CopyWithBase<$R, f.Cake, $Out>
    implements CakeCopyWith<$R, f.Cake, $Out> {
  _CakeCopyWithImpl(super.value, super.then, super.then2);
  @override
  CakeCopyWith<$R2, f.Cake, $Out2> chain<$R2, $Out2 extends f.Cake>(
          Then<f.Cake, $Out2> t, Then<$Out2, $R2> t2) =>
      _CakeCopyWithImpl($value, t, t2);

  @override
  $R call({String? type}) => $then(f.Cake(type ?? $value.type));
}

class Person2Mapper extends MapperBase<m.Person> {
  static MapperContainer container = MapperContainer(
    mappers: {Person2Mapper()},
    types: {'Person2': (f) => f<Person2>()},
  );

  @override
  Person2MapperElement createElement(MapperContainer container) {
    return Person2MapperElement._(this, container);
  }

  @override
  String get id => 'm.Person';
  @override
  Type get implType => Person2;
  static final fromMap = container.fromMap<Person2>;
  static final fromJson = container.fromJson<Person2>;
}

class Person2MapperElement extends MapperElementBase<m.Person> {
  Person2MapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Person2 decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Person2 fromMap(Map<String, dynamic> map) =>
      Person2(container.$get(map, 'first_name'));

  @override
  Function get encoder => encode;
  dynamic encode(m.Person v) => toMap(v);
  Map<String, dynamic> toMap(m.Person p) =>
      {'first_name': container.$enc(p.firstName, 'firstName')};

  @override
  String stringify(m.Person self) => 'Person2()';
  @override
  int hash(m.Person self) => 0;
  @override
  bool equals(m.Person self, m.Person other) => true;
}

mixin Person2Mappable {
  String toJson() => Person2Mapper.container.toJson(this as m.Person);
  Map<String, dynamic> toMap() =>
      Person2Mapper.container.toMap(this as m.Person);
  Person2CopyWith<m.Person, m.Person, m.Person> get copyWith =>
      _Person2CopyWithImpl(this as m.Person, $identity, $identity);
  @override
  String toString() => Person2Mapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          Person2Mapper.container.isEqual(this, other));
  @override
  int get hashCode => Person2Mapper.container.hash(this);
}

extension Person2ValueCopy<$R, $Out extends m.Person>
    on ObjectCopyWith<$R, m.Person, $Out> {
  Person2CopyWith<$R, m.Person, $Out> get asPerson2 =>
      base.as((v, t, t2) => _Person2CopyWithImpl(v, t, t2));
}

typedef Person2CopyWithBound = m.Person;

abstract class Person2CopyWith<$R, $In extends m.Person, $Out extends m.Person>
    implements ObjectCopyWith<$R, $In, $Out> {
  Person2CopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends m.Person>(
      Then<m.Person, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? firstName});
}

class _Person2CopyWithImpl<$R, $Out extends m.Person>
    extends CopyWithBase<$R, m.Person, $Out>
    implements Person2CopyWith<$R, m.Person, $Out> {
  _Person2CopyWithImpl(super.value, super.then, super.then2);
  @override
  Person2CopyWith<$R2, m.Person, $Out2> chain<$R2, $Out2 extends m.Person>(
          Then<m.Person, $Out2> t, Then<$Out2, $R2> t2) =>
      _Person2CopyWithImpl($value, t, t2);

  @override
  $R call({String? firstName}) =>
      $then(m.Person(firstName ?? $value.firstName));
}

class AnimalMapper extends MapperBase<o.Animal> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {AnimalMapper()},
        types: {'Animal': (f) => f<Animal>()},
      ))
        ..linkAll({PetMapper.container}));

  @override
  AnimalMapperElement createElement(MapperContainer container) {
    return AnimalMapperElement._(this, container);
  }

  @override
  String get id => 'o.Animal';
  @override
  Type get implType => Animal;
  static final fromMap = container.fromMap<Animal>;
  static final fromJson = container.fromJson<Animal>;
}

class AnimalMapperElement extends MapperElementBase<o.Animal> {
  AnimalMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Animal decode(dynamic v) => checkedType(v, (Map<String, dynamic> map) {
        switch (map['type']) {
          case 'Pet':
            return PetMapper().createElement(container).decode(map);
          default:
            return fromMap(map);
        }
      });
  Animal fromMap(Map<String, dynamic> map) =>
      throw MapperException.missingSubclass('Animal', 'type', '${map['type']}');

  @override
  Function get encoder => encode;
  dynamic encode(o.Animal v) => toMap(v);
  Map<String, dynamic> toMap(o.Animal a) =>
      {'color': container.$enc(a.color, 'color')};

  @override
  String stringify(o.Animal self) => 'Animal()';
  @override
  int hash(o.Animal self) => 0;
  @override
  bool equals(o.Animal self, o.Animal other) => true;
}

mixin AnimalMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AnimalCopyWith<o.Animal, o.Animal, o.Animal> get copyWith;
}

typedef AnimalCopyWithBound = o.Animal;

abstract class AnimalCopyWith<$R, $In extends o.Animal, $Out extends o.Animal>
    implements ObjectCopyWith<$R, $In, $Out> {
  AnimalCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends o.Animal>(
      Then<o.Animal, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? color});
}

class PetMapper extends MapperBase<o.Pet> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {PetMapper()},
        types: {'Pet': (f) => f<Pet>()},
      ))
        ..linkAll({AnimalMapper.container, Person2Mapper.container}));

  @override
  PetMapperElement createElement(MapperContainer container) {
    return PetMapperElement._(this, container);
  }

  @override
  String get id => 'o.Pet';
  @override
  Type get implType => Pet;
  static final fromMap = container.fromMap<Pet>;
  static final fromJson = container.fromJson<Pet>;
}

class PetMapperElement extends MapperElementBase<o.Pet> {
  PetMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Pet decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Pet fromMap(Map<String, dynamic> map) =>
      Pet(container.$get(map, 'owner'), container.$get(map, 'color'));

  @override
  Function get encoder => encode;
  dynamic encode(o.Pet v) => toMap(v);
  Map<String, dynamic> toMap(o.Pet p) => {
        'owner': container.$enc(p.owner, 'owner'),
        'color': container.$enc(p.color, 'color'),
        'type': 'Pet'
      };

  @override
  String stringify(o.Pet self) => 'Pet()';
  @override
  int hash(o.Pet self) => 0;
  @override
  bool equals(o.Pet self, o.Pet other) => true;
}

mixin PetMappable {
  String toJson() => PetMapper.container.toJson(this as o.Pet);
  Map<String, dynamic> toMap() => PetMapper.container.toMap(this as o.Pet);
  PetCopyWith<o.Pet, o.Pet, o.Pet> get copyWith =>
      _PetCopyWithImpl(this as o.Pet, $identity, $identity);
  @override
  String toString() => PetMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          PetMapper.container.isEqual(this, other));
  @override
  int get hashCode => PetMapper.container.hash(this);
}

extension PetValueCopy<$R, $Out extends o.Animal>
    on ObjectCopyWith<$R, o.Pet, $Out> {
  PetCopyWith<$R, o.Pet, $Out> get asPet =>
      base.as((v, t, t2) => _PetCopyWithImpl(v, t, t2));
}

typedef PetCopyWithBound = o.Animal;

abstract class PetCopyWith<$R, $In extends o.Pet, $Out extends o.Animal>
    implements AnimalCopyWith<$R, $In, $Out> {
  PetCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends o.Animal>(
      Then<o.Pet, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call({m.Person? owner, String? color});
}

class _PetCopyWithImpl<$R, $Out extends o.Animal>
    extends CopyWithBase<$R, o.Pet, $Out>
    implements PetCopyWith<$R, o.Pet, $Out> {
  _PetCopyWithImpl(super.value, super.then, super.then2);
  @override
  PetCopyWith<$R2, o.Pet, $Out2> chain<$R2, $Out2 extends o.Animal>(
          Then<o.Pet, $Out2> t, Then<$Out2, $R2> t2) =>
      _PetCopyWithImpl($value, t, t2);

  @override
  $R call({m.Person? owner, String? color}) =>
      $then(o.Pet(owner ?? $value.owner, color ?? $value.color));
}

class PersonMapper extends MapperBase<Person> {
  static MapperContainer container = MapperContainer(
    mappers: {PersonMapper()},
  );

  @override
  PersonMapperElement createElement(MapperContainer container) {
    return PersonMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<Person>;
  static final fromJson = container.fromJson<Person>;
}

class PersonMapperElement extends MapperElementBase<Person> {
  PersonMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Person decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Person fromMap(Map<String, dynamic> map) =>
      Person(container.$get(map, 'first_name'));

  @override
  Function get encoder => encode;
  dynamic encode(Person v) => toMap(v);
  Map<String, dynamic> toMap(Person p) =>
      {'first_name': container.$enc(p.firstName, 'firstName')};

  @override
  String stringify(Person self) =>
      'Person(firstName: ${container.asString(self.firstName)})';
  @override
  int hash(Person self) => container.hash(self.firstName);
  @override
  bool equals(Person self, Person other) =>
      container.isEqual(self.firstName, other.firstName);
}

mixin PersonMappable {
  String toJson() => PersonMapper.container.toJson(this as Person);
  Map<String, dynamic> toMap() => PersonMapper.container.toMap(this as Person);
  PersonCopyWith<Person, Person, Person> get copyWith =>
      _PersonCopyWithImpl(this as Person, $identity, $identity);
  @override
  String toString() => PersonMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          PersonMapper.container.isEqual(this, other));
  @override
  int get hashCode => PersonMapper.container.hash(this);
}

extension PersonValueCopy<$R, $Out extends Person>
    on ObjectCopyWith<$R, Person, $Out> {
  PersonCopyWith<$R, Person, $Out> get asPerson =>
      base.as((v, t, t2) => _PersonCopyWithImpl(v, t, t2));
}

typedef PersonCopyWithBound = Person;

abstract class PersonCopyWith<$R, $In extends Person, $Out extends Person>
    implements ObjectCopyWith<$R, $In, $Out> {
  PersonCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Person>(
      Then<Person, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? firstName});
}

class _PersonCopyWithImpl<$R, $Out extends Person>
    extends CopyWithBase<$R, Person, $Out>
    implements PersonCopyWith<$R, Person, $Out> {
  _PersonCopyWithImpl(super.value, super.then, super.then2);
  @override
  PersonCopyWith<$R2, Person, $Out2> chain<$R2, $Out2 extends Person>(
          Then<Person, $Out2> t, Then<$Out2, $R2> t2) =>
      _PersonCopyWithImpl($value, t, t2);

  @override
  $R call({String? firstName}) => $then(Person(firstName ?? $value.firstName));
}
