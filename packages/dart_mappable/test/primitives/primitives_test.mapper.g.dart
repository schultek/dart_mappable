import 'dart:core';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'primitives_test.dart' as p0;


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  ItemsMapper._(),
  ItemMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class ItemsMapper extends BaseMapper<p0.Items> {
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

extension ItemsMapperExtension on p0.Items {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ItemsCopyWith<p0.Items> get copyWith => _ItemsCopyWithImpl(this, $identity);
}

extension ItemsObjectCopy<$R> on ObjectCopyWith<$R, p0.Items> {
  ItemsCopyWith<$R> get asItems => chain(_ItemsCopyWithImpl.new);
}

abstract class ItemsCopyWith<$R> implements ObjectCopyWith<$R, p0.Items> {
  ListCopyWith<$R, p0.Item, ItemCopyWith<$R>> get items;
  MapCopyWith<$R, int, p0.Item, ItemCopyWith<$R>> get items2;
  $R call({List<p0.Item>? items, Map<int, p0.Item>? items2});
}

class _ItemsCopyWithImpl<$R> extends BaseCopyWith<p0.Items, $R> implements ItemsCopyWith<$R> {
  _ItemsCopyWithImpl(super.value, super.then);

  @override ListCopyWith<$R, p0.Item, ItemCopyWith<$R>> get items => ListCopyWith($value.items, (v, t) => _ItemCopyWithImpl(v, t), (v) => call(items: v));
  @override MapCopyWith<$R, int, p0.Item, ItemCopyWith<$R>> get items2 => MapCopyWith($value.items2, (v, t) => _ItemCopyWithImpl(v, t), (v) => call(items2: v));
  @override $R call({List<p0.Item>? items, Map<int, p0.Item>? items2}) => $then(p0.Items(items ?? $value.items, items2 ?? $value.items2));
}

class ItemMapper extends BaseMapper<p0.Item> {
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

extension ItemMapperExtension on p0.Item {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ItemCopyWith<p0.Item> get copyWith => _ItemCopyWithImpl(this, $identity);
}

extension ItemObjectCopy<$R> on ObjectCopyWith<$R, p0.Item> {
  ItemCopyWith<$R> get asItem => chain(_ItemCopyWithImpl.new);
}

abstract class ItemCopyWith<$R> implements ObjectCopyWith<$R, p0.Item> {
  $R call({int? index});
}

class _ItemCopyWithImpl<$R> extends BaseCopyWith<p0.Item, $R> implements ItemCopyWith<$R> {
  _ItemCopyWithImpl(super.value, super.then);

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
