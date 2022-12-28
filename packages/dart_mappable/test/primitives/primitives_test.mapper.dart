// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'primitives_test.dart';

class ItemsMapper extends MapperBase<Items> {
  static MapperContainer container = MapperContainer(
    mappers: {ItemsMapper()},
  )..linkAll({ItemMapper.container});

  @override
  ItemsMapperElement createElement(MapperContainer container) {
    return ItemsMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<Items>;
  static final fromJson = container.fromJson<Items>;
}

class ItemsMapperElement extends MapperElementBase<Items> {
  ItemsMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Items decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Items fromMap(Map<String, dynamic> map) =>
      Items(container.$get(map, 'items'), container.$get(map, 'items2'));

  @override
  Function get encoder => encode;
  dynamic encode(Items v) => toMap(v);
  Map<String, dynamic> toMap(Items i) => {
        'items': container.$enc(i.items, 'items'),
        'items2': container.$enc(i.items2, 'items2')
      };

  @override
  String stringify(Items self) =>
      'Items(items: ${container.asString(self.items)}, items2: ${container.asString(self.items2)})';
  @override
  int hash(Items self) =>
      container.hash(self.items) ^ container.hash(self.items2);
  @override
  bool equals(Items self, Items other) =>
      container.isEqual(self.items, other.items) &&
      container.isEqual(self.items2, other.items2);
}

mixin ItemsMappable {
  String toJson() => ItemsMapper.container.toJson(this as Items);
  Map<String, dynamic> toMap() => ItemsMapper.container.toMap(this as Items);
  ItemsCopyWith<Items, Items, Items> get copyWith =>
      _ItemsCopyWithImpl(this as Items, $identity, $identity);
  @override
  String toString() => ItemsMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          ItemsMapper.container.isEqual(this, other));
  @override
  int get hashCode => ItemsMapper.container.hash(this);
}

extension ItemsValueCopy<$R, $Out extends Items>
    on ObjectCopyWith<$R, Items, $Out> {
  ItemsCopyWith<$R, Items, $Out> get asItems =>
      base.as((v, t, t2) => _ItemsCopyWithImpl(v, t, t2));
}

typedef ItemsCopyWithBound = Items;

abstract class ItemsCopyWith<$R, $In extends Items, $Out extends Items>
    implements ObjectCopyWith<$R, $In, $Out> {
  ItemsCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Items>(
      Then<Items, $Out2> t, Then<$Out2, $R2> t2);
  ListCopyWith<$R, Item, ItemCopyWith<$R, Item, Item>> get items;
  MapCopyWith<$R, int, Item, ItemCopyWith<$R, Item, Item>> get items2;
  $R call({List<Item>? items, Map<int, Item>? items2});
}

class _ItemsCopyWithImpl<$R, $Out extends Items>
    extends CopyWithBase<$R, Items, $Out>
    implements ItemsCopyWith<$R, Items, $Out> {
  _ItemsCopyWithImpl(super.value, super.then, super.then2);
  @override
  ItemsCopyWith<$R2, Items, $Out2> chain<$R2, $Out2 extends Items>(
          Then<Items, $Out2> t, Then<$Out2, $R2> t2) =>
      _ItemsCopyWithImpl($value, t, t2);

  @override
  ListCopyWith<$R, Item, ItemCopyWith<$R, Item, Item>> get items =>
      ListCopyWith($value.items, (v, t) => v.copyWith.chain($identity, t),
          (v) => call(items: v));
  @override
  MapCopyWith<$R, int, Item, ItemCopyWith<$R, Item, Item>> get items2 =>
      MapCopyWith($value.items2, (v, t) => v.copyWith.chain($identity, t),
          (v) => call(items2: v));
  @override
  $R call({List<Item>? items, Map<int, Item>? items2}) =>
      $then(Items(items ?? $value.items, items2 ?? $value.items2));
}

class ItemMapper extends MapperBase<Item> {
  static MapperContainer container = MapperContainer(
    mappers: {ItemMapper()},
  );

  @override
  ItemMapperElement createElement(MapperContainer container) {
    return ItemMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<Item>;
  static final fromJson = container.fromJson<Item>;
}

class ItemMapperElement extends MapperElementBase<Item> {
  ItemMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Item decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Item fromMap(Map<String, dynamic> map) => Item(container.$get(map, 'index'));

  @override
  Function get encoder => encode;
  dynamic encode(Item v) => toMap(v);
  Map<String, dynamic> toMap(Item i) =>
      {'index': container.$enc(i.index, 'index')};

  @override
  String stringify(Item self) =>
      'Item(index: ${container.asString(self.index)})';
  @override
  int hash(Item self) => container.hash(self.index);
  @override
  bool equals(Item self, Item other) =>
      container.isEqual(self.index, other.index);
}

mixin ItemMappable {
  String toJson() => ItemMapper.container.toJson(this as Item);
  Map<String, dynamic> toMap() => ItemMapper.container.toMap(this as Item);
  ItemCopyWith<Item, Item, Item> get copyWith =>
      _ItemCopyWithImpl(this as Item, $identity, $identity);
  @override
  String toString() => ItemMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          ItemMapper.container.isEqual(this, other));
  @override
  int get hashCode => ItemMapper.container.hash(this);
}

extension ItemValueCopy<$R, $Out extends Item>
    on ObjectCopyWith<$R, Item, $Out> {
  ItemCopyWith<$R, Item, $Out> get asItem =>
      base.as((v, t, t2) => _ItemCopyWithImpl(v, t, t2));
}

typedef ItemCopyWithBound = Item;

abstract class ItemCopyWith<$R, $In extends Item, $Out extends Item>
    implements ObjectCopyWith<$R, $In, $Out> {
  ItemCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Item>(
      Then<Item, $Out2> t, Then<$Out2, $R2> t2);
  $R call({int? index});
}

class _ItemCopyWithImpl<$R, $Out extends Item>
    extends CopyWithBase<$R, Item, $Out>
    implements ItemCopyWith<$R, Item, $Out> {
  _ItemCopyWithImpl(super.value, super.then, super.then2);
  @override
  ItemCopyWith<$R2, Item, $Out2> chain<$R2, $Out2 extends Item>(
          Then<Item, $Out2> t, Then<$Out2, $R2> t2) =>
      _ItemCopyWithImpl($value, t, t2);

  @override
  $R call({int? index}) => $then(Item(index ?? $value.index));
}
