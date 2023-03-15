// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'nested_serialization_test.dart';

class PersonMapper extends ClassMapperBase<Person> {
  PersonMapper._();
  static PersonMapper? _instance;
  static PersonMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PersonMapper._());
      CarMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Person';

  static String _$name(Person v) => v.name;
  static const Field<Person, String> _f$name = Field('name', _$name);
  static int _$age(Person v) => v.age;
  static const Field<Person, int> _f$age =
      Field('age', _$age, opt: true, def: 18);
  static Car? _$car(Person v) => v.car;
  static const Field<Person, Car?> _f$car = Field('car', _$car, opt: true);

  @override
  final Map<Symbol, Field<Person, dynamic>> fields = const {
    #name: _f$name,
    #age: _f$age,
    #car: _f$car,
  };

  static Person _instantiate(DecodingData data) {
    return Person(data.dec(_f$name),
        age: data.dec(_f$age), car: data.dec(_f$car));
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
  CarCopyWith<$R, Car, Car>? get car;
  $R call({String? name, int? age, Car? car});
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
  CarCopyWith<$R, Car, Car>? get car =>
      $value.car?.copyWith.$chain($identity, (v) => call(car: v));
  @override
  $R call({String? name, int? age, Object? car = $none}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (age != null) #age: age,
        if (car != $none) #car: car
      }));
  @override
  Person $make(CopyWithData data) => Person(data.get(#name, or: $value.name),
      age: data.get(#age, or: $value.age), car: data.get(#car, or: $value.car));

  @override
  PersonCopyWith<$R2, Person, $Out2> $chain<$R2, $Out2 extends Person>(
          Then<Person, $Out2> t, Then<$Out2, $R2> t2) =>
      _PersonCopyWithImpl($value, t, t2);
}

class CarMapper extends ClassMapperBase<Car> {
  CarMapper._();
  static CarMapper? _instance;
  static CarMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CarMapper._());
      BrandMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Car';

  static int _$drivenKm(Car v) => v.drivenKm;
  static const Field<Car, int> _f$drivenKm = Field('drivenKm', _$drivenKm);
  static Brand _$brand(Car v) => v.brand;
  static const Field<Car, Brand> _f$brand = Field('brand', _$brand);
  static double _$miles(Car v) => v.miles;
  static const Field<Car, double> _f$miles =
      Field('miles', _$miles, mode: FieldMode.member);

  @override
  final Map<Symbol, Field<Car, dynamic>> fields = const {
    #drivenKm: _f$drivenKm,
    #brand: _f$brand,
    #miles: _f$miles,
  };

  static Car _instantiate(DecodingData data) {
    return Car(data.dec(_f$drivenKm), data.dec(_f$brand));
  }

  @override
  final Function instantiate = _instantiate;

  static Car fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Car>(map));
  }

  static Car fromJson(String json) {
    return _guard((c) => c.fromJson<Car>(json));
  }
}

mixin CarMappable {
  String toJson() {
    return CarMapper._guard((c) => c.toJson(this as Car));
  }

  Map<String, dynamic> toMap() {
    return CarMapper._guard((c) => c.toMap(this as Car));
  }

  CarCopyWith<Car, Car, Car> get copyWith =>
      _CarCopyWithImpl(this as Car, $identity, $identity);
  @override
  String toString() {
    return CarMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CarMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return CarMapper._guard((c) => c.hash(this));
  }
}

extension CarValueCopy<$R, $Out extends Car> on ObjectCopyWith<$R, Car, $Out> {
  CarCopyWith<$R, Car, $Out> get $asCar =>
      $base.as((v, t, t2) => _CarCopyWithImpl(v, t, t2));
}

typedef CarCopyWithBound = Car;

abstract class CarCopyWith<$R, $In extends Car, $Out extends Car>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? drivenKm, Brand? brand});
  CarCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Car>(
      Then<Car, $Out2> t, Then<$Out2, $R2> t2);
}

class _CarCopyWithImpl<$R, $Out extends Car>
    extends ClassCopyWithBase<$R, Car, $Out>
    implements CarCopyWith<$R, Car, $Out> {
  _CarCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Car> $mapper = CarMapper.ensureInitialized();
  @override
  $R call({int? drivenKm, Brand? brand}) => $apply(FieldCopyWithData({
        if (drivenKm != null) #drivenKm: drivenKm,
        if (brand != null) #brand: brand
      }));
  @override
  Car $make(CopyWithData data) => Car(data.get(#drivenKm, or: $value.drivenKm),
      data.get(#brand, or: $value.brand));

  @override
  CarCopyWith<$R2, Car, $Out2> $chain<$R2, $Out2 extends Car>(
          Then<Car, $Out2> t, Then<$Out2, $R2> t2) =>
      _CarCopyWithImpl($value, t, t2);
}

class BrandMapper extends EnumMapper<Brand> {
  BrandMapper._();
  static BrandMapper? _instance;
  static BrandMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BrandMapper._());
    }
    return _instance!;
  }

  static Brand fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Brand decode(dynamic value) {
    switch (value) {
      case 'Toyota':
        return Brand.Toyota;
      case 'Audi':
        return Brand.Audi;
      case 'BMW':
        return Brand.BMW;
      default:
        return Brand.values[1];
    }
  }

  @override
  dynamic encode(Brand self) {
    switch (self) {
      case Brand.Toyota:
        return 'Toyota';
      case Brand.Audi:
        return 'Audi';
      case Brand.BMW:
        return 'BMW';
    }
  }
}

extension BrandMapperExtension on Brand {
  String toValue() {
    BrandMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}
