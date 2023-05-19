// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'retype_copy_with.dart';

class AMapper extends ClassMapperBase<A> {
  AMapper._();

  static AMapper? _instance;
  static AMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AMapper._());
      BMapper.ensureInitialized();
      VMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'A';

  static V _$v(A v) => v.v;
  static const Field<A, V> _f$v = Field('v', _$v);
  static V _$v2(A v) => v.v2;
  static const Field<A, V> _f$v2 = Field('v2', _$v2);

  @override
  final Map<Symbol, Field<A, dynamic>> fields = const {
    #v: _f$v,
    #v2: _f$v2,
  };

  static A _instantiate(DecodingData data) {
    return A(v: data.dec(_f$v), v2: data.dec(_f$v2));
  }

  @override
  final Function instantiate = _instantiate;

  static A fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<A>(map);
  }

  static A fromJson(String json) {
    return ensureInitialized().decodeJson<A>(json);
  }
}

mixin AMappable {
  String toJson() {
    return AMapper.ensureInitialized().encodeJson<A>(this as A);
  }

  Map<String, dynamic> toMap() {
    return AMapper.ensureInitialized().encodeMap<A>(this as A);
  }

  ACopyWith<A, A, A> get copyWith =>
      _ACopyWithImpl(this as A, $identity, $identity);
  @override
  String toString() {
    return AMapper.ensureInitialized().stringifyValue(this as A);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AMapper.ensureInitialized().isValueEqual(this as A, other));
  }

  @override
  int get hashCode {
    return AMapper.ensureInitialized().hashValue(this as A);
  }
}

extension AValueCopy<$R, $Out> on ObjectCopyWith<$R, A, $Out> {
  ACopyWith<$R, A, $Out> get $asA =>
      $base.as((v, t, t2) => _ACopyWithImpl(v, t, t2));
}

abstract class ACopyWith<$R, $In extends A, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  VCopyWith<$R, V, V> get v;
  VCopyWith<$R, V, V> get v2;
  $R call({V? v, V? v2});
  ACopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ACopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, A, $Out>
    implements ACopyWith<$R, A, $Out> {
  _ACopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<A> $mapper = AMapper.ensureInitialized();
  @override
  VCopyWith<$R, V, V> get v => $value.v.copyWith.$chain((v) => call(v: v));
  @override
  VCopyWith<$R, V, V> get v2 => $value.v2.copyWith.$chain((v) => call(v2: v));
  @override
  $R call({V? v, V? v2}) => $apply(
      FieldCopyWithData({if (v != null) #v: v, if (v2 != null) #v2: v2}));
  @override
  A $make(CopyWithData data) =>
      A(v: data.get(#v, or: $value.v), v2: data.get(#v2, or: $value.v2));

  @override
  ACopyWith<$R2, A, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ACopyWithImpl($value, $cast, t);
}

class BMapper extends ClassMapperBase<B> {
  BMapper._();

  static BMapper? _instance;
  static BMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BMapper._());
      WMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'B';

  static V _$v(B v) => v.v;
  static dynamic _arg$v(f) => f<V>();
  static const Field<B, W> _f$v = Field('v', _$v, arg: _arg$v);
  static V _$v2(B v) => v.v2;
  static dynamic _arg$v2(f) => f<V>();
  static const Field<B, W> _f$v2 = Field('v2', _$v2, arg: _arg$v2);

  @override
  final Map<Symbol, Field<B, dynamic>> fields = const {
    #v: _f$v,
    #v2: _f$v2,
  };

  static B _instantiate(DecodingData data) {
    return B(v: data.dec(_f$v), v2: data.dec(_f$v2));
  }

  @override
  final Function instantiate = _instantiate;

  static B fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<B>(map);
  }

  static B fromJson(String json) {
    return ensureInitialized().decodeJson<B>(json);
  }
}

mixin BMappable {
  String toJson() {
    return BMapper.ensureInitialized().encodeJson<B>(this as B);
  }

  Map<String, dynamic> toMap() {
    return BMapper.ensureInitialized().encodeMap<B>(this as B);
  }

  BCopyWith<B, B, B> get copyWith =>
      _BCopyWithImpl(this as B, $identity, $identity);
  @override
  String toString() {
    return BMapper.ensureInitialized().stringifyValue(this as B);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BMapper.ensureInitialized().isValueEqual(this as B, other));
  }

  @override
  int get hashCode {
    return BMapper.ensureInitialized().hashValue(this as B);
  }
}

extension BValueCopy<$R, $Out> on ObjectCopyWith<$R, B, $Out> {
  BCopyWith<$R, B, $Out> get $asB =>
      $base.as((v, t, t2) => _BCopyWithImpl(v, t, t2));
}

abstract class BCopyWith<$R, $In extends B, $Out>
    implements ACopyWith<$R, $In, $Out> {
  @override
  WCopyWith<$R, W, W> get v;
  @override
  WCopyWith<$R, W, W> get v2;
  @override
  $R call({covariant W? v, covariant W? v2});
  BCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, B, $Out>
    implements BCopyWith<$R, B, $Out> {
  _BCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<B> $mapper = BMapper.ensureInitialized();
  @override
  WCopyWith<$R, W, W> get v =>
      ($value.v as W).copyWith.$chain((v) => call(v: v));
  @override
  WCopyWith<$R, W, W> get v2 =>
      ($value.v2 as W).copyWith.$chain((v) => call(v2: v));
  @override
  $R call({W? v, W? v2}) => $apply(
      FieldCopyWithData({if (v != null) #v: v, if (v2 != null) #v2: v2}));
  @override
  B $make(CopyWithData data) =>
      B(v: data.get(#v, or: $value.v), v2: data.get(#v2, or: $value.v2));

  @override
  BCopyWith<$R2, B, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BCopyWithImpl($value, $cast, t);
}

class VMapper extends ClassMapperBase<V> {
  VMapper._();

  static VMapper? _instance;
  static VMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VMapper._());
      WMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'V';

  static int _$v(V v) => v.v;
  static const Field<V, int> _f$v = Field('v', _$v);

  @override
  final Map<Symbol, Field<V, dynamic>> fields = const {
    #v: _f$v,
  };

  static V _instantiate(DecodingData data) {
    return V(data.dec(_f$v));
  }

  @override
  final Function instantiate = _instantiate;

  static V fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<V>(map);
  }

  static V fromJson(String json) {
    return ensureInitialized().decodeJson<V>(json);
  }
}

mixin VMappable {
  String toJson() {
    return VMapper.ensureInitialized().encodeJson<V>(this as V);
  }

  Map<String, dynamic> toMap() {
    return VMapper.ensureInitialized().encodeMap<V>(this as V);
  }

  VCopyWith<V, V, V> get copyWith =>
      _VCopyWithImpl(this as V, $identity, $identity);
  @override
  String toString() {
    return VMapper.ensureInitialized().stringifyValue(this as V);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            VMapper.ensureInitialized().isValueEqual(this as V, other));
  }

  @override
  int get hashCode {
    return VMapper.ensureInitialized().hashValue(this as V);
  }
}

extension VValueCopy<$R, $Out> on ObjectCopyWith<$R, V, $Out> {
  VCopyWith<$R, V, $Out> get $asV =>
      $base.as((v, t, t2) => _VCopyWithImpl(v, t, t2));
}

abstract class VCopyWith<$R, $In extends V, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? v});
  VCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _VCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, V, $Out>
    implements VCopyWith<$R, V, $Out> {
  _VCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<V> $mapper = VMapper.ensureInitialized();
  @override
  $R call({int? v}) => $apply(FieldCopyWithData({if (v != null) #v: v}));
  @override
  V $make(CopyWithData data) => V(data.get(#v, or: $value.v));

  @override
  VCopyWith<$R2, V, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _VCopyWithImpl($value, $cast, t);
}

class WMapper extends ClassMapperBase<W> {
  WMapper._();

  static WMapper? _instance;
  static WMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'W';

  static int _$v(W v) => v.v;
  static const Field<W, int> _f$v = Field('v', _$v);

  @override
  final Map<Symbol, Field<W, dynamic>> fields = const {
    #v: _f$v,
  };

  static W _instantiate(DecodingData data) {
    return W(data.dec(_f$v));
  }

  @override
  final Function instantiate = _instantiate;

  static W fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<W>(map);
  }

  static W fromJson(String json) {
    return ensureInitialized().decodeJson<W>(json);
  }
}

mixin WMappable {
  String toJson() {
    return WMapper.ensureInitialized().encodeJson<W>(this as W);
  }

  Map<String, dynamic> toMap() {
    return WMapper.ensureInitialized().encodeMap<W>(this as W);
  }

  WCopyWith<W, W, W> get copyWith =>
      _WCopyWithImpl(this as W, $identity, $identity);
  @override
  String toString() {
    return WMapper.ensureInitialized().stringifyValue(this as W);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            WMapper.ensureInitialized().isValueEqual(this as W, other));
  }

  @override
  int get hashCode {
    return WMapper.ensureInitialized().hashValue(this as W);
  }
}

extension WValueCopy<$R, $Out> on ObjectCopyWith<$R, W, $Out> {
  WCopyWith<$R, W, $Out> get $asW =>
      $base.as((v, t, t2) => _WCopyWithImpl(v, t, t2));
}

abstract class WCopyWith<$R, $In extends W, $Out>
    implements VCopyWith<$R, $In, $Out> {
  @override
  $R call({int? v});
  WCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, W, $Out>
    implements WCopyWith<$R, W, $Out> {
  _WCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<W> $mapper = WMapper.ensureInitialized();
  @override
  $R call({int? v}) => $apply(FieldCopyWithData({if (v != null) #v: v}));
  @override
  W $make(CopyWithData data) => W(data.get(#v, or: $value.v));

  @override
  WCopyWith<$R2, W, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _WCopyWithImpl($value, $cast, t);
}
