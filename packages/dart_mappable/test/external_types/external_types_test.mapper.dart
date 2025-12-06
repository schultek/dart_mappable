// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

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

  @override
  final String id = 'Person';

  static String _$firstName(Person v) => v.firstName;
  static const Field<Person, String> _f$firstName = Field(
    'firstName',
    _$firstName,
    key: r'first_name',
  );

  @override
  final MappableFields<Person> fields = const {#firstName: _f$firstName};

  static Person _instantiate(DecodingData data) {
    return Person(data.dec(_f$firstName));
  }

  @override
  final Function instantiate = _instantiate;

  static Person fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Person>(map);
  }

  static Person fromJson(String json) {
    return ensureInitialized().decodeJson<Person>(json);
  }
}

mixin PersonMappable {
  String toJson() {
    return PersonMapper.ensureInitialized().encodeJson<Person>(this as Person);
  }

  Map<String, dynamic> toMap() {
    return PersonMapper.ensureInitialized().encodeMap<Person>(this as Person);
  }

  PersonCopyWith<Person, Person, Person> get copyWith =>
      _PersonCopyWithImpl<Person, Person>(this as Person, $identity, $identity);
  @override
  String toString() {
    return PersonMapper.ensureInitialized().stringifyValue(this as Person);
  }

  @override
  bool operator ==(Object other) {
    return PersonMapper.ensureInitialized().equalsValue(this as Person, other);
  }

  @override
  int get hashCode {
    return PersonMapper.ensureInitialized().hashValue(this as Person);
  }
}

extension PersonValueCopy<$R, $Out> on ObjectCopyWith<$R, Person, $Out> {
  PersonCopyWith<$R, Person, $Out> get $asPerson =>
      $base.as((v, t, t2) => _PersonCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PersonCopyWith<$R, $In extends Person, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? firstName});
  PersonCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PersonCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Person, $Out>
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
  PersonCopyWith<$R2, Person, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PersonCopyWithImpl<$R2, $Out2>($value, $cast, t);
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

  @override
  final String id = 'Cake';

  static String _$type(f.Cake v) => v.type;
  static const Field<f.Cake, String> _f$type = Field('type', _$type);

  @override
  final MappableFields<f.Cake> fields = const {#type: _f$type};

  static f.Cake _instantiate(DecodingData data) {
    return f.Cake(data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static f.Cake fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<f.Cake>(map);
  }

  static f.Cake fromJson(String json) {
    return ensureInitialized().decodeJson<f.Cake>(json);
  }
}

extension CakeMapperExtension on f.Cake {
  String toJson() {
    return CakeMapper.ensureInitialized().encodeJson<f.Cake>(this);
  }

  Map<String, dynamic> toMap() {
    return CakeMapper.ensureInitialized().encodeMap<f.Cake>(this);
  }

  CakeCopyWith<f.Cake, f.Cake, f.Cake> get copyWith =>
      _CakeCopyWithImpl(this, $identity, $identity);
}

extension CakeValueCopy<$R, $Out> on ObjectCopyWith<$R, f.Cake, $Out> {
  CakeCopyWith<$R, f.Cake, $Out> get $asCake =>
      $base.as((v, t, t2) => _CakeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CakeCopyWith<$R, $In extends f.Cake, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? type});
  CakeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CakeCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, f.Cake, $Out>
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
  CakeCopyWith<$R2, f.Cake, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CakeCopyWithImpl<$R2, $Out2>($value, $cast, t);
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

  @override
  final String id = 'Person';

  static String _$firstName(m.Person v) => v.firstName;
  static const Field<m.Person, String> _f$firstName = Field(
    'firstName',
    _$firstName,
    key: r'first_name',
  );

  @override
  final MappableFields<m.Person> fields = const {#firstName: _f$firstName};

  static m.Person _instantiate(DecodingData data) {
    return m.Person(data.dec(_f$firstName));
  }

  @override
  final Function instantiate = _instantiate;

  static m.Person fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<m.Person>(map);
  }

  static m.Person fromJson(String json) {
    return ensureInitialized().decodeJson<m.Person>(json);
  }
}

extension Person2MapperExtension on m.Person {
  String toJson() {
    return Person2Mapper.ensureInitialized().encodeJson<m.Person>(this);
  }

  Map<String, dynamic> toMap() {
    return Person2Mapper.ensureInitialized().encodeMap<m.Person>(this);
  }

  Person2CopyWith<m.Person, m.Person, m.Person> get copyWith =>
      _Person2CopyWithImpl(this, $identity, $identity);
}

extension Person2ValueCopy<$R, $Out> on ObjectCopyWith<$R, m.Person, $Out> {
  Person2CopyWith<$R, m.Person, $Out> get $asPerson =>
      $base.as((v, t, t2) => _Person2CopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class Person2CopyWith<$R, $In extends m.Person, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? firstName});
  Person2CopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _Person2CopyWithImpl<$R, $Out>
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
  Person2CopyWith<$R2, m.Person, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _Person2CopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AnimalMapper extends ClassMapperBase<o.Animal> {
  AnimalMapper._();

  static AnimalMapper? _instance;
  static AnimalMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AnimalMapper._());
      PetMapper.ensureInitialized();
      ColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Animal';

  static String _$name(o.Animal v) => v.name;
  static const Field<o.Animal, String> _f$name = Field('name', _$name);
  static c.Color _$color(o.Animal v) => v.color;
  static const Field<o.Animal, c.Color> _f$color = Field('color', _$color);

  @override
  final MappableFields<o.Animal> fields = const {
    #name: _f$name,
    #color: _f$color,
  };

  static o.Animal _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
      'Animal',
      'type',
      '${data.value['type']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static o.Animal fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<o.Animal>(map);
  }

  static o.Animal fromJson(String json) {
    return ensureInitialized().decodeJson<o.Animal>(json);
  }
}

extension AnimalMapperExtension on o.Animal {
  String toJson() {
    return AnimalMapper.ensureInitialized().encodeJson<o.Animal>(this);
  }

  Map<String, dynamic> toMap() {
    return AnimalMapper.ensureInitialized().encodeMap<o.Animal>(this);
  }
}

abstract class AnimalCopyWith<$R, $In extends o.Animal, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, c.Color? color});
  AnimalCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class PetMapper extends SubClassMapperBase<o.Pet> {
  PetMapper._();

  static PetMapper? _instance;
  static PetMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PetMapper._());
      AnimalMapper.ensureInitialized().addSubMapper(_instance!);
      Person2Mapper.ensureInitialized();
      ColorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Pet';

  static m.Person _$owner(o.Pet v) => v.owner;
  static const Field<o.Pet, m.Person> _f$owner = Field('owner', _$owner);
  static String _$name(o.Pet v) => v.name;
  static const Field<o.Pet, String> _f$name = Field('name', _$name);
  static c.Color _$color(o.Pet v) => v.color;
  static const Field<o.Pet, c.Color> _f$color = Field('color', _$color);

  @override
  final MappableFields<o.Pet> fields = const {
    #owner: _f$owner,
    #name: _f$name,
    #color: _f$color,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'Pet';
  @override
  late final ClassMapperBase superMapper = AnimalMapper.ensureInitialized();

  static o.Pet _instantiate(DecodingData data) {
    return o.Pet(data.dec(_f$owner), data.dec(_f$name), data.dec(_f$color));
  }

  @override
  final Function instantiate = _instantiate;

  static o.Pet fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<o.Pet>(map);
  }

  static o.Pet fromJson(String json) {
    return ensureInitialized().decodeJson<o.Pet>(json);
  }
}

extension PetMapperExtension on o.Pet {
  String toJson() {
    return PetMapper.ensureInitialized().encodeJson<o.Pet>(this);
  }

  Map<String, dynamic> toMap() {
    return PetMapper.ensureInitialized().encodeMap<o.Pet>(this);
  }

  PetCopyWith<o.Pet, o.Pet, o.Pet> get copyWith =>
      _PetCopyWithImpl(this, $identity, $identity);
}

extension PetValueCopy<$R, $Out> on ObjectCopyWith<$R, o.Pet, $Out> {
  PetCopyWith<$R, o.Pet, $Out> get $asPet =>
      $base.as((v, t, t2) => _PetCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PetCopyWith<$R, $In extends o.Pet, $Out>
    implements AnimalCopyWith<$R, $In, $Out> {
  Person2CopyWith<$R, m.Person, m.Person> get owner;
  @override
  $R call({m.Person? owner, String? name, c.Color? color});
  PetCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PetCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, o.Pet, $Out>
    implements PetCopyWith<$R, o.Pet, $Out> {
  _PetCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<o.Pet> $mapper = PetMapper.ensureInitialized();
  @override
  Person2CopyWith<$R, m.Person, m.Person> get owner =>
      $value.owner.copyWith.$chain((v) => call(owner: v));
  @override
  $R call({m.Person? owner, String? name, c.Color? color}) => $apply(
    FieldCopyWithData({
      if (owner != null) #owner: owner,
      if (name != null) #name: name,
      if (color != null) #color: color,
    }),
  );
  @override
  o.Pet $make(CopyWithData data) => o.Pet(
    data.get(#owner, or: $value.owner),
    data.get(#name, or: $value.name),
    data.get(#color, or: $value.color),
  );

  @override
  PetCopyWith<$R2, o.Pet, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PetCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ColorMapper extends EnumMapper<c.Color> {
  ColorMapper._();

  static ColorMapper? _instance;
  static ColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ColorMapper._());
    }
    return _instance!;
  }

  static c.Color fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  c.Color decode(dynamic value) {
    switch (value) {
      case r'Black':
        return c.Color.black;
      case r'Red':
        return c.Color.red;
      case r'White':
        return c.Color.white;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(c.Color self) {
    switch (self) {
      case c.Color.black:
        return r'Black';
      case c.Color.red:
        return r'Red';
      case c.Color.white:
        return r'White';
    }
  }
}

extension ColorMapperExtension on c.Color {
  String toValue() {
    ColorMapper.ensureInitialized();
    return MapperContainer.globals.toValue<c.Color>(this) as String;
  }
}

