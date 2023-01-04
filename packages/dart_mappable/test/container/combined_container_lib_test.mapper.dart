// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'combined_container_lib_test.dart';

class AMapper extends MapperBase<A> {
  static MapperContainer container = MapperContainer(
    mappers: {AMapper()},
  );

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
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  A fromMap(Map<String, dynamic> map) => A();

  @override
  Function get encoder => encode;
  dynamic encode(A v) => toMap(v);
  Map<String, dynamic> toMap(A a) => {};

  @override
  String stringify(A self) => 'A()';
  @override
  int hash(A self) => 0;
  @override
  bool equals(A self, A other) => true;
}

mixin AMappable {
  String toJson() => AMapper.container.toJson(this as A);
  Map<String, dynamic> toMap() => AMapper.container.toMap(this as A);
  ACopyWith<A, A, A> get copyWith =>
      _ACopyWithImpl(this as A, $identity, $identity);
  @override
  String toString() => AMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          AMapper.container.isEqual(this, other));
  @override
  int get hashCode => AMapper.container.hash(this);
}

extension AValueCopy<$R, $Out extends A> on ObjectCopyWith<$R, A, $Out> {
  ACopyWith<$R, A, $Out> get asA =>
      base.as((v, t, t2) => _ACopyWithImpl(v, t, t2));
}

typedef ACopyWithBound = A;

abstract class ACopyWith<$R, $In extends A, $Out extends A>
    implements ObjectCopyWith<$R, $In, $Out> {
  ACopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends A>(
      Then<A, $Out2> t, Then<$Out2, $R2> t2);
  $R call();
}

class _ACopyWithImpl<$R, $Out extends A> extends CopyWithBase<$R, A, $Out>
    implements ACopyWith<$R, A, $Out> {
  _ACopyWithImpl(super.value, super.then, super.then2);
  @override
  ACopyWith<$R2, A, $Out2> chain<$R2, $Out2 extends A>(
          Then<A, $Out2> t, Then<$Out2, $R2> t2) =>
      _ACopyWithImpl($value, t, t2);

  @override
  $R call() => $then(A());
}

class BMapper extends MapperBase<B> {
  static MapperContainer container = MapperContainer(
    mappers: {BMapper()},
  );

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
  Function get decoder => decode;
  B decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  B fromMap(Map<String, dynamic> map) => B();

  @override
  Function get encoder => encode;
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

extension BValueCopy<$R, $Out extends B> on ObjectCopyWith<$R, B, $Out> {
  BCopyWith<$R, B, $Out> get asB =>
      base.as((v, t, t2) => _BCopyWithImpl(v, t, t2));
}

typedef BCopyWithBound = B;

abstract class BCopyWith<$R, $In extends B, $Out extends B>
    implements ObjectCopyWith<$R, $In, $Out> {
  BCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends B>(
      Then<B, $Out2> t, Then<$Out2, $R2> t2);
  $R call();
}

class _BCopyWithImpl<$R, $Out extends B> extends CopyWithBase<$R, B, $Out>
    implements BCopyWith<$R, B, $Out> {
  _BCopyWithImpl(super.value, super.then, super.then2);
  @override
  BCopyWith<$R2, B, $Out2> chain<$R2, $Out2 extends B>(
          Then<B, $Out2> t, Then<$Out2, $R2> t2) =>
      _BCopyWithImpl($value, t, t2);

  @override
  $R call() => $then(B());
}
