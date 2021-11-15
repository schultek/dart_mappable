import 'package:dart_mappable/internals.dart';

import 'copy_with_test.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  PersonMapper._(),
  CarMapper._(),
  BrandMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class PersonMapper extends BaseMapper<Person> {
  PersonMapper._();
}

extension PersonMapperExtension on Person {
  PersonCopyWith<Person> get copyWith => PersonCopyWith(this, $identity);
}

abstract class PersonCopyWith<$R> {
  factory PersonCopyWith(Person value, Then<Person, $R> then) = _PersonCopyWithImpl<$R>;
  CarCopyWith<$R> get car;
  $R call({String? name, Car? car});
}

class _PersonCopyWithImpl<$R> extends BaseCopyWith<Person, $R> implements PersonCopyWith<$R> {
  _PersonCopyWithImpl(Person value, Then<Person, $R> then) : super(value, then);

  @override CarCopyWith<$R> get car => CarCopyWith($value.car, (v) => call(car: v));
  @override $R call({String? name, Car? car}) => $then(Person(name ?? $value.name, car ?? $value.car));
}

class CarMapper extends BaseMapper<Car> {
  CarMapper._();
}

extension CarMapperExtension on Car {
  CarCopyWith<Car> get copyWith => CarCopyWith(this, $identity);
}

abstract class CarCopyWith<$R> {
  factory CarCopyWith(Car value, Then<Car, $R> then) = _CarCopyWithImpl<$R>;
  BrandCopyWith<$R> get brand;
  $R call({Brand? brand, String? model});
}

class _CarCopyWithImpl<$R> extends BaseCopyWith<Car, $R> implements CarCopyWith<$R> {
  _CarCopyWithImpl(Car value, Then<Car, $R> then) : super(value, then);

  @override BrandCopyWith<$R> get brand => BrandCopyWith($value.brand, (v) => call(brand: v));
  @override $R call({Brand? brand, String? model}) => $then(Car(brand ?? $value.brand, model ?? $value.model));
}

class BrandMapper extends BaseMapper<Brand> {
  BrandMapper._();
}

extension BrandMapperExtension on Brand {
  BrandCopyWith<Brand> get copyWith => BrandCopyWith(this, $identity);
}

abstract class BrandCopyWith<$R> {
  factory BrandCopyWith(Brand value, Then<Brand, $R> then) = _BrandCopyWithImpl<$R>;
  $R call({String? name});
}

class _BrandCopyWithImpl<$R> extends BaseCopyWith<Brand, $R> implements BrandCopyWith<$R> {
  _BrandCopyWithImpl(Brand value, Then<Brand, $R> then) : super(value, then);

  @override $R call({String? name}) => $then(Brand(name ?? $value.name));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




// === GENERATED UTILITY CODE ===


class _Mapper extends MapperContainer {
  _Mapper._() : super(_mappers);
}

class Mapper {
  Mapper._();

  static late _Mapper i = _Mapper._();

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
  BaseMapper? get _mapper => Mapper.get(runtimeType);

  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override String toString() => _mapper?.stringify(this) ?? super.toString();
  @override bool operator ==(Object other) => identical(this, other) ||
      (runtimeType == other.runtimeType && (_mapper?.equals(this, other) 
      ?? super == other));
  @override int get hashCode => _mapper?.hash(this) ?? super.hashCode;
}

extension MapGet on Map<String, dynamic> {
  T get<T>(String key, {MappingHooks? hooks}) => _getOr(
      key, hooks, () => throw MapperException('Parameter $key is required.'));

  T? getOpt<T>(String key, {MappingHooks? hooks}) =>
      _getOr(key, hooks, () => null);

  T _getOr<T>(String key, MappingHooks? hooks, T Function() or) =>
      hooks.decode(this[key], (v) => v == null ? or() : Mapper.fromValue<T>(v));
}


