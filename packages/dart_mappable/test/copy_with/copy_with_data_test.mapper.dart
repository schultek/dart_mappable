// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'copy_with_data_test.dart';

class AMapper extends ClassMapperBase<A> {
  AMapper._();

  static AMapper? _instance;
  static AMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AMapper._());
      BMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'A';

  static String? _$a(A v) => v.a;
  static const Field<A, String> _f$a = Field('a', _$a);
  static B? _$b(A v) => v.b;
  static const Field<A, B> _f$b = Field('b', _$b);

  @override
  final MappableFields<A> fields = const {
    #a: _f$a,
    #b: _f$b,
  };

  static A _instantiate(DecodingData data) {
    return A(data.dec(_f$a), data.dec(_f$b));
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
    return AMapper.ensureInitialized().equalsValue(this as A, other);
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
  BCopyWith<$R, B, B>? get b;
  $R call({String? a, B? b});
  ACopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ACopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, A, $Out>
    implements ACopyWith<$R, A, $Out> {
  _ACopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<A> $mapper = AMapper.ensureInitialized();
  @override
  BCopyWith<$R, B, B>? get b => $value.b?.copyWith.$chain((v) => call(b: v));
  @override
  $R call({Object? a = $none, Object? b = $none}) =>
      $apply(FieldCopyWithData({if (a != $none) #a: a, if (b != $none) #b: b}));
  @override
  A $make(CopyWithData data) =>
      A(data.get(#a, or: $value.a), data.get(#b, or: $value.b));

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
    }
    return _instance!;
  }

  @override
  final String id = 'B';

  static String? _$a(B v) => v.a;
  static const Field<B, String> _f$a = Field('a', _$a);
  static int? _$b(B v) => v.b;
  static const Field<B, int> _f$b = Field('b', _$b);

  @override
  final MappableFields<B> fields = const {
    #a: _f$a,
    #b: _f$b,
  };

  static B _instantiate(DecodingData data) {
    return B(data.dec(_f$a), data.dec(_f$b));
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
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? a, int? b});
  BCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, B, $Out>
    implements BCopyWith<$R, B, $Out> {
  _BCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<B> $mapper = BMapper.ensureInitialized();
  @override
  $R call({Object? a = $none, Object? b = $none}) =>
      $apply(FieldCopyWithData({if (a != $none) #a: a, if (b != $none) #b: b}));
  @override
  B $make(CopyWithData data) =>
      B(data.get(#a, or: $value.a), data.get(#b, or: $value.b));

  @override
  BCopyWith<$R2, B, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BCopyWithImpl($value, $cast, t);
}
