// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'copy_with_test.dart';

class PersonMapper extends MapperBase<Person> {
  static MapperContainer container = MapperContainer(
    mappers: {PersonMapper()},
    link: {CarMapper.container},
  );

  @override
  PersonMapperElement createElement(MapperContainer container) {
    return PersonMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<Person>;
  static final fromJson = container.fromJson<Person>;
}

class PersonMapperElement extends MapperElementBase<Person> {
  PersonMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  Person decode(dynamic v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Person fromMap(Map<String, dynamic> map) => Person(container.$get(map, 'name'), container.$get(map, 'car'));

  @override Function get encoder => encode;
  dynamic encode(Person v) => toMap(v);
  Map<String, dynamic> toMap(Person p) => {'name': container.$enc(p.name, 'name'), 'car': container.$enc(p.car, 'car')};

  @override String stringify(Person self) => 'Person(name: ${container.asString(self.name)}, car: ${container.asString(self.car)})';
  @override int hash(Person self) => container.hash(self.name) ^ container.hash(self.car);
  @override bool equals(Person self, Person other) => container.isEqual(self.name, other.name) && container.isEqual(self.car, other.car);
}

mixin PersonMappable {
  String toJson() => PersonMapper.container.toJson(this as Person);
  Map<String, dynamic> toMap() => PersonMapper.container.toMap(this as Person);
  PersonCopyWith<Person, Person, Person> get copyWith => _PersonCopyWithImpl(this as Person, $identity, $identity);
  @override String toString() => PersonMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && PersonMapper.container.isEqual(this, other));
  @override int get hashCode => PersonMapper.container.hash(this);
}

extension PersonValueCopy<$R, $Out extends Person> on ObjectCopyWith<$R, Person, $Out> {
  PersonCopyWith<$R, Person, $Out> get asPerson => base.as((v, t, t2) => _PersonCopyWithImpl(v, t, t2));
}

typedef PersonCopyWithBound = Person;
abstract class PersonCopyWith<$R, $In extends Person, $Out extends Person> implements ObjectCopyWith<$R, $In, $Out> {
  PersonCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Person>(Then<Person, $Out2> t, Then<$Out2, $R2> t2);
  CarCopyWith<$R, Car, Car> get car;
  $R call({String? name, Car? car});
}

class _PersonCopyWithImpl<$R, $Out extends Person> extends CopyWithBase<$R, Person, $Out> implements PersonCopyWith<$R, Person, $Out> {
  _PersonCopyWithImpl(super.value, super.then, super.then2);
  @override PersonCopyWith<$R2, Person, $Out2> chain<$R2, $Out2 extends Person>(Then<Person, $Out2> t, Then<$Out2, $R2> t2) => _PersonCopyWithImpl($value, t, t2);

  @override CarCopyWith<$R, Car, Car> get car => $value.car.copyWith.chain($identity, (v) => call(car: v));
  @override $R call({String? name, Car? car}) => $then(Person(name ?? $value.name, car ?? $value.car));
}

class CarMapper extends MapperBase<Car> {
  static MapperContainer container = MapperContainer(
    mappers: {CarMapper()},
    link: {BrandMapper.container},
  );

  @override
  CarMapperElement createElement(MapperContainer container) {
    return CarMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<Car>;
  static final fromJson = container.fromJson<Car>;
}

class CarMapperElement extends MapperElementBase<Car> {
  CarMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  Car decode(dynamic v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Car fromMap(Map<String, dynamic> map) => Car(container.$getOpt(map, 'brand'), container.$get(map, 'model'));

  @override Function get encoder => encode;
  dynamic encode(Car v) => toMap(v);
  Map<String, dynamic> toMap(Car c) => {'brand': container.$enc(c.brand, 'brand'), 'model': container.$enc(c.model, 'model')};

  @override String stringify(Car self) => 'Car(model: ${container.asString(self.model)}, brand: ${container.asString(self.brand)})';
  @override int hash(Car self) => container.hash(self.model) ^ container.hash(self.brand);
  @override bool equals(Car self, Car other) => container.isEqual(self.model, other.model) && container.isEqual(self.brand, other.brand);
}

mixin CarMappable {
  String toJson() => CarMapper.container.toJson(this as Car);
  Map<String, dynamic> toMap() => CarMapper.container.toMap(this as Car);
  CarCopyWith<Car, Car, Car> get copyWith => _CarCopyWithImpl(this as Car, $identity, $identity);
  @override String toString() => CarMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && CarMapper.container.isEqual(this, other));
  @override int get hashCode => CarMapper.container.hash(this);
}

extension CarValueCopy<$R, $Out extends Car> on ObjectCopyWith<$R, Car, $Out> {
  CarCopyWith<$R, Car, $Out> get asCar => base.as((v, t, t2) => _CarCopyWithImpl(v, t, t2));
}

typedef CarCopyWithBound = Car;
abstract class CarCopyWith<$R, $In extends Car, $Out extends Car> implements ObjectCopyWith<$R, $In, $Out> {
  CarCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Car>(Then<Car, $Out2> t, Then<$Out2, $R2> t2);
  BrandCopyWith<$R, Brand, Brand>? get brand;
  $R call({Brand? brand, String? model});
}

class _CarCopyWithImpl<$R, $Out extends Car> extends CopyWithBase<$R, Car, $Out> implements CarCopyWith<$R, Car, $Out> {
  _CarCopyWithImpl(super.value, super.then, super.then2);
  @override CarCopyWith<$R2, Car, $Out2> chain<$R2, $Out2 extends Car>(Then<Car, $Out2> t, Then<$Out2, $R2> t2) => _CarCopyWithImpl($value, t, t2);

  @override BrandCopyWith<$R, Brand, Brand>? get brand => $value.brand?.copyWith.chain($identity, (v) => call(brand: v));
  @override $R call({Object? brand = $none, String? model}) => $then(Car(or(brand, $value.brand), model ?? $value.model));
}

class BrandMapper extends MapperBase<Brand> {
  static MapperContainer container = MapperContainer(
    mappers: {BrandMapper()},
  );

  @override
  BrandMapperElement createElement(MapperContainer container) {
    return BrandMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<Brand>;
  static final fromJson = container.fromJson<Brand>;
}

class BrandMapperElement extends MapperElementBase<Brand> {
  BrandMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  Brand decode(dynamic v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Brand fromMap(Map<String, dynamic> map) => Brand(container.$getOpt(map, 'name'));

  @override Function get encoder => encode;
  dynamic encode(Brand v) => toMap(v);
  Map<String, dynamic> toMap(Brand b) => {'name': container.$enc(b.name, 'name')};

  @override String stringify(Brand self) => 'Brand(name: ${container.asString(self.name)})';
  @override int hash(Brand self) => container.hash(self.name);
  @override bool equals(Brand self, Brand other) => container.isEqual(self.name, other.name);
}

mixin BrandMappable {
  String toJson() => BrandMapper.container.toJson(this as Brand);
  Map<String, dynamic> toMap() => BrandMapper.container.toMap(this as Brand);
  BrandCopyWith<Brand, Brand, Brand> get copyWith => _BrandCopyWithImpl(this as Brand, $identity, $identity);
  @override String toString() => BrandMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && BrandMapper.container.isEqual(this, other));
  @override int get hashCode => BrandMapper.container.hash(this);
}

extension BrandValueCopy<$R, $Out extends Brand> on ObjectCopyWith<$R, Brand, $Out> {
  BrandCopyWith<$R, Brand, $Out> get asBrand => base.as((v, t, t2) => _BrandCopyWithImpl(v, t, t2));
}

typedef BrandCopyWithBound = Brand;
abstract class BrandCopyWith<$R, $In extends Brand, $Out extends Brand> implements ObjectCopyWith<$R, $In, $Out> {
  BrandCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Brand>(Then<Brand, $Out2> t, Then<$Out2, $R2> t2);
  $R call({dynamic name});
}

class _BrandCopyWithImpl<$R, $Out extends Brand> extends CopyWithBase<$R, Brand, $Out> implements BrandCopyWith<$R, Brand, $Out> {
  _BrandCopyWithImpl(super.value, super.then, super.then2);
  @override BrandCopyWith<$R2, Brand, $Out2> chain<$R2, $Out2 extends Brand>(Then<Brand, $Out2> t, Then<$Out2, $R2> t2) => _BrandCopyWithImpl($value, t, t2);

  @override $R call({Object? name = $none}) => $then(Brand(or(name, $value.name)));
}

class DealershipMapper extends MapperBase<Dealership> {
  static MapperContainer container = MapperContainer(
    mappers: {DealershipMapper()},
  );

  @override
  DealershipMapperElement createElement(MapperContainer container) {
    return DealershipMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<Dealership>;
  static final fromJson = container.fromJson<Dealership>;
}

class DealershipMapperElement extends MapperElementBase<Dealership> {
  DealershipMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  Dealership decode(dynamic v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Dealership fromMap(Map<String, dynamic> map) => Dealership(container.$get(map, 'cars'), container.$get(map, 'salesRep'));

  @override Function get encoder => encode;
  dynamic encode(Dealership v) => toMap(v);
  Map<String, dynamic> toMap(Dealership d) => {'cars': container.$enc(d.cars, 'cars'), 'salesRep': container.$enc(d.salesRep, 'salesRep')};

  @override String stringify(Dealership self) => 'Dealership(cars: ${container.asString(self.cars)}, salesRep: ${container.asString(self.salesRep)})';
  @override int hash(Dealership self) => container.hash(self.cars) ^ container.hash(self.salesRep);
  @override bool equals(Dealership self, Dealership other) => container.isEqual(self.cars, other.cars) && container.isEqual(self.salesRep, other.salesRep);
}

mixin DealershipMappable {
  String toJson() => DealershipMapper.container.toJson(this as Dealership);
  Map<String, dynamic> toMap() => DealershipMapper.container.toMap(this as Dealership);
  DealershipCopyWith<Dealership, Dealership, Dealership> get copyWith => _DealershipCopyWithImpl(this as Dealership, $identity, $identity);
  @override String toString() => DealershipMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && DealershipMapper.container.isEqual(this, other));
  @override int get hashCode => DealershipMapper.container.hash(this);
}

extension DealershipValueCopy<$R, $Out extends Dealership> on ObjectCopyWith<$R, Dealership, $Out> {
  DealershipCopyWith<$R, Dealership, $Out> get asDealership => base.as((v, t, t2) => _DealershipCopyWithImpl(v, t, t2));
}

typedef DealershipCopyWithBound = Dealership;
abstract class DealershipCopyWith<$R, $In extends Dealership, $Out extends Dealership> implements ObjectCopyWith<$R, $In, $Out> {
  DealershipCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Dealership>(Then<Dealership, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, Car, CarCopyWith<$R, Car, Car>> get cars;
  MapCopyWith<$R, Brand, Person?, PersonCopyWith<$R, Person, Person>?> get salesRep;
  $R call({List<Car>? cars, Map<Brand, Person?>? salesRep});
}

class _DealershipCopyWithImpl<$R, $Out extends Dealership> extends CopyWithBase<$R, Dealership, $Out> implements DealershipCopyWith<$R, Dealership, $Out> {
  _DealershipCopyWithImpl(super.value, super.then, super.then2);
  @override DealershipCopyWith<$R2, Dealership, $Out2> chain<$R2, $Out2 extends Dealership>(Then<Dealership, $Out2> t, Then<$Out2, $R2> t2) => _DealershipCopyWithImpl($value, t, t2);

  @override ListCopyWith<$R, Car, CarCopyWith<$R, Car, Car>> get cars => ListCopyWith($value.cars, (v, t) => v.copyWith.chain($identity, t), (v) => call(cars: v));
  @override MapCopyWith<$R, Brand, Person?, PersonCopyWith<$R, Person, Person>?> get salesRep => MapCopyWith($value.salesRep, (v, t) => v?.copyWith.chain($identity, t), (v) => call(salesRep: v));
  @override $R call({List<Car>? cars, Map<Brand, Person?>? salesRep}) => $then(Dealership(cars ?? $value.cars, salesRep ?? $value.salesRep));
}

class ItemListMapper extends MapperBase<ItemList> {
  static MapperContainer container = MapperContainer(
    mappers: {ItemListMapper()},
    link: {
      BrandListMapper.container,
      NamedItemListMapper.container,
      KeyedItemListMapper.container,
      ComparableItemListMapper.container,
    },
  );

  @override
  ItemListMapperElement createElement(MapperContainer container) {
    return ItemListMapperElement._(this, container);
  }


  @override Function get typeFactory => <T>(f) => f<ItemList<T>>();
  static final fromMap = container.fromMap<ItemList>;
  static final fromJson = container.fromJson<ItemList>;
}

class ItemListMapperElement extends MapperElementBase<ItemList> {
  ItemListMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  ItemList<T> decode<T>(dynamic v) => checkedType(v, (Map<String, dynamic> map) {
    switch(map['type']) {
      case 'BrandList': return BrandListMapper().createElement(container).decode(map) as ItemList<T>;
      case 'ComparableItemList': return ComparableItemListMapper().createElement(container).decode(map) as ItemList<T>;
      case 'KeyedItemList': return KeyedItemListMapper().createElement(container).decode(map) as ItemList<T>;
      case 'NamedItemList': return NamedItemListMapper().createElement(container).decode(map) as ItemList<T>;
      default: return fromMap<T>(map);
    }
  });
  ItemList<T> fromMap<T>(Map<String, dynamic> map) => throw MapperException.missingSubclass('ItemList', 'type', '${map['type']}');

  @override Function get encoder => encode;
  dynamic encode<T>(ItemList<T> v) => toMap<T>(v);
  Map<String, dynamic> toMap<T>(ItemList<T> i) => {'items': container.$enc(i.items, 'items'), ...container.$type<ItemList<T>>(i)};

  @override String stringify(ItemList self) => 'ItemList(items: ${container.asString(self.items)})';
  @override int hash(ItemList self) => container.hash(self.items);
  @override bool equals(ItemList self, ItemList other) => container.isEqual(self.items, other.items);
}

mixin ItemListMappable<T> {
  String toJson();
  Map<String, dynamic> toMap();
  ItemListCopyWith<ItemList<T>, ItemList<T>, ItemList<T>, T> get copyWith;
}

typedef ItemListCopyWithBound = ItemList;
abstract class ItemListCopyWith<$R, $In extends ItemList<T>, $Out extends ItemList, T> implements ObjectCopyWith<$R, $In, $Out> {
  ItemListCopyWith<$R2, $In, $Out2, T> chain<$R2, $Out2 extends ItemList>(Then<ItemList<T>, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>?> get items;
  $R call({List<T>? items});
}


class BrandListMapper extends MapperBase<BrandList> {
  static MapperContainer container = MapperContainer(
    mappers: {BrandListMapper()},
  );

  @override
  BrandListMapperElement createElement(MapperContainer container) {
    return BrandListMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<BrandList>;
  static final fromJson = container.fromJson<BrandList>;
}

class BrandListMapperElement extends MapperElementBase<BrandList> {
  BrandListMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  BrandList decode(dynamic v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  BrandList fromMap(Map<String, dynamic> map) => BrandList(container.$getOpt(map, 'brands'));

  @override Function get encoder => encode;
  dynamic encode(BrandList v) => toMap(v);
  Map<String, dynamic> toMap(BrandList b) => {'brands': container.$enc(b.items, 'items'), 'type': 'BrandList'};

  @override String stringify(BrandList self) => 'BrandList(items: ${container.asString(self.items)})';
  @override int hash(BrandList self) => container.hash(self.items);
  @override bool equals(BrandList self, BrandList other) => container.isEqual(self.items, other.items);
}

mixin BrandListMappable {
  String toJson() => BrandListMapper.container.toJson(this as BrandList);
  Map<String, dynamic> toMap() => BrandListMapper.container.toMap(this as BrandList);
  BrandListCopyWith<BrandList, BrandList, BrandList> get copyWith => _BrandListCopyWithImpl(this as BrandList, $identity, $identity);
  @override String toString() => BrandListMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && BrandListMapper.container.isEqual(this, other));
  @override int get hashCode => BrandListMapper.container.hash(this);
}

extension BrandListValueCopy<$R, $Out extends ItemList> on ObjectCopyWith<$R, BrandList, $Out> {
  BrandListCopyWith<$R, BrandList, $Out> get asBrandList => base.as((v, t, t2) => _BrandListCopyWithImpl(v, t, t2));
}

typedef BrandListCopyWithBound = ItemList;
abstract class BrandListCopyWith<$R, $In extends BrandList, $Out extends ItemList> implements ItemListCopyWith<$R, $In, $Out, Brand?> {
  BrandListCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends ItemList>(Then<BrandList, $Out2> t, Then<$Out2, $R2> t2);
  @override ListCopyWith<$R, Brand?, BrandCopyWith<$R, Brand, Brand>?> get items;
  @override $R call({List<Brand?>? items});
}

class _BrandListCopyWithImpl<$R, $Out extends ItemList> extends CopyWithBase<$R, BrandList, $Out> implements BrandListCopyWith<$R, BrandList, $Out> {
  _BrandListCopyWithImpl(super.value, super.then, super.then2);
  @override BrandListCopyWith<$R2, BrandList, $Out2> chain<$R2, $Out2 extends ItemList>(Then<BrandList, $Out2> t, Then<$Out2, $R2> t2) => _BrandListCopyWithImpl($value, t, t2);

  @override ListCopyWith<$R, Brand?, BrandCopyWith<$R, Brand, Brand>?> get items => ListCopyWith($value.items, (v, t) => v?.copyWith.chain($identity, t), (v) => call(items: v));
  @override $R call({Object? items = $none}) => $then(BrandList(or(items, $value.items)));
}

class NamedItemListMapper extends MapperBase<NamedItemList> {
  static MapperContainer container = MapperContainer(
    mappers: {NamedItemListMapper()},
  );

  @override
  NamedItemListMapperElement createElement(MapperContainer container) {
    return NamedItemListMapperElement._(this, container);
  }


  @override Function get typeFactory => <T>(f) => f<NamedItemList<T>>();
  static final fromMap = container.fromMap<NamedItemList>;
  static final fromJson = container.fromJson<NamedItemList>;
}

class NamedItemListMapperElement extends MapperElementBase<NamedItemList> {
  NamedItemListMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  NamedItemList<T> decode<T>(dynamic v) => checkedType(v, (Map<String, dynamic> map) => fromMap<T>(map));
  NamedItemList<T> fromMap<T>(Map<String, dynamic> map) => NamedItemList(container.$get(map, 'name'), container.$getOpt(map, 'items'));

  @override Function get encoder => encode;
  dynamic encode<T>(NamedItemList<T> v) => toMap<T>(v);
  Map<String, dynamic> toMap<T>(NamedItemList<T> n) => {'name': container.$enc(n.name, 'name'), 'items': container.$enc(n.items, 'items'), 'type': 'NamedItemList', ...container.$type<NamedItemList<T>>(n)};

  @override String stringify(NamedItemList self) => 'NamedItemList(items: ${container.asString(self.items)}, name: ${container.asString(self.name)})';
  @override int hash(NamedItemList self) => container.hash(self.items) ^ container.hash(self.name);
  @override bool equals(NamedItemList self, NamedItemList other) => container.isEqual(self.items, other.items) && container.isEqual(self.name, other.name);
}

mixin NamedItemListMappable<T> {
  String toJson() => NamedItemListMapper.container.toJson(this as NamedItemList<T>);
  Map<String, dynamic> toMap() => NamedItemListMapper.container.toMap(this as NamedItemList<T>);
  NamedItemListCopyWith<NamedItemList<T>, NamedItemList<T>, NamedItemList<T>, T> get copyWith => _NamedItemListCopyWithImpl(this as NamedItemList<T>, $identity, $identity);
  @override String toString() => NamedItemListMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && NamedItemListMapper.container.isEqual(this, other));
  @override int get hashCode => NamedItemListMapper.container.hash(this);
}

extension NamedItemListValueCopy<$R, $Out extends ItemList, T> on ObjectCopyWith<$R, NamedItemList<T>, $Out> {
  NamedItemListCopyWith<$R, NamedItemList<T>, $Out, T> get asNamedItemList => base.as((v, t, t2) => _NamedItemListCopyWithImpl(v, t, t2));
}

typedef NamedItemListCopyWithBound = ItemList;
abstract class NamedItemListCopyWith<$R, $In extends NamedItemList<T>, $Out extends ItemList, T> implements ItemListCopyWith<$R, $In, $Out, T> {
  NamedItemListCopyWith<$R2, $In, $Out2, T> chain<$R2, $Out2 extends ItemList>(Then<NamedItemList<T>, $Out2> t, Then<$Out2, $R2> t2);
  @override ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items;
  @override $R call({String? name, List<T>? items});
}

class _NamedItemListCopyWithImpl<$R, $Out extends ItemList, T> extends CopyWithBase<$R, NamedItemList<T>, $Out> implements NamedItemListCopyWith<$R, NamedItemList<T>, $Out, T> {
  _NamedItemListCopyWithImpl(super.value, super.then, super.then2);
  @override NamedItemListCopyWith<$R2, NamedItemList<T>, $Out2, T> chain<$R2, $Out2 extends ItemList>(Then<NamedItemList<T>, $Out2> t, Then<$Out2, $R2> t2) => _NamedItemListCopyWithImpl($value, t, t2);

  @override ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items => ListCopyWith($value.items, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(items: v));
  @override $R call({String? name, Object? items = $none}) => $then(NamedItemList(name ?? $value.name, or(items, $value.items)));
}

class KeyedItemListMapper extends MapperBase<KeyedItemList> {
  static MapperContainer container = MapperContainer(
    mappers: {KeyedItemListMapper()},
  );

  @override
  KeyedItemListMapperElement createElement(MapperContainer container) {
    return KeyedItemListMapperElement._(this, container);
  }


  @override Function get typeFactory => <K, T>(f) => f<KeyedItemList<K, T>>();
  static final fromMap = container.fromMap<KeyedItemList>;
  static final fromJson = container.fromJson<KeyedItemList>;
}

class KeyedItemListMapperElement extends MapperElementBase<KeyedItemList> {
  KeyedItemListMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  KeyedItemList<K, T> decode<K, T>(dynamic v) => checkedType(v, (Map<String, dynamic> map) => fromMap<K, T>(map));
  KeyedItemList<K, T> fromMap<K, T>(Map<String, dynamic> map) => KeyedItemList(container.$get(map, 'key'), container.$getOpt(map, 'items'));

  @override Function get encoder => encode;
  dynamic encode<K, T>(KeyedItemList<K, T> v) => toMap<K, T>(v);
  Map<String, dynamic> toMap<K, T>(KeyedItemList<K, T> k) => {'key': container.$enc(k.key, 'key'), 'items': container.$enc(k.items, 'items'), 'type': 'KeyedItemList', ...container.$type<KeyedItemList<K, T>>(k)};

  @override String stringify(KeyedItemList self) => 'KeyedItemList(items: ${container.asString(self.items)}, key: ${container.asString(self.key)})';
  @override int hash(KeyedItemList self) => container.hash(self.items) ^ container.hash(self.key);
  @override bool equals(KeyedItemList self, KeyedItemList other) => container.isEqual(self.items, other.items) && container.isEqual(self.key, other.key);
}

mixin KeyedItemListMappable<K, T> {
  String toJson() => KeyedItemListMapper.container.toJson(this as KeyedItemList<K, T>);
  Map<String, dynamic> toMap() => KeyedItemListMapper.container.toMap(this as KeyedItemList<K, T>);
  KeyedItemListCopyWith<KeyedItemList<K, T>, KeyedItemList<K, T>, KeyedItemList<K, T>, K, T> get copyWith => _KeyedItemListCopyWithImpl(this as KeyedItemList<K, T>, $identity, $identity);
  @override String toString() => KeyedItemListMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && KeyedItemListMapper.container.isEqual(this, other));
  @override int get hashCode => KeyedItemListMapper.container.hash(this);
}

extension KeyedItemListValueCopy<$R, $Out extends ItemList, K, T> on ObjectCopyWith<$R, KeyedItemList<K, T>, $Out> {
  KeyedItemListCopyWith<$R, KeyedItemList<K, T>, $Out, K, T> get asKeyedItemList => base.as((v, t, t2) => _KeyedItemListCopyWithImpl(v, t, t2));
}

typedef KeyedItemListCopyWithBound = ItemList;
abstract class KeyedItemListCopyWith<$R, $In extends KeyedItemList<K, T>, $Out extends ItemList, K, T> implements ItemListCopyWith<$R, $In, $Out, T> {
  KeyedItemListCopyWith<$R2, $In, $Out2, K, T> chain<$R2, $Out2 extends ItemList>(Then<KeyedItemList<K, T>, $Out2> t, Then<$Out2, $R2> t2);
  @override ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items;
  @override $R call({K? key, List<T>? items});
}

class _KeyedItemListCopyWithImpl<$R, $Out extends ItemList, K, T> extends CopyWithBase<$R, KeyedItemList<K, T>, $Out> implements KeyedItemListCopyWith<$R, KeyedItemList<K, T>, $Out, K, T> {
  _KeyedItemListCopyWithImpl(super.value, super.then, super.then2);
  @override KeyedItemListCopyWith<$R2, KeyedItemList<K, T>, $Out2, K, T> chain<$R2, $Out2 extends ItemList>(Then<KeyedItemList<K, T>, $Out2> t, Then<$Out2, $R2> t2) => _KeyedItemListCopyWithImpl($value, t, t2);

  @override ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items => ListCopyWith($value.items, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(items: v));
  @override $R call({K? key, Object? items = $none}) => $then(KeyedItemList(key ?? $value.key, or(items, $value.items)));
}

class ComparableItemListMapper extends MapperBase<ComparableItemList> {
  static MapperContainer container = MapperContainer(
    mappers: {ComparableItemListMapper()},
  );

  @override
  ComparableItemListMapperElement createElement(MapperContainer container) {
    return ComparableItemListMapperElement._(this, container);
  }


  @override Function get typeFactory => <T extends Comparable<dynamic>>(f) => f<ComparableItemList<T>>();
  static final fromMap = container.fromMap<ComparableItemList>;
  static final fromJson = container.fromJson<ComparableItemList>;
}

class ComparableItemListMapperElement extends MapperElementBase<ComparableItemList> {
  ComparableItemListMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  ComparableItemList<T> decode<T extends Comparable<dynamic>>(dynamic v) => checkedType(v, (Map<String, dynamic> map) => fromMap<T>(map));
  ComparableItemList<T> fromMap<T extends Comparable<dynamic>>(Map<String, dynamic> map) => ComparableItemList(container.$getOpt(map, 'items'));

  @override Function get encoder => encode;
  dynamic encode<T extends Comparable<dynamic>>(ComparableItemList<T> v) => toMap<T>(v);
  Map<String, dynamic> toMap<T extends Comparable<dynamic>>(ComparableItemList<T> c) => {'items': container.$enc(c.items, 'items'), 'type': 'ComparableItemList', ...container.$type<ComparableItemList<T>>(c)};

  @override String stringify(ComparableItemList self) => 'ComparableItemList(items: ${container.asString(self.items)})';
  @override int hash(ComparableItemList self) => container.hash(self.items);
  @override bool equals(ComparableItemList self, ComparableItemList other) => container.isEqual(self.items, other.items);
}

mixin ComparableItemListMappable<T extends Comparable<dynamic>> {
  String toJson() => ComparableItemListMapper.container.toJson(this as ComparableItemList<T>);
  Map<String, dynamic> toMap() => ComparableItemListMapper.container.toMap(this as ComparableItemList<T>);
  ComparableItemListCopyWith<ComparableItemList<T>, ComparableItemList<T>, ComparableItemList<T>, T> get copyWith => _ComparableItemListCopyWithImpl(this as ComparableItemList<T>, $identity, $identity);
  @override String toString() => ComparableItemListMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && ComparableItemListMapper.container.isEqual(this, other));
  @override int get hashCode => ComparableItemListMapper.container.hash(this);
}

extension ComparableItemListValueCopy<$R, $Out extends ItemList, T extends Comparable<dynamic>> on ObjectCopyWith<$R, ComparableItemList<T>, $Out> {
  ComparableItemListCopyWith<$R, ComparableItemList<T>, $Out, T> get asComparableItemList => base.as((v, t, t2) => _ComparableItemListCopyWithImpl(v, t, t2));
}

typedef ComparableItemListCopyWithBound = ItemList;
abstract class ComparableItemListCopyWith<$R, $In extends ComparableItemList<T>, $Out extends ItemList, T extends Comparable<dynamic>> implements ItemListCopyWith<$R, $In, $Out, T> {
  ComparableItemListCopyWith<$R2, $In, $Out2, T> chain<$R2, $Out2 extends ItemList>(Then<ComparableItemList<T>, $Out2> t, Then<$Out2, $R2> t2);
  @override ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items;
  @override $R call({List<T>? items});
}

class _ComparableItemListCopyWithImpl<$R, $Out extends ItemList, T extends Comparable<dynamic>> extends CopyWithBase<$R, ComparableItemList<T>, $Out> implements ComparableItemListCopyWith<$R, ComparableItemList<T>, $Out, T> {
  _ComparableItemListCopyWithImpl(super.value, super.then, super.then2);
  @override ComparableItemListCopyWith<$R2, ComparableItemList<T>, $Out2, T> chain<$R2, $Out2 extends ItemList>(Then<ComparableItemList<T>, $Out2> t, Then<$Out2, $R2> t2) => _ComparableItemListCopyWithImpl($value, t, t2);

  @override ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items => ListCopyWith($value.items, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(items: v));
  @override $R call({Object? items = $none}) => $then(ComparableItemList(or(items, $value.items)));
}
