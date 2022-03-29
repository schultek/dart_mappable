import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'main.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  PersonMapper._(),
  CarMapper._(),
  BoxMapper._(),
  ConfettiMapper._(),
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

class BoxMapper extends BaseMapper<Box> {
  BoxMapper._();

  @override Function get decoder => decode;
  Box<T> decode<T>(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap<T>(map));
  Box<T> fromMap<T>(Map<String, dynamic> map) => Box(Mapper.i.$get(map, 'size'), content: Mapper.i.$get(map, 'content'));

  @override Function get encoder => (Box v) => encode(v);
  dynamic encode(Box v) => toMap(v);
  Map<String, dynamic> toMap(Box b) => {'size': Mapper.i.$enc(b.size, 'size'), 'content': Mapper.i.$enc(b.content, 'content')};

  @override String stringify(Box self) => 'Box(size: ${Mapper.asString(self.size)}, content: ${Mapper.asString(self.content)})';
  @override int hash(Box self) => Mapper.hash(self.size) ^ Mapper.hash(self.content);
  @override bool equals(Box self, Box other) => Mapper.isEqual(self.size, other.size) && Mapper.isEqual(self.content, other.content);

  @override Function get typeFactory => <T>(f) => f<Box<T>>();
}

extension BoxMapperExtension <T> on Box<T> {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  BoxCopyWith<Box<T>, T> get copyWith => BoxCopyWith(this, $identity);
}

abstract class BoxCopyWith<$R, T> {
  factory BoxCopyWith(Box<T> value, Then<Box<T>, $R> then) = _BoxCopyWithImpl<$R, T>;
  $R call({int? size, T? content});
  $R apply(Box<T> Function(Box<T>) transform);
}

class _BoxCopyWithImpl<$R, T> extends BaseCopyWith<Box<T>, $R> implements BoxCopyWith<$R, T> {
  _BoxCopyWithImpl(Box<T> value, Then<Box<T>, $R> then) : super(value, then);

  @override $R call({int? size, T? content}) => $then(Box(size ?? $value.size, content: content ?? $value.content));
}

class ConfettiMapper extends BaseMapper<Confetti> {
  ConfettiMapper._();

  @override Function get decoder => decode;
  Confetti decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Confetti fromMap(Map<String, dynamic> map) => Confetti(Mapper.i.$get(map, 'color'));

  @override Function get encoder => (Confetti v) => encode(v);
  dynamic encode(Confetti v) => toMap(v);
  Map<String, dynamic> toMap(Confetti c) => {'color': Mapper.i.$enc(c.color, 'color')};

  @override String stringify(Confetti self) => 'Confetti(color: ${Mapper.asString(self.color)})';
  @override int hash(Confetti self) => Mapper.hash(self.color);
  @override bool equals(Confetti self, Confetti other) => Mapper.isEqual(self.color, other.color);

  @override Function get typeFactory => (f) => f<Confetti>();
}

extension ConfettiMapperExtension  on Confetti {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ConfettiCopyWith<Confetti> get copyWith => ConfettiCopyWith(this, $identity);
}

abstract class ConfettiCopyWith<$R> {
  factory ConfettiCopyWith(Confetti value, Then<Confetti, $R> then) = _ConfettiCopyWithImpl<$R>;
  $R call({String? color});
  $R apply(Confetti Function(Confetti) transform);
}

class _ConfettiCopyWithImpl<$R> extends BaseCopyWith<Confetti, $R> implements ConfettiCopyWith<$R> {
  _ConfettiCopyWithImpl(Confetti value, Then<Confetti, $R> then) : super(value, then);

  @override $R call({String? color}) => $then(Confetti(color ?? $value.color));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===

class BrandMapper extends EnumMapper<Brand> {
  BrandMapper._();

  @override  Brand fromString(String value) {
    switch (value) {
      case 'toyota': return Brand.Toyota;
      case 'audi': return Brand.Audi;
      case 'bmw': return Brand.BMW;
      default: throw MapperException.unknownEnumValue(value);
    }
  }

  @override  String toStringValue(Brand value) {
    switch (value) {
      case Brand.Toyota: return 'toyota';
      case Brand.Audi: return 'audi';
      case Brand.BMW: return 'bmw';
    }
  }
}

extension BrandMapperExtension on Brand {
  String toStringValue() => Mapper.toValue(this) as String;
}


// === GENERATED UTILITY CODE ===

class Mapper {
  Mapper._();

  static late MapperContainer i = MapperContainer(_mappers);

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

mixin Mappable {
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
      if (e.isUnsupported()) {
        return fallback();
      } else {
        rethrow;
      }
    }
  }
}
