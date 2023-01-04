// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'custom_discriminator_test.dart';

class AMapper extends MapperBase<A> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {AMapper()},
      ))
        ..linkAll({BMapper.container, CMapper.container}));

  @override
  AMapperElement createElement(MapperContainer container) {
    return AMapperElement._(this, container);
  }

  @override
  String get id => 'A';

  static final fromMap = container.fromMap<A>;
  static final fromJson = container.fromJson<A>;
}

class AMapperElement extends MapperElementBase<A> {
  AMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  A decode(dynamic v) =>
      const CheckTypesHook({B: B.checkType, C: C.checkType}).decode(
          v,
          (v) => checkedType(v, (Map<String, dynamic> map) => fromMap(map)),
          container);
  A fromMap(Map<String, dynamic> map) =>
      throw MapperException.missingConstructor('A');

  @override
  Function get encoder => encode;
  dynamic encode(A v) => const CheckTypesHook({B: B.checkType, C: C.checkType})
      .encode<A>(v, (v) => toMap(v), container);
  Map<String, dynamic> toMap(A a) => {};

  @override
  String stringify(A self) => 'A()';
  @override
  int hash(A self) => 0;
  @override
  bool equals(A self, A other) => true;
}

mixin AMappable {
  String toJson();
  Map<String, dynamic> toMap();
  ACopyWith<A, A, A> get copyWith;
}

typedef ACopyWithBound = A;

abstract class ACopyWith<$R, $In extends A, $Out extends A>
    implements ObjectCopyWith<$R, $In, $Out> {
  ACopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends A>(
      Then<A, $Out2> t, Then<$Out2, $R2> t2);
  $R call();
}

class BMapper extends MapperBase<B> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {BMapper()},
      ))
        ..linkAll({AMapper.container}));

  @override
  BMapperElement createElement(MapperContainer container) {
    return BMapperElement._(this, container);
  }

  @override
  String get id => 'B';

  static final fromMap = container.fromMap<B>;
  static final fromJson = container.fromJson<B>;
}

class BMapperElement extends MapperElementBase<B> {
  BMapperElement._(super.mapper, super.container);

  @override
  Function get decoder =>
      (v) => const CheckTypesHook({B: B.checkType, C: C.checkType})
          .decode(v, decode, container);
  B decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  B fromMap(Map<String, dynamic> map) => B();

  @override
  Function get encoder =>
      (B v) => const CheckTypesHook({B: B.checkType, C: C.checkType})
          .encode<B>(v, (v) => encode, container);
  dynamic encode(B v) => toMap(v);
  Map<String, dynamic> toMap(B b) => {};

  @override
  String stringify(B self) => 'B()';
  @override
  int hash(B self) => 0;
  @override
  bool equals(B self, B other) => true;
}

mixin BMappable {
  String toJson() => BMapper.container.toJson(this as B);
  Map<String, dynamic> toMap() => BMapper.container.toMap(this as B);
  BCopyWith<B, B, B> get copyWith =>
      _BCopyWithImpl(this as B, $identity, $identity);
  @override
  String toString() => BMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          BMapper.container.isEqual(this, other));
  @override
  int get hashCode => BMapper.container.hash(this);
}

extension BValueCopy<$R, $Out extends A> on ObjectCopyWith<$R, B, $Out> {
  BCopyWith<$R, B, $Out> get asB =>
      base.as((v, t, t2) => _BCopyWithImpl(v, t, t2));
}

typedef BCopyWithBound = A;

abstract class BCopyWith<$R, $In extends B, $Out extends A>
    implements ACopyWith<$R, $In, $Out> {
  BCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends A>(
      Then<B, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call();
}

class _BCopyWithImpl<$R, $Out extends A> extends CopyWithBase<$R, B, $Out>
    implements BCopyWith<$R, B, $Out> {
  _BCopyWithImpl(super.value, super.then, super.then2);
  @override
  BCopyWith<$R2, B, $Out2> chain<$R2, $Out2 extends A>(
          Then<B, $Out2> t, Then<$Out2, $R2> t2) =>
      _BCopyWithImpl($value, t, t2);

  @override
  $R call() => $then(B());
}

class CMapper extends MapperBase<C> {
  static MapperContainer? _c;
  static MapperContainer container = _c ??
      ((_c = MapperContainer(
        mappers: {CMapper()},
      ))
        ..linkAll({AMapper.container}));

  @override
  CMapperElement createElement(MapperContainer container) {
    return CMapperElement._(this, container);
  }

  @override
  String get id => 'C';

  static final fromMap = container.fromMap<C>;
  static final fromJson = container.fromJson<C>;
}

class CMapperElement extends MapperElementBase<C> {
  CMapperElement._(super.mapper, super.container);

  @override
  Function get decoder =>
      (v) => const CheckTypesHook({B: B.checkType, C: C.checkType})
          .decode(v, decode, container);
  C decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  C fromMap(Map<String, dynamic> map) => C();

  @override
  Function get encoder =>
      (C v) => const CheckTypesHook({B: B.checkType, C: C.checkType})
          .encode<C>(v, (v) => encode, container);
  dynamic encode(C v) => toMap(v);
  Map<String, dynamic> toMap(C c) => {};

  @override
  String stringify(C self) => 'C()';
  @override
  int hash(C self) => 0;
  @override
  bool equals(C self, C other) => true;
}

mixin CMappable {
  String toJson() => CMapper.container.toJson(this as C);
  Map<String, dynamic> toMap() => CMapper.container.toMap(this as C);
  CCopyWith<C, C, C> get copyWith =>
      _CCopyWithImpl(this as C, $identity, $identity);
  @override
  String toString() => CMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          CMapper.container.isEqual(this, other));
  @override
  int get hashCode => CMapper.container.hash(this);
}

extension CValueCopy<$R, $Out extends A> on ObjectCopyWith<$R, C, $Out> {
  CCopyWith<$R, C, $Out> get asC =>
      base.as((v, t, t2) => _CCopyWithImpl(v, t, t2));
}

typedef CCopyWithBound = A;

abstract class CCopyWith<$R, $In extends C, $Out extends A>
    implements ACopyWith<$R, $In, $Out> {
  CCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends A>(
      Then<C, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call();
}

class _CCopyWithImpl<$R, $Out extends A> extends CopyWithBase<$R, C, $Out>
    implements CCopyWith<$R, C, $Out> {
  _CCopyWithImpl(super.value, super.then, super.then2);
  @override
  CCopyWith<$R2, C, $Out2> chain<$R2, $Out2 extends A>(
          Then<C, $Out2> t, Then<$Out2, $R2> t2) =>
      _CCopyWithImpl($value, t, t2);

  @override
  $R call() => $then(C());
}
