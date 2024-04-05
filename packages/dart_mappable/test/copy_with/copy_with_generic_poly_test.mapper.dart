// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'copy_with_generic_poly_test.dart';

class AMapper extends ClassMapperBase<A> {
  AMapper._();

  static AMapper? _instance;
  static AMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AMapper._());
      BMapper.ensureInitialized();
      CMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'A';
  @override
  Function get typeFactory => <T extends C>(f) => f<A<T>>();

  static C _$value(A v) => v.value;
  static dynamic _arg$value<T extends C>(f) => f<T>();
  static const Field<A, C> _f$value = Field('value', _$value, arg: _arg$value);

  @override
  final MappableFields<A> fields = const {
    #value: _f$value,
  };

  static A<T> _instantiate<T extends C>(DecodingData data) {
    return A(data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static A<T> fromMap<T extends C>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<A<T>>(map);
  }

  static A<T> fromJson<T extends C>(String json) {
    return ensureInitialized().decodeJson<A<T>>(json);
  }
}

mixin AMappable<T extends C> {
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
    return AMapper.ensureInitialized().equalsValue(this as A<T>, other);
  }

  @override
  int get hashCode {
    return AMapper.ensureInitialized().hashValue(this as A<T>);
  }
}

extension AValueCopy<$R, $Out, T extends C> on ObjectCopyWith<$R, A<T>, $Out> {
  ACopyWith<$R, A<T>, $Out, T> get $asA =>
      $base.as((v, t, t2) => _ACopyWithImpl(v, t, t2));
}

abstract class ACopyWith<$R, $In extends A<T>, $Out, T extends C>
    implements ClassCopyWith<$R, $In, $Out> {
  CCopyWith<$R, C, T> get value;
  $R call({T? value});
  ACopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ACopyWithImpl<$R, $Out, T extends C>
    extends ClassCopyWithBase<$R, A<T>, $Out>
    implements ACopyWith<$R, A<T>, $Out, T> {
  _ACopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<A> $mapper = AMapper.ensureInitialized();
  @override
  CCopyWith<$R, C, T> get value =>
      $value.value.copyWith.$chain((v) => call(value: v));
  @override
  $R call({T? value}) =>
      $apply(FieldCopyWithData({if (value != null) #value: value}));
  @override
  A<T> $make(CopyWithData data) => A(data.get(#value, or: $value.value));

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
      DMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'C';

  static String _$data(C v) => v.data;
  static const Field<C, String> _f$data = Field('data', _$data);

  @override
  final MappableFields<C> fields = const {
    #data: _f$data,
  };

  static C _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('C');
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
  String toJson();
  Map<String, dynamic> toMap();
  CCopyWith<C, C, C> get copyWith;
}

abstract class CCopyWith<$R, $In extends C, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? data});
  CCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class BMapper extends ClassMapperBase<B> {
  BMapper._();

  static BMapper? _instance;
  static BMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BMapper._());
      AMapper.ensureInitialized();
      DMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'B';

  static D _$value(B v) => v.value;
  static const Field<B, D> _f$value = Field('value', _$value);

  @override
  final MappableFields<B> fields = const {
    #value: _f$value,
  };

  static B _instantiate(DecodingData data) {
    return B(data.dec(_f$value));
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
    return BMapper.ensureInitialized().equalsValue(this as B, other);
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
    implements ACopyWith<$R, $In, $Out, D> {
  @override
  DCopyWith<$R, D, D> get value;
  @override
  $R call({D? value});
  BCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, B, $Out>
    implements BCopyWith<$R, B, $Out> {
  _BCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<B> $mapper = BMapper.ensureInitialized();
  @override
  DCopyWith<$R, D, D> get value =>
      ($value.value as D).copyWith.$chain((v) => call(value: v));
  @override
  $R call({D? value}) =>
      $apply(FieldCopyWithData({if (value != null) #value: value}));
  @override
  B $make(CopyWithData data) => B(data.get(#value, or: $value.value));

  @override
  BCopyWith<$R2, B, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BCopyWithImpl($value, $cast, t);
}

class DMapper extends ClassMapperBase<D> {
  DMapper._();

  static DMapper? _instance;
  static DMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DMapper._());
      CMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'D';

  static String _$data(D v) => v.data;
  static const Field<D, String> _f$data = Field('data', _$data);

  @override
  final MappableFields<D> fields = const {
    #data: _f$data,
  };

  static D _instantiate(DecodingData data) {
    return D(data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static D fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<D>(map);
  }

  static D fromJson(String json) {
    return ensureInitialized().decodeJson<D>(json);
  }
}

mixin DMappable {
  String toJson() {
    return DMapper.ensureInitialized().encodeJson<D>(this as D);
  }

  Map<String, dynamic> toMap() {
    return DMapper.ensureInitialized().encodeMap<D>(this as D);
  }

  DCopyWith<D, D, D> get copyWith =>
      _DCopyWithImpl(this as D, $identity, $identity);
  @override
  String toString() {
    return DMapper.ensureInitialized().stringifyValue(this as D);
  }

  @override
  bool operator ==(Object other) {
    return DMapper.ensureInitialized().equalsValue(this as D, other);
  }

  @override
  int get hashCode {
    return DMapper.ensureInitialized().hashValue(this as D);
  }
}

extension DValueCopy<$R, $Out> on ObjectCopyWith<$R, D, $Out> {
  DCopyWith<$R, D, $Out> get $asD =>
      $base.as((v, t, t2) => _DCopyWithImpl(v, t, t2));
}

abstract class DCopyWith<$R, $In extends D, $Out>
    implements CCopyWith<$R, $In, $Out> {
  @override
  $R call({String? data});
  DCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, D, $Out>
    implements DCopyWith<$R, D, $Out> {
  _DCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<D> $mapper = DMapper.ensureInitialized();
  @override
  $R call({String? data}) =>
      $apply(FieldCopyWithData({if (data != null) #data: data}));
  @override
  D $make(CopyWithData data) => D(data: data.get(#data, or: $value.data));

  @override
  DCopyWith<$R2, D, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _DCopyWithImpl($value, $cast, t);
}
