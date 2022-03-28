import 'package:dart_mappable/internals.dart';

import 'copy_with_test.dart';


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  PersonMapper._(),
  CarMapper._(),
  BrandMapper._(),
  DealershipMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class PersonMapper extends BaseMapper<Person> {
  PersonMapper._();

  @override Function get decoder => decode;
  Person decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Person fromMap(Map<String, dynamic> map) => Person(Mapper.i.$get(map, 'name'), Mapper.i.$get(map, 'car'));

  @override Function get encoder => (Person v) => encode(v);
  dynamic encode(Person v) => toMap(v);
  Map<String, dynamic> toMap(Person p) => {'name': Mapper.i.$enc(p.name, 'name'), 'car': Mapper.i.$enc(p.car, 'car')};

  @override String stringify(Person self) => 'Person(name: ${Mapper.asString(self.name)}, car: ${Mapper.asString(self.car)})';
  @override int hash(Person self) => Mapper.hash(self.name) ^ Mapper.hash(self.car);
  @override bool equals(Person self, Person other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.car, other.car);

  @override Function get typeFactory => (f) => f<Person>();
}

extension PersonMapperExtension  on Person {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  PersonCopyWith<Person> get copyWith => PersonCopyWith(this, $identity);
}

abstract class PersonCopyWith<$R> {
  factory PersonCopyWith(Person value, Then<Person, $R> then) = _PersonCopyWithImpl<$R>;
  CarCopyWith<$R> get car;
  $R call({String? name, Car? car});
  $R apply(Person Function(Person) transform);
}

class _PersonCopyWithImpl<$R> extends BaseCopyWith<Person, $R> implements PersonCopyWith<$R> {
  _PersonCopyWithImpl(Person value, Then<Person, $R> then) : super(value, then);

  @override CarCopyWith<$R> get car => CarCopyWith($value.car, (v) => call(car: v));
  @override $R call({String? name, Car? car}) => $then(Person(name ?? $value.name, car ?? $value.car));
}

class CarMapper extends BaseMapper<Car> {
  CarMapper._();

  @override Function get decoder => decode;
  Car decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Car fromMap(Map<String, dynamic> map) => Car(Mapper.i.$getOpt(map, 'brand'), Mapper.i.$get(map, 'model'));

  @override Function get encoder => (Car v) => encode(v);
  dynamic encode(Car v) => toMap(v);
  Map<String, dynamic> toMap(Car c) => {'brand': Mapper.i.$enc(c.brand, 'brand'), 'model': Mapper.i.$enc(c.model, 'model')};

  @override String stringify(Car self) => 'Car(model: ${Mapper.asString(self.model)}, brand: ${Mapper.asString(self.brand)})';
  @override int hash(Car self) => Mapper.hash(self.brand) ^ Mapper.hash(self.model);
  @override bool equals(Car self, Car other) => Mapper.isEqual(self.brand, other.brand) && Mapper.isEqual(self.model, other.model);

  @override Function get typeFactory => (f) => f<Car>();
}

extension CarMapperExtension  on Car {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CarCopyWith<Car> get copyWith => CarCopyWith(this, $identity);
}

abstract class CarCopyWith<$R> {
  factory CarCopyWith(Car value, Then<Car, $R> then) = _CarCopyWithImpl<$R>;
  BrandCopyWith<$R>? get brand;
  $R call({Brand? brand, String? model});
  $R apply(Car Function(Car) transform);
}

class _CarCopyWithImpl<$R> extends BaseCopyWith<Car, $R> implements CarCopyWith<$R> {
  _CarCopyWithImpl(Car value, Then<Car, $R> then) : super(value, then);

  @override BrandCopyWith<$R>? get brand => $value.brand != null ? BrandCopyWith($value.brand!, (v) => call(brand: v)) : null;
  @override $R call({Object? brand = $none, String? model}) => $then(Car(or(brand, $value.brand), model ?? $value.model));
}

class BrandMapper extends BaseMapper<Brand> {
  BrandMapper._();

  @override Function get decoder => decode;
  Brand decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Brand fromMap(Map<String, dynamic> map) => Brand(Mapper.i.$getOpt(map, 'name'));

  @override Function get encoder => (Brand v) => encode(v);
  dynamic encode(Brand v) => toMap(v);
  Map<String, dynamic> toMap(Brand b) => {'name': Mapper.i.$enc(b.name, 'name')};

  @override String stringify(Brand self) => 'Brand(name: ${Mapper.asString(self.name)})';
  @override int hash(Brand self) => Mapper.hash(self.name);
  @override bool equals(Brand self, Brand other) => Mapper.isEqual(self.name, other.name);

  @override Function get typeFactory => (f) => f<Brand>();
}

extension BrandMapperExtension  on Brand {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  BrandCopyWith<Brand> get copyWith => BrandCopyWith(this, $identity);
}

abstract class BrandCopyWith<$R> {
  factory BrandCopyWith(Brand value, Then<Brand, $R> then) = _BrandCopyWithImpl<$R>;
  $R call({dynamic name});
  $R apply(Brand Function(Brand) transform);
}

class _BrandCopyWithImpl<$R> extends BaseCopyWith<Brand, $R> implements BrandCopyWith<$R> {
  _BrandCopyWithImpl(Brand value, Then<Brand, $R> then) : super(value, then);

  @override $R call({Object? name = $none}) => $then(Brand(or(name, $value.name)));
}

class DealershipMapper extends BaseMapper<Dealership> {
  DealershipMapper._();

  @override Function get decoder => decode;
  Dealership decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Dealership fromMap(Map<String, dynamic> map) => Dealership(Mapper.i.$get(map, 'cars'), Mapper.i.$get(map, 'sales_rep'));

  @override Function get encoder => (Dealership v) => encode(v);
  dynamic encode(Dealership v) => toMap(v);
  Map<String, dynamic> toMap(Dealership d) => {'cars': Mapper.i.$enc(d.cars, 'cars'), 'sales_rep': Mapper.i.$enc(d.salesRep, 'salesRep')};

  @override String stringify(Dealership self) => 'Dealership(cars: ${Mapper.asString(self.cars)}, salesRep: ${Mapper.asString(self.salesRep)})';
  @override int hash(Dealership self) => Mapper.hash(self.cars) ^ Mapper.hash(self.salesRep);
  @override bool equals(Dealership self, Dealership other) => Mapper.isEqual(self.cars, other.cars) && Mapper.isEqual(self.salesRep, other.salesRep);

  @override Function get typeFactory => (f) => f<Dealership>();
}

extension DealershipMapperExtension  on Dealership {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DealershipCopyWith<Dealership> get copyWith => DealershipCopyWith(this, $identity);
}

abstract class DealershipCopyWith<$R> {
  factory DealershipCopyWith(Dealership value, Then<Dealership, $R> then) = _DealershipCopyWithImpl<$R>;
  ListCopyWith<$R, Car, CarCopyWith<$R>> get cars;
  MapCopyWith<$R, Brand, Person, PersonCopyWith<$R>> get salesRep;
  $R call({List<Car>? cars, Map<Brand, Person>? salesRep});
  $R apply(Dealership Function(Dealership) transform);
}

class _DealershipCopyWithImpl<$R> extends BaseCopyWith<Dealership, $R> implements DealershipCopyWith<$R> {
  _DealershipCopyWithImpl(Dealership value, Then<Dealership, $R> then) : super(value, then);

  @override ListCopyWith<$R, Car, CarCopyWith<$R>> get cars => ListCopyWith($value.cars, (v, t) => CarCopyWith(v, t), (v) => call(cars: v));
  @override MapCopyWith<$R, Brand, Person, PersonCopyWith<$R>> get salesRep => MapCopyWith($value.salesRep, (v, t) => PersonCopyWith(v, t), (v) => call(salesRep: v));
  @override $R call({List<Car>? cars, Map<Brand, Person>? salesRep}) => $then(Dealership(cars ?? $value.cars, salesRep ?? $value.salesRep));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




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
