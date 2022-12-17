// ignore_for_file: unused_element
import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'primitives_test.dart' as p0;


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <MapperElementBase>{
  // class mappers
  ItemsMapper._(),
  ItemMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class ItemsMapper extends MapperElementBase<p0.Items> {
  ItemsMapper._();

  @override Function get decoder => decode;
  p0.Items decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Items fromMap(Map<String, dynamic> map) => p0.Items(Mapper.i.$get(map, 'items'), Mapper.i.$get(map, 'items2'));

  @override Function get encoder => encode;
  dynamic encode(p0.Items v) => toMap(v);
  Map<String, dynamic> toMap(p0.Items i) => {'items': Mapper.i.$enc(i.items, 'items'), 'items2': Mapper.i.$enc(i.items2, 'items2')};

  @override String stringify(p0.Items self) => 'Items(items: ${Mapper.asString(self.items)}, items2: ${Mapper.asString(self.items2)})';
  @override int hash(p0.Items self) => Mapper.hash(self.items) ^ Mapper.hash(self.items2);
  @override bool equals(p0.Items self, p0.Items other) => Mapper.isEqual(self.items, other.items) && Mapper.isEqual(self.items2, other.items2);

  @override Function get typeFactory => (f) => f<p0.Items>();
}

mixin ItemsMappable implements MappableMixin {
  String toJson() => Mapper.toJson(this as p0.Items);
  Map<String, dynamic> toMap() => Mapper.toMap(this as p0.Items);
  ItemsCopyWith<p0.Items> get copyWith => _ItemsCopyWithImpl(this as p0.Items, $identity, $identity);
  @override String toString() => Mapper.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && Mapper.isEqual(this, other));
  @override int get hashCode => Mapper.hash(this);
}

extension ItemsObjectCopy<$R> on ObjectCopyWith<$R, p0.Items, p0.Items> {
  ItemsCopyWith<$R> get asItems => base.as((v, t, t2) => _ItemsCopyWithImpl(v, t, t2));
}

abstract class ItemsCopyWith<$R> implements ObjectCopyWith<$R, p0.Items, p0.Items> {
  ItemsCopyWith<$R2> _chain<$R2>(Then<p0.Items, p0.Items> t, Then<p0.Items, $R2> t2);
  ListCopyWith<$R, p0.Item, ItemCopyWith<$R>> get items;
  MapCopyWith<$R, int, p0.Item, ItemCopyWith<$R>> get items2;
  $R call({List<p0.Item>? items, Map<int, p0.Item>? items2});
}

class _ItemsCopyWithImpl<$R> extends CopyWithBase<$R, p0.Items, p0.Items> implements ItemsCopyWith<$R> {
  _ItemsCopyWithImpl(super.value, super.then, super.then2);
  @override ItemsCopyWith<$R2> _chain<$R2>(Then<p0.Items, p0.Items> t, Then<p0.Items, $R2> t2) => _ItemsCopyWithImpl($value, t, t2);

  @override ListCopyWith<$R, p0.Item, ItemCopyWith<$R>> get items => ListCopyWith($value.items, (v, t) => v.copyWith._chain($identity, t), (v) => call(items: v));
  @override MapCopyWith<$R, int, p0.Item, ItemCopyWith<$R>> get items2 => MapCopyWith($value.items2, (v, t) => v.copyWith._chain($identity, t), (v) => call(items2: v));
  @override $R call({List<p0.Item>? items, Map<int, p0.Item>? items2}) => $then(p0.Items(items ?? $value.items, items2 ?? $value.items2));
}

class ItemMapper extends MapperElementBase<p0.Item> {
  ItemMapper._();

  @override Function get decoder => decode;
  p0.Item decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Item fromMap(Map<String, dynamic> map) => p0.Item(Mapper.i.$get(map, 'index'));

  @override Function get encoder => encode;
  dynamic encode(p0.Item v) => toMap(v);
  Map<String, dynamic> toMap(p0.Item i) => {'index': Mapper.i.$enc(i.index, 'index')};

  @override String stringify(p0.Item self) => 'Item(index: ${Mapper.asString(self.index)})';
  @override int hash(p0.Item self) => Mapper.hash(self.index);
  @override bool equals(p0.Item self, p0.Item other) => Mapper.isEqual(self.index, other.index);

  @override Function get typeFactory => (f) => f<p0.Item>();
}

mixin ItemMappable implements MappableMixin {
  String toJson() => Mapper.toJson(this as p0.Item);
  Map<String, dynamic> toMap() => Mapper.toMap(this as p0.Item);
  ItemCopyWith<p0.Item> get copyWith => _ItemCopyWithImpl(this as p0.Item, $identity, $identity);
  @override String toString() => Mapper.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && Mapper.isEqual(this, other));
  @override int get hashCode => Mapper.hash(this);
}

extension ItemObjectCopy<$R> on ObjectCopyWith<$R, p0.Item, p0.Item> {
  ItemCopyWith<$R> get asItem => base.as((v, t, t2) => _ItemCopyWithImpl(v, t, t2));
}

abstract class ItemCopyWith<$R> implements ObjectCopyWith<$R, p0.Item, p0.Item> {
  ItemCopyWith<$R2> _chain<$R2>(Then<p0.Item, p0.Item> t, Then<p0.Item, $R2> t2);
  $R call({int? index});
}

class _ItemCopyWithImpl<$R> extends CopyWithBase<$R, p0.Item, p0.Item> implements ItemCopyWith<$R> {
  _ItemCopyWithImpl(super.value, super.then, super.then2);
  @override ItemCopyWith<$R2> _chain<$R2>(Then<p0.Item, p0.Item> t, Then<p0.Item, $R2> t2) => _ItemCopyWithImpl($value, t, t2);

  @override $R call({int? index}) => $then(p0.Item(index ?? $value.index));
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

  static void use<T>(MapperElementBase<T> mapper) => i.use<T>(mapper);
  static MapperElementBase<T>? unuse<T>() => i.unuse<T>();
  static void useAll(List<MapperElementBase> mappers) => i.useAll(mappers);

  static MapperElementBase<T>? get<T>([Type? type]) => i.get<T>(type);
  static List<MapperElementBase> getAll() => i.getAll();
}

extension _ChainedCopyWith<Result, In, Out> on ObjectCopyWith<Result, In, Out> {
  CopyWithBase<Result, In, Out> get base => this as CopyWithBase<Result, In, Out>;
}
