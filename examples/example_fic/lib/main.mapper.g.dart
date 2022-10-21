import 'dart:core';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';
import 'package:fast_immutable_collections/src/ilist/ilist.dart' as p1;

import 'main.dart' as p0;


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  AMapper._(),
  BMapper._(),
  // enum mappers
  // custom mappers
  p0.IMapMapper(),
  p0.iListMapper,
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class AMapper extends BaseMapper<p0.A> {
  AMapper._();

  @override Function get decoder => decode;
  p0.A decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.A fromMap(Map<String, dynamic> map) => p0.A(Mapper.i.$get(map, 'list'));

  @override Function get encoder => encode;
  dynamic encode(p0.A v) => toMap(v);
  Map<String, dynamic> toMap(p0.A a) => {'list': Mapper.i.$enc(a.list, 'list')};

  @override String stringify(p0.A self) => 'A(list: ${Mapper.asString(self.list)})';
  @override int hash(p0.A self) => Mapper.hash(self.list);
  @override bool equals(p0.A self, p0.A other) => Mapper.isEqual(self.list, other.list);

  @override Function get typeFactory => (f) => f<p0.A>();
}

extension AMapperExtension on p0.A {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ACopyWith<p0.A> get copyWith => _ACopyWithImpl(this, $identity);
}

extension AObjectCopy<$R> on ObjectCopyWith<$R, p0.A> {
  ACopyWith<$R> get a => chain((v, t) => _ACopyWithImpl(v, t));
}

abstract class ACopyWith<$R> implements ObjectCopyWith<$R, p0.A> {
  $R call({p1.IList<p0.B>? list});
}

class _ACopyWithImpl<$R> extends BaseCopyWith<p0.A, $R> implements ACopyWith<$R> {
  _ACopyWithImpl(super.value, super.then);

  @override $R call({p1.IList<p0.B>? list}) => $then(p0.A(list ?? $value.list));
}

class BMapper extends BaseMapper<p0.B> {
  BMapper._();

  @override Function get decoder => decode;
  p0.B decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.B fromMap(Map<String, dynamic> map) => p0.B(Mapper.i.$get(map, 'str'));

  @override Function get encoder => encode;
  dynamic encode(p0.B v) => toMap(v);
  Map<String, dynamic> toMap(p0.B b) => {'str': Mapper.i.$enc(b.str, 'str')};

  @override String stringify(p0.B self) => 'B(str: ${Mapper.asString(self.str)})';
  @override int hash(p0.B self) => Mapper.hash(self.str);
  @override bool equals(p0.B self, p0.B other) => Mapper.isEqual(self.str, other.str);

  @override Function get typeFactory => (f) => f<p0.B>();
}

extension BMapperExtension on p0.B {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  BCopyWith<p0.B> get copyWith => _BCopyWithImpl(this, $identity);
}

extension BObjectCopy<$R> on ObjectCopyWith<$R, p0.B> {
  BCopyWith<$R> get b => chain((v, t) => _BCopyWithImpl(v, t));
}

abstract class BCopyWith<$R> implements ObjectCopyWith<$R, p0.B> {
  $R call({String? str});
}

class _BCopyWithImpl<$R> extends BaseCopyWith<p0.B, $R> implements BCopyWith<$R> {
  _BCopyWithImpl(super.value, super.then);

  @override $R call({String? str}) => $then(p0.B(str ?? $value.str));
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
