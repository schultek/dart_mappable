import 'dart:core';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'models/abstract_base.dart' as p2;
import 'models/base.dart' as p1;
import 'models/one.dart' as p0;
import 'models/two.dart' as p3;


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  OneMapper._(),
  BaseMapper._(),
  AbstractIdBaseMapper._(),
  TwoMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class OneMapper extends BaseMapper<p0.One> {
  OneMapper._();

  @override Function get decoder => decode;
  p0.One decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.One fromMap(Map<String, dynamic> map) => p0.One(id: Mapper.i.$get(map, 'id'), name: Mapper.i.$get(map, 'name'), objects: Mapper.i.$get(map, 'objects'));

  @override Function get encoder => encode;
  dynamic encode(p0.One v) => toMap(v);
  Map<String, dynamic> toMap(p0.One o) => {'id': Mapper.i.$enc(o.id, 'id'), 'name': Mapper.i.$enc(o.name, 'name'), 'objects': Mapper.i.$enc(o.objects, 'objects')};

  @override String stringify(p0.One self) => 'One(id: ${Mapper.asString(self.id)}, name: ${Mapper.asString(self.name)}, objects: ${Mapper.asString(self.objects)})';
  @override int hash(p0.One self) => Mapper.hash(self.id) ^ Mapper.hash(self.name) ^ Mapper.hash(self.objects);
  @override bool equals(p0.One self, p0.One other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.objects, other.objects);

  @override Function get typeFactory => (f) => f<p0.One>();
}

extension OneMapperExtension on p0.One {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

mixin OneMixin {
  OneCopyWith<p0.One> get copyWith => _OneCopyWithImpl(this as p0.One, $identity);
}

extension OneObjectCopy<$R> on ObjectCopyWith<$R, p0.One> {
  OneCopyWith<$R> get one => chain(_OneCopyWithImpl.new);
}

abstract class OneCopyWith<$R> implements BaseCopyWith<$R, p0.One> {
  @override MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic>> get objects;
  @override $R call({String? id, String? name, Map<String, dynamic>? objects});
}

class _OneCopyWithImpl<$R> extends BaseCopyWith<p0.One, $R> implements OneCopyWith<$R> {
  _OneCopyWithImpl(super.value, super.then);

  @override MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic>> get objects => MapCopyWith($value.objects, (v, t) => ObjectCopyWith(v, t), (v) => call(objects: v));
  @override $R call({String? id, String? name, Map<String, dynamic>? objects}) => $then(p0.One(id: id ?? $value.id, name: name ?? $value.name, objects: objects ?? $value.objects));
}

class BaseMapper extends BaseMapper<p1.Base> {
  BaseMapper._();

  @override Function get decoder => decode;
  p1.Base decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p1.Base fromMap(Map<String, dynamic> map) => throw MapperException.missingConstructor('Base');

  @override Function get encoder => encode;
  dynamic encode(p1.Base v) => toMap(v);
  Map<String, dynamic> toMap(p1.Base b) => {'id': Mapper.i.$enc(b.id, 'id'), 'name': Mapper.i.$enc(b.name, 'name'), 'objects': Mapper.i.$enc(b.objects, 'objects')};

  @override String stringify(p1.Base self) => 'Base(id: ${Mapper.asString(self.id)}, name: ${Mapper.asString(self.name)}, objects: ${Mapper.asString(self.objects)})';
  @override int hash(p1.Base self) => Mapper.hash(self.id) ^ Mapper.hash(self.name) ^ Mapper.hash(self.objects);
  @override bool equals(p1.Base self, p1.Base other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.objects, other.objects);

  @override Function get typeFactory => (f) => f<p1.Base>();
}

extension BaseMapperExtension on p1.Base {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

mixin BaseMixin {
  BaseCopyWith<p1.Base, p1.Base> get copyWith;
}

abstract class BaseCopyWith<$R, $V extends p1.Base> implements AbstractIdBaseCopyWith<$R, $V> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic>?> get objects;
  @override $R call({String? id, String? name, Map<String, dynamic>? objects});
}


class AbstractIdBaseMapper extends BaseMapper<p2.AbstractIdBase> {
  AbstractIdBaseMapper._();

  @override Function get decoder => decode;
  p2.AbstractIdBase decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p2.AbstractIdBase fromMap(Map<String, dynamic> map) => throw MapperException.missingConstructor('AbstractIdBase');

  @override Function get encoder => encode;
  dynamic encode(p2.AbstractIdBase v) => toMap(v);
  Map<String, dynamic> toMap(p2.AbstractIdBase a) => {'id': Mapper.i.$enc(a.id, 'id'), 'name': Mapper.i.$enc(a.name, 'name')};

  @override String stringify(p2.AbstractIdBase self) => 'AbstractIdBase(id: ${Mapper.asString(self.id)}, name: ${Mapper.asString(self.name)})';
  @override int hash(p2.AbstractIdBase self) => Mapper.hash(self.id) ^ Mapper.hash(self.name);
  @override bool equals(p2.AbstractIdBase self, p2.AbstractIdBase other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.name, other.name);

  @override Function get typeFactory => (f) => f<p2.AbstractIdBase>();
}

extension AbstractIdBaseMapperExtension on p2.AbstractIdBase {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

mixin AbstractIdBaseMixin {
  AbstractIdBaseCopyWith<p2.AbstractIdBase, p2.AbstractIdBase> get copyWith;
}

abstract class AbstractIdBaseCopyWith<$R, $V extends p2.AbstractIdBase> implements ObjectCopyWith<$R, $V> {
  $R call({String? id, String? name});
}


class TwoMapper extends BaseMapper<p3.Two> {
  TwoMapper._();

  @override Function get decoder => decode;
  p3.Two decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p3.Two fromMap(Map<String, dynamic> map) => p3.Two(id: Mapper.i.$get(map, 'id'));

  @override Function get encoder => encode;
  dynamic encode(p3.Two v) => toMap(v);
  Map<String, dynamic> toMap(p3.Two t) => {'id': Mapper.i.$enc(t.id, 'id')};

  @override String stringify(p3.Two self) => 'Two(id: ${Mapper.asString(self.id)}, name: ${Mapper.asString(self.name)})';
  @override int hash(p3.Two self) => Mapper.hash(self.id) ^ Mapper.hash(self.name);
  @override bool equals(p3.Two self, p3.Two other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.name, other.name);

  @override Function get typeFactory => (f) => f<p3.Two>();
}

extension TwoMapperExtension on p3.Two {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

mixin TwoMixin {
  TwoCopyWith<p3.Two> get copyWith => _TwoCopyWithImpl(this as p3.Two, $identity);
}

extension TwoObjectCopy<$R> on ObjectCopyWith<$R, p3.Two> {
  TwoCopyWith<$R> get two => chain(_TwoCopyWithImpl.new);
}

abstract class TwoCopyWith<$R> implements AbstractIdBaseCopyWith<$R, p3.Two> {
  @override $R call({String? id});
}

class _TwoCopyWithImpl<$R> extends BaseCopyWith<p3.Two, $R> implements TwoCopyWith<$R> {
  _TwoCopyWithImpl(super.value, super.then);

  @override $R call({String? id}) => $then(p3.Two(id: id ?? $value.id));
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
