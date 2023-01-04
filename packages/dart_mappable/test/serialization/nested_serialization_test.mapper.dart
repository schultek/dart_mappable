// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'nested_serialization_test.dart';

class PersonMapper extends MapperBase<Person> {
  static MapperContainer container = MapperContainer(
    mappers: {PersonMapper()},
  )..linkAll({CarMapper.container});

  @override
  PersonMapperElement createElement(MapperContainer container) {
    return PersonMapperElement._(this, container);
  }

  @override
  String get id => 'Person';

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
      Person(container.$get(map, 'name'),
          age: container.$getOpt(map, 'age') ?? 18,
          car: container.$getOpt(map, 'car'));

  @override
  Function get encoder => encode;
  dynamic encode(Person v) => toMap(v);
  Map<String, dynamic> toMap(Person p) => {
        'name': container.$enc(p.name, 'name'),
        'age': container.$enc(p.age, 'age'),
        'car': container.$enc(p.car, 'car')
      };

  @override
  String stringify(Person self) =>
      'Person(name: ${container.asString(self.name)}, age: ${container.asString(self.age)}, car: ${container.asString(self.car)})';
  @override
  int hash(Person self) =>
      container.hash(self.name) ^
      container.hash(self.age) ^
      container.hash(self.car);
  @override
  bool equals(Person self, Person other) =>
      container.isEqual(self.name, other.name) &&
      container.isEqual(self.age, other.age) &&
      container.isEqual(self.car, other.car);
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
  CarCopyWith<$R, Car, Car>? get car;
  $R call({String? name, int? age, Car? car});
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
  CarCopyWith<$R, Car, Car>? get car =>
      $value.car?.copyWith.chain($identity, (v) => call(car: v));
  @override
  $R call({String? name, int? age, Object? car = $none}) =>
      $then(Person(name ?? $value.name,
          age: age ?? $value.age, car: or(car, $value.car)));
}

class CarMapper extends MapperBase<Car> {
  static MapperContainer container = MapperContainer(
    mappers: {CarMapper()},
  )..linkAll({BrandMapper.container});

  @override
  CarMapperElement createElement(MapperContainer container) {
    return CarMapperElement._(this, container);
  }

  @override
  String get id => 'Car';

  static final fromMap = container.fromMap<Car>;
  static final fromJson = container.fromJson<Car>;
}

class CarMapperElement extends MapperElementBase<Car> {
  CarMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Car decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Car fromMap(Map<String, dynamic> map) =>
      Car(container.$get(map, 'drivenKm'), container.$get(map, 'brand'));

  @override
  Function get encoder => encode;
  dynamic encode(Car v) => toMap(v);
  Map<String, dynamic> toMap(Car c) => {
        'drivenKm': container.$enc(c.drivenKm, 'drivenKm'),
        'brand': container.$enc(c.brand, 'brand')
      };

  @override
  String stringify(Car self) =>
      'Car(miles: ${container.asString(self.miles)}, brand: ${container.asString(self.brand)})';
  @override
  int hash(Car self) => container.hash(self.miles) ^ container.hash(self.brand);
  @override
  bool equals(Car self, Car other) =>
      container.isEqual(self.miles, other.miles) &&
      container.isEqual(self.brand, other.brand);
}

mixin CarMappable {
  String toJson() => CarMapper.container.toJson(this as Car);
  Map<String, dynamic> toMap() => CarMapper.container.toMap(this as Car);
  CarCopyWith<Car, Car, Car> get copyWith =>
      _CarCopyWithImpl(this as Car, $identity, $identity);
  @override
  String toString() => CarMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          CarMapper.container.isEqual(this, other));
  @override
  int get hashCode => CarMapper.container.hash(this);
}

extension CarValueCopy<$R, $Out extends Car> on ObjectCopyWith<$R, Car, $Out> {
  CarCopyWith<$R, Car, $Out> get asCar =>
      base.as((v, t, t2) => _CarCopyWithImpl(v, t, t2));
}

typedef CarCopyWithBound = Car;

abstract class CarCopyWith<$R, $In extends Car, $Out extends Car>
    implements ObjectCopyWith<$R, $In, $Out> {
  CarCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Car>(
      Then<Car, $Out2> t, Then<$Out2, $R2> t2);
  $R call({int? drivenKm, Brand? brand});
}

class _CarCopyWithImpl<$R, $Out extends Car> extends CopyWithBase<$R, Car, $Out>
    implements CarCopyWith<$R, Car, $Out> {
  _CarCopyWithImpl(super.value, super.then, super.then2);
  @override
  CarCopyWith<$R2, Car, $Out2> chain<$R2, $Out2 extends Car>(
          Then<Car, $Out2> t, Then<$Out2, $R2> t2) =>
      _CarCopyWithImpl($value, t, t2);

  @override
  $R call({int? drivenKm, Brand? brand}) =>
      $then(Car(drivenKm ?? $value.drivenKm, brand ?? $value.brand));
}

class BrandMapper extends EnumMapper<Brand> {
  static MapperContainer container = MapperContainer(
    mappers: {BrandMapper()},
  );

  static final fromValue = container.fromValue<Brand>;

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
  String toValue() => BrandMapper.container.toValue(this) as String;
}
