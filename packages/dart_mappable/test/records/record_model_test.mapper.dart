// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'record_model_test.dart';

class AMapper extends ClassMapperBase<A> {
  AMapper._();

  static AMapper? _instance;
  static AMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AMapper._());
      _t$_R0Mapper.ensureInitialized();
      CMapper.ensureInitialized();
      _t$_R1Mapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'A';
  @override
  Function get typeFactory =>
      <T>(f) => f<A<T>>();

  static String _$a(A v) => v.a;
  static const Field<A, String> _f$a = Field(
    'a',
    _$a,
    includeFromJson: true,
    includeToJson: true,
    includeIfNull: false,
  );
  static _t$_R0<int, dynamic, C, _t$_R1<double, double>> _$r(A v) => v.r;
  static dynamic _arg$r<T>(f) => f<_t$_R0<int, T, C, _t$_R1<double, double>>>();
  static const Field<A, _t$_R0<int, dynamic, C, _t$_R1<double, double>>> _f$r =
      Field(
        'r',
        _$r,
        arg: _arg$r,
        includeFromJson: true,
        includeToJson: true,
        includeIfNull: false,
      );

  @override
  final MappableFields<A> fields = const {#a: _f$a, #r: _f$r};

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
      _ACopyWithImpl<A<T>, A<T>, T>(this as A<T>, $identity, $identity);
  @override
  String toString() {
    return AMapper.ensureInitialized().stringifyValue(this as A<T>);
  }

  @override
  bool operator ==(Object other) {
    return AMapper.ensureInitialized().equalsValue(this as A<T>, other);
  }

  @override
  int get hashCode {
    return AMapper.ensureInitialized().hashValue(this as A<T>);
  }
}

extension AValueCopy<$R, $Out, T> on ObjectCopyWith<$R, A<T>, $Out> {
  ACopyWith<$R, A<T>, $Out, T> get $asA =>
      $base.as((v, t, t2) => _ACopyWithImpl<$R, $Out, T>(v, t, t2));
}

abstract class ACopyWith<$R, $In extends A<T>, $Out, T>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? a, _t$_R0<int, T, C, _t$_R1<double, double>>? r});
  ACopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ACopyWithImpl<$R, $Out, T> extends ClassCopyWithBase<$R, A<T>, $Out>
    implements ACopyWith<$R, A<T>, $Out, T> {
  _ACopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<A> $mapper = AMapper.ensureInitialized();
  @override
  $R call({String? a, _t$_R0<int, T, C, _t$_R1<double, double>>? r}) =>
      $apply(FieldCopyWithData({if (a != null) #a: a, if (r != null) #r: r}));
  @override
  A<T> $make(CopyWithData data) =>
      A(data.get(#a, or: $value.a), data.get(#r, or: $value.r));

  @override
  ACopyWith<$R2, A<T>, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ACopyWithImpl<$R2, $Out2, T>($value, $cast, t);
}

class CMapper extends ClassMapperBase<C> {
  CMapper._();

  static CMapper? _instance;
  static CMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CMapper._());
      _t$_R1Mapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'C';

  static String _$c(C v) => v.c;
  static const Field<C, String> _f$c = Field(
    'c',
    _$c,
    includeFromJson: true,
    includeToJson: true,
    includeIfNull: false,
  );
  static _t$_R1<String, int> _$d(C v) => v.d;
  static const Field<C, _t$_R1<String, int>> _f$d = Field(
    'd',
    _$d,
    includeFromJson: true,
    includeToJson: true,
    includeIfNull: false,
  );

  @override
  final MappableFields<C> fields = const {#c: _f$c, #d: _f$d};

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
      _CCopyWithImpl<C, C>(this as C, $identity, $identity);
  @override
  String toString() {
    return CMapper.ensureInitialized().stringifyValue(this as C);
  }

  @override
  bool operator ==(Object other) {
    return CMapper.ensureInitialized().equalsValue(this as C, other);
  }

  @override
  int get hashCode {
    return CMapper.ensureInitialized().hashValue(this as C);
  }
}

extension CValueCopy<$R, $Out> on ObjectCopyWith<$R, C, $Out> {
  CCopyWith<$R, C, $Out> get $asC =>
      $base.as((v, t, t2) => _CCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CCopyWith<$R, $In extends C, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? c, _t$_R1<String, int>? d});
  CCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, C, $Out>
    implements CCopyWith<$R, C, $Out> {
  _CCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<C> $mapper = CMapper.ensureInitialized();
  @override
  $R call({String? c, _t$_R1<String, int>? d}) =>
      $apply(FieldCopyWithData({if (c != null) #c: c, if (d != null) #d: d}));
  @override
  C $make(CopyWithData data) =>
      C(data.get(#c, or: $value.c), data.get(#d, or: $value.d));

  @override
  CCopyWith<$R2, C, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

typedef _t$_R1<A, B> = ({A lat, B lng});

class _t$_R1Mapper extends RecordMapperBase<_t$_R1> {
  static _t$_R1Mapper? _instance;
  _t$_R1Mapper._();

  static _t$_R1Mapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _t$_R1Mapper._());
      MapperBase.addType(<A, B>(f) => f<({A lat, B lng})>());
    }
    return _instance!;
  }

  static dynamic _$lat(_t$_R1 v) => v.lat;
  static dynamic _arg$lat<A, B>(f) => f<A>();
  static const Field<_t$_R1, dynamic> _f$lat = Field(
    'lat',
    _$lat,
    arg: _arg$lat,
  );
  static dynamic _$lng(_t$_R1 v) => v.lng;
  static dynamic _arg$lng<A, B>(f) => f<B>();
  static const Field<_t$_R1, dynamic> _f$lng = Field(
    'lng',
    _$lng,
    arg: _arg$lng,
  );

  @override
  final MappableFields<_t$_R1> fields = const {#lat: _f$lat, #lng: _f$lng};

  @override
  Function get typeFactory =>
      <A, B>(f) => f<_t$_R1<A, B>>();

  static _t$_R1<A, B> _instantiate<A, B>(DecodingData<_t$_R1> data) {
    return (lat: data.dec(_f$lat), lng: data.dec(_f$lng));
  }

  @override
  final Function instantiate = _instantiate;

  static _t$_R1<A, B> fromMap<A, B>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<_t$_R1<A, B>>(map);
  }

  static _t$_R1<A, B> fromJson<A, B>(String json) {
    return ensureInitialized().decodeJson<_t$_R1<A, B>>(json);
  }
}

typedef _t$_R0<A, B, C, D> = (A, {B b, C c, D d});

class _t$_R0Mapper extends RecordMapperBase<_t$_R0> {
  static _t$_R0Mapper? _instance;
  _t$_R0Mapper._();

  static _t$_R0Mapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _t$_R0Mapper._());
      MapperBase.addType(<A, B, C, D>(f) => f<(A, {B b, C c, D d})>());
    }
    return _instance!;
  }

  static dynamic _$$1(_t$_R0 v) => v.$1;
  static dynamic _arg$$1<A, B, C, D>(f) => f<A>();
  static const Field<_t$_R0, dynamic> _f$$1 = Field('\$1', _$$1, arg: _arg$$1);
  static dynamic _$b(_t$_R0 v) => v.b;
  static dynamic _arg$b<A, B, C, D>(f) => f<B>();
  static const Field<_t$_R0, dynamic> _f$b = Field('b', _$b, arg: _arg$b);
  static dynamic _$c(_t$_R0 v) => v.c;
  static dynamic _arg$c<A, B, C, D>(f) => f<C>();
  static const Field<_t$_R0, dynamic> _f$c = Field('c', _$c, arg: _arg$c);
  static dynamic _$d(_t$_R0 v) => v.d;
  static dynamic _arg$d<A, B, C, D>(f) => f<D>();
  static const Field<_t$_R0, dynamic> _f$d = Field('d', _$d, arg: _arg$d);

  @override
  final MappableFields<_t$_R0> fields = const {
    #$1: _f$$1,
    #b: _f$b,
    #c: _f$c,
    #d: _f$d,
  };

  @override
  Function get typeFactory =>
      <A, B, C, D>(f) => f<_t$_R0<A, B, C, D>>();

  static _t$_R0<A, B, C, D> _instantiate<A, B, C, D>(
    DecodingData<_t$_R0> data,
  ) {
    return (
      data.dec(_f$$1),
      b: data.dec(_f$b),
      c: data.dec(_f$c),
      d: data.dec(_f$d),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static _t$_R0<A, B, C, D> fromMap<A, B, C, D>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<_t$_R0<A, B, C, D>>(map);
  }

  static _t$_R0<A, B, C, D> fromJson<A, B, C, D>(String json) {
    return ensureInitialized().decodeJson<_t$_R0<A, B, C, D>>(json);
  }
}

