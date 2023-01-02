// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'selective_generation_test.dart';

class AMapper extends MapperBase<A> {
  static MapperContainer container = MapperContainer(
    mappers: {AMapper()},
  );

  @override
  AMapperElement createElement(MapperContainer container) {
    return AMapperElement._(this, container);
  }
}

class AMapperElement extends MapperElementBase<A> {
  AMapperElement._(super.mapper, super.container);

  @override
  Function get encoder => encode;
  dynamic encode(A v) => toMap(v);
  Map<String, dynamic> toMap(A a) => {'a': container.$enc(a.a, 'a')};
}

mixin AMappable {
  String toJson() => AMapper.container.toJson(this as A);
  Map<String, dynamic> toMap() => AMapper.container.toMap(this as A);
  ACopyWith<A, A, A> get copyWith =>
      _ACopyWithImpl(this as A, $identity, $identity);
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
  $R call({String? a});
}

class _ACopyWithImpl<$R, $Out extends A> extends CopyWithBase<$R, A, $Out>
    implements ACopyWith<$R, A, $Out> {
  _ACopyWithImpl(super.value, super.then, super.then2);
  @override
  ACopyWith<$R2, A, $Out2> chain<$R2, $Out2 extends A>(
          Then<A, $Out2> t, Then<$Out2, $R2> t2) =>
      _ACopyWithImpl($value, t, t2);

  @override
  $R call({String? a}) => $then(A(a ?? $value.a));
}

class BMapper extends MapperBase<B> {
  static MapperContainer container = MapperContainer(
    mappers: {BMapper()},
  );

  @override
  BMapperElement createElement(MapperContainer container) {
    return BMapperElement._(this, container);
  }
}

class BMapperElement extends MapperElementBase<B> {
  BMapperElement._(super.mapper, super.container);

  @override
  String stringify(B self) => 'B(b: ${container.asString(self.b)})';
  @override
  int hash(B self) => container.hash(self.b);
  @override
  bool equals(B self, B other) => container.isEqual(self.b, other.b);
}

mixin BMappable {
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
