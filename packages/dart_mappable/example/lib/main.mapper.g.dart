// ignore_for_file: unused_element
import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'main.dart' as p0;


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <MapperElementBase>{
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

class PersonMapper extends MapperElementBase<p0.Person> {
  PersonMapper._();

  @override Function get decoder => decode;
  p0.Person decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Person fromMap(Map<String, dynamic> map) => p0.Person(Mapper.i.$get(map, 'name'), age: Mapper.i.$getOpt(map, 'age') ?? 18, car: Mapper.i.$getOpt(map, 'car'));

  @override Function get encoder => encode;
  dynamic encode(p0.Person v) => toMap(v);
  Map<String, dynamic> toMap(p0.Person p) => {'name': Mapper.i.$enc(p.name, 'name'), 'age': Mapper.i.$enc(p.age, 'age'), 'car': Mapper.i.$enc(p.car, 'car')};

  @override String stringify(p0.Person self) => 'Person(name: ${Mapper.asString(self.name)}, age: ${Mapper.asString(self.age)}, car: ${Mapper.asString(self.car)})';
  @override int hash(p0.Person self) => Mapper.hash(self.name) ^ Mapper.hash(self.age) ^ Mapper.hash(self.car);
  @override bool equals(p0.Person self, p0.Person other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.age, other.age) && Mapper.isEqual(self.car, other.car);

  @override Function get typeFactory => (f) => f<p0.Person>();
}

extension PersonMapperExtension on p0.Person {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  PersonCopyWith<p0.Person> get copyWith => _PersonCopyWithImpl(this, $identity, $identity);
}

extension PersonObjectCopy<$R> on ObjectCopyWith<$R, p0.Person, p0.Person> {
  PersonCopyWith<$R> get asPerson => base.as((v, t, t2) => _PersonCopyWithImpl(v, t, t2));
}

abstract class PersonCopyWith<$R> implements ObjectCopyWith<$R, p0.Person, p0.Person> {
  PersonCopyWith<$R2> _chain<$R2>(Then<p0.Person, p0.Person> t, Then<p0.Person, $R2> t2);
  CarCopyWith<$R>? get car;
  $R call({String? name, int? age, p0.Car? car});
}

class _PersonCopyWithImpl<$R> extends BaseCopyWith<$R, p0.Person, p0.Person> implements PersonCopyWith<$R> {
  _PersonCopyWithImpl(super.value, super.then, super.then2);
  @override PersonCopyWith<$R2> _chain<$R2>(Then<p0.Person, p0.Person> t, Then<p0.Person, $R2> t2) => _PersonCopyWithImpl($value, t, t2);

  @override CarCopyWith<$R>? get car => $value.car?.copyWith._chain($identity, (v) => call(car: v));
  @override $R call({String? name, int? age, Object? car = $none}) => $then(p0.Person(name ?? $value.name, age: age ?? $value.age, car: or(car, $value.car)));
}

class CarMapper extends MapperElementBase<p0.Car> {
  CarMapper._();

  @override Function get decoder => decode;
  p0.Car decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Car fromMap(Map<String, dynamic> map) => p0.Car(Mapper.i.$get(map, 'driven_km'), Mapper.i.$get(map, 'brand'));

  @override Function get encoder => encode;
  dynamic encode(p0.Car v) => toMap(v);
  Map<String, dynamic> toMap(p0.Car c) => {'driven_km': Mapper.i.$enc(c.drivenKm, 'drivenKm'), 'brand': Mapper.i.$enc(c.brand, 'brand')};

  @override String stringify(p0.Car self) => 'Car(miles: ${Mapper.asString(self.miles)}, brand: ${Mapper.asString(self.brand)})';
  @override int hash(p0.Car self) => Mapper.hash(self.miles) ^ Mapper.hash(self.brand);
  @override bool equals(p0.Car self, p0.Car other) => Mapper.isEqual(self.miles, other.miles) && Mapper.isEqual(self.brand, other.brand);

  @override Function get typeFactory => (f) => f<p0.Car>();
}

extension CarMapperExtension on p0.Car {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CarCopyWith<p0.Car> get copyWith => _CarCopyWithImpl(this, $identity, $identity);
}

extension CarObjectCopy<$R> on ObjectCopyWith<$R, p0.Car, p0.Car> {
  CarCopyWith<$R> get asCar => base.as((v, t, t2) => _CarCopyWithImpl(v, t, t2));
}

abstract class CarCopyWith<$R> implements ObjectCopyWith<$R, p0.Car, p0.Car> {
  CarCopyWith<$R2> _chain<$R2>(Then<p0.Car, p0.Car> t, Then<p0.Car, $R2> t2);
  $R call({int? drivenKm, p0.Brand? brand});
}

class _CarCopyWithImpl<$R> extends BaseCopyWith<$R, p0.Car, p0.Car> implements CarCopyWith<$R> {
  _CarCopyWithImpl(super.value, super.then, super.then2);
  @override CarCopyWith<$R2> _chain<$R2>(Then<p0.Car, p0.Car> t, Then<p0.Car, $R2> t2) => _CarCopyWithImpl($value, t, t2);

  @override $R call({int? drivenKm, p0.Brand? brand}) => $then(p0.Car(drivenKm ?? $value.drivenKm, brand ?? $value.brand));
}

class BoxMapper extends MapperElementBase<p0.Box> {
  BoxMapper._();

  @override Function get decoder => decode;
  p0.Box<T> decode<T>(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap<T>(map));
  p0.Box<T> fromMap<T>(Map<String, dynamic> map) => p0.Box(Mapper.i.$get(map, 'size'), content: Mapper.i.$get(map, 'content'));

  @override Function get encoder => encode;
  dynamic encode<T>(p0.Box<T> v) => toMap<T>(v);
  Map<String, dynamic> toMap<T>(p0.Box<T> b) => {'size': Mapper.i.$enc(b.size, 'size'), 'content': Mapper.i.$enc(b.content, 'content'), ...Mapper.i.$type<p0.Box<T>>(b)};

  @override String stringify(p0.Box self) => 'Box(size: ${Mapper.asString(self.size)}, content: ${Mapper.asString(self.content)})';
  @override int hash(p0.Box self) => Mapper.hash(self.size) ^ Mapper.hash(self.content);
  @override bool equals(p0.Box self, p0.Box other) => Mapper.isEqual(self.size, other.size) && Mapper.isEqual(self.content, other.content);

  @override Function get typeFactory => <T>(f) => f<p0.Box<T>>();
}

extension BoxMapperExtension<T> on p0.Box<T> {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  BoxCopyWith<p0.Box<T>, T> get copyWith => _BoxCopyWithImpl(this, $identity, $identity);
}

extension BoxObjectCopy<$R, T> on ObjectCopyWith<$R, p0.Box<T>, p0.Box<T>> {
  BoxCopyWith<$R, T> get asBox => base.as((v, t, t2) => _BoxCopyWithImpl(v, t, t2));
}

abstract class BoxCopyWith<$R, T> implements ObjectCopyWith<$R, p0.Box<T>, p0.Box<T>> {
  BoxCopyWith<$R2, T> _chain<$R2>(Then<p0.Box<T>, p0.Box<T>> t, Then<p0.Box<T>, $R2> t2);
  $R call({int? size, T? content});
}

class _BoxCopyWithImpl<$R, T> extends BaseCopyWith<$R, p0.Box<T>, p0.Box<T>> implements BoxCopyWith<$R, T> {
  _BoxCopyWithImpl(super.value, super.then, super.then2);
  @override BoxCopyWith<$R2, T> _chain<$R2>(Then<p0.Box<T>, p0.Box<T>> t, Then<p0.Box<T>, $R2> t2) => _BoxCopyWithImpl($value, t, t2);

  @override $R call({int? size, T? content}) => $then(p0.Box(size ?? $value.size, content: content ?? $value.content));
}

class ConfettiMapper extends MapperElementBase<p0.Confetti> {
  ConfettiMapper._();

  @override Function get decoder => decode;
  p0.Confetti decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Confetti fromMap(Map<String, dynamic> map) => p0.Confetti(Mapper.i.$get(map, 'color'));

  @override Function get encoder => encode;
  dynamic encode(p0.Confetti v) => toMap(v);
  Map<String, dynamic> toMap(p0.Confetti c) => {'color': Mapper.i.$enc(c.color, 'color')};

  @override String stringify(p0.Confetti self) => 'Confetti(color: ${Mapper.asString(self.color)})';
  @override int hash(p0.Confetti self) => Mapper.hash(self.color);
  @override bool equals(p0.Confetti self, p0.Confetti other) => Mapper.isEqual(self.color, other.color);

  @override Function get typeFactory => (f) => f<p0.Confetti>();
}

extension ConfettiMapperExtension on p0.Confetti {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ConfettiCopyWith<p0.Confetti> get copyWith => _ConfettiCopyWithImpl(this, $identity, $identity);
}

extension ConfettiObjectCopy<$R> on ObjectCopyWith<$R, p0.Confetti, p0.Confetti> {
  ConfettiCopyWith<$R> get asConfetti => base.as((v, t, t2) => _ConfettiCopyWithImpl(v, t, t2));
}

abstract class ConfettiCopyWith<$R> implements ObjectCopyWith<$R, p0.Confetti, p0.Confetti> {
  ConfettiCopyWith<$R2> _chain<$R2>(Then<p0.Confetti, p0.Confetti> t, Then<p0.Confetti, $R2> t2);
  $R call({String? color});
}

class _ConfettiCopyWithImpl<$R> extends BaseCopyWith<$R, p0.Confetti, p0.Confetti> implements ConfettiCopyWith<$R> {
  _ConfettiCopyWithImpl(super.value, super.then, super.then2);
  @override ConfettiCopyWith<$R2> _chain<$R2>(Then<p0.Confetti, p0.Confetti> t, Then<p0.Confetti, $R2> t2) => _ConfettiCopyWithImpl($value, t, t2);

  @override $R call({String? color}) => $then(p0.Confetti(color ?? $value.color));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===

class BrandMapper extends EnumMapper<p0.Brand> {
  BrandMapper._();

  @override  p0.Brand decode(dynamic value) {
    switch (value) {
      case 'toyota': return p0.Brand.Toyota;
      case 'audi': return p0.Brand.Audi;
      case 'bmw': return p0.Brand.BMW;
      default: throw MapperException.unknownEnumValue(value);
    }
  }

  @override  dynamic encode(p0.Brand self) {
    switch (self) {
      case p0.Brand.Toyota: return 'toyota';
      case p0.Brand.Audi: return 'audi';
      case p0.Brand.BMW: return 'bmw';
    }
  }
}

extension BrandMapperExtension on p0.Brand {
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

  static dynamic toValue<T>(T value) => i.toValue<T>(value);
  static Map<String, dynamic> toMap<T>(T object) => i.toMap<T>(object);
  static Iterable<dynamic> toIterable<T>(T object) => i.toIterable<T>(object);
  static String toJson<T>(T object) => i.toJson<T>(object);

  static bool isEqual(dynamic value, Object? other) => i.isEqual(value, other);
  static int hash(dynamic value) => i.hash(value);
  static String asString(dynamic value) => i.asString(value);

  static void use<T>(MapperElementBase<T> mapper) => i.use<T>(mapper);
  static MapperElementBase<T>? unuse<T>() => i.unuse<T>();
  static void useAll(List<MapperElementBase> mappers) => i.useAll(mappers);

  static MapperElementBase<T>? get<T>([Type? type]) => i.get<T>(type);
  static List<MapperElementBase> getAll() => i.getAll();
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

extension _ChainedCopyWith<$R, $T, $S> on ObjectCopyWith<$R, $T, $S> {
  BaseCopyWith<$R, $T, $S> get base => this as BaseCopyWith<$R, $T, $S>;
}
