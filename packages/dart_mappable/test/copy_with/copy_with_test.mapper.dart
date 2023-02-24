// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'copy_with_test.dart';

class PersonMapper extends ClassMapperBase<Person> {
  PersonMapper._();
  static PersonMapper? _instance;
  static PersonMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PersonMapper._());
      CarMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Person';

  static String _$name(Person v) => v.name;
  static Car _$car(Person v) => v.car;

  @override
  final Map<Symbol, Field<Person, dynamic>> fields = const {
    #name: Field<Person, String>('name', _$name),
    #car: Field<Person, Car>('car', _$car),
  };

  static Person _instantiate(DecodingData data) {
    return Person(data.get(#name), data.get(#car));
  }

  @override
  final Function instantiate = _instantiate;

  static Person fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Person>(map));
  }

  static Person fromJson(String json) {
    return _guard((c) => c.fromJson<Person>(json));
  }
}

mixin PersonMappable {
  String toJson() {
    return PersonMapper._guard((c) => c.toJson(this as Person));
  }

  Map<String, dynamic> toMap() {
    return PersonMapper._guard((c) => c.toMap(this as Person));
  }

  PersonCopyWith<Person, Person, Person> get copyWith =>
      _PersonCopyWithImpl(this as Person, $identity, $identity);
  @override
  String toString() {
    return PersonMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PersonMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return PersonMapper._guard((c) => c.hash(this));
  }
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
  CarCopyWith<$R, Car, Car> get car;
  $R call({String? name, Car? car});
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
  CarCopyWith<$R, Car, Car> get car =>
      $value.car.copyWith.chain($identity, (v) => call(car: v));
  @override
  $R call({String? name, Car? car}) =>
      $then(Person(name ?? $value.name, car ?? $value.car));
}

class CarMapper extends ClassMapperBase<Car> {
  CarMapper._();
  static CarMapper? _instance;
  static CarMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CarMapper._());
      BrandMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Car';

  static Brand? _$brand(Car v) => v.brand;
  static String _$model(Car v) => v.model;

  @override
  final Map<Symbol, Field<Car, dynamic>> fields = const {
    #brand: Field<Car, Brand?>('brand', _$brand),
    #model: Field<Car, String>('model', _$model),
  };

  static Car _instantiate(DecodingData data) {
    return Car(data.get(#brand), data.get(#model));
  }

  @override
  final Function instantiate = _instantiate;

  static Car fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Car>(map));
  }

  static Car fromJson(String json) {
    return _guard((c) => c.fromJson<Car>(json));
  }
}

mixin CarMappable {
  String toJson() {
    return CarMapper._guard((c) => c.toJson(this as Car));
  }

  Map<String, dynamic> toMap() {
    return CarMapper._guard((c) => c.toMap(this as Car));
  }

  CarCopyWith<Car, Car, Car> get copyWith =>
      _CarCopyWithImpl(this as Car, $identity, $identity);
  @override
  String toString() {
    return CarMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CarMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return CarMapper._guard((c) => c.hash(this));
  }
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
  BrandCopyWith<$R, Brand, Brand>? get brand;
  $R call({Brand? brand, String? model});
}

class _CarCopyWithImpl<$R, $Out extends Car> extends CopyWithBase<$R, Car, $Out>
    implements CarCopyWith<$R, Car, $Out> {
  _CarCopyWithImpl(super.value, super.then, super.then2);
  @override
  CarCopyWith<$R2, Car, $Out2> chain<$R2, $Out2 extends Car>(
          Then<Car, $Out2> t, Then<$Out2, $R2> t2) =>
      _CarCopyWithImpl($value, t, t2);

  @override
  BrandCopyWith<$R, Brand, Brand>? get brand =>
      $value.brand?.copyWith.chain($identity, (v) => call(brand: v));
  @override
  $R call({Object? brand = $none, String? model}) =>
      $then(Car(or(brand, $value.brand), model ?? $value.model));
}

class BrandMapper extends ClassMapperBase<Brand> {
  BrandMapper._();
  static BrandMapper? _instance;
  static BrandMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BrandMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Brand';

  static dynamic _$name(Brand v) => v.name;

  @override
  final Map<Symbol, Field<Brand, dynamic>> fields = const {
    #name: Field<Brand, dynamic>('name', _$name),
  };

  static Brand _instantiate(DecodingData data) {
    return Brand(data.get(#name));
  }

  @override
  final Function instantiate = _instantiate;

  static Brand fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Brand>(map));
  }

  static Brand fromJson(String json) {
    return _guard((c) => c.fromJson<Brand>(json));
  }
}

mixin BrandMappable {
  String toJson() {
    return BrandMapper._guard((c) => c.toJson(this as Brand));
  }

  Map<String, dynamic> toMap() {
    return BrandMapper._guard((c) => c.toMap(this as Brand));
  }

  BrandCopyWith<Brand, Brand, Brand> get copyWith =>
      _BrandCopyWithImpl(this as Brand, $identity, $identity);
  @override
  String toString() {
    return BrandMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BrandMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return BrandMapper._guard((c) => c.hash(this));
  }
}

extension BrandValueCopy<$R, $Out extends Brand>
    on ObjectCopyWith<$R, Brand, $Out> {
  BrandCopyWith<$R, Brand, $Out> get asBrand =>
      base.as((v, t, t2) => _BrandCopyWithImpl(v, t, t2));
}

typedef BrandCopyWithBound = Brand;

abstract class BrandCopyWith<$R, $In extends Brand, $Out extends Brand>
    implements ObjectCopyWith<$R, $In, $Out> {
  BrandCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Brand>(
      Then<Brand, $Out2> t, Then<$Out2, $R2> t2);
  $R call({dynamic name});
}

class _BrandCopyWithImpl<$R, $Out extends Brand>
    extends CopyWithBase<$R, Brand, $Out>
    implements BrandCopyWith<$R, Brand, $Out> {
  _BrandCopyWithImpl(super.value, super.then, super.then2);
  @override
  BrandCopyWith<$R2, Brand, $Out2> chain<$R2, $Out2 extends Brand>(
          Then<Brand, $Out2> t, Then<$Out2, $R2> t2) =>
      _BrandCopyWithImpl($value, t, t2);

  @override
  $R call({Object? name = $none}) => $then(Brand(or(name, $value.name)));
}

class DealershipMapper extends ClassMapperBase<Dealership> {
  DealershipMapper._();
  static DealershipMapper? _instance;
  static DealershipMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DealershipMapper._());
      CarMapper.ensureInitialized();
      BrandMapper.ensureInitialized();
      PersonMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Dealership';

  static List<Car> _$cars(Dealership v) => v.cars;
  static Map<Brand, Person?> _$salesRep(Dealership v) => v.salesRep;

  @override
  final Map<Symbol, Field<Dealership, dynamic>> fields = const {
    #cars: Field<Dealership, List<Car>>('cars', _$cars),
    #salesRep: Field<Dealership, Map<Brand, Person?>>('salesRep', _$salesRep),
  };

  static Dealership _instantiate(DecodingData data) {
    return Dealership(data.get(#cars), data.get(#salesRep));
  }

  @override
  final Function instantiate = _instantiate;

  static Dealership fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Dealership>(map));
  }

  static Dealership fromJson(String json) {
    return _guard((c) => c.fromJson<Dealership>(json));
  }
}

mixin DealershipMappable {
  String toJson() {
    return DealershipMapper._guard((c) => c.toJson(this as Dealership));
  }

  Map<String, dynamic> toMap() {
    return DealershipMapper._guard((c) => c.toMap(this as Dealership));
  }

  DealershipCopyWith<Dealership, Dealership, Dealership> get copyWith =>
      _DealershipCopyWithImpl(this as Dealership, $identity, $identity);
  @override
  String toString() {
    return DealershipMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DealershipMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return DealershipMapper._guard((c) => c.hash(this));
  }
}

extension DealershipValueCopy<$R, $Out extends Dealership>
    on ObjectCopyWith<$R, Dealership, $Out> {
  DealershipCopyWith<$R, Dealership, $Out> get asDealership =>
      base.as((v, t, t2) => _DealershipCopyWithImpl(v, t, t2));
}

typedef DealershipCopyWithBound = Dealership;

abstract class DealershipCopyWith<$R, $In extends Dealership,
    $Out extends Dealership> implements ObjectCopyWith<$R, $In, $Out> {
  DealershipCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Dealership>(
      Then<Dealership, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, Car, CarCopyWith<$R, Car, Car>> get cars;
  MapCopyWith<$R, Brand, Person?, PersonCopyWith<$R, Person, Person>?>
      get salesRep;
  $R call({List<Car>? cars, Map<Brand, Person?>? salesRep});
}

class _DealershipCopyWithImpl<$R, $Out extends Dealership>
    extends CopyWithBase<$R, Dealership, $Out>
    implements DealershipCopyWith<$R, Dealership, $Out> {
  _DealershipCopyWithImpl(super.value, super.then, super.then2);
  @override
  DealershipCopyWith<$R2, Dealership, $Out2>
      chain<$R2, $Out2 extends Dealership>(
              Then<Dealership, $Out2> t, Then<$Out2, $R2> t2) =>
          _DealershipCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, Car, CarCopyWith<$R, Car, Car>> get cars => ListCopyWith(
      $value.cars,
      (v, t) => v.copyWith.chain<$R, Car>($identity, t),
      (v) => call(cars: v));
  @override
  MapCopyWith<$R, Brand, Person?, PersonCopyWith<$R, Person, Person>?>
      get salesRep => MapCopyWith(
          $value.salesRep,
          (v, t) => v?.copyWith.chain<$R, Person>($identity, t),
          (v) => call(salesRep: v));
  @override
  $R call({List<Car>? cars, Map<Brand, Person?>? salesRep}) =>
      $then(Dealership(cars ?? $value.cars, salesRep ?? $value.salesRep));
}

class ItemListMapper extends ClassMapperBase<ItemList> {
  ItemListMapper._();
  static ItemListMapper? _instance;
  static ItemListMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ItemListMapper._());
      BrandListMapper.ensureInitialized();
      NamedItemListMapper.ensureInitialized();
      KeyedItemListMapper.ensureInitialized();
      ComparableItemListMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ItemList';
  @override
  Function get typeFactory => <T>(f) => f<ItemList<T>>();

  static List<dynamic> _$items(ItemList v) => v.items;
  static dynamic _arg$items<T>(f) => f<List<T>>();

  @override
  final Map<Symbol, Field<ItemList, dynamic>> fields = const {
    #items: Field<ItemList, List<dynamic>>('items', _$items, arg: _arg$items),
  };

  static ItemList<T> _instantiate<T>(DecodingData data) {
    throw MapperException.missingSubclass(
        'ItemList', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static ItemList<T> fromMap<T>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ItemList<T>>(map));
  }

  static ItemList<T> fromJson<T>(String json) {
    return _guard((c) => c.fromJson<ItemList<T>>(json));
  }
}

mixin ItemListMappable<T> {
  String toJson();
  Map<String, dynamic> toMap();
  ItemListCopyWith<ItemList<T>, ItemList<T>, ItemList<T>, T> get copyWith;
}

typedef ItemListCopyWithBound = ItemList;

abstract class ItemListCopyWith<$R, $In extends ItemList<T>,
    $Out extends ItemList, T> implements ObjectCopyWith<$R, $In, $Out> {
  ItemListCopyWith<$R2, $In, $Out2, T> chain<$R2, $Out2 extends ItemList>(
      Then<ItemList<T>, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>?> get items;
  $R call({List<T>? items});
}

class BrandListMapper extends SubClassMapperBase<BrandList> {
  BrandListMapper._();
  static BrandListMapper? _instance;
  static BrandListMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BrandListMapper._());
      BrandMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'BrandList';

  static List<Brand?> _$items(BrandList v) => v.items;

  @override
  final Map<Symbol, Field<BrandList, dynamic>> fields = const {
    #items: Field<BrandList, List<Brand?>>('items', _$items, key: 'brands'),
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'BrandList';
  @override
  final ClassMapperBase superMapper = ItemListMapper.ensureInitialized();

  static BrandList _instantiate(DecodingData data) {
    return BrandList(data.get(#brands));
  }

  @override
  final Function instantiate = _instantiate;

  static BrandList fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<BrandList>(map));
  }

  static BrandList fromJson(String json) {
    return _guard((c) => c.fromJson<BrandList>(json));
  }
}

mixin BrandListMappable {
  String toJson() {
    return BrandListMapper._guard((c) => c.toJson(this as BrandList));
  }

  Map<String, dynamic> toMap() {
    return BrandListMapper._guard((c) => c.toMap(this as BrandList));
  }

  BrandListCopyWith<BrandList, BrandList, BrandList> get copyWith =>
      _BrandListCopyWithImpl(this as BrandList, $identity, $identity);
  @override
  String toString() {
    return BrandListMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BrandListMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return BrandListMapper._guard((c) => c.hash(this));
  }
}

extension BrandListValueCopy<$R, $Out extends ItemList>
    on ObjectCopyWith<$R, BrandList, $Out> {
  BrandListCopyWith<$R, BrandList, $Out> get asBrandList =>
      base.as((v, t, t2) => _BrandListCopyWithImpl(v, t, t2));
}

typedef BrandListCopyWithBound = ItemList;

abstract class BrandListCopyWith<$R, $In extends BrandList,
    $Out extends ItemList> implements ItemListCopyWith<$R, $In, $Out, Brand?> {
  BrandListCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends ItemList>(
      Then<BrandList, $Out2> t, Then<$Out2, $R2> t2);
  @override
  ListCopyWith<$R, Brand?, BrandCopyWith<$R, Brand, Brand>?> get items;
  @override
  $R call({List<Brand?>? items});
}

class _BrandListCopyWithImpl<$R, $Out extends ItemList>
    extends CopyWithBase<$R, BrandList, $Out>
    implements BrandListCopyWith<$R, BrandList, $Out> {
  _BrandListCopyWithImpl(super.value, super.then, super.then2);
  @override
  BrandListCopyWith<$R2, BrandList, $Out2> chain<$R2, $Out2 extends ItemList>(
          Then<BrandList, $Out2> t, Then<$Out2, $R2> t2) =>
      _BrandListCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, Brand?, BrandCopyWith<$R, Brand, Brand>?> get items =>
      ListCopyWith(
          $value.items,
          (v, t) => v?.copyWith.chain<$R, Brand>($identity, t),
          (v) => call(items: v));
  @override
  $R call({Object? items = $none}) => $then(BrandList(or(items, $value.items)));
}

class NamedItemListMapper extends SubClassMapperBase<NamedItemList> {
  NamedItemListMapper._();
  static NamedItemListMapper? _instance;
  static NamedItemListMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NamedItemListMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'NamedItemList';
  @override
  Function get typeFactory => <T>(f) => f<NamedItemList<T>>();

  static String _$name(NamedItemList v) => v.name;
  static List<dynamic> _$items(NamedItemList v) => v.items;
  static dynamic _arg$items<T>(f) => f<List<T>>();

  @override
  final Map<Symbol, Field<NamedItemList, dynamic>> fields = const {
    #name: Field<NamedItemList, String>('name', _$name),
    #items:
        Field<NamedItemList, List<dynamic>>('items', _$items, arg: _arg$items),
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'NamedItemList';
  @override
  final ClassMapperBase superMapper = ItemListMapper.ensureInitialized();

  static NamedItemList<T> _instantiate<T>(DecodingData data) {
    return NamedItemList(data.get(#name), data.get(#items));
  }

  @override
  final Function instantiate = _instantiate;

  static NamedItemList<T> fromMap<T>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<NamedItemList<T>>(map));
  }

  static NamedItemList<T> fromJson<T>(String json) {
    return _guard((c) => c.fromJson<NamedItemList<T>>(json));
  }
}

mixin NamedItemListMappable<T> {
  String toJson() {
    return NamedItemListMapper._guard(
        (c) => c.toJson(this as NamedItemList<T>));
  }

  Map<String, dynamic> toMap() {
    return NamedItemListMapper._guard((c) => c.toMap(this as NamedItemList<T>));
  }

  NamedItemListCopyWith<NamedItemList<T>, NamedItemList<T>, NamedItemList<T>, T>
      get copyWith => _NamedItemListCopyWithImpl(
          this as NamedItemList<T>, $identity, $identity);
  @override
  String toString() {
    return NamedItemListMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            NamedItemListMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return NamedItemListMapper._guard((c) => c.hash(this));
  }
}

extension NamedItemListValueCopy<$R, $Out extends ItemList, T>
    on ObjectCopyWith<$R, NamedItemList<T>, $Out> {
  NamedItemListCopyWith<$R, NamedItemList<T>, $Out, T> get asNamedItemList =>
      base.as((v, t, t2) => _NamedItemListCopyWithImpl(v, t, t2));
}

typedef NamedItemListCopyWithBound = ItemList;

abstract class NamedItemListCopyWith<$R, $In extends NamedItemList<T>,
    $Out extends ItemList, T> implements ItemListCopyWith<$R, $In, $Out, T> {
  NamedItemListCopyWith<$R2, $In, $Out2, T> chain<$R2, $Out2 extends ItemList>(
      Then<NamedItemList<T>, $Out2> t, Then<$Out2, $R2> t2);
  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items;
  @override
  $R call({String? name, List<T>? items});
}

class _NamedItemListCopyWithImpl<$R, $Out extends ItemList, T>
    extends CopyWithBase<$R, NamedItemList<T>, $Out>
    implements NamedItemListCopyWith<$R, NamedItemList<T>, $Out, T> {
  _NamedItemListCopyWithImpl(super.value, super.then, super.then2);
  @override
  NamedItemListCopyWith<$R2, NamedItemList<T>, $Out2, T>
      chain<$R2, $Out2 extends ItemList>(
              Then<NamedItemList<T>, $Out2> t, Then<$Out2, $R2> t2) =>
          _NamedItemListCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items => ListCopyWith(
      $value.items,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(items: v));
  @override
  $R call({String? name, Object? items = $none}) =>
      $then(NamedItemList(name ?? $value.name, or(items, $value.items)));
}

class KeyedItemListMapper extends SubClassMapperBase<KeyedItemList> {
  KeyedItemListMapper._();
  static KeyedItemListMapper? _instance;
  static KeyedItemListMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = KeyedItemListMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'KeyedItemList';
  @override
  Function get typeFactory => <K, T>(f) => f<KeyedItemList<K, T>>();

  static dynamic _$key(KeyedItemList v) => v.key;
  static dynamic _arg$key<K, T>(f) => f<K>();
  static List<dynamic> _$items(KeyedItemList v) => v.items;
  static dynamic _arg$items<K, T>(f) => f<List<T>>();

  @override
  final Map<Symbol, Field<KeyedItemList, dynamic>> fields = const {
    #key: Field<KeyedItemList, dynamic>('key', _$key, arg: _arg$key),
    #items:
        Field<KeyedItemList, List<dynamic>>('items', _$items, arg: _arg$items),
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'KeyedItemList';
  @override
  final ClassMapperBase superMapper = ItemListMapper.ensureInitialized();

  @override
  DecodingContext<Object> inherit(DecodingContext<Object> context) {
    return context.inherit(args: [dynamic, context.arg(0)]);
  }

  static KeyedItemList<K, T> _instantiate<K, T>(DecodingData data) {
    return KeyedItemList(data.get(#key), data.get(#items));
  }

  @override
  final Function instantiate = _instantiate;

  static KeyedItemList<K, T> fromMap<K, T>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<KeyedItemList<K, T>>(map));
  }

  static KeyedItemList<K, T> fromJson<K, T>(String json) {
    return _guard((c) => c.fromJson<KeyedItemList<K, T>>(json));
  }
}

mixin KeyedItemListMappable<K, T> {
  String toJson() {
    return KeyedItemListMapper._guard(
        (c) => c.toJson(this as KeyedItemList<K, T>));
  }

  Map<String, dynamic> toMap() {
    return KeyedItemListMapper._guard(
        (c) => c.toMap(this as KeyedItemList<K, T>));
  }

  KeyedItemListCopyWith<KeyedItemList<K, T>, KeyedItemList<K, T>,
          KeyedItemList<K, T>, K, T>
      get copyWith => _KeyedItemListCopyWithImpl(
          this as KeyedItemList<K, T>, $identity, $identity);
  @override
  String toString() {
    return KeyedItemListMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            KeyedItemListMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return KeyedItemListMapper._guard((c) => c.hash(this));
  }
}

extension KeyedItemListValueCopy<$R, $Out extends ItemList, K, T>
    on ObjectCopyWith<$R, KeyedItemList<K, T>, $Out> {
  KeyedItemListCopyWith<$R, KeyedItemList<K, T>, $Out, K, T>
      get asKeyedItemList =>
          base.as((v, t, t2) => _KeyedItemListCopyWithImpl(v, t, t2));
}

typedef KeyedItemListCopyWithBound = ItemList;

abstract class KeyedItemListCopyWith<$R, $In extends KeyedItemList<K, T>,
    $Out extends ItemList, K, T> implements ItemListCopyWith<$R, $In, $Out, T> {
  KeyedItemListCopyWith<$R2, $In, $Out2, K, T>
      chain<$R2, $Out2 extends ItemList>(
          Then<KeyedItemList<K, T>, $Out2> t, Then<$Out2, $R2> t2);
  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items;
  @override
  $R call({K? key, List<T>? items});
}

class _KeyedItemListCopyWithImpl<$R, $Out extends ItemList, K, T>
    extends CopyWithBase<$R, KeyedItemList<K, T>, $Out>
    implements KeyedItemListCopyWith<$R, KeyedItemList<K, T>, $Out, K, T> {
  _KeyedItemListCopyWithImpl(super.value, super.then, super.then2);
  @override
  KeyedItemListCopyWith<$R2, KeyedItemList<K, T>, $Out2, K, T>
      chain<$R2, $Out2 extends ItemList>(
              Then<KeyedItemList<K, T>, $Out2> t, Then<$Out2, $R2> t2) =>
          _KeyedItemListCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items => ListCopyWith(
      $value.items,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(items: v));
  @override
  $R call({K? key, Object? items = $none}) =>
      $then(KeyedItemList(key ?? $value.key, or(items, $value.items)));
}

class ComparableItemListMapper extends SubClassMapperBase<ComparableItemList> {
  ComparableItemListMapper._();
  static ComparableItemListMapper? _instance;
  static ComparableItemListMapper ensureInitialized() {
    if (_instance == null) {
      MapperBase.addType<Comparable>();
      MapperContainer.globals.use(_instance = ComparableItemListMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ComparableItemList';
  @override
  Function get typeFactory =>
      <T extends Comparable<dynamic>>(f) => f<ComparableItemList<T>>();

  static List<Comparable<dynamic>> _$items(ComparableItemList v) => v.items;
  static dynamic _arg$items<T extends Comparable<dynamic>>(f) => f<List<T>>();

  @override
  final Map<Symbol, Field<ComparableItemList, dynamic>> fields = const {
    #items: Field<ComparableItemList, List<Comparable<dynamic>>>(
        'items', _$items,
        arg: _arg$items),
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'ComparableItemList';
  @override
  final ClassMapperBase superMapper = ItemListMapper.ensureInitialized();

  static ComparableItemList<T> _instantiate<T extends Comparable<dynamic>>(
      DecodingData data) {
    return ComparableItemList(data.get(#items));
  }

  @override
  final Function instantiate = _instantiate;

  static ComparableItemList<T> fromMap<T extends Comparable<dynamic>>(
      Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ComparableItemList<T>>(map));
  }

  static ComparableItemList<T> fromJson<T extends Comparable<dynamic>>(
      String json) {
    return _guard((c) => c.fromJson<ComparableItemList<T>>(json));
  }
}

mixin ComparableItemListMappable<T extends Comparable<dynamic>> {
  String toJson() {
    return ComparableItemListMapper._guard(
        (c) => c.toJson(this as ComparableItemList<T>));
  }

  Map<String, dynamic> toMap() {
    return ComparableItemListMapper._guard(
        (c) => c.toMap(this as ComparableItemList<T>));
  }

  ComparableItemListCopyWith<ComparableItemList<T>, ComparableItemList<T>,
          ComparableItemList<T>, T>
      get copyWith => _ComparableItemListCopyWithImpl(
          this as ComparableItemList<T>, $identity, $identity);
  @override
  String toString() {
    return ComparableItemListMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ComparableItemListMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ComparableItemListMapper._guard((c) => c.hash(this));
  }
}

extension ComparableItemListValueCopy<$R, $Out extends ItemList,
        T extends Comparable<dynamic>>
    on ObjectCopyWith<$R, ComparableItemList<T>, $Out> {
  ComparableItemListCopyWith<$R, ComparableItemList<T>, $Out, T>
      get asComparableItemList =>
          base.as((v, t, t2) => _ComparableItemListCopyWithImpl(v, t, t2));
}

typedef ComparableItemListCopyWithBound = ItemList;

abstract class ComparableItemListCopyWith<$R, $In extends ComparableItemList<T>,
        $Out extends ItemList, T extends Comparable<dynamic>>
    implements ItemListCopyWith<$R, $In, $Out, T> {
  ComparableItemListCopyWith<$R2, $In, $Out2, T>
      chain<$R2, $Out2 extends ItemList>(
          Then<ComparableItemList<T>, $Out2> t, Then<$Out2, $R2> t2);
  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items;
  @override
  $R call({List<T>? items});
}

class _ComparableItemListCopyWithImpl<$R, $Out extends ItemList,
        T extends Comparable<dynamic>>
    extends CopyWithBase<$R, ComparableItemList<T>, $Out>
    implements ComparableItemListCopyWith<$R, ComparableItemList<T>, $Out, T> {
  _ComparableItemListCopyWithImpl(super.value, super.then, super.then2);
  @override
  ComparableItemListCopyWith<$R2, ComparableItemList<T>, $Out2, T>
      chain<$R2, $Out2 extends ItemList>(
              Then<ComparableItemList<T>, $Out2> t, Then<$Out2, $R2> t2) =>
          _ComparableItemListCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items => ListCopyWith(
      $value.items,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(items: v));
  @override
  $R call({Object? items = $none}) =>
      $then(ComparableItemList(or(items, $value.items)));
}
