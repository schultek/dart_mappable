import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'lib_mapping_test.dart';
import 'other/food.dart';
import 'other/models.dart';
import 'other/other.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  PersonMapper._(),
  AppleMapper._(),
  CakeMapper._(),
  CarMapper._(),
  AnimalMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class PersonMapper extends BaseMapper<Person> {
  PersonMapper._();

  @override Function get decoder => decode;
  Person decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Person fromMap(Map<String, dynamic> map) => Person(Mapper.i.$get(map, 'first_name'));

  @override Function get encoder => (Person v) => encode(v);
  dynamic encode(Person v) => toMap(v);
  Map<String, dynamic> toMap(Person p) => {'first_name': Mapper.i.$enc(p.firstName, 'firstName')};

  @override String stringify(Person self) => 'Person(firstName: ${Mapper.asString(self.firstName)})';
  @override int hash(Person self) => Mapper.hash(self.firstName);
  @override bool equals(Person self, Person other) => Mapper.isEqual(self.firstName, other.firstName);

  @override Function get typeFactory => (f) => f<Person>();
}

extension PersonMapperExtension  on Person {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  PersonCopyWith<Person> get copyWith => PersonCopyWith(this, $identity);
}

abstract class PersonCopyWith<$R> {
  factory PersonCopyWith(Person value, Then<Person, $R> then) = _PersonCopyWithImpl<$R>;
  $R call({String? firstName});
  $R apply(Person Function(Person) transform);
}

class _PersonCopyWithImpl<$R> extends BaseCopyWith<Person, $R> implements PersonCopyWith<$R> {
  _PersonCopyWithImpl(Person value, Then<Person, $R> then) : super(value, then);

  @override $R call({String? firstName}) => $then(Person(firstName ?? $value.firstName));
}

class AppleMapper extends BaseMapper<Apple> {
  AppleMapper._();

  @override Function get decoder => decode;
  Apple decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Apple fromMap(Map<String, dynamic> map) => Apple(Mapper.i.$get(map, 'is_red'));

  @override Function get encoder => (Apple v) => encode(v);
  dynamic encode(Apple v) => toMap(v);
  Map<String, dynamic> toMap(Apple a) => {'is_red': Mapper.i.$enc(a.isRed, 'isRed')};

  @override String stringify(Apple self) => 'Apple(isRed: ${Mapper.asString(self.isRed)})';
  @override int hash(Apple self) => Mapper.hash(self.isRed);
  @override bool equals(Apple self, Apple other) => Mapper.isEqual(self.isRed, other.isRed);

  @override Function get typeFactory => (f) => f<Apple>();
}

extension AppleMapperExtension  on Apple {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AppleCopyWith<Apple> get copyWith => AppleCopyWith(this, $identity);
}

abstract class AppleCopyWith<$R> {
  factory AppleCopyWith(Apple value, Then<Apple, $R> then) = _AppleCopyWithImpl<$R>;
  $R call({bool? isRed});
  $R apply(Apple Function(Apple) transform);
}

class _AppleCopyWithImpl<$R> extends BaseCopyWith<Apple, $R> implements AppleCopyWith<$R> {
  _AppleCopyWithImpl(Apple value, Then<Apple, $R> then) : super(value, then);

  @override $R call({bool? isRed}) => $then(Apple(isRed ?? $value.isRed));
}

class CakeMapper extends BaseMapper<Cake> {
  CakeMapper._();

  @override Function get decoder => decode;
  Cake decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Cake fromMap(Map<String, dynamic> map) => Cake(Mapper.i.$get(map, 'type'));

  @override Function get encoder => (Cake v) => encode(v);
  dynamic encode(Cake v) => toMap(v);
  Map<String, dynamic> toMap(Cake c) => {'type': Mapper.i.$enc(c.type, 'type')};

  @override String stringify(Cake self) => 'Cake(type: ${Mapper.asString(self.type)})';
  @override int hash(Cake self) => Mapper.hash(self.type);
  @override bool equals(Cake self, Cake other) => Mapper.isEqual(self.type, other.type);

  @override Function get typeFactory => (f) => f<Cake>();
}

extension CakeMapperExtension  on Cake {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CakeCopyWith<Cake> get copyWith => CakeCopyWith(this, $identity);
}

abstract class CakeCopyWith<$R> {
  factory CakeCopyWith(Cake value, Then<Cake, $R> then) = _CakeCopyWithImpl<$R>;
  $R call({String? type});
  $R apply(Cake Function(Cake) transform);
}

class _CakeCopyWithImpl<$R> extends BaseCopyWith<Cake, $R> implements CakeCopyWith<$R> {
  _CakeCopyWithImpl(Cake value, Then<Cake, $R> then) : super(value, then);

  @override $R call({String? type}) => $then(Cake(type ?? $value.type));
}

class CarMapper extends BaseMapper<Car> {
  CarMapper._();

  @override Function get decoder => decode;
  Car decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Car fromMap(Map<String, dynamic> map) => Car(Mapper.i.$get(map, 'brand_name'));

  @override Function get encoder => (Car v) => encode(v);
  dynamic encode(Car v) => toMap(v);
  Map<String, dynamic> toMap(Car c) => {'brand_name': Mapper.i.$enc(c.brandName, 'brandName')};

  @override String stringify(Car self) => 'Car(brandName: ${Mapper.asString(self.brandName)})';
  @override int hash(Car self) => Mapper.hash(self.brandName);
  @override bool equals(Car self, Car other) => Mapper.isEqual(self.brandName, other.brandName);

  @override Function get typeFactory => (f) => f<Car>();
}

extension CarMapperExtension  on Car {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CarCopyWith<Car> get copyWith => CarCopyWith(this, $identity);
}

abstract class CarCopyWith<$R> {
  factory CarCopyWith(Car value, Then<Car, $R> then) = _CarCopyWithImpl<$R>;
  $R call({String? brandName});
  $R apply(Car Function(Car) transform);
}

class _CarCopyWithImpl<$R> extends BaseCopyWith<Car, $R> implements CarCopyWith<$R> {
  _CarCopyWithImpl(Car value, Then<Car, $R> then) : super(value, then);

  @override $R call({String? brandName}) => $then(Car(brandName ?? $value.brandName));
}

class AnimalMapper extends BaseMapper<Animal> {
  AnimalMapper._();

  @override Function get decoder => decode;
  Animal decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Animal fromMap(Map<String, dynamic> map) => Animal(Mapper.i.$get(map, 'color'));

  @override Function get encoder => (Animal v) => encode(v);
  dynamic encode(Animal v) => toMap(v);
  Map<String, dynamic> toMap(Animal a) => {'color': Mapper.i.$enc(a.color, 'color')};

  @override String stringify(Animal self) => 'Animal(color: ${Mapper.asString(self.color)})';
  @override int hash(Animal self) => Mapper.hash(self.color);
  @override bool equals(Animal self, Animal other) => Mapper.isEqual(self.color, other.color);

  @override Function get typeFactory => (f) => f<Animal>();
}

extension AnimalMapperExtension  on Animal {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  AnimalCopyWith<Animal> get copyWith => AnimalCopyWith(this, $identity);
}

abstract class AnimalCopyWith<$R> {
  factory AnimalCopyWith(Animal value, Then<Animal, $R> then) = _AnimalCopyWithImpl<$R>;
  $R call({String? color});
  $R apply(Animal Function(Animal) transform);
}

class _AnimalCopyWithImpl<$R> extends BaseCopyWith<Animal, $R> implements AnimalCopyWith<$R> {
  _AnimalCopyWithImpl(Animal value, Then<Animal, $R> then) : super(value, then);

  @override $R call({String? color}) => $then(Animal(color ?? $value.color));
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
