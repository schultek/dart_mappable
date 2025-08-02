// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'unmapped_props_hook_test.dart';

class AMapper extends ClassMapperBase<A> {
  AMapper._();

  static AMapper? _instance;
  static AMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'A';

  static Map<String, dynamic> _$unmappedProps(A v) => v.unmappedProps;
  static const Field<A, Map<String, dynamic>> _f$unmappedProps = Field(
    'unmappedProps',
    _$unmappedProps,
  );
  static String? _$a(A v) => v.a;
  static const Field<A, String> _f$a = Field('a', _$a);

  @override
  final MappableFields<A> fields = const {
    #unmappedProps: _f$unmappedProps,
    #a: _f$a,
  };

  @override
  final MappingHook hook = const UnmappedPropertiesHook('unmappedProps');
  static A _instantiate(DecodingData data) {
    return A(data.dec(_f$unmappedProps), data.dec(_f$a));
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
      _ACopyWithImpl<A, A>(this as A, $identity, $identity);
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
      $base.as((v, t, t2) => _ACopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ACopyWith<$R, $In extends A, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
  get unmappedProps;
  $R call({Map<String, dynamic>? unmappedProps, String? a});
  ACopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ACopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, A, $Out>
    implements ACopyWith<$R, A, $Out> {
  _ACopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<A> $mapper = AMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
  get unmappedProps => MapCopyWith(
    $value.unmappedProps,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(unmappedProps: v),
  );
  @override
  $R call({Map<String, dynamic>? unmappedProps, Object? a = $none}) => $apply(
    FieldCopyWithData({
      if (unmappedProps != null) #unmappedProps: unmappedProps,
      if (a != $none) #a: a,
    }),
  );
  @override
  A $make(CopyWithData data) => A(
    data.get(#unmappedProps, or: $value.unmappedProps),
    data.get(#a, or: $value.a),
  );

  @override
  ACopyWith<$R2, A, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ACopyWithImpl<$R2, $Out2>($value, $cast, t);
}

