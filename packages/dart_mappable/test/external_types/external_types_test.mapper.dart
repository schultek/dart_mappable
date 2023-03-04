// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'external_types_test.dart';

class PersonMapper extends ClassMapperBase<Person> {
  PersonMapper._();
  static PersonMapper? _instance;
  static PersonMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PersonMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Person';

  static String _$firstName(Person v) => v.firstName;

  @override
  final Map<Symbol, Field<Person, dynamic>> fields = const {
    #firstName:
        Field<Person, String>('firstName', _$firstName, key: 'first_name'),
  };

  static Person _instantiate(DecodingData data) {
    return Person(data.get(#firstName));
  }

  @override
  final Function instantiate = _instantiate;

  static Person fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Person>(map));
  }

  static Person fromJson(String json) {
    return _guard((c) => c.fromJson<Person>(json));
  }
}

mixin PersonMappable {
  String toJson() {
    return PersonMapper._guard((c) => c.toJson(this as Person));
  }

  Map<String, dynamic> toMap() {
    return PersonMapper._guard((c) => c.toMap(this as Person));
  }

  PersonCopyWith<Person, Person, Person> get copyWith =>
      _PersonCopyWithImpl(this as Person, $identity, $identity);
  @override
  String toString() {
    return PersonMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PersonMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return PersonMapper._guard((c) => c.hash(this));
  }
}

extension PersonValueCopy<$R, $Out extends Person>
    on ObjectCopyWith<$R, Person, $Out> {
  PersonCopyWith<$R, Person, $Out> get $asPerson =>
      $base.as((v, t, t2) => _PersonCopyWithImpl(v, t, t2));
}

typedef PersonCopyWithBound = Person;

abstract class PersonCopyWith<$R, $In extends Person, $Out extends Person>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? firstName});
  PersonCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Person>(
      Then<Person, $Out2> t, Then<$Out2, $R2> t2);
}

class _PersonCopyWithImpl<$R, $Out extends Person>
    extends ClassCopyWithBase<$R, Person, $Out>
    implements PersonCopyWith<$R, Person, $Out> {
  _PersonCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Person> $mapper = PersonMapper.ensureInitialized();
  @override
  $R call({String? firstName}) =>
      $apply(FieldCopyWithData({if (firstName != null) #firstName: firstName}));
  @override
  Person $make(CopyWithData data) =>
      Person(data.get(#firstName, or: $value.firstName));

  @override
  PersonCopyWith<$R2, Person, $Out2> $chain<$R2, $Out2 extends Person>(
          Then<Person, $Out2> t, Then<$Out2, $R2> t2) =>
      _PersonCopyWithImpl($value, t, t2);
}

class CakeMapper extends ClassMapperBase<f.Cake> {
  CakeMapper._();
  static CakeMapper? _instance;
  static CakeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CakeMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Cake';

  static String _$type(f.Cake v) => v.type;

  @override
  final Map<Symbol, Field<f.Cake, dynamic>> fields = const {
    #type: Field<f.Cake, String>('type', _$type),
  };

  static f.Cake _instantiate(DecodingData data) {
    return f.Cake(data.get(#type));
  }

  @override
  final Function instantiate = _instantiate;

  static f.Cake fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<f.Cake>(map));
  }

  static f.Cake fromJson(String json) {
    return _guard((c) => c.fromJson<f.Cake>(json));
  }
}

extension CakeMapperExtension on f.Cake {
  String toJson() {
    return CakeMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return CakeMapper._guard((c) => c.toMap(this));
  }

  CakeCopyWith<f.Cake, f.Cake, f.Cake> get copyWith =>
      _CakeCopyWithImpl(this, $identity, $identity);
}

extension CakeValueCopy<$R, $Out extends f.Cake>
    on ObjectCopyWith<$R, f.Cake, $Out> {
  CakeCopyWith<$R, f.Cake, $Out> get $asCake =>
      $base.as((v, t, t2) => _CakeCopyWithImpl(v, t, t2));
}

typedef CakeCopyWithBound = f.Cake;

abstract class CakeCopyWith<$R, $In extends f.Cake, $Out extends f.Cake>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? type});
  CakeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends f.Cake>(
      Then<f.Cake, $Out2> t, Then<$Out2, $R2> t2);
}

class _CakeCopyWithImpl<$R, $Out extends f.Cake>
    extends ClassCopyWithBase<$R, f.Cake, $Out>
    implements CakeCopyWith<$R, f.Cake, $Out> {
  _CakeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<f.Cake> $mapper = CakeMapper.ensureInitialized();
  @override
  $R call({String? type}) =>
      $apply(FieldCopyWithData({if (type != null) #type: type}));
  @override
  f.Cake $make(CopyWithData data) => f.Cake(data.get(#type, or: $value.type));

  @override
  CakeCopyWith<$R2, f.Cake, $Out2> $chain<$R2, $Out2 extends f.Cake>(
          Then<f.Cake, $Out2> t, Then<$Out2, $R2> t2) =>
      _CakeCopyWithImpl($value, t, t2);
}

class Person2Mapper extends ClassMapperBase<m.Person> {
  Person2Mapper._();
  static Person2Mapper? _instance;
  static Person2Mapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = Person2Mapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Person';

  static String _$firstName(m.Person v) => v.firstName;

  @override
  final Map<Symbol, Field<m.Person, dynamic>> fields = const {
    #firstName:
        Field<m.Person, String>('firstName', _$firstName, key: 'first_name'),
  };

  static m.Person _instantiate(DecodingData data) {
    return m.Person(data.get(#firstName));
  }

  @override
  final Function instantiate = _instantiate;

  static m.Person fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<m.Person>(map));
  }

  static m.Person fromJson(String json) {
    return _guard((c) => c.fromJson<m.Person>(json));
  }
}

extension Person2MapperExtension on m.Person {
  String toJson() {
    return Person2Mapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return Person2Mapper._guard((c) => c.toMap(this));
  }

  Person2CopyWith<m.Person, m.Person, m.Person> get copyWith =>
      _Person2CopyWithImpl(this, $identity, $identity);
}

extension Person2ValueCopy<$R, $Out extends m.Person>
    on ObjectCopyWith<$R, m.Person, $Out> {
  Person2CopyWith<$R, m.Person, $Out> get $asPerson =>
      $base.as((v, t, t2) => _Person2CopyWithImpl(v, t, t2));
}

typedef Person2CopyWithBound = m.Person;

abstract class Person2CopyWith<$R, $In extends m.Person, $Out extends m.Person>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? firstName});
  Person2CopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends m.Person>(
      Then<m.Person, $Out2> t, Then<$Out2, $R2> t2);
}

class _Person2CopyWithImpl<$R, $Out extends m.Person>
    extends ClassCopyWithBase<$R, m.Person, $Out>
    implements Person2CopyWith<$R, m.Person, $Out> {
  _Person2CopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<m.Person> $mapper =
      Person2Mapper.ensureInitialized();
  @override
  $R call({String? firstName}) =>
      $apply(FieldCopyWithData({if (firstName != null) #firstName: firstName}));
  @override
  m.Person $make(CopyWithData data) =>
      m.Person(data.get(#firstName, or: $value.firstName));

  @override
  Person2CopyWith<$R2, m.Person, $Out2> $chain<$R2, $Out2 extends m.Person>(
          Then<m.Person, $Out2> t, Then<$Out2, $R2> t2) =>
      _Person2CopyWithImpl($value, t, t2);
}

class AnimalMapper extends ClassMapperBase<o.Animal> {
  AnimalMapper._();
  static AnimalMapper? _instance;
  static AnimalMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AnimalMapper._());
      PetMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Animal';

  static String _$color(o.Animal v) => v.color;

  @override
  final Map<Symbol, Field<o.Animal, dynamic>> fields = const {
    #color: Field<o.Animal, String>('color', _$color),
  };

  static o.Animal _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'Animal', 'type', '${data.value.get('type')}');
  }

  @override
  final Function instantiate = _instantiate;

  static o.Animal fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<o.Animal>(map));
  }

  static o.Animal fromJson(String json) {
    return _guard((c) => c.fromJson<o.Animal>(json));
  }
}

extension AnimalMapperExtension on o.Animal {
  String toJson() {
    return AnimalMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return AnimalMapper._guard((c) => c.toMap(this));
  }
}

typedef AnimalCopyWithBound = o.Animal;

abstract class AnimalCopyWith<$R, $In extends o.Animal, $Out extends o.Animal>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? color});
  AnimalCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends o.Animal>(
      Then<o.Animal, $Out2> t, Then<$Out2, $R2> t2);
}

class PetMapper extends SubClassMapperBase<o.Pet> {
  PetMapper._();
  static PetMapper? _instance;
  static PetMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PetMapper._());
      Person2Mapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Pet';

  static m.Person _$owner(o.Pet v) => v.owner;
  static String _$color(o.Pet v) => v.color;

  @override
  final Map<Symbol, Field<o.Pet, dynamic>> fields = const {
    #owner: Field<o.Pet, m.Person>('owner', _$owner),
    #color: Field<o.Pet, String>('color', _$color),
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'Pet';
  @override
  final ClassMapperBase superMapper = AnimalMapper.ensureInitialized();

  static o.Pet _instantiate(DecodingData data) {
    return o.Pet(data.get(#owner), data.get(#color));
  }

  @override
  final Function instantiate = _instantiate;

  static o.Pet fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<o.Pet>(map));
  }

  static o.Pet fromJson(String json) {
    return _guard((c) => c.fromJson<o.Pet>(json));
  }
}

extension PetMapperExtension on o.Pet {
  String toJson() {
    return PetMapper._guard((c) => c.toJson(this));
  }

  Map<String, dynamic> toMap() {
    return PetMapper._guard((c) => c.toMap(this));
  }

  PetCopyWith<o.Pet, o.Pet, o.Pet> get copyWith =>
      _PetCopyWithImpl(this, $identity, $identity);
}

extension PetValueCopy<$R, $Out extends o.Animal>
    on ObjectCopyWith<$R, o.Pet, $Out> {
  PetCopyWith<$R, o.Pet, $Out> get $asPet =>
      $base.as((v, t, t2) => _PetCopyWithImpl(v, t, t2));
}

typedef PetCopyWithBound = o.Animal;

abstract class PetCopyWith<$R, $In extends o.Pet, $Out extends o.Animal>
    implements AnimalCopyWith<$R, $In, $Out> {
  Person2CopyWith<$R, m.Person, m.Person> get owner;
  @override
  $R call({m.Person? owner, String? color});
  PetCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends o.Animal>(
      Then<o.Pet, $Out2> t, Then<$Out2, $R2> t2);
}

class _PetCopyWithImpl<$R, $Out extends o.Animal>
    extends ClassCopyWithBase<$R, o.Pet, $Out>
    implements PetCopyWith<$R, o.Pet, $Out> {
  _PetCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<o.Pet> $mapper = PetMapper.ensureInitialized();
  @override
  Person2CopyWith<$R, m.Person, m.Person> get owner =>
      $value.owner.copyWith.$chain($identity, (v) => call(owner: v));
  @override
  $R call({m.Person? owner, String? color}) => $apply(FieldCopyWithData(
      {if (owner != null) #owner: owner, if (color != null) #color: color}));
  @override
  o.Pet $make(CopyWithData data) => o.Pet(
      data.get(#owner, or: $value.owner), data.get(#color, or: $value.color));

  @override
  PetCopyWith<$R2, o.Pet, $Out2> $chain<$R2, $Out2 extends o.Animal>(
          Then<o.Pet, $Out2> t, Then<$Out2, $R2> t2) =>
      _PetCopyWithImpl($value, t, t2);
}
