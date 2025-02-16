// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

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

  @override
  final String id = 'Person';

  static String _$name(Person v) => v.name;
  static const Field<Person, String> _f$name = Field('name', _$name);
  static Car _$car(Person v) => v.car;
  static const Field<Person, Car> _f$car = Field('car', _$car);

  @override
  final MappableFields<Person> fields = const {
    #name: _f$name,
    #car: _f$car,
  };

  static Person _instantiate(DecodingData data) {
    return Person(data.dec(_f$name), data.dec(_f$car));
  }

  @override
  final Function instantiate = _instantiate;

  static Person fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Person>(map);
  }

  static Person fromJson(String json) {
    return ensureInitialized().decodeJson<Person>(json);
  }
}

mixin PersonMappable {
  String toJson() {
    return PersonMapper.ensureInitialized().encodeJson<Person>(this as Person);
  }

  Map<String, dynamic> toMap() {
    return PersonMapper.ensureInitialized().encodeMap<Person>(this as Person);
  }

  PersonCopyWith<Person, Person, Person> get copyWith =>
      _PersonCopyWithImpl(this as Person, $identity, $identity);
  @override
  String toString() {
    return PersonMapper.ensureInitialized().stringifyValue(this as Person);
  }

  @override
  bool operator ==(Object other) {
    return PersonMapper.ensureInitialized().equalsValue(this as Person, other);
  }

  @override
  int get hashCode {
    return PersonMapper.ensureInitialized().hashValue(this as Person);
  }
}

extension PersonValueCopy<$R, $Out> on ObjectCopyWith<$R, Person, $Out> {
  PersonCopyWith<$R, Person, $Out> get $asPerson =>
      $base.as((v, t, t2) => _PersonCopyWithImpl(v, t, t2));
}

abstract class PersonCopyWith<$R, $In extends Person, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  CarCopyWith<$R, Car, Car> get car;
  $R call({String? name, Car? car});
  PersonCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PersonCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Person, $Out>
    implements PersonCopyWith<$R, Person, $Out> {
  _PersonCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Person> $mapper = PersonMapper.ensureInitialized();
  @override
  CarCopyWith<$R, Car, Car> get car =>
      $value.car.copyWith.$chain((v) => call(car: v));
  @override
  $R call({String? name, Car? car}) => $apply(FieldCopyWithData(
      {if (name != null) #name: name, if (car != null) #car: car}));
  @override
  Person $make(CopyWithData data) =>
      Person(data.get(#name, or: $value.name), data.get(#car, or: $value.car));

  @override
  PersonCopyWith<$R2, Person, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PersonCopyWithImpl($value, $cast, t);
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

  @override
  final String id = 'Car';

  static Brand? _$brand(Car v) => v.brand;
  static const Field<Car, Brand> _f$brand = Field('brand', _$brand);
  static String _$model(Car v) => v.model;
  static const Field<Car, String> _f$model = Field('model', _$model);

  @override
  final MappableFields<Car> fields = const {
    #brand: _f$brand,
    #model: _f$model,
  };

  static Car _instantiate(DecodingData data) {
    return Car(data.dec(_f$brand), data.dec(_f$model));
  }

  @override
  final Function instantiate = _instantiate;

  static Car fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Car>(map);
  }

  static Car fromJson(String json) {
    return ensureInitialized().decodeJson<Car>(json);
  }
}

mixin CarMappable {
  String toJson() {
    return CarMapper.ensureInitialized().encodeJson<Car>(this as Car);
  }

  Map<String, dynamic> toMap() {
    return CarMapper.ensureInitialized().encodeMap<Car>(this as Car);
  }

  CarCopyWith<Car, Car, Car> get copyWith =>
      _CarCopyWithImpl(this as Car, $identity, $identity);
  @override
  String toString() {
    return CarMapper.ensureInitialized().stringifyValue(this as Car);
  }

  @override
  bool operator ==(Object other) {
    return CarMapper.ensureInitialized().equalsValue(this as Car, other);
  }

  @override
  int get hashCode {
    return CarMapper.ensureInitialized().hashValue(this as Car);
  }
}

extension CarValueCopy<$R, $Out> on ObjectCopyWith<$R, Car, $Out> {
  CarCopyWith<$R, Car, $Out> get $asCar =>
      $base.as((v, t, t2) => _CarCopyWithImpl(v, t, t2));
}

abstract class CarCopyWith<$R, $In extends Car, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  BrandCopyWith<$R, Brand, Brand>? get brand;
  $R call({Brand? brand, String? model});
  CarCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CarCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Car, $Out>
    implements CarCopyWith<$R, Car, $Out> {
  _CarCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Car> $mapper = CarMapper.ensureInitialized();
  @override
  BrandCopyWith<$R, Brand, Brand>? get brand =>
      $value.brand?.copyWith.$chain((v) => call(brand: v));
  @override
  $R call({Object? brand = $none, String? model}) => $apply(FieldCopyWithData(
      {if (brand != $none) #brand: brand, if (model != null) #model: model}));
  @override
  Car $make(CopyWithData data) => Car(
      data.get(#brand, or: $value.brand), data.get(#model, or: $value.model));

  @override
  CarCopyWith<$R2, Car, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CarCopyWithImpl($value, $cast, t);
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

  @override
  final String id = 'Brand';

  static dynamic _$name(Brand v) => v.name;
  static const Field<Brand, dynamic> _f$name = Field('name', _$name);

  @override
  final MappableFields<Brand> fields = const {
    #name: _f$name,
  };

  static Brand _instantiate(DecodingData data) {
    return Brand(data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Brand fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Brand>(map);
  }

  static Brand fromJson(String json) {
    return ensureInitialized().decodeJson<Brand>(json);
  }
}

mixin BrandMappable {
  String toJson() {
    return BrandMapper.ensureInitialized().encodeJson<Brand>(this as Brand);
  }

  Map<String, dynamic> toMap() {
    return BrandMapper.ensureInitialized().encodeMap<Brand>(this as Brand);
  }

  BrandCopyWith<Brand, Brand, Brand> get copyWith =>
      _BrandCopyWithImpl(this as Brand, $identity, $identity);
  @override
  String toString() {
    return BrandMapper.ensureInitialized().stringifyValue(this as Brand);
  }

  @override
  bool operator ==(Object other) {
    return BrandMapper.ensureInitialized().equalsValue(this as Brand, other);
  }

  @override
  int get hashCode {
    return BrandMapper.ensureInitialized().hashValue(this as Brand);
  }
}

extension BrandValueCopy<$R, $Out> on ObjectCopyWith<$R, Brand, $Out> {
  BrandCopyWith<$R, Brand, $Out> get $asBrand =>
      $base.as((v, t, t2) => _BrandCopyWithImpl(v, t, t2));
}

abstract class BrandCopyWith<$R, $In extends Brand, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({dynamic name});
  BrandCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BrandCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Brand, $Out>
    implements BrandCopyWith<$R, Brand, $Out> {
  _BrandCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Brand> $mapper = BrandMapper.ensureInitialized();
  @override
  $R call({Object? name = $none}) =>
      $apply(FieldCopyWithData({if (name != $none) #name: name}));
  @override
  Brand $make(CopyWithData data) => Brand(data.get(#name, or: $value.name));

  @override
  BrandCopyWith<$R2, Brand, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BrandCopyWithImpl($value, $cast, t);
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

  @override
  final String id = 'Dealership';

  static List<Car> _$cars(Dealership v) => v.cars;
  static const Field<Dealership, List<Car>> _f$cars = Field('cars', _$cars);
  static Map<Brand, Person?> _$salesRep(Dealership v) => v.salesRep;
  static const Field<Dealership, Map<Brand, Person?>> _f$salesRep =
      Field('salesRep', _$salesRep);

  @override
  final MappableFields<Dealership> fields = const {
    #cars: _f$cars,
    #salesRep: _f$salesRep,
  };

  static Dealership _instantiate(DecodingData data) {
    return Dealership(data.dec(_f$cars), data.dec(_f$salesRep));
  }

  @override
  final Function instantiate = _instantiate;

  static Dealership fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Dealership>(map);
  }

  static Dealership fromJson(String json) {
    return ensureInitialized().decodeJson<Dealership>(json);
  }
}

mixin DealershipMappable {
  String toJson() {
    return DealershipMapper.ensureInitialized()
        .encodeJson<Dealership>(this as Dealership);
  }

  Map<String, dynamic> toMap() {
    return DealershipMapper.ensureInitialized()
        .encodeMap<Dealership>(this as Dealership);
  }

  DealershipCopyWith<Dealership, Dealership, Dealership> get copyWith =>
      _DealershipCopyWithImpl(this as Dealership, $identity, $identity);
  @override
  String toString() {
    return DealershipMapper.ensureInitialized()
        .stringifyValue(this as Dealership);
  }

  @override
  bool operator ==(Object other) {
    return DealershipMapper.ensureInitialized()
        .equalsValue(this as Dealership, other);
  }

  @override
  int get hashCode {
    return DealershipMapper.ensureInitialized().hashValue(this as Dealership);
  }
}

extension DealershipValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Dealership, $Out> {
  DealershipCopyWith<$R, Dealership, $Out> get $asDealership =>
      $base.as((v, t, t2) => _DealershipCopyWithImpl(v, t, t2));
}

abstract class DealershipCopyWith<$R, $In extends Dealership, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Car, CarCopyWith<$R, Car, Car>> get cars;
  MapCopyWith<$R, Brand, Person?, PersonCopyWith<$R, Person, Person>?>
      get salesRep;
  $R call({List<Car>? cars, Map<Brand, Person?>? salesRep});
  DealershipCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DealershipCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Dealership, $Out>
    implements DealershipCopyWith<$R, Dealership, $Out> {
  _DealershipCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Dealership> $mapper =
      DealershipMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Car, CarCopyWith<$R, Car, Car>> get cars => ListCopyWith(
      $value.cars, (v, t) => v.copyWith.$chain(t), (v) => call(cars: v));
  @override
  MapCopyWith<$R, Brand, Person?, PersonCopyWith<$R, Person, Person>?>
      get salesRep => MapCopyWith($value.salesRep,
          (v, t) => v?.copyWith.$chain(t), (v) => call(salesRep: v));
  @override
  $R call({List<Car>? cars, Map<Brand, Person?>? salesRep}) =>
      $apply(FieldCopyWithData({
        if (cars != null) #cars: cars,
        if (salesRep != null) #salesRep: salesRep
      }));
  @override
  Dealership $make(CopyWithData data) => Dealership(
      data.get(#cars, or: $value.cars),
      data.get(#salesRep, or: $value.salesRep));

  @override
  DealershipCopyWith<$R2, Dealership, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DealershipCopyWithImpl($value, $cast, t);
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

  @override
  final String id = 'ItemList';
  @override
  Function get typeFactory => <T>(f) => f<ItemList<T>>();

  static List<dynamic> _$items(ItemList v) => v.items;
  static dynamic _arg$items<T>(f) => f<List<T>>();
  static const Field<ItemList, List<dynamic>> _f$items =
      Field('items', _$items, arg: _arg$items);

  @override
  final MappableFields<ItemList> fields = const {
    #items: _f$items,
  };

  static ItemList<T> _instantiate<T>(DecodingData data) {
    throw MapperException.missingSubclass(
        'ItemList', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static ItemList<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ItemList<T>>(map);
  }

  static ItemList<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<ItemList<T>>(json);
  }
}

mixin ItemListMappable<T> {
  String toJson();
  Map<String, dynamic> toMap();
  ItemListCopyWith<ItemList<T>, ItemList<T>, ItemList<T>, T> get copyWith;
}

abstract class ItemListCopyWith<$R, $In extends ItemList<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>?> get items;
  $R call({List<T>? items});
  ItemListCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class BrandListMapper extends SubClassMapperBase<BrandList> {
  BrandListMapper._();

  static BrandListMapper? _instance;
  static BrandListMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BrandListMapper._());
      ItemListMapper.ensureInitialized().addSubMapper(_instance!);
      BrandMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'BrandList';

  static List<Brand?> _$items(BrandList v) => v.items;
  static const Field<BrandList, List<Brand?>> _f$items =
      Field('items', _$items, key: r'brands');

  @override
  final MappableFields<BrandList> fields = const {
    #items: _f$items,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'BrandList';
  @override
  late final ClassMapperBase superMapper = ItemListMapper.ensureInitialized();

  @override
  DecodingContext inherit(DecodingContext context) {
    return context.inherit(args: () => []);
  }

  static BrandList _instantiate(DecodingData data) {
    return BrandList(data.dec(_f$items));
  }

  @override
  final Function instantiate = _instantiate;

  static BrandList fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BrandList>(map);
  }

  static BrandList fromJson(String json) {
    return ensureInitialized().decodeJson<BrandList>(json);
  }
}

mixin BrandListMappable {
  String toJson() {
    return BrandListMapper.ensureInitialized()
        .encodeJson<BrandList>(this as BrandList);
  }

  Map<String, dynamic> toMap() {
    return BrandListMapper.ensureInitialized()
        .encodeMap<BrandList>(this as BrandList);
  }

  BrandListCopyWith<BrandList, BrandList, BrandList> get copyWith =>
      _BrandListCopyWithImpl(this as BrandList, $identity, $identity);
  @override
  String toString() {
    return BrandListMapper.ensureInitialized()
        .stringifyValue(this as BrandList);
  }

  @override
  bool operator ==(Object other) {
    return BrandListMapper.ensureInitialized()
        .equalsValue(this as BrandList, other);
  }

  @override
  int get hashCode {
    return BrandListMapper.ensureInitialized().hashValue(this as BrandList);
  }
}

extension BrandListValueCopy<$R, $Out> on ObjectCopyWith<$R, BrandList, $Out> {
  BrandListCopyWith<$R, BrandList, $Out> get $asBrandList =>
      $base.as((v, t, t2) => _BrandListCopyWithImpl(v, t, t2));
}

abstract class BrandListCopyWith<$R, $In extends BrandList, $Out>
    implements ItemListCopyWith<$R, $In, $Out, Brand?> {
  @override
  ListCopyWith<$R, Brand?, BrandCopyWith<$R, Brand, Brand>?> get items;
  @override
  $R call({List<Brand?>? items});
  BrandListCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BrandListCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BrandList, $Out>
    implements BrandListCopyWith<$R, BrandList, $Out> {
  _BrandListCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BrandList> $mapper =
      BrandListMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Brand?, BrandCopyWith<$R, Brand, Brand>?> get items =>
      ListCopyWith(
          $value.items, (v, t) => v?.copyWith.$chain(t), (v) => call(items: v));
  @override
  $R call({Object? items = $none}) =>
      $apply(FieldCopyWithData({if (items != $none) #items: items}));
  @override
  BrandList $make(CopyWithData data) =>
      BrandList(data.get(#items, or: $value.items));

  @override
  BrandListCopyWith<$R2, BrandList, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _BrandListCopyWithImpl($value, $cast, t);
}

class NamedItemListMapper extends SubClassMapperBase<NamedItemList> {
  NamedItemListMapper._();

  static NamedItemListMapper? _instance;
  static NamedItemListMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NamedItemListMapper._());
      ItemListMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'NamedItemList';
  @override
  Function get typeFactory => <T>(f) => f<NamedItemList<T>>();

  static String _$name(NamedItemList v) => v.name;
  static const Field<NamedItemList, String> _f$name = Field('name', _$name);
  static List<dynamic> _$items(NamedItemList v) => v.items;
  static dynamic _arg$items<T>(f) => f<List<T>>();
  static const Field<NamedItemList, List<dynamic>> _f$items =
      Field('items', _$items, arg: _arg$items);

  @override
  final MappableFields<NamedItemList> fields = const {
    #name: _f$name,
    #items: _f$items,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'NamedItemList';
  @override
  late final ClassMapperBase superMapper = ItemListMapper.ensureInitialized();

  static NamedItemList<T> _instantiate<T>(DecodingData data) {
    return NamedItemList(data.dec(_f$name), data.dec(_f$items));
  }

  @override
  final Function instantiate = _instantiate;

  static NamedItemList<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NamedItemList<T>>(map);
  }

  static NamedItemList<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<NamedItemList<T>>(json);
  }
}

mixin NamedItemListMappable<T> {
  String toJson() {
    return NamedItemListMapper.ensureInitialized()
        .encodeJson<NamedItemList<T>>(this as NamedItemList<T>);
  }

  Map<String, dynamic> toMap() {
    return NamedItemListMapper.ensureInitialized()
        .encodeMap<NamedItemList<T>>(this as NamedItemList<T>);
  }

  NamedItemListCopyWith<NamedItemList<T>, NamedItemList<T>, NamedItemList<T>, T>
      get copyWith => _NamedItemListCopyWithImpl(
          this as NamedItemList<T>, $identity, $identity);
  @override
  String toString() {
    return NamedItemListMapper.ensureInitialized()
        .stringifyValue(this as NamedItemList<T>);
  }

  @override
  bool operator ==(Object other) {
    return NamedItemListMapper.ensureInitialized()
        .equalsValue(this as NamedItemList<T>, other);
  }

  @override
  int get hashCode {
    return NamedItemListMapper.ensureInitialized()
        .hashValue(this as NamedItemList<T>);
  }
}

extension NamedItemListValueCopy<$R, $Out, T>
    on ObjectCopyWith<$R, NamedItemList<T>, $Out> {
  NamedItemListCopyWith<$R, NamedItemList<T>, $Out, T> get $asNamedItemList =>
      $base.as((v, t, t2) => _NamedItemListCopyWithImpl(v, t, t2));
}

abstract class NamedItemListCopyWith<$R, $In extends NamedItemList<T>, $Out, T>
    implements ItemListCopyWith<$R, $In, $Out, T> {
  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items;
  @override
  $R call({String? name, covariant List<T>? items});
  NamedItemListCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NamedItemListCopyWithImpl<$R, $Out, T>
    extends ClassCopyWithBase<$R, NamedItemList<T>, $Out>
    implements NamedItemListCopyWith<$R, NamedItemList<T>, $Out, T> {
  _NamedItemListCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NamedItemList> $mapper =
      NamedItemListMapper.ensureInitialized();
  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items => ListCopyWith(
      $value.items,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(items: v));
  @override
  $R call({String? name, Object? items = $none}) => $apply(FieldCopyWithData(
      {if (name != null) #name: name, if (items != $none) #items: items}));
  @override
  NamedItemList<T> $make(CopyWithData data) => NamedItemList(
      data.get(#name, or: $value.name), data.get(#items, or: $value.items));

  @override
  NamedItemListCopyWith<$R2, NamedItemList<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NamedItemListCopyWithImpl($value, $cast, t);
}

class KeyedItemListMapper extends SubClassMapperBase<KeyedItemList> {
  KeyedItemListMapper._();

  static KeyedItemListMapper? _instance;
  static KeyedItemListMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = KeyedItemListMapper._());
      ItemListMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'KeyedItemList';
  @override
  Function get typeFactory => <K, T>(f) => f<KeyedItemList<K, T>>();

  static dynamic _$key(KeyedItemList v) => v.key;
  static dynamic _arg$key<K, T>(f) => f<K>();
  static const Field<KeyedItemList, dynamic> _f$key =
      Field('key', _$key, arg: _arg$key);
  static List<dynamic> _$items(KeyedItemList v) => v.items;
  static dynamic _arg$items<K, T>(f) => f<List<T>>();
  static const Field<KeyedItemList, List<dynamic>> _f$items =
      Field('items', _$items, arg: _arg$items);

  @override
  final MappableFields<KeyedItemList> fields = const {
    #key: _f$key,
    #items: _f$items,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'KeyedItemList';
  @override
  late final ClassMapperBase superMapper = ItemListMapper.ensureInitialized();

  @override
  DecodingContext inherit(DecodingContext context) {
    return context.inherit(args: () => [dynamic, context.arg(0)]);
  }

  static KeyedItemList<K, T> _instantiate<K, T>(DecodingData data) {
    return KeyedItemList(data.dec(_f$key), data.dec(_f$items));
  }

  @override
  final Function instantiate = _instantiate;

  static KeyedItemList<K, T> fromMap<K, T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<KeyedItemList<K, T>>(map);
  }

  static KeyedItemList<K, T> fromJson<K, T>(String json) {
    return ensureInitialized().decodeJson<KeyedItemList<K, T>>(json);
  }
}

mixin KeyedItemListMappable<K, T> {
  String toJson() {
    return KeyedItemListMapper.ensureInitialized()
        .encodeJson<KeyedItemList<K, T>>(this as KeyedItemList<K, T>);
  }

  Map<String, dynamic> toMap() {
    return KeyedItemListMapper.ensureInitialized()
        .encodeMap<KeyedItemList<K, T>>(this as KeyedItemList<K, T>);
  }

  KeyedItemListCopyWith<KeyedItemList<K, T>, KeyedItemList<K, T>,
          KeyedItemList<K, T>, K, T>
      get copyWith => _KeyedItemListCopyWithImpl(
          this as KeyedItemList<K, T>, $identity, $identity);
  @override
  String toString() {
    return KeyedItemListMapper.ensureInitialized()
        .stringifyValue(this as KeyedItemList<K, T>);
  }

  @override
  bool operator ==(Object other) {
    return KeyedItemListMapper.ensureInitialized()
        .equalsValue(this as KeyedItemList<K, T>, other);
  }

  @override
  int get hashCode {
    return KeyedItemListMapper.ensureInitialized()
        .hashValue(this as KeyedItemList<K, T>);
  }
}

extension KeyedItemListValueCopy<$R, $Out, K, T>
    on ObjectCopyWith<$R, KeyedItemList<K, T>, $Out> {
  KeyedItemListCopyWith<$R, KeyedItemList<K, T>, $Out, K, T>
      get $asKeyedItemList =>
          $base.as((v, t, t2) => _KeyedItemListCopyWithImpl(v, t, t2));
}

abstract class KeyedItemListCopyWith<$R, $In extends KeyedItemList<K, T>, $Out,
    K, T> implements ItemListCopyWith<$R, $In, $Out, T> {
  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items;
  @override
  $R call({K? key, covariant List<T>? items});
  KeyedItemListCopyWith<$R2, $In, $Out2, K, T> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _KeyedItemListCopyWithImpl<$R, $Out, K, T>
    extends ClassCopyWithBase<$R, KeyedItemList<K, T>, $Out>
    implements KeyedItemListCopyWith<$R, KeyedItemList<K, T>, $Out, K, T> {
  _KeyedItemListCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<KeyedItemList> $mapper =
      KeyedItemListMapper.ensureInitialized();
  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items => ListCopyWith(
      $value.items,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(items: v));
  @override
  $R call({K? key, Object? items = $none}) => $apply(FieldCopyWithData(
      {if (key != null) #key: key, if (items != $none) #items: items}));
  @override
  KeyedItemList<K, T> $make(CopyWithData data) => KeyedItemList(
      data.get(#key, or: $value.key), data.get(#items, or: $value.items));

  @override
  KeyedItemListCopyWith<$R2, KeyedItemList<K, T>, $Out2, K, T>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _KeyedItemListCopyWithImpl($value, $cast, t);
}

class ComparableItemListMapper extends SubClassMapperBase<ComparableItemList> {
  ComparableItemListMapper._();

  static ComparableItemListMapper? _instance;
  static ComparableItemListMapper ensureInitialized() {
    if (_instance == null) {
      MapperBase.addType<Comparable>();
      MapperContainer.globals.use(_instance = ComparableItemListMapper._());
      ItemListMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'ComparableItemList';
  @override
  Function get typeFactory =>
      <T extends Comparable<dynamic>>(f) => f<ComparableItemList<T>>();

  static List<Comparable<dynamic>> _$items(ComparableItemList v) => v.items;
  static dynamic _arg$items<T extends Comparable<dynamic>>(f) => f<List<T>>();
  static const Field<ComparableItemList, List<Comparable<dynamic>>> _f$items =
      Field('items', _$items, arg: _arg$items);

  @override
  final MappableFields<ComparableItemList> fields = const {
    #items: _f$items,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'ComparableItemList';
  @override
  late final ClassMapperBase superMapper = ItemListMapper.ensureInitialized();

  static ComparableItemList<T> _instantiate<T extends Comparable<dynamic>>(
      DecodingData data) {
    return ComparableItemList(data.dec(_f$items));
  }

  @override
  final Function instantiate = _instantiate;

  static ComparableItemList<T> fromMap<T extends Comparable<dynamic>>(
      Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ComparableItemList<T>>(map);
  }

  static ComparableItemList<T> fromJson<T extends Comparable<dynamic>>(
      String json) {
    return ensureInitialized().decodeJson<ComparableItemList<T>>(json);
  }
}

mixin ComparableItemListMappable<T extends Comparable<dynamic>> {
  String toJson() {
    return ComparableItemListMapper.ensureInitialized()
        .encodeJson<ComparableItemList<T>>(this as ComparableItemList<T>);
  }

  Map<String, dynamic> toMap() {
    return ComparableItemListMapper.ensureInitialized()
        .encodeMap<ComparableItemList<T>>(this as ComparableItemList<T>);
  }

  ComparableItemListCopyWith<ComparableItemList<T>, ComparableItemList<T>,
          ComparableItemList<T>, T>
      get copyWith => _ComparableItemListCopyWithImpl(
          this as ComparableItemList<T>, $identity, $identity);
  @override
  String toString() {
    return ComparableItemListMapper.ensureInitialized()
        .stringifyValue(this as ComparableItemList<T>);
  }

  @override
  bool operator ==(Object other) {
    return ComparableItemListMapper.ensureInitialized()
        .equalsValue(this as ComparableItemList<T>, other);
  }

  @override
  int get hashCode {
    return ComparableItemListMapper.ensureInitialized()
        .hashValue(this as ComparableItemList<T>);
  }
}

extension ComparableItemListValueCopy<$R, $Out, T extends Comparable<dynamic>>
    on ObjectCopyWith<$R, ComparableItemList<T>, $Out> {
  ComparableItemListCopyWith<$R, ComparableItemList<T>, $Out, T>
      get $asComparableItemList =>
          $base.as((v, t, t2) => _ComparableItemListCopyWithImpl(v, t, t2));
}

abstract class ComparableItemListCopyWith<$R, $In extends ComparableItemList<T>,
        $Out, T extends Comparable<dynamic>>
    implements ItemListCopyWith<$R, $In, $Out, T> {
  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items;
  @override
  $R call({List<T>? items});
  ComparableItemListCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ComparableItemListCopyWithImpl<$R, $Out, T extends Comparable<dynamic>>
    extends ClassCopyWithBase<$R, ComparableItemList<T>, $Out>
    implements ComparableItemListCopyWith<$R, ComparableItemList<T>, $Out, T> {
  _ComparableItemListCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ComparableItemList> $mapper =
      ComparableItemListMapper.ensureInitialized();
  @override
  ListCopyWith<$R, T, ObjectCopyWith<$R, T, T>> get items => ListCopyWith(
      $value.items,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(items: v));
  @override
  $R call({Object? items = $none}) =>
      $apply(FieldCopyWithData({if (items != $none) #items: items}));
  @override
  ComparableItemList<T> $make(CopyWithData data) =>
      ComparableItemList(data.get(#items, or: $value.items));

  @override
  ComparableItemListCopyWith<$R2, ComparableItemList<T>, $Out2, T>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ComparableItemListCopyWithImpl($value, $cast, t);
}
