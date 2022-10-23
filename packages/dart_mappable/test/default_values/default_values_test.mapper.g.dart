// ignore_for_file: unused_element
import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'default_values_test.dart' as p0;
import 'otherlib.dart' as p1;


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
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

class AMapper extends BaseMapper<p0.A> {
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

extension AMapperExtension on p0.A {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  ACopyWith<p0.A> get copyWith => _ACopyWithImpl(this, $identity, $identity);
}

extension AObjectCopy<$R> on ObjectCopyWith<$R, p0.A, p0.A> {
  ACopyWith<$R> get asA => base.as((v, t, t2) => _ACopyWithImpl(v, t, t2));
}

abstract class ACopyWith<$R> implements ObjectCopyWith<$R, p0.A, p0.A> {
  ACopyWith<$R2> _chain<$R2>(Then<p0.A, $R2> then, Then<p0.A, p0.A> then2);
  BCopyWith<$R> get b;
  $R call({p0.B? b});
}

class _ACopyWithImpl<$R> extends BaseCopyWith<$R, p0.A, p0.A> implements ACopyWith<$R> {
  _ACopyWithImpl(super.value, super.then, super.then2);
  @override ACopyWith<$R2> _chain<$R2>(Then<p0.A, $R2> then, Then<p0.A, p0.A> then2) => _ACopyWithImpl($value, then, then2);

  @override BCopyWith<$R> get b => $value.b.copyWith._chain((v) => call(b: v), $identity);
  @override $R call({p0.B? b}) => $then(p0.A(b: b ?? $value.b));
}

class BMapper extends BaseMapper<p0.B> {
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

extension BMapperExtension on p0.B {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  BCopyWith<p0.B> get copyWith => _BCopyWithImpl(this, $identity, $identity);
}

extension BObjectCopy<$R> on ObjectCopyWith<$R, p0.B, p0.B> {
  BCopyWith<$R> get asB => base.as((v, t, t2) => _BCopyWithImpl(v, t, t2));
}

abstract class BCopyWith<$R> implements ObjectCopyWith<$R, p0.B, p0.B> {
  BCopyWith<$R2> _chain<$R2>(Then<p0.B, $R2> then, Then<p0.B, p0.B> then2);
  CCopyWith<$R> get c;
  $R call({p0.C? c});
}

class _BCopyWithImpl<$R> extends BaseCopyWith<$R, p0.B, p0.B> implements BCopyWith<$R> {
  _BCopyWithImpl(super.value, super.then, super.then2);
  @override BCopyWith<$R2> _chain<$R2>(Then<p0.B, $R2> then, Then<p0.B, p0.B> then2) => _BCopyWithImpl($value, then, then2);

  @override CCopyWith<$R> get c => $value.c.copyWith._chain((v) => call(c: v), $identity);
  @override $R call({p0.C? c}) => $then(p0.B(c: c ?? $value.c));
}

class CMapper extends BaseMapper<p0.C> {
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

extension CMapperExtension on p0.C {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  CCopyWith<p0.C> get copyWith => _CCopyWithImpl(this, $identity, $identity);
}

extension CObjectCopy<$R> on ObjectCopyWith<$R, p0.C, p0.C> {
  CCopyWith<$R> get asC => base.as((v, t, t2) => _CCopyWithImpl(v, t, t2));
}

abstract class CCopyWith<$R> implements ObjectCopyWith<$R, p0.C, p0.C> {
  CCopyWith<$R2> _chain<$R2>(Then<p0.C, $R2> then, Then<p0.C, p0.C> then2);
  $R call({String? d});
}

class _CCopyWithImpl<$R> extends BaseCopyWith<$R, p0.C, p0.C> implements CCopyWith<$R> {
  _CCopyWithImpl(super.value, super.then, super.then2);
  @override CCopyWith<$R2> _chain<$R2>(Then<p0.C, $R2> then, Then<p0.C, p0.C> then2) => _CCopyWithImpl($value, then, then2);

  @override $R call({String? d}) => $then(p0.C(d ?? $value.d));
}

class A1Mapper extends BaseMapper<p1.A> {
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

extension A1MapperExtension on p1.A {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  A1CopyWith<p1.A> get copyWith => _A1CopyWithImpl(this, $identity, $identity);
}

extension A1ObjectCopy<$R> on ObjectCopyWith<$R, p1.A, p1.A> {
  A1CopyWith<$R> get asA => base.as((v, t, t2) => _A1CopyWithImpl(v, t, t2));
}

abstract class A1CopyWith<$R> implements ObjectCopyWith<$R, p1.A, p1.A> {
  A1CopyWith<$R2> _chain<$R2>(Then<p1.A, $R2> then, Then<p1.A, p1.A> then2);
  B1CopyWith<$R> get b;
  $R call({p1.B? b});
}

class _A1CopyWithImpl<$R> extends BaseCopyWith<$R, p1.A, p1.A> implements A1CopyWith<$R> {
  _A1CopyWithImpl(super.value, super.then, super.then2);
  @override A1CopyWith<$R2> _chain<$R2>(Then<p1.A, $R2> then, Then<p1.A, p1.A> then2) => _A1CopyWithImpl($value, then, then2);

  @override B1CopyWith<$R> get b => $value.b.copyWith._chain((v) => call(b: v), $identity);
  @override $R call({p1.B? b}) => $then(p1.A(b: b ?? $value.b));
}

class B1Mapper extends BaseMapper<p1.B> {
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

extension B1MapperExtension on p1.B {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  B1CopyWith<p1.B> get copyWith => _B1CopyWithImpl(this, $identity, $identity);
}

extension B1ObjectCopy<$R> on ObjectCopyWith<$R, p1.B, p1.B> {
  B1CopyWith<$R> get asB => base.as((v, t, t2) => _B1CopyWithImpl(v, t, t2));
}

abstract class B1CopyWith<$R> implements ObjectCopyWith<$R, p1.B, p1.B> {
  B1CopyWith<$R2> _chain<$R2>(Then<p1.B, $R2> then, Then<p1.B, p1.B> then2);
  C1CopyWith<$R> get c;
  $R call({p1.C? c});
}

class _B1CopyWithImpl<$R> extends BaseCopyWith<$R, p1.B, p1.B> implements B1CopyWith<$R> {
  _B1CopyWithImpl(super.value, super.then, super.then2);
  @override B1CopyWith<$R2> _chain<$R2>(Then<p1.B, $R2> then, Then<p1.B, p1.B> then2) => _B1CopyWithImpl($value, then, then2);

  @override C1CopyWith<$R> get c => $value.c.copyWith._chain((v) => call(c: v), $identity);
  @override $R call({p1.C? c}) => $then(p1.B(c: c ?? $value.c));
}

class C1Mapper extends BaseMapper<p1.C> {
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

extension C1MapperExtension on p1.C {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
  C1CopyWith<p1.C> get copyWith => _C1CopyWithImpl(this, $identity, $identity);
}

extension C1ObjectCopy<$R> on ObjectCopyWith<$R, p1.C, p1.C> {
  C1CopyWith<$R> get asC => base.as((v, t, t2) => _C1CopyWithImpl(v, t, t2));
}

abstract class C1CopyWith<$R> implements ObjectCopyWith<$R, p1.C, p1.C> {
  C1CopyWith<$R2> _chain<$R2>(Then<p1.C, $R2> then, Then<p1.C, p1.C> then2);
  $R call({String? d});
}

class _C1CopyWithImpl<$R> extends BaseCopyWith<$R, p1.C, p1.C> implements C1CopyWith<$R> {
  _C1CopyWithImpl(super.value, super.then, super.then2);
  @override C1CopyWith<$R2> _chain<$R2>(Then<p1.C, $R2> then, Then<p1.C, p1.C> then2) => _C1CopyWithImpl($value, then, then2);

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

extension _ChainedCopyWith<$R, $T, $S> on ObjectCopyWith<$R, $T, $S> {
  BaseCopyWith<$R, $T, $S> get base => this as BaseCopyWith<$R, $T, $S>;
}
