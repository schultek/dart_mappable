// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'default_values_test.dart';

class AMapper extends MapperBase<A> {
  static MapperContainer container = MapperContainer(
    mappers: {AMapper()},
    linked: {BMapper.container},
  );

  @override
  AMapperElement createElement(MapperContainer container) {
    return AMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<A>;
  static final fromJson = container.fromJson<A>;
}

class AMapperElement extends MapperElementBase<A> {
  AMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  A decode(dynamic v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  A fromMap(Map<String, dynamic> map) => A(b: container.$getOpt(map, 'b') ?? const B(c: C(C.def)));

  @override Function get encoder => encode;
  dynamic encode(A v) => toMap(v);
  Map<String, dynamic> toMap(A a) => {'b': container.$enc(a.b, 'b')};

  @override String stringify(A self) => 'A(b: ${container.asString(self.b)})';
  @override int hash(A self) => container.hash(self.b);
  @override bool equals(A self, A other) => container.isEqual(self.b, other.b);
}

mixin AMappable {
  String toJson() => AMapper.container.toJson(this as A);
  Map<String, dynamic> toMap() => AMapper.container.toMap(this as A);
  ACopyWith<A, A, A> get copyWith => _ACopyWithImpl(this as A, $identity, $identity);
  @override String toString() => AMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && AMapper.container.isEqual(this, other));
  @override int get hashCode => AMapper.container.hash(this);
}

extension AValueCopy<$R, $Out extends A> on ObjectCopyWith<$R, A, $Out> {
  ACopyWith<$R, A, $Out> get asA => base.as((v, t, t2) => _ACopyWithImpl(v, t, t2));
}

typedef ACopyWithBound = A;
abstract class ACopyWith<$R, $In extends A, $Out extends A> implements ObjectCopyWith<$R, $In, $Out> {
  ACopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends A>(Then<A, $Out2> t, Then<$Out2, $R2> t2);
  BCopyWith<$R, B, B> get b;
  $R call({B? b});
}

class _ACopyWithImpl<$R, $Out extends A> extends CopyWithBase<$R, A, $Out> implements ACopyWith<$R, A, $Out> {
  _ACopyWithImpl(super.value, super.then, super.then2);
  @override ACopyWith<$R2, A, $Out2> chain<$R2, $Out2 extends A>(Then<A, $Out2> t, Then<$Out2, $R2> t2) => _ACopyWithImpl($value, t, t2);

  @override BCopyWith<$R, B, B> get b => $value.b.copyWith.chain($identity, (v) => call(b: v));
  @override $R call({B? b}) => $then(A(b: b ?? $value.b));
}

class BMapper extends MapperBase<B> {
  static MapperContainer container = MapperContainer(
    mappers: {BMapper()},
    linked: {CMapper.container},
  );

  @override
  BMapperElement createElement(MapperContainer container) {
    return BMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<B>;
  static final fromJson = container.fromJson<B>;
}

class BMapperElement extends MapperElementBase<B> {
  BMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  B decode(dynamic v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  B fromMap(Map<String, dynamic> map) => B(c: container.$get(map, 'c'));

  @override Function get encoder => encode;
  dynamic encode(B v) => toMap(v);
  Map<String, dynamic> toMap(B b) => {'c': container.$enc(b.c, 'c')};

  @override String stringify(B self) => 'B(c: ${container.asString(self.c)})';
  @override int hash(B self) => container.hash(self.c);
  @override bool equals(B self, B other) => container.isEqual(self.c, other.c);
}

mixin BMappable {
  String toJson() => BMapper.container.toJson(this as B);
  Map<String, dynamic> toMap() => BMapper.container.toMap(this as B);
  BCopyWith<B, B, B> get copyWith => _BCopyWithImpl(this as B, $identity, $identity);
  @override String toString() => BMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && BMapper.container.isEqual(this, other));
  @override int get hashCode => BMapper.container.hash(this);
}

extension BValueCopy<$R, $Out extends B> on ObjectCopyWith<$R, B, $Out> {
  BCopyWith<$R, B, $Out> get asB => base.as((v, t, t2) => _BCopyWithImpl(v, t, t2));
}

typedef BCopyWithBound = B;
abstract class BCopyWith<$R, $In extends B, $Out extends B> implements ObjectCopyWith<$R, $In, $Out> {
  BCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends B>(Then<B, $Out2> t, Then<$Out2, $R2> t2);
  CCopyWith<$R, C, C> get c;
  $R call({C? c});
}

class _BCopyWithImpl<$R, $Out extends B> extends CopyWithBase<$R, B, $Out> implements BCopyWith<$R, B, $Out> {
  _BCopyWithImpl(super.value, super.then, super.then2);
  @override BCopyWith<$R2, B, $Out2> chain<$R2, $Out2 extends B>(Then<B, $Out2> t, Then<$Out2, $R2> t2) => _BCopyWithImpl($value, t, t2);

  @override CCopyWith<$R, C, C> get c => $value.c.copyWith.chain($identity, (v) => call(c: v));
  @override $R call({C? c}) => $then(B(c: c ?? $value.c));
}

class CMapper extends MapperBase<C> {
  static MapperContainer container = MapperContainer(
    mappers: {CMapper()},
  );

  @override
  CMapperElement createElement(MapperContainer container) {
    return CMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<C>;
  static final fromJson = container.fromJson<C>;
}

class CMapperElement extends MapperElementBase<C> {
  CMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  C decode(dynamic v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  C fromMap(Map<String, dynamic> map) => C(container.$get(map, 'd'));

  @override Function get encoder => encode;
  dynamic encode(C v) => toMap(v);
  Map<String, dynamic> toMap(C c) => {'d': container.$enc(c.d, 'd')};

  @override String stringify(C self) => 'C(d: ${container.asString(self.d)})';
  @override int hash(C self) => container.hash(self.d);
  @override bool equals(C self, C other) => container.isEqual(self.d, other.d);
}

mixin CMappable {
  String toJson() => CMapper.container.toJson(this as C);
  Map<String, dynamic> toMap() => CMapper.container.toMap(this as C);
  CCopyWith<C, C, C> get copyWith => _CCopyWithImpl(this as C, $identity, $identity);
  @override String toString() => CMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && CMapper.container.isEqual(this, other));
  @override int get hashCode => CMapper.container.hash(this);
}

extension CValueCopy<$R, $Out extends C> on ObjectCopyWith<$R, C, $Out> {
  CCopyWith<$R, C, $Out> get asC => base.as((v, t, t2) => _CCopyWithImpl(v, t, t2));
}

typedef CCopyWithBound = C;
abstract class CCopyWith<$R, $In extends C, $Out extends C> implements ObjectCopyWith<$R, $In, $Out> {
  CCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends C>(Then<C, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? d});
}

class _CCopyWithImpl<$R, $Out extends C> extends CopyWithBase<$R, C, $Out> implements CCopyWith<$R, C, $Out> {
  _CCopyWithImpl(super.value, super.then, super.then2);
  @override CCopyWith<$R2, C, $Out2> chain<$R2, $Out2 extends C>(Then<C, $Out2> t, Then<$Out2, $R2> t2) => _CCopyWithImpl($value, t, t2);

  @override $R call({String? d}) => $then(C(d ?? $value.d));
}
