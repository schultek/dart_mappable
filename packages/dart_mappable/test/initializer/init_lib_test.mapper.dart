// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'init_lib_test.dart';

class AMapper extends ClassMapperBase<A> {
  AMapper._();

  static AMapper? _instance;
  static AMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'A';

  @override
  final Map<Symbol, Field<A, dynamic>> fields = const {};

  static A _instantiate(DecodingData data) {
    return A();
  }

  @override
  final Function instantiate = _instantiate;

  static A fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<A>(map));
  }

  static A fromJson(String json) {
    return _guard((c) => c.fromJson<A>(json));
  }
}

mixin AMappable {
  String toJson() {
    return AMapper._guard((c) => c.toJson(this as A));
  }

  Map<String, dynamic> toMap() {
    return AMapper._guard((c) => c.toMap(this as A));
  }

  ACopyWith<A, A, A> get copyWith =>
      _ACopyWithImpl(this as A, $identity, $identity);
  @override
  String toString() {
    return AMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return AMapper._guard((c) => c.hash(this));
  }
}

extension AValueCopy<$R, $Out extends A> on ObjectCopyWith<$R, A, $Out> {
  ACopyWith<$R, A, $Out> get $asA =>
      $base.as((v, t, t2) => _ACopyWithImpl(v, t, t2));
}

typedef ACopyWithBound = A;

abstract class ACopyWith<$R, $In extends A, $Out extends A>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  ACopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends A>(
      Then<A, $Out2> t, Then<$Out2, $R2> t2);
}

class _ACopyWithImpl<$R, $Out extends A> extends ClassCopyWithBase<$R, A, $Out>
    implements ACopyWith<$R, A, $Out> {
  _ACopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<A> $mapper = AMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  A $make(CopyWithData data) => A();

  @override
  ACopyWith<$R2, A, $Out2> $chain<$R2, $Out2 extends A>(
          Then<A, $Out2> t, Then<$Out2, $R2> t2) =>
      _ACopyWithImpl($value, t, t2);
}

class BMapper extends ClassMapperBase<B> {
  BMapper._();

  static BMapper? _instance;
  static BMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'B';

  @override
  final Map<Symbol, Field<B, dynamic>> fields = const {};

  static B _instantiate(DecodingData data) {
    return B();
  }

  @override
  final Function instantiate = _instantiate;

  static B fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<B>(map));
  }

  static B fromJson(String json) {
    return _guard((c) => c.fromJson<B>(json));
  }
}

mixin BMappable {
  String toJson() {
    return BMapper._guard((c) => c.toJson(this as B));
  }

  Map<String, dynamic> toMap() {
    return BMapper._guard((c) => c.toMap(this as B));
  }

  BCopyWith<B, B, B> get copyWith =>
      _BCopyWithImpl(this as B, $identity, $identity);
  @override
  String toString() {
    return BMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return BMapper._guard((c) => c.hash(this));
  }
}

extension BValueCopy<$R, $Out extends B> on ObjectCopyWith<$R, B, $Out> {
  BCopyWith<$R, B, $Out> get $asB =>
      $base.as((v, t, t2) => _BCopyWithImpl(v, t, t2));
}

typedef BCopyWithBound = B;

abstract class BCopyWith<$R, $In extends B, $Out extends B>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  BCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends B>(
      Then<B, $Out2> t, Then<$Out2, $R2> t2);
}

class _BCopyWithImpl<$R, $Out extends B> extends ClassCopyWithBase<$R, B, $Out>
    implements BCopyWith<$R, B, $Out> {
  _BCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<B> $mapper = BMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  B $make(CopyWithData data) => B();

  @override
  BCopyWith<$R2, B, $Out2> $chain<$R2, $Out2 extends B>(
          Then<B, $Out2> t, Then<$Out2, $R2> t2) =>
      _BCopyWithImpl($value, t, t2);
}
