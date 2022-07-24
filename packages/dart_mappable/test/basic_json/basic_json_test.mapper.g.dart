import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'basic_json_test.dart' as p0;


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  PersonMapper._(),
  CarMapper._(),
  // enum mappers
  BrandMapper._(),
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class PersonMapper extends BaseMapper<Person> {
  PersonMapper._();

  @override Function get decoder => decode;
  Person decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Person fromMap(Map<String, dynamic> map) => Person(Mapper.i.$get(map, 'name'), age: Mapper.i.$getOpt(map, 'age') ?? 18, car: Mapper.i.$getOpt(map, 'car'));

  @override Function get encoder => (Person v) => encode(v);
  dynamic encode(Person v) => toMap(v);
  Map<String, dynamic> toMap(Person p) => {'name': Mapper.i.$enc(p.name, 'name'), 'age': Mapper.i.$enc(p.age, 'age'), 'car': Mapper.i.$enc(p.car, 'car')};

  @override String stringify(Person self) => 'Person(name: ${Mapper.asString(self.name)}, age: ${Mapper.asString(self.age)}, car: ${Mapper.asString(self.car)})';
  @override int hash(Person self) => Mapper.hash(self.name) ^ Mapper.hash(self.age) ^ Mapper.hash(self.car);
  @override bool equals(Person self, Person other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.age, other.age) && Mapper.isEqual(self.car, other.car);

  @override Function get typeFactory => (f) => f<Person>();
}

extension PersonMapperExtension  on Person {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  PersonCopyWith<Person> get copyWith => PersonCopyWith(this, $identity);
}

abstract class PersonCopyWith<$R> {
  factory PersonCopyWith(Person value, Then<Person, $R> then) = _PersonCopyWithImpl<$R>;
  CarCopyWith<$R>? get car;
  $R call({String? name, int? age, Car? car});
  $R apply(Person Function(Person) transform);
}

class _PersonCopyWithImpl<$R> extends BaseCopyWith<Person, $R> implements PersonCopyWith<$R> {
  _PersonCopyWithImpl(Person value, Then<Person, $R> then) : super(value, then);

  @override CarCopyWith<$R>? get car => $value.car != null ? CarCopyWith($value.car!, (v) => call(car: v)) : null;
  @override $R call({String? name, int? age, Object? car = $none}) => $then(Person(name ?? $value.name, age: age ?? $value.age, car: or(car, $value.car)));
}

class CarMapper extends BaseMapper<Car> {
  CarMapper._();

  @override Function get decoder => decode;
  Car decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Car fromMap(Map<String, dynamic> map) => Car(Mapper.i.$get(map, 'driven_km'), Mapper.i.$get(map, 'brand'));

  @override Function get encoder => (Car v) => encode(v);
  dynamic encode(Car v) => toMap(v);
  Map<String, dynamic> toMap(Car c) => {'driven_km': Mapper.i.$enc(c.drivenKm, 'drivenKm'), 'brand': Mapper.i.$enc(c.brand, 'brand')};

  @override String stringify(Car self) => 'Car(miles: ${Mapper.asString(self.miles)}, brand: ${Mapper.asString(self.brand)})';
  @override int hash(Car self) => Mapper.hash(self.miles) ^ Mapper.hash(self.brand);
  @override bool equals(Car self, Car other) => Mapper.isEqual(self.miles, other.miles) && Mapper.isEqual(self.brand, other.brand);

  @override Function get typeFactory => (f) => f<Car>();
}

extension CarMapperExtension  on Car {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CarCopyWith<Car> get copyWith => CarCopyWith(this, $identity);
}

abstract class CarCopyWith<$R> {
  factory CarCopyWith(Car value, Then<Car, $R> then) = _CarCopyWithImpl<$R>;
  $R call({int? drivenKm, Brand? brand});
  $R apply(Car Function(Car) transform);
}

class _CarCopyWithImpl<$R> extends BaseCopyWith<Car, $R> implements CarCopyWith<$R> {
  _CarCopyWithImpl(Car value, Then<Car, $R> then) : super(value, then);

  @override $R call({int? drivenKm, Brand? brand}) => $then(Car(drivenKm ?? $value.drivenKm, brand ?? $value.brand));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===

class BrandMapper extends EnumMapper<Brand> {
  BrandMapper._();

  @override  Brand decode(dynamic value) {
    switch (value) {
      case 'toyota': return Brand.Toyota;
      case 'audi': return Brand.Audi;
      case 'bmw': return Brand.BMW;
      default: return Brand.values[1];
    }
  }

  @override  dynamic encode(Brand self) {
    switch (self) {
      case Brand.Toyota: return 'toyota';
      case Brand.Audi: return 'audi';
      case Brand.BMW: return 'bmw';
    }
  }
}

extension BrandMapperExtension on Brand {
  dynamic toValue() => Mapper.toValue(this);
  @Deprecated('Use \'toValue\' instead')
  String toStringValue() => Mapper.toValue(this) as String;
}


// === GENERATED UTILITY CODE ===

class Mapper {
  Mapper._();

  static MapperContainer i = MapperContainer(_mappers);

  static T fromValue<T>(dynamic value) => i.fromValue<T>(value);
  static T fromMap<T>(Map<String, dynamic> map) => i.fromMap<T>(map);
  static T fromIterable<T>(Iterable<dynamic> iterable) => i.fromIterable<T>(iterable);
  static T fromJson<T>(String json) => i.fromJson<T>(json);

  static dynamic toValue(dynamic value) => i.toValue(value);
  static Map<String, dynamic> toMap(dynamic object) => i.toMap(object);
  static Iterable<dynamic> toIterable(dynamic object) => i.toIterable(object);
  static String toJson(dynamic object) => i.toJson(object);

  static bool isEqual(dynamic value, Object? other) => i.isEqual(value, other);
  static int hash(dynamic value) => i.hash(value);
  static String asString(dynamic value) => i.asString(value);

  static void use<T>(BaseMapper<T> mapper) => i.use<T>(mapper);
  static BaseMapper<T>? unuse<T>() => i.unuse<T>();
  static void useAll(List<BaseMapper> mappers) => i.useAll(mappers);

  static BaseMapper<T>? get<T>([Type? type]) => i.get<T>(type);
  static List<BaseMapper> getAll() => i.getAll();
}

mixin Mappable implements MappableMixin {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override
  String toString() {
    return _guard(() => Mapper.asString(this), super.toString);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            _guard(() => Mapper.isEqual(this, other), () => super == other));
  }

  @override
  int get hashCode {
    return _guard(() => Mapper.hash(this), () => super.hashCode);
  }

  T _guard<T>(T Function() fn, T Function() fallback) {
    try {
      return fn();
    } on MapperException catch (e) {
      if (e.isUnsupportedOrUnallowed()) {
        return fallback();
      } else {
        rethrow;
      }
    }
  }
}
