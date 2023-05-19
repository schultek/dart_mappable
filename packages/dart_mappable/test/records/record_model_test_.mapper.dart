// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'record_model_test_.dart';

class AMapper extends ClassMapperBase<A> {
  AMapper._();

  static AMapper? _instance;
  static AMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AMapper._());
      _m$r0.ensureInitialized();
      CMapper.ensureInitialized();
      _m$r1.ensureInitialized();
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

  static String _$a(A v) => v.a;
  static const Field<A, String> _f$a = Field('a', _$a);
  static _t$r0<int, dynamic, C, _t$r1<double, double>> _$r(A v) => v.r;
  static dynamic _arg$r<T>(f) => f<_t$r0<int, T, C, _t$r1<double, double>>>();
  static const Field<A, _t$r0<int, dynamic, C, _t$r1<double, double>>> _f$r =
      Field('r', _$r, arg: _arg$r);

  @override
  final Map<Symbol, Field<A, dynamic>> fields = const {
    #a: _f$a,
    #r: _f$r,
  };

  static A<T> _instantiate<T>(DecodingData data) {
    return A(data.dec(_f$a), data.dec(_f$r));
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
  $R call({String? a, _t$r0<int, T, C, _t$r1<double, double>>? r});
  ACopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ACopyWithImpl<$R, $Out, T> extends ClassCopyWithBase<$R, A<T>, $Out>
    implements ACopyWith<$R, A<T>, $Out, T> {
  _ACopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<A> $mapper = AMapper.ensureInitialized();
  @override
  $R call({String? a, _t$r0<int, T, C, _t$r1<double, double>>? r}) =>
      $apply(FieldCopyWithData({if (a != null) #a: a, if (r != null) #r: r}));
  @override
  A<T> $make(CopyWithData data) =>
      A(data.get(#a, or: $value.a), data.get(#r, or: $value.r));

  @override
  ACopyWith<$R2, A<T>, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ACopyWithImpl($value, $cast, t);
}

class CMapper extends ClassMapperBase<C> {
  CMapper._();

  static CMapper? _instance;
  static CMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CMapper._());
      _m$r1.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'C';

  static String _$c(C v) => v.c;
  static const Field<C, String> _f$c = Field('c', _$c);
  static _t$r1<String, int> _$d(C v) => v.d;
  static const Field<C, _t$r1<String, int>> _f$d = Field('d', _$d);

  @override
  final Map<Symbol, Field<C, dynamic>> fields = const {
    #c: _f$c,
    #d: _f$d,
  };

  static C _instantiate(DecodingData data) {
    return C(data.dec(_f$c), data.dec(_f$d));
  }

  @override
  final Function instantiate = _instantiate;

  static C fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<C>(map);
  }

  static C fromJson(String json) {
    return ensureInitialized().decodeJson<C>(json);
  }
}

mixin CMappable {
  String toJson() {
    return CMapper.ensureInitialized().encodeJson<C>(this as C);
  }

  Map<String, dynamic> toMap() {
    return CMapper.ensureInitialized().encodeMap<C>(this as C);
  }

  CCopyWith<C, C, C> get copyWith =>
      _CCopyWithImpl(this as C, $identity, $identity);
  @override
  String toString() {
    return CMapper.ensureInitialized().stringifyValue(this as C);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CMapper.ensureInitialized().isValueEqual(this as C, other));
  }

  @override
  int get hashCode {
    return CMapper.ensureInitialized().hashValue(this as C);
  }
}

extension CValueCopy<$R, $Out> on ObjectCopyWith<$R, C, $Out> {
  CCopyWith<$R, C, $Out> get $asC =>
      $base.as((v, t, t2) => _CCopyWithImpl(v, t, t2));
}

abstract class CCopyWith<$R, $In extends C, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? c, _t$r1<String, int>? d});
  CCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, C, $Out>
    implements CCopyWith<$R, C, $Out> {
  _CCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<C> $mapper = CMapper.ensureInitialized();
  @override
  $R call({String? c, _t$r1<String, int>? d}) =>
      $apply(FieldCopyWithData({if (c != null) #c: c, if (d != null) #d: d}));
  @override
  C $make(CopyWithData data) =>
      C(data.get(#c, or: $value.c), data.get(#d, or: $value.d));

  @override
  CCopyWith<$R2, C, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CCopyWithImpl($value, $cast, t);
}

typedef _t$r1<A, B> = ({A lat, B lng});
final _m$r1 = RecordMapper<_t$r1>(
  <A, B>(RecordData<_t$r1> d) => (
    lat: d<A>('lat', (r) => r.lat),
    lng: d<B>('lng', (r) => r.lng),
  ),
  <A, B>(f) => f<_t$r1<A, B>>(),
);

typedef _t$r0<A, B, C, D> = (A, {B b, C c, D d});
final _m$r0 = RecordMapper<_t$r0>(
  <A, B, C, D>(RecordData<_t$r0> d) => (
    d<A>('1', (r) => r.$1),
    b: d<B>('b', (r) => r.b),
    c: d<C>('c', (r) => r.c),
    d: d<D>('d', (r) => r.d),
  ),
  <A, B, C, D>(f) => f<_t$r0<A, B, C, D>>(),
);
