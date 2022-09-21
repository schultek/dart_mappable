import 'dart:core';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'copy_with_test.dart' as p0;


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  PersonMapper._(),
  CarMapper._(),
  BrandMapper._(),
  DealershipMapper._(),
  ItemListMapper._(),
  BrandListMapper._(),
  NamedItemListMapper._(),
  KeyedItemListMapper._(),
  ComparableItemListMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class PersonMapper extends BaseMapper<p0.Person> {
  PersonMapper._();

  @override Function get decoder => decode;
  p0.Person decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Person fromMap(Map<String, dynamic> map) => p0.Person(Mapper.i.$get(map, 'name'), Mapper.i.$get(map, 'car'));

  @override Function get encoder => (p0.Person v) => encode(v);
  dynamic encode(p0.Person v) => toMap(v);
  Map<String, dynamic> toMap(p0.Person p) => {'name': Mapper.i.$enc(p.name, 'name'), 'car': Mapper.i.$enc(p.car, 'car')};

  @override String stringify(p0.Person self) => 'Person(name: ${Mapper.asString(self.name)}, car: ${Mapper.asString(self.car)})';
  @override int hash(p0.Person self) => Mapper.hash(self.name) ^ Mapper.hash(self.car);
  @override bool equals(p0.Person self, p0.Person other) => Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.car, other.car);

  @override Function get typeFactory => (f) => f<p0.Person>();
}

extension PersonMapperExtension on p0.Person {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  PersonCopyWith<p0.Person> get copyWith => PersonCopyWith(this, $identity);
}

abstract class PersonCopyWith<$R> {
  factory PersonCopyWith(p0.Person value, Then<p0.Person, $R> then) = _PersonCopyWithImpl<$R>;
  CarCopyWith<$R> get car;
  $R call({String? name, p0.Car? car});
  $R apply(p0.Person Function(p0.Person) transform);
}

class _PersonCopyWithImpl<$R> extends BaseCopyWith<p0.Person, $R> implements PersonCopyWith<$R> {
  _PersonCopyWithImpl(p0.Person value, Then<p0.Person, $R> then) : super(value, then);

  @override CarCopyWith<$R> get car => CarCopyWith($value.car, (v) => call(car: v));
  @override $R call({String? name, p0.Car? car}) => $then(p0.Person(name ?? $value.name, car ?? $value.car));
}

class CarMapper extends BaseMapper<p0.Car> {
  CarMapper._();

  @override Function get decoder => decode;
  p0.Car decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Car fromMap(Map<String, dynamic> map) => p0.Car(Mapper.i.$getOpt(map, 'brand'), Mapper.i.$get(map, 'model'));

  @override Function get encoder => (p0.Car v) => encode(v);
  dynamic encode(p0.Car v) => toMap(v);
  Map<String, dynamic> toMap(p0.Car c) => {'brand': Mapper.i.$enc(c.brand, 'brand'), 'model': Mapper.i.$enc(c.model, 'model')};

  @override String stringify(p0.Car self) => 'Car(model: ${Mapper.asString(self.model)}, brand: ${Mapper.asString(self.brand)})';
  @override int hash(p0.Car self) => Mapper.hash(self.model) ^ Mapper.hash(self.brand);
  @override bool equals(p0.Car self, p0.Car other) => Mapper.isEqual(self.model, other.model) && Mapper.isEqual(self.brand, other.brand);

  @override Function get typeFactory => (f) => f<p0.Car>();
}

extension CarMapperExtension on p0.Car {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CarCopyWith<p0.Car> get copyWith => CarCopyWith(this, $identity);
}

abstract class CarCopyWith<$R> {
  factory CarCopyWith(p0.Car value, Then<p0.Car, $R> then) = _CarCopyWithImpl<$R>;
  BrandCopyWith<$R>? get brand;
  $R call({p0.Brand? brand, String? model});
  $R apply(p0.Car Function(p0.Car) transform);
}

class _CarCopyWithImpl<$R> extends BaseCopyWith<p0.Car, $R> implements CarCopyWith<$R> {
  _CarCopyWithImpl(p0.Car value, Then<p0.Car, $R> then) : super(value, then);

  @override BrandCopyWith<$R>? get brand => $value.brand != null ? BrandCopyWith($value.brand!, (v) => call(brand: v)) : null;
  @override $R call({Object? brand = $none, String? model}) => $then(p0.Car(or(brand, $value.brand), model ?? $value.model));
}

class BrandMapper extends BaseMapper<p0.Brand> {
  BrandMapper._();

  @override Function get decoder => decode;
  p0.Brand decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Brand fromMap(Map<String, dynamic> map) => p0.Brand(Mapper.i.$getOpt(map, 'name'));

  @override Function get encoder => (p0.Brand v) => encode(v);
  dynamic encode(p0.Brand v) => toMap(v);
  Map<String, dynamic> toMap(p0.Brand b) => {'name': Mapper.i.$enc(b.name, 'name')};

  @override String stringify(p0.Brand self) => 'Brand(name: ${Mapper.asString(self.name)})';
  @override int hash(p0.Brand self) => Mapper.hash(self.name);
  @override bool equals(p0.Brand self, p0.Brand other) => Mapper.isEqual(self.name, other.name);

  @override Function get typeFactory => (f) => f<p0.Brand>();
}

extension BrandMapperExtension on p0.Brand {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  BrandCopyWith<p0.Brand> get copyWith => BrandCopyWith(this, $identity);
}

abstract class BrandCopyWith<$R> {
  factory BrandCopyWith(p0.Brand value, Then<p0.Brand, $R> then) = _BrandCopyWithImpl<$R>;
  $R call({dynamic name});
  $R apply(p0.Brand Function(p0.Brand) transform);
}

class _BrandCopyWithImpl<$R> extends BaseCopyWith<p0.Brand, $R> implements BrandCopyWith<$R> {
  _BrandCopyWithImpl(p0.Brand value, Then<p0.Brand, $R> then) : super(value, then);

  @override $R call({Object? name = $none}) => $then(p0.Brand(or(name, $value.name)));
}

class DealershipMapper extends BaseMapper<p0.Dealership> {
  DealershipMapper._();

  @override Function get decoder => decode;
  p0.Dealership decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Dealership fromMap(Map<String, dynamic> map) => p0.Dealership(Mapper.i.$get(map, 'cars'), Mapper.i.$get(map, 'sales_rep'));

  @override Function get encoder => (p0.Dealership v) => encode(v);
  dynamic encode(p0.Dealership v) => toMap(v);
  Map<String, dynamic> toMap(p0.Dealership d) => {'cars': Mapper.i.$enc(d.cars, 'cars'), 'sales_rep': Mapper.i.$enc(d.salesRep, 'salesRep')};

  @override String stringify(p0.Dealership self) => 'Dealership(cars: ${Mapper.asString(self.cars)}, salesRep: ${Mapper.asString(self.salesRep)})';
  @override int hash(p0.Dealership self) => Mapper.hash(self.cars) ^ Mapper.hash(self.salesRep);
  @override bool equals(p0.Dealership self, p0.Dealership other) => Mapper.isEqual(self.cars, other.cars) && Mapper.isEqual(self.salesRep, other.salesRep);

  @override Function get typeFactory => (f) => f<p0.Dealership>();
}

extension DealershipMapperExtension on p0.Dealership {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  DealershipCopyWith<p0.Dealership> get copyWith => DealershipCopyWith(this, $identity);
}

abstract class DealershipCopyWith<$R> {
  factory DealershipCopyWith(p0.Dealership value, Then<p0.Dealership, $R> then) = _DealershipCopyWithImpl<$R>;
  ListCopyWith<$R, p0.Car, CarCopyWith<$R>> get cars;
  MapCopyWith<$R, p0.Brand, p0.Person?, PersonCopyWith<$R>?> get salesRep;
  $R call({List<p0.Car>? cars, Map<p0.Brand, p0.Person?>? salesRep});
  $R apply(p0.Dealership Function(p0.Dealership) transform);
}

class _DealershipCopyWithImpl<$R> extends BaseCopyWith<p0.Dealership, $R> implements DealershipCopyWith<$R> {
  _DealershipCopyWithImpl(p0.Dealership value, Then<p0.Dealership, $R> then) : super(value, then);

  @override ListCopyWith<$R, p0.Car, CarCopyWith<$R>> get cars => ListCopyWith($value.cars, (v, t) => CarCopyWith(v, t), (v) => call(cars: v));
  @override MapCopyWith<$R, p0.Brand, p0.Person?, PersonCopyWith<$R>?> get salesRep => MapCopyWith($value.salesRep, (v, t) => v == null ? null : PersonCopyWith(v, t), (v) => call(salesRep: v));
  @override $R call({List<p0.Car>? cars, Map<p0.Brand, p0.Person?>? salesRep}) => $then(p0.Dealership(cars ?? $value.cars, salesRep ?? $value.salesRep));
}

class ItemListMapper extends BaseMapper<p0.ItemList> {
  ItemListMapper._();

  @override Function get decoder => decode;
  p0.ItemList<T> decode<T>(dynamic v) => checked(v, (Map<String, dynamic> map) {
    switch(map['type']) {
      case 'BrandList': return BrandListMapper._().decode(map) as p0.ItemList<T>;
      case 'ComparableItemList': return ComparableItemListMapper._().decode(map) as p0.ItemList<T>;
      case 'KeyedItemList': return KeyedItemListMapper._().decode(map) as p0.ItemList<T>;
      case 'NamedItemList': return NamedItemListMapper._().decode(map) as p0.ItemList<T>;
      default: return fromMap<T>(map);
    }
  });
  p0.ItemList<T> fromMap<T>(Map<String, dynamic> map) => p0.ItemList(Mapper.i.$getOpt(map, 'items'));

  @override Function get encoder => (p0.ItemList v) => encode(v);
  dynamic encode(p0.ItemList v) {
    if (v is p0.BrandList) { return BrandListMapper._().encode(v); }
    else if (v is p0.ComparableItemList) { return ComparableItemListMapper._().encode(v); }
    else if (v is p0.NamedItemList) { return NamedItemListMapper._().encode(v); }
    else if (v is p0.KeyedItemList) { return KeyedItemListMapper._().encode(v); }
    else { return toMap(v); }
  }
  Map<String, dynamic> toMap(p0.ItemList i) => {'items': Mapper.i.$enc(i.items, 'items')};

  @override String stringify(p0.ItemList self) => 'ItemList(items: ${Mapper.asString(self.items)})';
  @override int hash(p0.ItemList self) => Mapper.hash(self.items);
  @override bool equals(p0.ItemList self, p0.ItemList other) => Mapper.isEqual(self.items, other.items);

  @override Function get typeFactory => <T>(f) => f<p0.ItemList<T>>();
}

extension ItemListMapperExtension<T> on p0.ItemList<T> {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ItemListCopyWith<p0.ItemList<T>, T> get copyWith => ItemListCopyWith(this, $identity);
}

abstract class ItemListCopyWith<$R, T> {
  factory ItemListCopyWith(p0.ItemList<T> value, Then<p0.ItemList<T>, $R> then) {
    if (T >: p0.BrandList) { return BrandListCopyWith<$R>(value as p0.BrandList, then as Then<p0.BrandList, $R>) as ItemListCopyWith<$R, T>; }
    else if (value is p0.ComparableItemList<Comparable>) { return ComparableItemListCopyWith<$R, T>(value, then); }
    else if (value is p0.NamedItemList<T>) { return NamedItemListCopyWith(value, then); }
    else if (value is p0.KeyedItemList<dynamic, T>) { return KeyedItemListCopyWith(value, then); }
    else { return _ItemListCopyWithImpl<$R, T>(value, then); }
  }
  $R call({List<T>? items});
}

class _ItemListCopyWithImpl<$R, T> extends BaseCopyWith<p0.ItemList<T>, $R> implements ItemListCopyWith<$R, T> {
  _ItemListCopyWithImpl(p0.ItemList<T> value, Then<p0.ItemList<T>, $R> then) : super(value, then);

  @override $R call({Object? items = $none}) => $then(p0.ItemList(or(items, $value.items)));
}

class BrandListMapper extends BaseMapper<p0.BrandList> {
  BrandListMapper._();

  @override Function get decoder => decode;
  p0.BrandList decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.BrandList fromMap(Map<String, dynamic> map) => p0.BrandList(Mapper.i.$getOpt(map, 'brands'));

  @override Function get encoder => (p0.BrandList v) => encode(v);
  dynamic encode(p0.BrandList v) => toMap(v);
  Map<String, dynamic> toMap(p0.BrandList b) => {'brands': Mapper.i.$enc(b.items, 'items'), 'type': 'BrandList'};

  @override String stringify(p0.BrandList self) => 'BrandList(items: ${Mapper.asString(self.items)})';
  @override int hash(p0.BrandList self) => Mapper.hash(self.items);
  @override bool equals(p0.BrandList self, p0.BrandList other) => Mapper.isEqual(self.items, other.items);

  @override Function get typeFactory => (f) => f<p0.BrandList>();
}

extension BrandListMapperExtension on p0.BrandList {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  BrandListCopyWith<p0.BrandList> get copyWith => BrandListCopyWith(this, $identity);
}

abstract class BrandListCopyWith<$R> implements ItemListCopyWith<$R, p0.Brand?> {
  factory BrandListCopyWith(p0.BrandList value, Then<p0.BrandList, $R> then) = _BrandListCopyWithImpl<$R>;
  ListCopyWith<$R, p0.Brand?, BrandCopyWith<$R>?> get items;
  @override $R call({List<p0.Brand?>? brands});
  $R apply(p0.BrandList Function(p0.BrandList) transform);
}

class _BrandListCopyWithImpl<$R> extends BaseCopyWith<p0.BrandList, $R> implements BrandListCopyWith<$R> {
  _BrandListCopyWithImpl(p0.BrandList value, Then<p0.BrandList, $R> then) : super(value, then);

  @override ListCopyWith<$R, p0.Brand?, BrandCopyWith<$R>?> get items => ListCopyWith($value.items, (v, t) => v == null ? null : BrandCopyWith(v, t), (v) => call(brands: v));
  @override $R call({Object? brands = $none}) => $then(p0.BrandList(or(brands, $value.items)));
}

class NamedItemListMapper extends BaseMapper<p0.NamedItemList> {
  NamedItemListMapper._();

  @override Function get decoder => decode;
  p0.NamedItemList<T> decode<T>(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap<T>(map));
  p0.NamedItemList<T> fromMap<T>(Map<String, dynamic> map) => p0.NamedItemList(Mapper.i.$get(map, 'name'), Mapper.i.$getOpt(map, 'items'));

  @override Function get encoder => (p0.NamedItemList v) => encode(v);
  dynamic encode(p0.NamedItemList v) => toMap(v);
  Map<String, dynamic> toMap(p0.NamedItemList n) => {'name': Mapper.i.$enc(n.name, 'name'), 'items': Mapper.i.$enc(n.items, 'items'), 'type': 'NamedItemList'};

  @override String stringify(p0.NamedItemList self) => 'NamedItemList(items: ${Mapper.asString(self.items)}, name: ${Mapper.asString(self.name)})';
  @override int hash(p0.NamedItemList self) => Mapper.hash(self.items) ^ Mapper.hash(self.name);
  @override bool equals(p0.NamedItemList self, p0.NamedItemList other) => Mapper.isEqual(self.items, other.items) && Mapper.isEqual(self.name, other.name);

  @override Function get typeFactory => <T>(f) => f<p0.NamedItemList<T>>();
}

extension NamedItemListMapperExtension<T> on p0.NamedItemList<T> {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  NamedItemListCopyWith<p0.NamedItemList<T>, T> get copyWith => NamedItemListCopyWith(this, $identity);
}

abstract class NamedItemListCopyWith<$R, T> implements ItemListCopyWith<$R, T> {
  factory NamedItemListCopyWith(p0.NamedItemList<T> value, Then<p0.NamedItemList<T>, $R> then) = _NamedItemListCopyWithImpl<$R, T>;
  @override $R call({String? name, List<T>? items});
  $R apply(p0.NamedItemList<T> Function(p0.NamedItemList<T>) transform);
}

class _NamedItemListCopyWithImpl<$R, T> extends BaseCopyWith<p0.NamedItemList<T>, $R> implements NamedItemListCopyWith<$R, T> {
  _NamedItemListCopyWithImpl(p0.NamedItemList<T> value, Then<p0.NamedItemList<T>, $R> then) : super(value, then);

  @override $R call({String? name, Object? items = $none}) => $then(p0.NamedItemList(name ?? $value.name, or(items, $value.items)));
}

class KeyedItemListMapper extends BaseMapper<p0.KeyedItemList> {
  KeyedItemListMapper._();

  @override Function get decoder => decode;
  p0.KeyedItemList<K, T> decode<K, T>(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap<K, T>(map));
  p0.KeyedItemList<K, T> fromMap<K, T>(Map<String, dynamic> map) => p0.KeyedItemList(Mapper.i.$get(map, 'key'), Mapper.i.$getOpt(map, 'items'));

  @override Function get encoder => (p0.KeyedItemList v) => encode(v);
  dynamic encode(p0.KeyedItemList v) => toMap(v);
  Map<String, dynamic> toMap(p0.KeyedItemList k) => {'key': Mapper.i.$enc(k.key, 'key'), 'items': Mapper.i.$enc(k.items, 'items'), 'type': 'KeyedItemList'};

  @override String stringify(p0.KeyedItemList self) => 'KeyedItemList(items: ${Mapper.asString(self.items)}, key: ${Mapper.asString(self.key)})';
  @override int hash(p0.KeyedItemList self) => Mapper.hash(self.items) ^ Mapper.hash(self.key);
  @override bool equals(p0.KeyedItemList self, p0.KeyedItemList other) => Mapper.isEqual(self.items, other.items) && Mapper.isEqual(self.key, other.key);

  @override Function get typeFactory => <K, T>(f) => f<p0.KeyedItemList<K, T>>();
}

extension KeyedItemListMapperExtension<K, T> on p0.KeyedItemList<K, T> {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  KeyedItemListCopyWith<p0.KeyedItemList<K, T>, K, T> get copyWith => KeyedItemListCopyWith(this, $identity);
}

abstract class KeyedItemListCopyWith<$R, K, T> implements ItemListCopyWith<$R, T> {
  factory KeyedItemListCopyWith(p0.KeyedItemList<K, T> value, Then<p0.KeyedItemList<K, T>, $R> then) = _KeyedItemListCopyWithImpl<$R, K, T>;
  @override $R call({K? key, List<T>? items});
  $R apply(p0.KeyedItemList<K, T> Function(p0.KeyedItemList<K, T>) transform);
}

class _KeyedItemListCopyWithImpl<$R, K, T> extends BaseCopyWith<p0.KeyedItemList<K, T>, $R> implements KeyedItemListCopyWith<$R, K, T> {
  _KeyedItemListCopyWithImpl(p0.KeyedItemList<K, T> value, Then<p0.KeyedItemList<K, T>, $R> then) : super(value, then);

  @override $R call({K? key, Object? items = $none}) => $then(p0.KeyedItemList(key ?? $value.key, or(items, $value.items)));
}

class ComparableItemListMapper extends BaseMapper<p0.ComparableItemList> {
  ComparableItemListMapper._();

  @override Function get decoder => decode;
  p0.ComparableItemList<T> decode<T extends Comparable<dynamic>>(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap<T>(map));
  p0.ComparableItemList<T> fromMap<T extends Comparable<dynamic>>(Map<String, dynamic> map) => p0.ComparableItemList(Mapper.i.$getOpt(map, 'items'));

  @override Function get encoder => (p0.ComparableItemList v) => encode(v);
  dynamic encode(p0.ComparableItemList v) => toMap(v);
  Map<String, dynamic> toMap(p0.ComparableItemList c) => {'items': Mapper.i.$enc(c.items, 'items'), 'type': 'ComparableItemList'};

  @override String stringify(p0.ComparableItemList self) => 'ComparableItemList(items: ${Mapper.asString(self.items)})';
  @override int hash(p0.ComparableItemList self) => Mapper.hash(self.items);
  @override bool equals(p0.ComparableItemList self, p0.ComparableItemList other) => Mapper.isEqual(self.items, other.items);

  @override Function get typeFactory => <T extends Comparable<dynamic>>(f) => f<p0.ComparableItemList<T>>();
}

extension ComparableItemListMapperExtension<T extends Comparable<dynamic>> on p0.ComparableItemList<T> {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ComparableItemListCopyWith<p0.ComparableItemList<T>, T> get copyWith => ComparableItemListCopyWith(this, $identity);
}

abstract class ComparableItemListCopyWith<$R, T extends Comparable<dynamic>> implements ItemListCopyWith<$R, T> {
  factory ComparableItemListCopyWith(p0.ComparableItemList<T> value, Then<p0.ComparableItemList<T>, $R> then) = _ComparableItemListCopyWithImpl<$R, T>;
  @override $R call({List<T>? items});
  $R apply(p0.ComparableItemList<T> Function(p0.ComparableItemList<T>) transform);
}

class _ComparableItemListCopyWithImpl<$R, T extends Comparable<dynamic>> extends BaseCopyWith<p0.ComparableItemList<T>, $R> implements ComparableItemListCopyWith<$R, T> {
  _ComparableItemListCopyWithImpl(p0.ComparableItemList<T> value, Then<p0.ComparableItemList<T>, $R> then) : super(value, then);

  @override $R call({Object? items = $none}) => $then(p0.ComparableItemList(or(items, $value.items)));
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
