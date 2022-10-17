import 'dart:core';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'lib_mapping_test.dart' as p0;
import 'other/food.dart' as p1;
import 'other/models.dart' as p2;
import 'other/other.dart' as p3;


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  PersonMapper._(),
  AppleMapper._(),
  CakeMapper._(),
  CarMapper._(),
  Person1Mapper._(),
  AnimalMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class PersonMapper extends BaseMapper<p0.Person> {
  PersonMapper._();

  @override Function get decoder => decode;
  p0.Person decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Person fromMap(Map<String, dynamic> map) => p0.Person(Mapper.i.$get(map, 'first_name'));

  @override Function get encoder => encode;
  dynamic encode(p0.Person v) => toMap(v);
  Map<String, dynamic> toMap(p0.Person p) => {'first_name': Mapper.i.$enc(p.firstName, 'firstName')};

  @override String stringify(p0.Person self) => 'Person(firstName: ${Mapper.asString(self.firstName)})';
  @override int hash(p0.Person self) => Mapper.hash(self.firstName);
  @override bool equals(p0.Person self, p0.Person other) => Mapper.isEqual(self.firstName, other.firstName);

  @override Function get typeFactory => (f) => f<p0.Person>();
}

extension PersonMapperExtension on p0.Person {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  PersonCopyWith<p0.Person> get copyWith => _PersonCopyWithImpl(this, $identity);
}

extension PersonObjectCopy<$R> on ObjectCopyWith<$R, p0.Person> {
  PersonCopyWith<$R> get person => chain(_PersonCopyWithImpl.new);
}

abstract class PersonCopyWith<$R> implements ObjectCopyWith<$R, p0.Person> {
  $R call({String? firstName});
}

class _PersonCopyWithImpl<$R> extends BaseCopyWith<p0.Person, $R> implements PersonCopyWith<$R> {
  _PersonCopyWithImpl(super.value, super.then);

  @override $R call({String? firstName}) => $then(p0.Person(firstName ?? $value.firstName));
}

class AppleMapper extends BaseMapper<p1.Apple> {
  AppleMapper._();

  @override Function get decoder => decode;
  p1.Apple decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p1.Apple fromMap(Map<String, dynamic> map) => p1.Apple(Mapper.i.$get(map, 'is_red'));

  @override Function get encoder => encode;
  dynamic encode(p1.Apple v) => toMap(v);
  Map<String, dynamic> toMap(p1.Apple a) => {'is_red': Mapper.i.$enc(a.isRed, 'isRed')};

  @override String stringify(p1.Apple self) => 'Apple(isRed: ${Mapper.asString(self.isRed)})';
  @override int hash(p1.Apple self) => Mapper.hash(self.isRed);
  @override bool equals(p1.Apple self, p1.Apple other) => Mapper.isEqual(self.isRed, other.isRed);

  @override Function get typeFactory => (f) => f<p1.Apple>();
}

extension AppleMapperExtension on p1.Apple {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AppleCopyWith<p1.Apple> get copyWith => _AppleCopyWithImpl(this, $identity);
}

extension AppleObjectCopy<$R> on ObjectCopyWith<$R, p1.Apple> {
  AppleCopyWith<$R> get apple => chain(_AppleCopyWithImpl.new);
}

abstract class AppleCopyWith<$R> implements ObjectCopyWith<$R, p1.Apple> {
  $R call({bool? isRed});
}

class _AppleCopyWithImpl<$R> extends BaseCopyWith<p1.Apple, $R> implements AppleCopyWith<$R> {
  _AppleCopyWithImpl(super.value, super.then);

  @override $R call({bool? isRed}) => $then(p1.Apple(isRed ?? $value.isRed));
}

class CakeMapper extends BaseMapper<p1.Cake> {
  CakeMapper._();

  @override Function get decoder => decode;
  p1.Cake decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p1.Cake fromMap(Map<String, dynamic> map) => p1.Cake(Mapper.i.$get(map, 'type'));

  @override Function get encoder => encode;
  dynamic encode(p1.Cake v) => toMap(v);
  Map<String, dynamic> toMap(p1.Cake c) => {'type': Mapper.i.$enc(c.type, 'type')};

  @override String stringify(p1.Cake self) => 'Cake(type: ${Mapper.asString(self.type)})';
  @override int hash(p1.Cake self) => Mapper.hash(self.type);
  @override bool equals(p1.Cake self, p1.Cake other) => Mapper.isEqual(self.type, other.type);

  @override Function get typeFactory => (f) => f<p1.Cake>();
}

extension CakeMapperExtension on p1.Cake {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CakeCopyWith<p1.Cake> get copyWith => _CakeCopyWithImpl(this, $identity);
}

extension CakeObjectCopy<$R> on ObjectCopyWith<$R, p1.Cake> {
  CakeCopyWith<$R> get cake => chain(_CakeCopyWithImpl.new);
}

abstract class CakeCopyWith<$R> implements ObjectCopyWith<$R, p1.Cake> {
  $R call({String? type});
}

class _CakeCopyWithImpl<$R> extends BaseCopyWith<p1.Cake, $R> implements CakeCopyWith<$R> {
  _CakeCopyWithImpl(super.value, super.then);

  @override $R call({String? type}) => $then(p1.Cake(type ?? $value.type));
}

class CarMapper extends BaseMapper<p2.Car> {
  CarMapper._();

  @override Function get decoder => decode;
  p2.Car decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p2.Car fromMap(Map<String, dynamic> map) => p2.Car(Mapper.i.$get(map, 'brand_name'));

  @override Function get encoder => encode;
  dynamic encode(p2.Car v) => toMap(v);
  Map<String, dynamic> toMap(p2.Car c) => {'brand_name': Mapper.i.$enc(c.brandName, 'brandName')};

  @override String stringify(p2.Car self) => 'Car(brandName: ${Mapper.asString(self.brandName)})';
  @override int hash(p2.Car self) => Mapper.hash(self.brandName);
  @override bool equals(p2.Car self, p2.Car other) => Mapper.isEqual(self.brandName, other.brandName);

  @override Function get typeFactory => (f) => f<p2.Car>();
}

extension CarMapperExtension on p2.Car {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CarCopyWith<p2.Car> get copyWith => _CarCopyWithImpl(this, $identity);
}

extension CarObjectCopy<$R> on ObjectCopyWith<$R, p2.Car> {
  CarCopyWith<$R> get car => chain(_CarCopyWithImpl.new);
}

abstract class CarCopyWith<$R> implements ObjectCopyWith<$R, p2.Car> {
  $R call({String? brandName});
}

class _CarCopyWithImpl<$R> extends BaseCopyWith<p2.Car, $R> implements CarCopyWith<$R> {
  _CarCopyWithImpl(super.value, super.then);

  @override $R call({String? brandName}) => $then(p2.Car(brandName ?? $value.brandName));
}

class Person1Mapper extends BaseMapper<p2.Person> {
  Person1Mapper._();

  @override Function get decoder => decode;
  p2.Person decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p2.Person fromMap(Map<String, dynamic> map) => p2.Person(Mapper.i.$get(map, 'first_name'));

  @override Function get encoder => encode;
  dynamic encode(p2.Person v) => toMap(v);
  Map<String, dynamic> toMap(p2.Person p) => {'first_name': Mapper.i.$enc(p.firstName, 'firstName')};

  @override String stringify(p2.Person self) => 'Person(firstName: ${Mapper.asString(self.firstName)})';
  @override int hash(p2.Person self) => Mapper.hash(self.firstName);
  @override bool equals(p2.Person self, p2.Person other) => Mapper.isEqual(self.firstName, other.firstName);

  @override String get id => 'Person1';
  @override Function get typeFactory => (f) => f<p2.Person>();
}

extension Person1MapperExtension on p2.Person {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  Person1CopyWith<p2.Person> get copyWith => _Person1CopyWithImpl(this, $identity);
}

extension Person1ObjectCopy<$R> on ObjectCopyWith<$R, p2.Person> {
  Person1CopyWith<$R> get person => chain(_Person1CopyWithImpl.new);
}

abstract class Person1CopyWith<$R> implements ObjectCopyWith<$R, p2.Person> {
  $R call({String? firstName});
}

class _Person1CopyWithImpl<$R> extends BaseCopyWith<p2.Person, $R> implements Person1CopyWith<$R> {
  _Person1CopyWithImpl(super.value, super.then);

  @override $R call({String? firstName}) => $then(p2.Person(firstName ?? $value.firstName));
}

class AnimalMapper extends BaseMapper<p3.Animal> {
  AnimalMapper._();

  @override Function get decoder => decode;
  p3.Animal decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p3.Animal fromMap(Map<String, dynamic> map) => p3.Animal(Mapper.i.$get(map, 'color'));

  @override Function get encoder => encode;
  dynamic encode(p3.Animal v) => toMap(v);
  Map<String, dynamic> toMap(p3.Animal a) => {'color': Mapper.i.$enc(a.color, 'color')};

  @override String stringify(p3.Animal self) => 'Animal(color: ${Mapper.asString(self.color)})';
  @override int hash(p3.Animal self) => Mapper.hash(self.color);
  @override bool equals(p3.Animal self, p3.Animal other) => Mapper.isEqual(self.color, other.color);

  @override Function get typeFactory => (f) => f<p3.Animal>();
}

extension AnimalMapperExtension on p3.Animal {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AnimalCopyWith<p3.Animal> get copyWith => _AnimalCopyWithImpl(this, $identity);
}

extension AnimalObjectCopy<$R> on ObjectCopyWith<$R, p3.Animal> {
  AnimalCopyWith<$R> get animal => chain(_AnimalCopyWithImpl.new);
}

abstract class AnimalCopyWith<$R> implements ObjectCopyWith<$R, p3.Animal> {
  $R call({String? color});
}

class _AnimalCopyWithImpl<$R> extends BaseCopyWith<p3.Animal, $R> implements AnimalCopyWith<$R> {
  _AnimalCopyWithImpl(super.value, super.then);

  @override $R call({String? color}) => $then(p3.Animal(color ?? $value.color));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




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
