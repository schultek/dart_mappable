// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'primitives_test.dart';

class ItemsMapper extends ClassMapperBase<Items> {
  ItemsMapper._();
  static ItemsMapper? _instance;
  static ItemsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ItemsMapper._());
      ItemMapper.ensureInitialized();
    }
    return _instance!;
  }
  @override
  final String id = 'Items';

  static List<Item> _$items(Items v) => v.items;
  static Map<int, Item> _$items2(Items v) => v.items2;

  @override
  final Map<Symbol, Field<Items, dynamic>> fields = const {
    #items: Field<Items, List<Item>>('items', _$items),
    #items2: Field<Items, Map<int, Item>>('items2', _$items2),
  };

  static Items _instantiate(DecodingData data) {
    return Items(data.get(#items), data.get(#items2));
  }
  @override
  final Function instantiate = _instantiate;

  static Items fromMap(Map<String, dynamic> map) {
    ensureInitialized();
    return MapperContainer.globals.fromMap<Items>(map);
  }
  static Items fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<Items>(json);
  }
}

mixin ItemsMappable {
  String toJson() {
    ItemsMapper.ensureInitialized();
    return MapperContainer.globals.toJson(this as Items);
  }
  Map<String, dynamic> toMap() {
    ItemsMapper.ensureInitialized();
    return MapperContainer.globals.toMap(this as Items);
  }
  ItemsCopyWith<Items, Items, Items> get copyWith => _ItemsCopyWithImpl(this as Items, $identity, $identity);
  @override
  String toString() {
    ItemsMapper.ensureInitialized();
    return MapperContainer.globals.asString(this);
  }
  @override
  bool operator ==(Object other) {
    ItemsMapper.ensureInitialized();
    return identical(this, other) || (runtimeType == other.runtimeType && MapperContainer.globals.isEqual(this, other));
  }
  @override
  int get hashCode {
    ItemsMapper.ensureInitialized();
    return MapperContainer.globals.hash(this);
  }
}

extension ItemsValueCopy<$R, $Out extends Items> on ObjectCopyWith<$R, Items, $Out> {
  ItemsCopyWith<$R, Items, $Out> get asItems => base.as((v, t, t2) => _ItemsCopyWithImpl(v, t, t2));
}

typedef ItemsCopyWithBound = Items;
abstract class ItemsCopyWith<$R, $In extends Items, $Out extends Items> implements ObjectCopyWith<$R, $In, $Out> {
  ItemsCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Items>(Then<Items, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, Item, ItemCopyWith<$R, Item, Item>> get items;
  MapCopyWith<$R, int, Item, ItemCopyWith<$R, Item, Item>> get items2;
  $R call({List<Item>? items, Map<int, Item>? items2});
}

class _ItemsCopyWithImpl<$R, $Out extends Items> extends CopyWithBase<$R, Items, $Out> implements ItemsCopyWith<$R, Items, $Out> {
  _ItemsCopyWithImpl(super.value, super.then, super.then2);
  @override ItemsCopyWith<$R2, Items, $Out2> chain<$R2, $Out2 extends Items>(Then<Items, $Out2> t, Then<$Out2, $R2> t2) => _ItemsCopyWithImpl($value, t, t2);

  @override ListCopyWith<$R, Item, ItemCopyWith<$R, Item, Item>> get items => ListCopyWith($value.items, (v, t) => v.copyWith.chain<$R, Item>($identity, t), (v) => call(items: v));
  @override MapCopyWith<$R, int, Item, ItemCopyWith<$R, Item, Item>> get items2 => MapCopyWith($value.items2, (v, t) => v.copyWith.chain<$R, Item>($identity, t), (v) => call(items2: v));
  @override $R call({List<Item>? items, Map<int, Item>? items2}) => $then(Items(items ?? $value.items, items2 ?? $value.items2));
}

class ItemMapper extends ClassMapperBase<Item> {
  ItemMapper._();
  static ItemMapper? _instance;
  static ItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ItemMapper._());
    }
    return _instance!;
  }
  @override
  final String id = 'Item';

  static int _$index(Item v) => v.index;

  @override
  final Map<Symbol, Field<Item, dynamic>> fields = const {
    #index: Field<Item, int>('index', _$index),
  };

  static Item _instantiate(DecodingData data) {
    return Item(data.get(#index));
  }
  @override
  final Function instantiate = _instantiate;

  static Item fromMap(Map<String, dynamic> map) {
    ensureInitialized();
    return MapperContainer.globals.fromMap<Item>(map);
  }
  static Item fromJson(String json) {
    ensureInitialized();
    return MapperContainer.globals.fromJson<Item>(json);
  }
}

mixin ItemMappable {
  String toJson() {
    ItemMapper.ensureInitialized();
    return MapperContainer.globals.toJson(this as Item);
  }
  Map<String, dynamic> toMap() {
    ItemMapper.ensureInitialized();
    return MapperContainer.globals.toMap(this as Item);
  }
  ItemCopyWith<Item, Item, Item> get copyWith => _ItemCopyWithImpl(this as Item, $identity, $identity);
  @override
  String toString() {
    ItemMapper.ensureInitialized();
    return MapperContainer.globals.asString(this);
  }
  @override
  bool operator ==(Object other) {
    ItemMapper.ensureInitialized();
    return identical(this, other) || (runtimeType == other.runtimeType && MapperContainer.globals.isEqual(this, other));
  }
  @override
  int get hashCode {
    ItemMapper.ensureInitialized();
    return MapperContainer.globals.hash(this);
  }
}

extension ItemValueCopy<$R, $Out extends Item> on ObjectCopyWith<$R, Item, $Out> {
  ItemCopyWith<$R, Item, $Out> get asItem => base.as((v, t, t2) => _ItemCopyWithImpl(v, t, t2));
}

typedef ItemCopyWithBound = Item;
abstract class ItemCopyWith<$R, $In extends Item, $Out extends Item> implements ObjectCopyWith<$R, $In, $Out> {
  ItemCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Item>(Then<Item, $Out2> t, Then<$Out2, $R2> t2);
  $R call({int? index});
}

class _ItemCopyWithImpl<$R, $Out extends Item> extends CopyWithBase<$R, Item, $Out> implements ItemCopyWith<$R, Item, $Out> {
  _ItemCopyWithImpl(super.value, super.then, super.then2);
  @override ItemCopyWith<$R2, Item, $Out2> chain<$R2, $Out2 extends Item>(Then<Item, $Out2> t, Then<$Out2, $R2> t2) => _ItemCopyWithImpl($value, t, t2);

  @override $R call({int? index}) => $then(Item(index ?? $value.index));
}
