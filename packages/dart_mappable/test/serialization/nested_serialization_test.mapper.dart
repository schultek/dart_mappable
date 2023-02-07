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
  @override
  final String id = 'Person';

  static String _$name(Person v) => v.name;
  static int _$age(Person v) => v.age;
  static Car? _$car(Person v) => v.car;

  @override
  final Map<Symbol, Field<Person, dynamic>> fields = const {
    #name: Field<Person, String>('name', _$name),
    #age: Field<Person, int>('age', _$age, opt: true, def: 18),
    #car: Field<Person, Car?>('car', _$car, opt: true),
  };

  static Person _instantiate(DecodingData data) {
    return Person(data.get(#name), age: data.get(#age), car: data.get(#car));
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
  CarCopyWith<$R, Car, Car>? get car;
  $R call({String? name, int? age, Car? car});
}

class _PersonCopyWithImpl<$R, $Out extends Person> extends CopyWithBase<$R, Person, $Out> implements PersonCopyWith<$R, Person, $Out> {
  _PersonCopyWithImpl(super.value, super.then, super.then2);
  @override PersonCopyWith<$R2, Person, $Out2> chain<$R2, $Out2 extends Person>(Then<Person, $Out2> t, Then<$Out2, $R2> t2) => _PersonCopyWithImpl($value, t, t2);

  @override CarCopyWith<$R, Car, Car>? get car => $value.car?.copyWith.chain($identity, (v) => call(car: v));
  @override $R call({String? name, int? age, Object? car = $none}) => $then(Person(name ?? $value.name, age: age ?? $value.age, car: or(car, $value.car)));
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
  @override
  final String id = 'Car';

  static int _$drivenKm(Car v) => v.drivenKm;
  static Brand _$brand(Car v) => v.brand;
  static double _$miles(Car v) => v.miles;

  @override
  final Map<Symbol, Field<Car, dynamic>> fields = const {
    #drivenKm: Field<Car, int>('drivenKm', _$drivenKm),
    #brand: Field<Car, Brand>('brand', _$brand),
    #miles: Field<Car, double>('miles', _$miles, mode: FieldMode.member),
  };

  static Car _instantiate(DecodingData data) {
    return Car(data.get(#drivenKm), data.get(#brand));
  }
  @override
  final Function instantiate = _instantiate;

  static Car fromMap(Map<String, dynamic> map) {
    ensureInitialized();
    return MapperContainer.globals.fromMap<Car>(map);
  }
  static Car fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<Car>(json);
  }
}

mixin CarMappable {
  String toJson() {
    CarMapper.ensureInitialized();
    return MapperContainer.globals.toJson(this as Car);
  }
  Map<String, dynamic> toMap() {
    CarMapper.ensureInitialized();
    return MapperContainer.globals.toMap(this as Car);
  }
  CarCopyWith<Car, Car, Car> get copyWith => _CarCopyWithImpl(this as Car, $identity, $identity);
  @override
  String toString() {
    CarMapper.ensureInitialized();
    return MapperContainer.globals.asString(this);
  }
  @override
  bool operator ==(Object other) {
    CarMapper.ensureInitialized();
    return identical(this, other) || (runtimeType == other.runtimeType && MapperContainer.globals.isEqual(this, other));
  }
  @override
  int get hashCode {
    CarMapper.ensureInitialized();
    return MapperContainer.globals.hash(this);
  }
}

extension CarValueCopy<$R, $Out extends Car> on ObjectCopyWith<$R, Car, $Out> {
  CarCopyWith<$R, Car, $Out> get asCar => base.as((v, t, t2) => _CarCopyWithImpl(v, t, t2));
}

typedef CarCopyWithBound = Car;
abstract class CarCopyWith<$R, $In extends Car, $Out extends Car> implements ObjectCopyWith<$R, $In, $Out> {
  CarCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Car>(Then<Car, $Out2> t, Then<$Out2, $R2> t2);
  $R call({int? drivenKm, Brand? brand});
}

class _CarCopyWithImpl<$R, $Out extends Car> extends CopyWithBase<$R, Car, $Out> implements CarCopyWith<$R, Car, $Out> {
  _CarCopyWithImpl(super.value, super.then, super.then2);
  @override CarCopyWith<$R2, Car, $Out2> chain<$R2, $Out2 extends Car>(Then<Car, $Out2> t, Then<$Out2, $R2> t2) => _CarCopyWithImpl($value, t, t2);

  @override $R call({int? drivenKm, Brand? brand}) => $then(Car(drivenKm ?? $value.drivenKm, brand ?? $value.brand));
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
      case 'Toyota': return Brand.Toyota;
      case 'Audi': return Brand.Audi;
      case 'BMW': return Brand.BMW;
      default: return Brand.values[1];
    }
  }

  @override
  dynamic encode(Brand self) {
    switch (self) {
      case Brand.Toyota: return 'Toyota';
      case Brand.Audi: return 'Audi';
      case Brand.BMW: return 'BMW';
    }
  }
}

extension BrandMapperExtension on Brand {
  String toValue() {
    BrandMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}
