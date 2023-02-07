// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'lib_mapping_test.dart';

class CakeMapper extends ClassMapperBase<f.Cake> {
  CakeMapper._();
  static CakeMapper? _instance;
  static CakeMapper ensureInitialized() {
    if (_instance == null) {
      MapperBase.addType<Cake>();
      MapperContainer.globals.use(_instance = CakeMapper._());
    }
    return _instance!;
  }
  @override
  final String id = 'Cake';
  @override
  Type get implType => Cake;

  static String _$type(f.Cake v) => v.type;

  @override
  final Map<Symbol, Field<f.Cake, dynamic>> fields = const {
    #type: Field<f.Cake, String>('type', _$type),
  };

  static Cake _instantiate(DecodingData data) {
    return Cake(data.get(#type));
  }
  @override
  final Function instantiate = _instantiate;

  static Cake fromMap(Map<String, dynamic> map) {
    ensureInitialized();
    return MapperContainer.globals.fromMap<Cake>(map);
  }
  static Cake fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<Cake>(json);
  }
}

mixin CakeMappable {
  String toJson() {
    CakeMapper.ensureInitialized();
    return MapperContainer.globals.toJson(this as Cake);
  }
  Map<String, dynamic> toMap() {
    CakeMapper.ensureInitialized();
    return MapperContainer.globals.toMap(this as Cake);
  }
  CakeCopyWith<Cake, Cake, Cake> get copyWith => _CakeCopyWithImpl(this as Cake, $identity, $identity);
  @override
  String toString() {
    CakeMapper.ensureInitialized();
    return MapperContainer.globals.asString(this);
  }
  @override
  bool operator ==(Object other) {
    CakeMapper.ensureInitialized();
    return identical(this, other) || (runtimeType == other.runtimeType && MapperContainer.globals.isEqual(this, other));
  }
  @override
  int get hashCode {
    CakeMapper.ensureInitialized();
    return MapperContainer.globals.hash(this);
  }
}

extension CakeValueCopy<$R, $Out extends f.Cake> on ObjectCopyWith<$R, Cake, $Out> {
  CakeCopyWith<$R, Cake, $Out> get asCake => base.as((v, t, t2) => _CakeCopyWithImpl(v, t, t2));
}

typedef CakeCopyWithBound = f.Cake;
abstract class CakeCopyWith<$R, $In extends Cake, $Out extends f.Cake> implements ObjectCopyWith<$R, $In, $Out> {
  CakeCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends f.Cake>(Then<Cake, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? type});
}

class _CakeCopyWithImpl<$R, $Out extends f.Cake> extends CopyWithBase<$R, Cake, $Out> implements CakeCopyWith<$R, Cake, $Out> {
  _CakeCopyWithImpl(super.value, super.then, super.then2);
  @override CakeCopyWith<$R2, Cake, $Out2> chain<$R2, $Out2 extends f.Cake>(Then<Cake, $Out2> t, Then<$Out2, $R2> t2) => _CakeCopyWithImpl($value, t, t2);

  @override $R call({String? type}) => $then(Cake(type ?? $value.type));
}

class Person2Mapper extends ClassMapperBase<m.Person> {
  Person2Mapper._();
  static Person2Mapper? _instance;
  static Person2Mapper ensureInitialized() {
    if (_instance == null) {
      MapperBase.addType<Person2>();
      MapperContainer.globals.use(_instance = Person2Mapper._());
    }
    return _instance!;
  }
  @override
  final String id = 'Person2';
  @override
  Type get implType => Person2;

  static String _$firstName(m.Person v) => v.firstName;

  @override
  final Map<Symbol, Field<m.Person, dynamic>> fields = const {
    #firstName: Field<m.Person, String>('firstName', _$firstName, key: 'first_name'),
  };

  static Person2 _instantiate(DecodingData data) {
    return Person2(data.get(#firstName));
  }
  @override
  final Function instantiate = _instantiate;

  static Person2 fromMap(Map<String, dynamic> map) {
    ensureInitialized();
    return MapperContainer.globals.fromMap<Person2>(map);
  }
  static Person2 fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<Person2>(json);
  }
}

mixin Person2Mappable {
  String toJson() {
    Person2Mapper.ensureInitialized();
    return MapperContainer.globals.toJson(this as Person2);
  }
  Map<String, dynamic> toMap() {
    Person2Mapper.ensureInitialized();
    return MapperContainer.globals.toMap(this as Person2);
  }
  Person2CopyWith<Person2, Person2, Person2> get copyWith => _Person2CopyWithImpl(this as Person2, $identity, $identity);
  @override
  String toString() {
    Person2Mapper.ensureInitialized();
    return MapperContainer.globals.asString(this);
  }
  @override
  bool operator ==(Object other) {
    Person2Mapper.ensureInitialized();
    return identical(this, other) || (runtimeType == other.runtimeType && MapperContainer.globals.isEqual(this, other));
  }
  @override
  int get hashCode {
    Person2Mapper.ensureInitialized();
    return MapperContainer.globals.hash(this);
  }
}

extension Person2ValueCopy<$R, $Out extends m.Person> on ObjectCopyWith<$R, Person2, $Out> {
  Person2CopyWith<$R, Person2, $Out> get asPerson2 => base.as((v, t, t2) => _Person2CopyWithImpl(v, t, t2));
}

typedef Person2CopyWithBound = m.Person;
abstract class Person2CopyWith<$R, $In extends Person2, $Out extends m.Person> implements ObjectCopyWith<$R, $In, $Out> {
  Person2CopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends m.Person>(Then<Person2, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? firstName});
}

class _Person2CopyWithImpl<$R, $Out extends m.Person> extends CopyWithBase<$R, Person2, $Out> implements Person2CopyWith<$R, Person2, $Out> {
  _Person2CopyWithImpl(super.value, super.then, super.then2);
  @override Person2CopyWith<$R2, Person2, $Out2> chain<$R2, $Out2 extends m.Person>(Then<Person2, $Out2> t, Then<$Out2, $R2> t2) => _Person2CopyWithImpl($value, t, t2);

  @override $R call({String? firstName}) => $then(Person2(firstName ?? $value.firstName));
}

class AnimalMapper extends ClassMapperBase<o.Animal> {
  AnimalMapper._();
  static AnimalMapper? _instance;
  static AnimalMapper ensureInitialized() {
    if (_instance == null) {
      MapperBase.addType<Animal>();
      MapperContainer.globals.use(_instance = AnimalMapper._());
      PetMapper.ensureInitialized();
    }
    return _instance!;
  }
  @override
  final String id = 'Animal';
  @override
  Type get implType => Animal;

  static String _$color(o.Animal v) => v.color;

  @override
  final Map<Symbol, Field<o.Animal, dynamic>> fields = const {
    #color: Field<o.Animal, String>('color', _$color),
  };

  static Animal _instantiate(DecodingData data) {
    throw MapperException.missingSubclass('Animal', 'type', '${data.value['type']}');
  }
  @override
  final Function instantiate = _instantiate;

  static Animal fromMap(Map<String, dynamic> map) {
    ensureInitialized();
    return MapperContainer.globals.fromMap<Animal>(map);
  }
  static Animal fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<Animal>(json);
  }
}

mixin AnimalMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AnimalCopyWith<Animal, Animal, Animal> get copyWith;
}

typedef AnimalCopyWithBound = o.Animal;
abstract class AnimalCopyWith<$R, $In extends Animal, $Out extends o.Animal> implements ObjectCopyWith<$R, $In, $Out> {
  AnimalCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends o.Animal>(Then<Animal, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? color});
}


class PetMapper extends DiscriminatorSubClassMapperBase<o.Pet> {
  PetMapper._();
  static PetMapper? _instance;
  static PetMapper ensureInitialized() {
    if (_instance == null) {
      MapperBase.addType<Pet>();
      MapperContainer.globals.use(_instance = PetMapper._());
      AnimalMapper.ensureInitialized().addSubMapper(_instance!);
      Person2Mapper.ensureInitialized();
    }
    return _instance!;
  }
  @override
  final String id = 'Pet';
  @override
  Type get implType => Pet;

  static m.Person _$owner(o.Pet v) => v.owner;
  static String _$color(o.Pet v) => v.color;

  @override
  final Map<Symbol, Field<o.Pet, dynamic>> fields = const {
    #owner: Field<o.Pet, m.Person>('owner', _$owner),
    #color: Field<o.Pet, String>('color', _$color),
  };

  @override
  final String discriminatorKey = 'type';
  final dynamic discriminatorValue = 'Pet';

  static Pet _instantiate(DecodingData data) {
    return Pet(data.get(#owner), data.get(#color));
  }
  @override
  final Function instantiate = _instantiate;

  static Pet fromMap(Map<String, dynamic> map) {
    ensureInitialized();
    return MapperContainer.globals.fromMap<Pet>(map);
  }
  static Pet fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<Pet>(json);
  }
}

mixin PetMappable {
  String toJson() {
    PetMapper.ensureInitialized();
    return MapperContainer.globals.toJson(this as Pet);
  }
  Map<String, dynamic> toMap() {
    PetMapper.ensureInitialized();
    return MapperContainer.globals.toMap(this as Pet);
  }
  PetCopyWith<Pet, Pet, Pet> get copyWith => _PetCopyWithImpl(this as Pet, $identity, $identity);
  @override
  String toString() {
    PetMapper.ensureInitialized();
    return MapperContainer.globals.asString(this);
  }
  @override
  bool operator ==(Object other) {
    PetMapper.ensureInitialized();
    return identical(this, other) || (runtimeType == other.runtimeType && MapperContainer.globals.isEqual(this, other));
  }
  @override
  int get hashCode {
    PetMapper.ensureInitialized();
    return MapperContainer.globals.hash(this);
  }
}

extension PetValueCopy<$R, $Out extends o.Animal> on ObjectCopyWith<$R, Pet, $Out> {
  PetCopyWith<$R, Pet, $Out> get asPet => base.as((v, t, t2) => _PetCopyWithImpl(v, t, t2));
}

typedef PetCopyWithBound = o.Animal;
abstract class PetCopyWith<$R, $In extends Pet, $Out extends o.Animal> implements AnimalCopyWith<$R, $In, $Out> {
  PetCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends o.Animal>(Then<Pet, $Out2> t, Then<$Out2, $R2> t2);
  @override $R call({m.Person? owner, String? color});
}

class _PetCopyWithImpl<$R, $Out extends o.Animal> extends CopyWithBase<$R, Pet, $Out> implements PetCopyWith<$R, Pet, $Out> {
  _PetCopyWithImpl(super.value, super.then, super.then2);
  @override PetCopyWith<$R2, Pet, $Out2> chain<$R2, $Out2 extends o.Animal>(Then<Pet, $Out2> t, Then<$Out2, $R2> t2) => _PetCopyWithImpl($value, t, t2);

  @override $R call({m.Person? owner, String? color}) => $then(Pet(owner ?? $value.owner, color ?? $value.color));
}

class PersonMapper extends ClassMapperBase<Person> {
  PersonMapper._();
  static PersonMapper? _instance;
  static PersonMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PersonMapper._());
    }
    return _instance!;
  }
  @override
  final String id = 'Person';

  static String _$firstName(Person v) => v.firstName;

  @override
  final Map<Symbol, Field<Person, dynamic>> fields = const {
    #firstName: Field<Person, String>('firstName', _$firstName, key: 'first_name'),
  };

  static Person _instantiate(DecodingData data) {
    return Person(data.get(#firstName));
  }
  @override
  final Function instantiate = _instantiate;

  static Person fromMap(Map<String, dynamic> map) {
    ensureInitialized();
    return MapperContainer.globals.fromMap<Person>(map);
  }
  static Person fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<Person>(json);
  }
}

mixin PersonMappable {
  String toJson() {
    PersonMapper.ensureInitialized();
    return MapperContainer.globals.toJson(this as Person);
  }
  Map<String, dynamic> toMap() {
    PersonMapper.ensureInitialized();
    return MapperContainer.globals.toMap(this as Person);
  }
  PersonCopyWith<Person, Person, Person> get copyWith => _PersonCopyWithImpl(this as Person, $identity, $identity);
  @override
  String toString() {
    PersonMapper.ensureInitialized();
    return MapperContainer.globals.asString(this);
  }
  @override
  bool operator ==(Object other) {
    PersonMapper.ensureInitialized();
    return identical(this, other) || (runtimeType == other.runtimeType && MapperContainer.globals.isEqual(this, other));
  }
  @override
  int get hashCode {
    PersonMapper.ensureInitialized();
    return MapperContainer.globals.hash(this);
  }
}

extension PersonValueCopy<$R, $Out extends Person> on ObjectCopyWith<$R, Person, $Out> {
  PersonCopyWith<$R, Person, $Out> get asPerson => base.as((v, t, t2) => _PersonCopyWithImpl(v, t, t2));
}

typedef PersonCopyWithBound = Person;
abstract class PersonCopyWith<$R, $In extends Person, $Out extends Person> implements ObjectCopyWith<$R, $In, $Out> {
  PersonCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Person>(Then<Person, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? firstName});
}

class _PersonCopyWithImpl<$R, $Out extends Person> extends CopyWithBase<$R, Person, $Out> implements PersonCopyWith<$R, Person, $Out> {
  _PersonCopyWithImpl(super.value, super.then, super.then2);
  @override PersonCopyWith<$R2, Person, $Out2> chain<$R2, $Out2 extends Person>(Then<Person, $Out2> t, Then<$Out2, $R2> t2) => _PersonCopyWithImpl($value, t, t2);

  @override $R call({String? firstName}) => $then(Person(firstName ?? $value.firstName));
}
