// ignore_for_file: unused_element
import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'default_values_test.dart' as p0;
import 'otherlib.dart' as p1;


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <MapperElementBase>{
  // class mappers
  AMapper._(),
  BMapper._(),
  CMapper._(),
  A1Mapper._(),
  B1Mapper._(),
  C1Mapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class AMapper extends MapperElementBase<p0.A> {
  AMapper._();

  @override Function get decoder => decode;
  p0.A decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.A fromMap(Map<String, dynamic> map) => p0.A(b: Mapper.i.$getOpt(map, 'b') ?? const p0.B(c: p0.C(p0.C.def)));

  @override Function get encoder => encode;
  dynamic encode(p0.A v) => toMap(v);
  Map<String, dynamic> toMap(p0.A a) => {'b': Mapper.i.$enc(a.b, 'b')};

  @override String stringify(p0.A self) => 'A(b: ${Mapper.asString(self.b)})';
  @override int hash(p0.A self) => Mapper.hash(self.b);
  @override bool equals(p0.A self, p0.A other) => Mapper.isEqual(self.b, other.b);

  @override Function get typeFactory => (f) => f<p0.A>();
}

mixin AMappable implements MappableMixin {
  String toJson() => Mapper.toJson(this as p0.A);
  Map<String, dynamic> toMap() => Mapper.toMap(this as p0.A);
  ACopyWith<p0.A> get copyWith => _ACopyWithImpl(this as p0.A, $identity, $identity);
  @override String toString() => Mapper.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && Mapper.isEqual(this, other));
  @override int get hashCode => Mapper.hash(this);
}

extension AObjectCopy<$R> on ObjectCopyWith<$R, p0.A, p0.A> {
  ACopyWith<$R> get asA => base.as((v, t, t2) => _ACopyWithImpl(v, t, t2));
}

abstract class ACopyWith<$R> implements ObjectCopyWith<$R, p0.A, p0.A> {
  ACopyWith<$R2> _chain<$R2>(Then<p0.A, p0.A> t, Then<p0.A, $R2> t2);
  BCopyWith<$R> get b;
  $R call({p0.B? b});
}

class _ACopyWithImpl<$R> extends BaseCopyWith<$R, p0.A, p0.A> implements ACopyWith<$R> {
  _ACopyWithImpl(super.value, super.then, super.then2);
  @override ACopyWith<$R2> _chain<$R2>(Then<p0.A, p0.A> t, Then<p0.A, $R2> t2) => _ACopyWithImpl($value, t, t2);

  @override BCopyWith<$R> get b => $value.b.copyWith._chain($identity, (v) => call(b: v));
  @override $R call({p0.B? b}) => $then(p0.A(b: b ?? $value.b));
}

class BMapper extends MapperElementBase<p0.B> {
  BMapper._();

  @override Function get decoder => decode;
  p0.B decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.B fromMap(Map<String, dynamic> map) => p0.B(c: Mapper.i.$get(map, 'c'));

  @override Function get encoder => encode;
  dynamic encode(p0.B v) => toMap(v);
  Map<String, dynamic> toMap(p0.B b) => {'c': Mapper.i.$enc(b.c, 'c')};

  @override String stringify(p0.B self) => 'B(c: ${Mapper.asString(self.c)})';
  @override int hash(p0.B self) => Mapper.hash(self.c);
  @override bool equals(p0.B self, p0.B other) => Mapper.isEqual(self.c, other.c);

  @override Function get typeFactory => (f) => f<p0.B>();
}

mixin BMappable implements MappableMixin {
  String toJson() => Mapper.toJson(this as p0.B);
  Map<String, dynamic> toMap() => Mapper.toMap(this as p0.B);
  BCopyWith<p0.B> get copyWith => _BCopyWithImpl(this as p0.B, $identity, $identity);
  @override String toString() => Mapper.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && Mapper.isEqual(this, other));
  @override int get hashCode => Mapper.hash(this);
}

extension BObjectCopy<$R> on ObjectCopyWith<$R, p0.B, p0.B> {
  BCopyWith<$R> get asB => base.as((v, t, t2) => _BCopyWithImpl(v, t, t2));
}

abstract class BCopyWith<$R> implements ObjectCopyWith<$R, p0.B, p0.B> {
  BCopyWith<$R2> _chain<$R2>(Then<p0.B, p0.B> t, Then<p0.B, $R2> t2);
  CCopyWith<$R> get c;
  $R call({p0.C? c});
}

class _BCopyWithImpl<$R> extends BaseCopyWith<$R, p0.B, p0.B> implements BCopyWith<$R> {
  _BCopyWithImpl(super.value, super.then, super.then2);
  @override BCopyWith<$R2> _chain<$R2>(Then<p0.B, p0.B> t, Then<p0.B, $R2> t2) => _BCopyWithImpl($value, t, t2);

  @override CCopyWith<$R> get c => $value.c.copyWith._chain($identity, (v) => call(c: v));
  @override $R call({p0.C? c}) => $then(p0.B(c: c ?? $value.c));
}

class CMapper extends MapperElementBase<p0.C> {
  CMapper._();

  @override Function get decoder => decode;
  p0.C decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.C fromMap(Map<String, dynamic> map) => p0.C(Mapper.i.$get(map, 'd'));

  @override Function get encoder => encode;
  dynamic encode(p0.C v) => toMap(v);
  Map<String, dynamic> toMap(p0.C c) => {'d': Mapper.i.$enc(c.d, 'd')};

  @override String stringify(p0.C self) => 'C(d: ${Mapper.asString(self.d)})';
  @override int hash(p0.C self) => Mapper.hash(self.d);
  @override bool equals(p0.C self, p0.C other) => Mapper.isEqual(self.d, other.d);

  @override Function get typeFactory => (f) => f<p0.C>();
}

mixin CMappable implements MappableMixin {
  String toJson() => Mapper.toJson(this as p0.C);
  Map<String, dynamic> toMap() => Mapper.toMap(this as p0.C);
  CCopyWith<p0.C> get copyWith => _CCopyWithImpl(this as p0.C, $identity, $identity);
  @override String toString() => Mapper.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && Mapper.isEqual(this, other));
  @override int get hashCode => Mapper.hash(this);
}

extension CObjectCopy<$R> on ObjectCopyWith<$R, p0.C, p0.C> {
  CCopyWith<$R> get asC => base.as((v, t, t2) => _CCopyWithImpl(v, t, t2));
}

abstract class CCopyWith<$R> implements ObjectCopyWith<$R, p0.C, p0.C> {
  CCopyWith<$R2> _chain<$R2>(Then<p0.C, p0.C> t, Then<p0.C, $R2> t2);
  $R call({String? d});
}

class _CCopyWithImpl<$R> extends BaseCopyWith<$R, p0.C, p0.C> implements CCopyWith<$R> {
  _CCopyWithImpl(super.value, super.then, super.then2);
  @override CCopyWith<$R2> _chain<$R2>(Then<p0.C, p0.C> t, Then<p0.C, $R2> t2) => _CCopyWithImpl($value, t, t2);

  @override $R call({String? d}) => $then(p0.C(d ?? $value.d));
}

class A1Mapper extends MapperElementBase<p1.A> {
  A1Mapper._();

  @override Function get decoder => decode;
  p1.A decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p1.A fromMap(Map<String, dynamic> map) => p1.A(b: Mapper.i.$getOpt(map, 'b') ?? const p1.B(c: p1.C(p1.def)));

  @override Function get encoder => encode;
  dynamic encode(p1.A v) => toMap(v);
  Map<String, dynamic> toMap(p1.A a) => {'b': Mapper.i.$enc(a.b, 'b')};

  @override String stringify(p1.A self) => 'A(b: ${Mapper.asString(self.b)})';
  @override int hash(p1.A self) => Mapper.hash(self.b);
  @override bool equals(p1.A self, p1.A other) => Mapper.isEqual(self.b, other.b);

  @override String get id => 'A1';
  @override Function get typeFactory => (f) => f<p1.A>();
}

mixin A1Mappable implements MappableMixin {
  String toJson() => Mapper.toJson(this as p1.A);
  Map<String, dynamic> toMap() => Mapper.toMap(this as p1.A);
  A1CopyWith<p1.A> get copyWith => _A1CopyWithImpl(this as p1.A, $identity, $identity);
  @override String toString() => Mapper.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && Mapper.isEqual(this, other));
  @override int get hashCode => Mapper.hash(this);
}

extension A1ObjectCopy<$R> on ObjectCopyWith<$R, p1.A, p1.A> {
  A1CopyWith<$R> get asA => base.as((v, t, t2) => _A1CopyWithImpl(v, t, t2));
}

abstract class A1CopyWith<$R> implements ObjectCopyWith<$R, p1.A, p1.A> {
  A1CopyWith<$R2> _chain<$R2>(Then<p1.A, p1.A> t, Then<p1.A, $R2> t2);
  B1CopyWith<$R> get b;
  $R call({p1.B? b});
}

class _A1CopyWithImpl<$R> extends BaseCopyWith<$R, p1.A, p1.A> implements A1CopyWith<$R> {
  _A1CopyWithImpl(super.value, super.then, super.then2);
  @override A1CopyWith<$R2> _chain<$R2>(Then<p1.A, p1.A> t, Then<p1.A, $R2> t2) => _A1CopyWithImpl($value, t, t2);

  @override B1CopyWith<$R> get b => $value.b.copyWith._chain($identity, (v) => call(b: v));
  @override $R call({p1.B? b}) => $then(p1.A(b: b ?? $value.b));
}

class B1Mapper extends MapperElementBase<p1.B> {
  B1Mapper._();

  @override Function get decoder => decode;
  p1.B decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p1.B fromMap(Map<String, dynamic> map) => p1.B(c: Mapper.i.$get(map, 'c'));

  @override Function get encoder => encode;
  dynamic encode(p1.B v) => toMap(v);
  Map<String, dynamic> toMap(p1.B b) => {'c': Mapper.i.$enc(b.c, 'c')};

  @override String stringify(p1.B self) => 'B(c: ${Mapper.asString(self.c)})';
  @override int hash(p1.B self) => Mapper.hash(self.c);
  @override bool equals(p1.B self, p1.B other) => Mapper.isEqual(self.c, other.c);

  @override String get id => 'B1';
  @override Function get typeFactory => (f) => f<p1.B>();
}

mixin B1Mappable implements MappableMixin {
  String toJson() => Mapper.toJson(this as p1.B);
  Map<String, dynamic> toMap() => Mapper.toMap(this as p1.B);
  B1CopyWith<p1.B> get copyWith => _B1CopyWithImpl(this as p1.B, $identity, $identity);
  @override String toString() => Mapper.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && Mapper.isEqual(this, other));
  @override int get hashCode => Mapper.hash(this);
}

extension B1ObjectCopy<$R> on ObjectCopyWith<$R, p1.B, p1.B> {
  B1CopyWith<$R> get asB => base.as((v, t, t2) => _B1CopyWithImpl(v, t, t2));
}

abstract class B1CopyWith<$R> implements ObjectCopyWith<$R, p1.B, p1.B> {
  B1CopyWith<$R2> _chain<$R2>(Then<p1.B, p1.B> t, Then<p1.B, $R2> t2);
  C1CopyWith<$R> get c;
  $R call({p1.C? c});
}

class _B1CopyWithImpl<$R> extends BaseCopyWith<$R, p1.B, p1.B> implements B1CopyWith<$R> {
  _B1CopyWithImpl(super.value, super.then, super.then2);
  @override B1CopyWith<$R2> _chain<$R2>(Then<p1.B, p1.B> t, Then<p1.B, $R2> t2) => _B1CopyWithImpl($value, t, t2);

  @override C1CopyWith<$R> get c => $value.c.copyWith._chain($identity, (v) => call(c: v));
  @override $R call({p1.C? c}) => $then(p1.B(c: c ?? $value.c));
}

class C1Mapper extends MapperElementBase<p1.C> {
  C1Mapper._();

  @override Function get decoder => decode;
  p1.C decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p1.C fromMap(Map<String, dynamic> map) => p1.C(Mapper.i.$get(map, 'd'));

  @override Function get encoder => encode;
  dynamic encode(p1.C v) => toMap(v);
  Map<String, dynamic> toMap(p1.C c) => {'d': Mapper.i.$enc(c.d, 'd')};

  @override String stringify(p1.C self) => 'C(d: ${Mapper.asString(self.d)})';
  @override int hash(p1.C self) => Mapper.hash(self.d);
  @override bool equals(p1.C self, p1.C other) => Mapper.isEqual(self.d, other.d);

  @override String get id => 'C1';
  @override Function get typeFactory => (f) => f<p1.C>();
}

mixin C1Mappable implements MappableMixin {
  String toJson() => Mapper.toJson(this as p1.C);
  Map<String, dynamic> toMap() => Mapper.toMap(this as p1.C);
  C1CopyWith<p1.C> get copyWith => _C1CopyWithImpl(this as p1.C, $identity, $identity);
  @override String toString() => Mapper.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && Mapper.isEqual(this, other));
  @override int get hashCode => Mapper.hash(this);
}

extension C1ObjectCopy<$R> on ObjectCopyWith<$R, p1.C, p1.C> {
  C1CopyWith<$R> get asC => base.as((v, t, t2) => _C1CopyWithImpl(v, t, t2));
}

abstract class C1CopyWith<$R> implements ObjectCopyWith<$R, p1.C, p1.C> {
  C1CopyWith<$R2> _chain<$R2>(Then<p1.C, p1.C> t, Then<p1.C, $R2> t2);
  $R call({String? d});
}

class _C1CopyWithImpl<$R> extends BaseCopyWith<$R, p1.C, p1.C> implements C1CopyWith<$R> {
  _C1CopyWithImpl(super.value, super.then, super.then2);
  @override C1CopyWith<$R2> _chain<$R2>(Then<p1.C, p1.C> t, Then<p1.C, $R2> t2) => _C1CopyWithImpl($value, t, t2);

  @override $R call({String? d}) => $then(p1.C(d ?? $value.d));
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
  BaseCopyWith<Result, In, Out> get base => this as BaseCopyWith<Result, In, Out>;
}
