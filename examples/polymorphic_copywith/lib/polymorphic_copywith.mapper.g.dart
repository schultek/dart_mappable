// ignore_for_file: unused_element
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
  BaseObjectMapper._(),
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
  OneCopyWith<p0.One, p0.One> get copyWith => _OneCopyWithImpl(this as p0.One, $identity, $identity);
}

extension OneObjectCopy<$R, $Out extends p2.AbstractIdBase> on ObjectCopyWith<$R, p0.One, $Out> {
  OneCopyWith<$R, $Out> get asOne => base.as((v, t, t2) => _OneCopyWithImpl(v, t, t2));
}

abstract class OneCopyWith<$R, $Out extends p2.AbstractIdBase> implements BaseObjectCopyWith<$R, p0.One, $Out> {
  @override MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>> get objects;
  @override $R call({String? id, String? name, Map<String, dynamic>? objects});
}

class _OneCopyWithImpl<$R, $Out extends p2.AbstractIdBase> extends BaseCopyWith<$R, p0.One, $Out> implements OneCopyWith<$R, $Out> {
  _OneCopyWithImpl(super.value, super.then, super.then2);
  @override OneCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p2.AbstractIdBase>(Then<p0.One, $Out2> t, Then<$Out2, $R2> t2) => _OneCopyWithImpl($value, t, t2);

  @override MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>> get objects => MapCopyWith($value.objects, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(objects: v));
  @override $R call({String? id, String? name, Map<String, dynamic>? objects}) => $then(p0.One(id: id ?? $value.id, name: name ?? $value.name, objects: objects ?? $value.objects));
}

class BaseObjectMapper extends BaseMapper<p1.BaseObject> {
  BaseObjectMapper._();

  @override Function get decoder => decode;
  p1.BaseObject decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p1.BaseObject fromMap(Map<String, dynamic> map) => throw MapperException.missingConstructor('BaseObject');

  @override Function get encoder => encode;
  dynamic encode(p1.BaseObject v) => toMap(v);
  Map<String, dynamic> toMap(p1.BaseObject b) => {'id': Mapper.i.$enc(b.id, 'id'), 'name': Mapper.i.$enc(b.name, 'name'), 'objects': Mapper.i.$enc(b.objects, 'objects')};

  @override String stringify(p1.BaseObject self) => 'BaseObject(id: ${Mapper.asString(self.id)}, name: ${Mapper.asString(self.name)}, objects: ${Mapper.asString(self.objects)})';
  @override int hash(p1.BaseObject self) => Mapper.hash(self.id) ^ Mapper.hash(self.name) ^ Mapper.hash(self.objects);
  @override bool equals(p1.BaseObject self, p1.BaseObject other) => Mapper.isEqual(self.id, other.id) && Mapper.isEqual(self.name, other.name) && Mapper.isEqual(self.objects, other.objects);

  @override Function get typeFactory => (f) => f<p1.BaseObject>();
}

extension BaseObjectMapperExtension on p1.BaseObject {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

mixin BaseObjectMixin {
  BaseObjectCopyWith<p1.BaseObject, p1.BaseObject, p1.BaseObject> get copyWith;
}

abstract class BaseObjectCopyWith<$R, $In extends p1.BaseObject, $Out extends p2.AbstractIdBase> implements AbstractIdBaseCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>?> get objects;
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
  AbstractIdBaseCopyWith<p2.AbstractIdBase, p2.AbstractIdBase, p2.AbstractIdBase> get copyWith;
}

abstract class AbstractIdBaseCopyWith<$R, $In extends p2.AbstractIdBase, $Out extends p2.AbstractIdBase> implements ObjectCopyWith<$R, $In, $Out> {
  AbstractIdBaseCopyWith<$R2, $In, $Out2> _chain<$R2, $Out2 extends p2.AbstractIdBase>(Then<p2.AbstractIdBase, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? id});
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
  TwoCopyWith<p3.Two, p3.Two> get copyWith => _TwoCopyWithImpl(this as p3.Two, $identity, $identity);
}

extension TwoObjectCopy<$R, $Out extends p2.AbstractIdBase> on ObjectCopyWith<$R, p3.Two, $Out> {
  TwoCopyWith<$R, $Out> get asTwo => base.as((v, t, t2) => _TwoCopyWithImpl(v, t, t2));
}

abstract class TwoCopyWith<$R, $Out extends p2.AbstractIdBase> implements AbstractIdBaseCopyWith<$R, p3.Two, $Out> {
  @override $R call({String? id});
}

class _TwoCopyWithImpl<$R, $Out extends p2.AbstractIdBase> extends BaseCopyWith<$R, p3.Two, $Out> implements TwoCopyWith<$R, $Out> {
  _TwoCopyWithImpl(super.value, super.then, super.then2);
  @override TwoCopyWith<$R2, $Out2> _chain<$R2, $Out2 extends p2.AbstractIdBase>(Then<p3.Two, $Out2> t, Then<$Out2, $R2> t2) => _TwoCopyWithImpl($value, t, t2);

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

extension _ChainedCopyWith<Result, In, Out> on ObjectCopyWith<Result, In, Out> {
  BaseCopyWith<Result, In, Out> get base => this as BaseCopyWith<Result, In, Out>;
}
