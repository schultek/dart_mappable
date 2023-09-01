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
      GMapper.ensureInitialized();
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

extension AValueCopy<$R, $Out, T> on ObjectCopyWith<$R, A<T>, $Out> {
  ACopyWith<$R, A<T>, $Out, T> get $asA =>
      $base.as((v, t, t2) => _ACopyWithImpl(v, t, t2));
}

abstract class ACopyWith<$R, $In extends A<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  ACopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ACopyWithImpl<$R, $Out, T> extends ClassCopyWithBase<$R, A<T>, $Out>
    implements ACopyWith<$R, A<T>, $Out, T> {
  _ACopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<A> $mapper = AMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  A<T> $make(CopyWithData data) => A();

  @override
  ACopyWith<$R2, A<T>, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ACopyWithImpl($value, $cast, t);
}

class BMapper extends SubClassMapperBase<B> {
  BMapper._();

  static BMapper? _instance;
  static BMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BMapper._());
      AMapper.ensureInitialized().addSubMapper(_instance!);
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
  late final ClassMapperBase superMapper = AMapper.ensureInitialized();

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

extension BValueCopy<$R, $Out, T> on ObjectCopyWith<$R, B<T>, $Out> {
  BCopyWith<$R, B<T>, $Out, T> get $asB =>
      $base.as((v, t, t2) => _BCopyWithImpl(v, t, t2));
}

abstract class BCopyWith<$R, $In extends B<T>, $Out, T>
    implements ACopyWith<$R, $In, $Out, T> {
  @override
  $R call();
  BCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BCopyWithImpl<$R, $Out, T> extends ClassCopyWithBase<$R, B<T>, $Out>
    implements BCopyWith<$R, B<T>, $Out, T> {
  _BCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<B> $mapper = BMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  B<T> $make(CopyWithData data) => B();

  @override
  BCopyWith<$R2, B<T>, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BCopyWithImpl($value, $cast, t);
}

class CMapper extends SubClassMapperBase<C> {
  CMapper._();

  static CMapper? _instance;
  static CMapper ensureInitialized() {
    if (_instance == null) {
      MapperBase.addType<num>();
      MapperContainer.globals.use(_instance = CMapper._());
      AMapper.ensureInitialized().addSubMapper(_instance!);
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
  late final ClassMapperBase superMapper = AMapper.ensureInitialized();

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

extension CValueCopy<$R, $Out, T extends num>
    on ObjectCopyWith<$R, C<T>, $Out> {
  CCopyWith<$R, C<T>, $Out, T> get $asC =>
      $base.as((v, t, t2) => _CCopyWithImpl(v, t, t2));
}

abstract class CCopyWith<$R, $In extends C<T>, $Out, T extends num>
    implements ACopyWith<$R, $In, $Out, T> {
  @override
  $R call();
  CCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CCopyWithImpl<$R, $Out, T extends num>
    extends ClassCopyWithBase<$R, C<T>, $Out>
    implements CCopyWith<$R, C<T>, $Out, T> {
  _CCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<C> $mapper = CMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  C<T> $make(CopyWithData data) => C();

  @override
  CCopyWith<$R2, C<T>, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CCopyWithImpl($value, $cast, t);
}

class DMapper extends SubClassMapperBase<D> {
  DMapper._();

  static DMapper? _instance;
  static DMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DMapper._());
      AMapper.ensureInitialized().addSubMapper(_instance!);
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
  late final ClassMapperBase superMapper = AMapper.ensureInitialized();

  @override
  DecodingContext inherit(DecodingContext context) {
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

extension DValueCopy<$R, $Out, T, V> on ObjectCopyWith<$R, D<T, V>, $Out> {
  DCopyWith<$R, D<T, V>, $Out, T, V> get $asD =>
      $base.as((v, t, t2) => _DCopyWithImpl(v, t, t2));
}

abstract class DCopyWith<$R, $In extends D<T, V>, $Out, T, V>
    implements ACopyWith<$R, $In, $Out, V> {
  @override
  $R call();
  DCopyWith<$R2, $In, $Out2, T, V> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DCopyWithImpl<$R, $Out, T, V>
    extends ClassCopyWithBase<$R, D<T, V>, $Out>
    implements DCopyWith<$R, D<T, V>, $Out, T, V> {
  _DCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<D> $mapper = DMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  D<T, V> $make(CopyWithData data) => D();

  @override
  DCopyWith<$R2, D<T, V>, $Out2, T, V> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _DCopyWithImpl($value, $cast, t);
}

class EMapper extends SubClassMapperBase<E> {
  EMapper._();

  static EMapper? _instance;
  static EMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EMapper._());
      DMapper.ensureInitialized().addSubMapper(_instance!);
      FMapper.ensureInitialized();
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
  late final ClassMapperBase superMapper = DMapper.ensureInitialized();

  @override
  DecodingContext inherit(DecodingContext context) {
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

extension EValueCopy<$R, $Out, T, V> on ObjectCopyWith<$R, E<T, V>, $Out> {
  ECopyWith<$R, E<T, V>, $Out, T, V> get $asE =>
      $base.as((v, t, t2) => _ECopyWithImpl(v, t, t2));
}

abstract class ECopyWith<$R, $In extends E<T, V>, $Out, T, V>
    implements DCopyWith<$R, $In, $Out, V, List<T>> {
  @override
  $R call();
  ECopyWith<$R2, $In, $Out2, T, V> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ECopyWithImpl<$R, $Out, T, V>
    extends ClassCopyWithBase<$R, E<T, V>, $Out>
    implements ECopyWith<$R, E<T, V>, $Out, T, V> {
  _ECopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<E> $mapper = EMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  E<T, V> $make(CopyWithData data) => E();

  @override
  ECopyWith<$R2, E<T, V>, $Out2, T, V> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ECopyWithImpl($value, $cast, t);
}

class FMapper extends SubClassMapperBase<F> {
  FMapper._();

  static FMapper? _instance;
  static FMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FMapper._());
      EMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'F';

  @override
  final Map<Symbol, Field<F, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'F';
  @override
  late final ClassMapperBase superMapper = EMapper.ensureInitialized();

  @override
  DecodingContext inherit(DecodingContext context) {
    return context.inherit(args: []);
  }

  static F _instantiate(DecodingData data) {
    return F();
  }

  @override
  final Function instantiate = _instantiate;

  static F fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<F>(map));
  }

  static F fromJson(String json) {
    return _guard((c) => c.fromJson<F>(json));
  }
}

mixin FMappable {
  String toJson() {
    return FMapper._guard((c) => c.toJson(this as F));
  }

  Map<String, dynamic> toMap() {
    return FMapper._guard((c) => c.toMap(this as F));
  }

  FCopyWith<F, F, F> get copyWith =>
      _FCopyWithImpl(this as F, $identity, $identity);
  @override
  String toString() {
    return FMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            FMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return FMapper._guard((c) => c.hash(this));
  }
}

extension FValueCopy<$R, $Out> on ObjectCopyWith<$R, F, $Out> {
  FCopyWith<$R, F, $Out> get $asF =>
      $base.as((v, t, t2) => _FCopyWithImpl(v, t, t2));
}

abstract class FCopyWith<$R, $In extends F, $Out>
    implements ECopyWith<$R, $In, $Out, int, String> {
  @override
  $R call();
  FCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, F, $Out>
    implements FCopyWith<$R, F, $Out> {
  _FCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<F> $mapper = FMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  F $make(CopyWithData data) => F();

  @override
  FCopyWith<$R2, F, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FCopyWithImpl($value, $cast, t);
}

class GMapper extends SubClassMapperBase<G> {
  GMapper._();

  static GMapper? _instance;
  static GMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GMapper._());
      AMapper.ensureInitialized().addSubMapper(_instance!);
      AMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'G';
  @override
  Function get typeFactory => <T, V extends A<T>>(f) => f<G<T, V>>();

  @override
  final Map<Symbol, Field<G, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'G';
  @override
  late final ClassMapperBase superMapper = AMapper.ensureInitialized();

  @override
  DecodingContext inherit(DecodingContext context) {
    return context.inherit(args: [
      context.arg(0),
      context.type(<$A>() => A<$A>, [context.arg(0)])
    ]);
  }

  static G<T, V> _instantiate<T, V extends A<T>>(DecodingData data) {
    return G();
  }

  @override
  final Function instantiate = _instantiate;

  static G<T, V> fromMap<T, V extends A<T>>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<G<T, V>>(map));
  }

  static G<T, V> fromJson<T, V extends A<T>>(String json) {
    return _guard((c) => c.fromJson<G<T, V>>(json));
  }
}

mixin GMappable<T, V extends A<T>> {
  String toJson() {
    return GMapper._guard((c) => c.toJson(this as G<T, V>));
  }

  Map<String, dynamic> toMap() {
    return GMapper._guard((c) => c.toMap(this as G<T, V>));
  }

  GCopyWith<G<T, V>, G<T, V>, G<T, V>, T, V> get copyWith =>
      _GCopyWithImpl(this as G<T, V>, $identity, $identity);
  @override
  String toString() {
    return GMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            GMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return GMapper._guard((c) => c.hash(this));
  }
}

extension GValueCopy<$R, $Out, T, V extends A<T>>
    on ObjectCopyWith<$R, G<T, V>, $Out> {
  GCopyWith<$R, G<T, V>, $Out, T, V> get $asG =>
      $base.as((v, t, t2) => _GCopyWithImpl(v, t, t2));
}

abstract class GCopyWith<$R, $In extends G<T, V>, $Out, T, V extends A<T>>
    implements ACopyWith<$R, $In, $Out, T> {
  @override
  $R call();
  GCopyWith<$R2, $In, $Out2, T, V> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GCopyWithImpl<$R, $Out, T, V extends A<T>>
    extends ClassCopyWithBase<$R, G<T, V>, $Out>
    implements GCopyWith<$R, G<T, V>, $Out, T, V> {
  _GCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<G> $mapper = GMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  G<T, V> $make(CopyWithData data) => G();

  @override
  GCopyWith<$R2, G<T, V>, $Out2, T, V> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _GCopyWithImpl($value, $cast, t);
}
