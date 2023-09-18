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
      HMapper.ensureInitialized();
      IMapper.ensureInitialized();
    }
    return _instance!;
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
    return ensureInitialized().decodeMap<A<T>>(map);
  }

  static A<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<A<T>>(json);
  }
}

mixin AMappable<T> {
  String toJson() {
    return AMapper.ensureInitialized().encodeJson<A<T>>(this as A<T>);
  }

  Map<String, dynamic> toMap() {
    return AMapper.ensureInitialized().encodeMap<A<T>>(this as A<T>);
  }

  ACopyWith<A<T>, A<T>, A<T>, T> get copyWith =>
      _ACopyWithImpl(this as A<T>, $identity, $identity);
  @override
  String toString() {
    return AMapper.ensureInitialized().stringifyValue(this as A<T>);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AMapper.ensureInitialized().isValueEqual(this as A<T>, other));
  }

  @override
  int get hashCode {
    return AMapper.ensureInitialized().hashValue(this as A<T>);
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
    return ensureInitialized().decodeMap<B<T>>(map);
  }

  static B<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<B<T>>(json);
  }
}

mixin BMappable<T> {
  String toJson() {
    return BMapper.ensureInitialized().encodeJson<B<T>>(this as B<T>);
  }

  Map<String, dynamic> toMap() {
    return BMapper.ensureInitialized().encodeMap<B<T>>(this as B<T>);
  }

  BCopyWith<B<T>, B<T>, B<T>, T> get copyWith =>
      _BCopyWithImpl(this as B<T>, $identity, $identity);
  @override
  String toString() {
    return BMapper.ensureInitialized().stringifyValue(this as B<T>);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BMapper.ensureInitialized().isValueEqual(this as B<T>, other));
  }

  @override
  int get hashCode {
    return BMapper.ensureInitialized().hashValue(this as B<T>);
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
    return ensureInitialized().decodeMap<C<T>>(map);
  }

  static C<T> fromJson<T extends num>(String json) {
    return ensureInitialized().decodeJson<C<T>>(json);
  }
}

mixin CMappable<T extends num> {
  String toJson() {
    return CMapper.ensureInitialized().encodeJson<C<T>>(this as C<T>);
  }

  Map<String, dynamic> toMap() {
    return CMapper.ensureInitialized().encodeMap<C<T>>(this as C<T>);
  }

  CCopyWith<C<T>, C<T>, C<T>, T> get copyWith =>
      _CCopyWithImpl(this as C<T>, $identity, $identity);
  @override
  String toString() {
    return CMapper.ensureInitialized().stringifyValue(this as C<T>);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CMapper.ensureInitialized().isValueEqual(this as C<T>, other));
  }

  @override
  int get hashCode {
    return CMapper.ensureInitialized().hashValue(this as C<T>);
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
      JMapper.ensureInitialized();
    }
    return _instance!;
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
    return ensureInitialized().decodeMap<D<T, V>>(map);
  }

  static D<T, V> fromJson<T, V>(String json) {
    return ensureInitialized().decodeJson<D<T, V>>(json);
  }
}

mixin DMappable<T, V> {
  String toJson() {
    return DMapper.ensureInitialized().encodeJson<D<T, V>>(this as D<T, V>);
  }

  Map<String, dynamic> toMap() {
    return DMapper.ensureInitialized().encodeMap<D<T, V>>(this as D<T, V>);
  }

  DCopyWith<D<T, V>, D<T, V>, D<T, V>, T, V> get copyWith =>
      _DCopyWithImpl(this as D<T, V>, $identity, $identity);
  @override
  String toString() {
    return DMapper.ensureInitialized().stringifyValue(this as D<T, V>);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DMapper.ensureInitialized().isValueEqual(this as D<T, V>, other));
  }

  @override
  int get hashCode {
    return DMapper.ensureInitialized().hashValue(this as D<T, V>);
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
    return ensureInitialized().decodeMap<E<T, V>>(map);
  }

  static E<T, V> fromJson<T, V>(String json) {
    return ensureInitialized().decodeJson<E<T, V>>(json);
  }
}

mixin EMappable<T, V> {
  String toJson() {
    return EMapper.ensureInitialized().encodeJson<E<T, V>>(this as E<T, V>);
  }

  Map<String, dynamic> toMap() {
    return EMapper.ensureInitialized().encodeMap<E<T, V>>(this as E<T, V>);
  }

  ECopyWith<E<T, V>, E<T, V>, E<T, V>, T, V> get copyWith =>
      _ECopyWithImpl(this as E<T, V>, $identity, $identity);
  @override
  String toString() {
    return EMapper.ensureInitialized().stringifyValue(this as E<T, V>);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            EMapper.ensureInitialized().isValueEqual(this as E<T, V>, other));
  }

  @override
  int get hashCode {
    return EMapper.ensureInitialized().hashValue(this as E<T, V>);
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
    return ensureInitialized().decodeMap<F>(map);
  }

  static F fromJson(String json) {
    return ensureInitialized().decodeJson<F>(json);
  }
}

mixin FMappable {
  String toJson() {
    return FMapper.ensureInitialized().encodeJson<F>(this as F);
  }

  Map<String, dynamic> toMap() {
    return FMapper.ensureInitialized().encodeMap<F>(this as F);
  }

  FCopyWith<F, F, F> get copyWith =>
      _FCopyWithImpl(this as F, $identity, $identity);
  @override
  String toString() {
    return FMapper.ensureInitialized().stringifyValue(this as F);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            FMapper.ensureInitialized().isValueEqual(this as F, other));
  }

  @override
  int get hashCode {
    return FMapper.ensureInitialized().hashValue(this as F);
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
    return ensureInitialized().decodeMap<G<T, V>>(map);
  }

  static G<T, V> fromJson<T, V extends A<T>>(String json) {
    return ensureInitialized().decodeJson<G<T, V>>(json);
  }
}

mixin GMappable<T, V extends A<T>> {
  String toJson() {
    return GMapper.ensureInitialized().encodeJson<G<T, V>>(this as G<T, V>);
  }

  Map<String, dynamic> toMap() {
    return GMapper.ensureInitialized().encodeMap<G<T, V>>(this as G<T, V>);
  }

  GCopyWith<G<T, V>, G<T, V>, G<T, V>, T, V> get copyWith =>
      _GCopyWithImpl(this as G<T, V>, $identity, $identity);
  @override
  String toString() {
    return GMapper.ensureInitialized().stringifyValue(this as G<T, V>);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            GMapper.ensureInitialized().isValueEqual(this as G<T, V>, other));
  }

  @override
  int get hashCode {
    return GMapper.ensureInitialized().hashValue(this as G<T, V>);
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

class HMapper extends SubClassMapperBase<H> {
  HMapper._();

  static HMapper? _instance;
  static HMapper ensureInitialized() {
    if (_instance == null) {
      MapperBase.addType<num>();
      MapperContainer.globals.use(_instance = HMapper._());
      AMapper.ensureInitialized().addSubMapper(_instance!);
      CMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'H';
  @override
  Function get typeFactory => <T extends C<num>>(f) => f<H<T>>();

  @override
  final Map<Symbol, Field<H, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'H';
  @override
  late final ClassMapperBase superMapper = AMapper.ensureInitialized();

  @override
  DecodingContext inherit(DecodingContext context) {
    return context.inherit(args: [C<num>]);
  }

  static H<T> _instantiate<T extends C<num>>(DecodingData data) {
    return H();
  }

  @override
  final Function instantiate = _instantiate;

  static H<T> fromMap<T extends C<num>>(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<H<T>>(map));
  }

  static H<T> fromJson<T extends C<num>>(String json) {
    return _guard((c) => c.fromJson<H<T>>(json));
  }
}

mixin HMappable<T extends C<num>> {
  String toJson() {
    return HMapper._guard((c) => c.toJson(this as H<T>));
  }

  Map<String, dynamic> toMap() {
    return HMapper._guard((c) => c.toMap(this as H<T>));
  }

  HCopyWith<H<T>, H<T>, H<T>, T> get copyWith =>
      _HCopyWithImpl(this as H<T>, $identity, $identity);
  @override
  String toString() {
    return HMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return HMapper._guard((c) => c.hash(this));
  }
}

extension HValueCopy<$R, $Out, T extends C<num>>
    on ObjectCopyWith<$R, H<T>, $Out> {
  HCopyWith<$R, H<T>, $Out, T> get $asH =>
      $base.as((v, t, t2) => _HCopyWithImpl(v, t, t2));
}

abstract class HCopyWith<$R, $In extends H<T>, $Out, T extends C<num>>
    implements ACopyWith<$R, $In, $Out, dynamic> {
  @override
  $R call();
  HCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HCopyWithImpl<$R, $Out, T extends C<num>>
    extends ClassCopyWithBase<$R, H<T>, $Out>
    implements HCopyWith<$R, H<T>, $Out, T> {
  _HCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<H> $mapper = HMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  H<T> $make(CopyWithData data) => H();

  @override
  HCopyWith<$R2, H<T>, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _HCopyWithImpl($value, $cast, t);
}

class IMapper extends SubClassMapperBase<I> {
  IMapper._();

  static IMapper? _instance;
  static IMapper ensureInitialized() {
    if (_instance == null) {
      MapperBase.addType<num>();
      MapperContainer.globals.use(_instance = IMapper._());
      AMapper.ensureInitialized().addSubMapper(_instance!);
      CMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'I';
  @override
  Function get typeFactory =>
      <T extends C<V>, V extends num>(f) => f<I<T, V>>();

  @override
  final Map<Symbol, Field<I, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'I';
  @override
  late final ClassMapperBase superMapper = AMapper.ensureInitialized();

  @override
  DecodingContext inherit(DecodingContext context) {
    return context.inherit(args: [
      context.type(<$A extends num>() => C<$A>, [context.arg(0)]),
      context.arg(0)
    ]);
  }

  static I<T, V> _instantiate<T extends C<V>, V extends num>(
      DecodingData data) {
    return I();
  }

  @override
  final Function instantiate = _instantiate;

  static I<T, V> fromMap<T extends C<V>, V extends num>(
      Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<I<T, V>>(map));
  }

  static I<T, V> fromJson<T extends C<V>, V extends num>(String json) {
    return _guard((c) => c.fromJson<I<T, V>>(json));
  }
}

mixin IMappable<T extends C<V>, V extends num> {
  String toJson() {
    return IMapper._guard((c) => c.toJson(this as I<T, V>));
  }

  Map<String, dynamic> toMap() {
    return IMapper._guard((c) => c.toMap(this as I<T, V>));
  }

  ICopyWith<I<T, V>, I<T, V>, I<T, V>, T, V> get copyWith =>
      _ICopyWithImpl(this as I<T, V>, $identity, $identity);
  @override
  String toString() {
    return IMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            IMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return IMapper._guard((c) => c.hash(this));
  }
}

extension IValueCopy<$R, $Out, T extends C<V>, V extends num>
    on ObjectCopyWith<$R, I<T, V>, $Out> {
  ICopyWith<$R, I<T, V>, $Out, T, V> get $asI =>
      $base.as((v, t, t2) => _ICopyWithImpl(v, t, t2));
}

abstract class ICopyWith<$R, $In extends I<T, V>, $Out, T extends C<V>,
    V extends num> implements ACopyWith<$R, $In, $Out, V> {
  @override
  $R call();
  ICopyWith<$R2, $In, $Out2, T, V> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ICopyWithImpl<$R, $Out, T extends C<V>, V extends num>
    extends ClassCopyWithBase<$R, I<T, V>, $Out>
    implements ICopyWith<$R, I<T, V>, $Out, T, V> {
  _ICopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<I> $mapper = IMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  I<T, V> $make(CopyWithData data) => I();

  @override
  ICopyWith<$R2, I<T, V>, $Out2, T, V> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ICopyWithImpl($value, $cast, t);
}

class JMapper extends SubClassMapperBase<J> {
  JMapper._();

  static JMapper? _instance;
  static JMapper ensureInitialized() {
    if (_instance == null) {
      MapperBase.addType<num>();
      MapperContainer.globals.use(_instance = JMapper._());
      DMapper.ensureInitialized().addSubMapper(_instance!);
      CMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'J';
  @override
  Function get typeFactory =>
      <T extends C<V>, V extends U, U extends num>(f) => f<J<T, V, U>>();

  @override
  final Map<Symbol, Field<J, dynamic>> fields = const {};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'J';
  @override
  late final ClassMapperBase superMapper = DMapper.ensureInitialized();

  @override
  DecodingContext inherit(DecodingContext context) {
    return context.inherit(args: [
      context.type(<$A extends $B, $B extends num>() => C<$A>,
          [context.arg(0), context.arg(1)]),
      context.arg(0),
      context.arg(1)
    ]);
  }

  static J<T, V, U> _instantiate<T extends C<V>, V extends U, U extends num>(
      DecodingData data) {
    return J();
  }

  @override
  final Function instantiate = _instantiate;

  static J<T, V, U> fromMap<T extends C<V>, V extends U, U extends num>(
      Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<J<T, V, U>>(map));
  }

  static J<T, V, U> fromJson<T extends C<V>, V extends U, U extends num>(
      String json) {
    return _guard((c) => c.fromJson<J<T, V, U>>(json));
  }
}

mixin JMappable<T extends C<V>, V extends U, U extends num> {
  String toJson() {
    return JMapper._guard((c) => c.toJson(this as J<T, V, U>));
  }

  Map<String, dynamic> toMap() {
    return JMapper._guard((c) => c.toMap(this as J<T, V, U>));
  }

  JCopyWith<J<T, V, U>, J<T, V, U>, J<T, V, U>, T, V, U> get copyWith =>
      _JCopyWithImpl(this as J<T, V, U>, $identity, $identity);
  @override
  String toString() {
    return JMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            JMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return JMapper._guard((c) => c.hash(this));
  }
}

extension JValueCopy<$R, $Out, T extends C<V>, V extends U, U extends num>
    on ObjectCopyWith<$R, J<T, V, U>, $Out> {
  JCopyWith<$R, J<T, V, U>, $Out, T, V, U> get $asJ =>
      $base.as((v, t, t2) => _JCopyWithImpl(v, t, t2));
}

abstract class JCopyWith<$R, $In extends J<T, V, U>, $Out, T extends C<V>,
    V extends U, U extends num> implements DCopyWith<$R, $In, $Out, V, U> {
  @override
  $R call();
  JCopyWith<$R2, $In, $Out2, T, V, U> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _JCopyWithImpl<$R, $Out, T extends C<V>, V extends U, U extends num>
    extends ClassCopyWithBase<$R, J<T, V, U>, $Out>
    implements JCopyWith<$R, J<T, V, U>, $Out, T, V, U> {
  _JCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<J> $mapper = JMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  J<T, V, U> $make(CopyWithData data) => J();

  @override
  JCopyWith<$R2, J<T, V, U>, $Out2, T, V, U> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _JCopyWithImpl($value, $cast, t);
}
