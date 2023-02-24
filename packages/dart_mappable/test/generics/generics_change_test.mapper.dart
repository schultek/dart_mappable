// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'generics_change_test.dart';

class AMapper extends ClassMapperBase<A> {
  AMapper._();
  static AMapper? _instance;
  static AMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AMapper._());
      BMapper.ensureInitialized();
      CMapper.ensureInitialized();
      DMapper.ensureInitialized();
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
  Function get typeFactory => <T>(f) => f<A<T>>();

  @override
  final Map<Symbol, Field<A, dynamic>> fields = const {};

  static A<T> _instantiate<T>(DecodingData data) {
    return A();
  }

  @override
  final Function instantiate = _instantiate;

  static A<T> fromMap<T>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<A<T>>(map));
  }

  static A<T> fromJson<T>(String json) {
    return _guard((c) => c.fromJson<A<T>>(json));
  }
}

mixin AMappable<T> {
  String toJson() {
    return AMapper._guard((c) => c.toJson(this as A<T>));
  }

  Map<String, dynamic> toMap() {
    return AMapper._guard((c) => c.toMap(this as A<T>));
  }

  ACopyWith<A<T>, A<T>, A<T>, T> get copyWith =>
      _ACopyWithImpl(this as A<T>, $identity, $identity);
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

extension AValueCopy<$R, $Out extends A, T> on ObjectCopyWith<$R, A<T>, $Out> {
  ACopyWith<$R, A<T>, $Out, T> get asA =>
      base.as((v, t, t2) => _ACopyWithImpl(v, t, t2));
}

typedef ACopyWithBound = A;

abstract class ACopyWith<$R, $In extends A<T>, $Out extends A, T>
    implements ObjectCopyWith<$R, $In, $Out> {
  ACopyWith<$R2, $In, $Out2, T> chain<$R2, $Out2 extends A>(
      Then<A<T>, $Out2> t, Then<$Out2, $R2> t2);
  $R call();
}

class _ACopyWithImpl<$R, $Out extends A, T> extends CopyWithBase<$R, A<T>, $Out>
    implements ACopyWith<$R, A<T>, $Out, T> {
  _ACopyWithImpl(super.value, super.then, super.then2);
  @override
  ACopyWith<$R2, A<T>, $Out2, T> chain<$R2, $Out2 extends A>(
          Then<A<T>, $Out2> t, Then<$Out2, $R2> t2) =>
      _ACopyWithImpl($value, t, t2);

  @override
  $R call() => $then(A());
}

class BMapper extends SubClassMapperBase<B> {
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
  Function get typeFactory => <T>(f) => f<B<T>>();

  @override
  final Map<Symbol, Field<B, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'B';
  @override
  final ClassMapperBase superMapper = AMapper.ensureInitialized();

  static B<T> _instantiate<T>(DecodingData data) {
    return B();
  }

  @override
  final Function instantiate = _instantiate;

  static B<T> fromMap<T>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<B<T>>(map));
  }

  static B<T> fromJson<T>(String json) {
    return _guard((c) => c.fromJson<B<T>>(json));
  }
}

mixin BMappable<T> {
  String toJson() {
    return BMapper._guard((c) => c.toJson(this as B<T>));
  }

  Map<String, dynamic> toMap() {
    return BMapper._guard((c) => c.toMap(this as B<T>));
  }

  BCopyWith<B<T>, B<T>, B<T>, T> get copyWith =>
      _BCopyWithImpl(this as B<T>, $identity, $identity);
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

extension BValueCopy<$R, $Out extends A, T> on ObjectCopyWith<$R, B<T>, $Out> {
  BCopyWith<$R, B<T>, $Out, T> get asB =>
      base.as((v, t, t2) => _BCopyWithImpl(v, t, t2));
}

typedef BCopyWithBound = A;

abstract class BCopyWith<$R, $In extends B<T>, $Out extends A, T>
    implements ACopyWith<$R, $In, $Out, T> {
  BCopyWith<$R2, $In, $Out2, T> chain<$R2, $Out2 extends A>(
      Then<B<T>, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call();
}

class _BCopyWithImpl<$R, $Out extends A, T> extends CopyWithBase<$R, B<T>, $Out>
    implements BCopyWith<$R, B<T>, $Out, T> {
  _BCopyWithImpl(super.value, super.then, super.then2);
  @override
  BCopyWith<$R2, B<T>, $Out2, T> chain<$R2, $Out2 extends A>(
          Then<B<T>, $Out2> t, Then<$Out2, $R2> t2) =>
      _BCopyWithImpl($value, t, t2);

  @override
  $R call() => $then(B());
}

class CMapper extends SubClassMapperBase<C> {
  CMapper._();
  static CMapper? _instance;
  static CMapper ensureInitialized() {
    if (_instance == null) {
      MapperBase.addType<num>();
      MapperContainer.globals.use(_instance = CMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'C';
  @override
  Function get typeFactory => <T extends num>(f) => f<C<T>>();

  @override
  final Map<Symbol, Field<C, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'C';
  @override
  final ClassMapperBase superMapper = AMapper.ensureInitialized();

  static C<T> _instantiate<T extends num>(DecodingData data) {
    return C();
  }

  @override
  final Function instantiate = _instantiate;

  static C<T> fromMap<T extends num>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<C<T>>(map));
  }

  static C<T> fromJson<T extends num>(String json) {
    return _guard((c) => c.fromJson<C<T>>(json));
  }
}

mixin CMappable<T extends num> {
  String toJson() {
    return CMapper._guard((c) => c.toJson(this as C<T>));
  }

  Map<String, dynamic> toMap() {
    return CMapper._guard((c) => c.toMap(this as C<T>));
  }

  CCopyWith<C<T>, C<T>, C<T>, T> get copyWith =>
      _CCopyWithImpl(this as C<T>, $identity, $identity);
  @override
  String toString() {
    return CMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return CMapper._guard((c) => c.hash(this));
  }
}

extension CValueCopy<$R, $Out extends A, T extends num>
    on ObjectCopyWith<$R, C<T>, $Out> {
  CCopyWith<$R, C<T>, $Out, T> get asC =>
      base.as((v, t, t2) => _CCopyWithImpl(v, t, t2));
}

typedef CCopyWithBound = A;

abstract class CCopyWith<$R, $In extends C<T>, $Out extends A, T extends num>
    implements ACopyWith<$R, $In, $Out, T> {
  CCopyWith<$R2, $In, $Out2, T> chain<$R2, $Out2 extends A>(
      Then<C<T>, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call();
}

class _CCopyWithImpl<$R, $Out extends A, T extends num>
    extends CopyWithBase<$R, C<T>, $Out>
    implements CCopyWith<$R, C<T>, $Out, T> {
  _CCopyWithImpl(super.value, super.then, super.then2);
  @override
  CCopyWith<$R2, C<T>, $Out2, T> chain<$R2, $Out2 extends A>(
          Then<C<T>, $Out2> t, Then<$Out2, $R2> t2) =>
      _CCopyWithImpl($value, t, t2);

  @override
  $R call() => $then(C());
}

class DMapper extends SubClassMapperBase<D> {
  DMapper._();
  static DMapper? _instance;
  static DMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DMapper._());
      EMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'D';
  @override
  Function get typeFactory => <T, V>(f) => f<D<T, V>>();

  @override
  final Map<Symbol, Field<D, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'D';
  @override
  final ClassMapperBase superMapper = AMapper.ensureInitialized();

  @override
  DecodingContext<Object> inherit(DecodingContext<Object> context) {
    return context.inherit(args: [dynamic, context.arg(0)]);
  }

  static D<T, V> _instantiate<T, V>(DecodingData data) {
    return D();
  }

  @override
  final Function instantiate = _instantiate;

  static D<T, V> fromMap<T, V>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<D<T, V>>(map));
  }

  static D<T, V> fromJson<T, V>(String json) {
    return _guard((c) => c.fromJson<D<T, V>>(json));
  }
}

mixin DMappable<T, V> {
  String toJson() {
    return DMapper._guard((c) => c.toJson(this as D<T, V>));
  }

  Map<String, dynamic> toMap() {
    return DMapper._guard((c) => c.toMap(this as D<T, V>));
  }

  DCopyWith<D<T, V>, D<T, V>, D<T, V>, T, V> get copyWith =>
      _DCopyWithImpl(this as D<T, V>, $identity, $identity);
  @override
  String toString() {
    return DMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return DMapper._guard((c) => c.hash(this));
  }
}

extension DValueCopy<$R, $Out extends A, T, V>
    on ObjectCopyWith<$R, D<T, V>, $Out> {
  DCopyWith<$R, D<T, V>, $Out, T, V> get asD =>
      base.as((v, t, t2) => _DCopyWithImpl(v, t, t2));
}

typedef DCopyWithBound = A;

abstract class DCopyWith<$R, $In extends D<T, V>, $Out extends A, T, V>
    implements ACopyWith<$R, $In, $Out, V> {
  DCopyWith<$R2, $In, $Out2, T, V> chain<$R2, $Out2 extends A>(
      Then<D<T, V>, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call();
}

class _DCopyWithImpl<$R, $Out extends A, T, V>
    extends CopyWithBase<$R, D<T, V>, $Out>
    implements DCopyWith<$R, D<T, V>, $Out, T, V> {
  _DCopyWithImpl(super.value, super.then, super.then2);
  @override
  DCopyWith<$R2, D<T, V>, $Out2, T, V> chain<$R2, $Out2 extends A>(
          Then<D<T, V>, $Out2> t, Then<$Out2, $R2> t2) =>
      _DCopyWithImpl($value, t, t2);

  @override
  $R call() => $then(D());
}

class EMapper extends SubClassMapperBase<E> {
  EMapper._();
  static EMapper? _instance;
  static EMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'E';
  @override
  Function get typeFactory => <T, V>(f) => f<E<T, V>>();

  @override
  final Map<Symbol, Field<E, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'E';
  @override
  final ClassMapperBase superMapper = DMapper.ensureInitialized();

  @override
  DecodingContext<Object> inherit(DecodingContext<Object> context) {
    return context.inherit(args: [
      context.arg(1, [0]),
      context.arg(0)
    ]);
  }

  static E<T, V> _instantiate<T, V>(DecodingData data) {
    return E();
  }

  @override
  final Function instantiate = _instantiate;

  static E<T, V> fromMap<T, V>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<E<T, V>>(map));
  }

  static E<T, V> fromJson<T, V>(String json) {
    return _guard((c) => c.fromJson<E<T, V>>(json));
  }
}

mixin EMappable<T, V> {
  String toJson() {
    return EMapper._guard((c) => c.toJson(this as E<T, V>));
  }

  Map<String, dynamic> toMap() {
    return EMapper._guard((c) => c.toMap(this as E<T, V>));
  }

  ECopyWith<E<T, V>, E<T, V>, E<T, V>, T, V> get copyWith =>
      _ECopyWithImpl(this as E<T, V>, $identity, $identity);
  @override
  String toString() {
    return EMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            EMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return EMapper._guard((c) => c.hash(this));
  }
}

extension EValueCopy<$R, $Out extends A, T, V>
    on ObjectCopyWith<$R, E<T, V>, $Out> {
  ECopyWith<$R, E<T, V>, $Out, T, V> get asE =>
      base.as((v, t, t2) => _ECopyWithImpl(v, t, t2));
}

typedef ECopyWithBound = A;

abstract class ECopyWith<$R, $In extends E<T, V>, $Out extends A, T, V>
    implements DCopyWith<$R, $In, $Out, V, List<T>> {
  ECopyWith<$R2, $In, $Out2, T, V> chain<$R2, $Out2 extends A>(
      Then<E<T, V>, $Out2> t, Then<$Out2, $R2> t2);
  @override
  $R call();
}

class _ECopyWithImpl<$R, $Out extends A, T, V>
    extends CopyWithBase<$R, E<T, V>, $Out>
    implements ECopyWith<$R, E<T, V>, $Out, T, V> {
  _ECopyWithImpl(super.value, super.then, super.then2);
  @override
  ECopyWith<$R2, E<T, V>, $Out2, T, V> chain<$R2, $Out2 extends A>(
          Then<E<T, V>, $Out2> t, Then<$Out2, $R2> t2) =>
      _ECopyWithImpl($value, t, t2);

  @override
  $R call() => $then(E());
}
