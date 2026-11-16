// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'record_ignore_null_test.dart';

class PartialPointMapper extends RecordMapperBase<PartialPoint> {
  static PartialPointMapper? _instance;
  PartialPointMapper._();

  static PartialPointMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PartialPointMapper._());
      MapperBase.addType(<A, B>(f) => f<({A x, B y})>());
    }
    return _instance!;
  }

  static double _$x(PartialPoint v) => v.x;
  static const Field<PartialPoint, double> _f$x = Field('x', _$x);
  static double? _$y(PartialPoint v) => v.y;
  static const Field<PartialPoint, double> _f$y = Field('y', _$y);

  @override
  final MappableFields<PartialPoint> fields = const {#x: _f$x, #y: _f$y};
  @override
  final bool ignoreNull = true;

  @override
  Function get typeFactory =>
      (f) => f<PartialPoint>();

  @override
  List<Type> apply(MappingContext context) {
    return [];
  }

  static PartialPoint _instantiate(DecodingData<PartialPoint> data) {
    return (x: data.dec(_f$x), y: data.dec(_f$y));
  }

  @override
  final Function instantiate = _instantiate;

  static PartialPoint fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PartialPoint>(map);
  }

  static PartialPoint fromJson(String json) {
    return ensureInitialized().decodeJson<PartialPoint>(json);
  }
}

extension PartialPointMappable on PartialPoint {
  Map<String, dynamic> toMap() {
    return PartialPointMapper.ensureInitialized().encodeMap(this);
  }

  String toJson() {
    return PartialPointMapper.ensureInitialized().encodeJson(this);
  }

  PartialPointCopyWith<PartialPoint> get copyWith =>
      _PartialPointCopyWithImpl(this, $identity, $identity);
}

extension PartialPointValueCopy<$R>
    on ObjectCopyWith<$R, PartialPoint, PartialPoint> {
  PartialPointCopyWith<$R> get $asPartialPoint =>
      $base.as((v, t, t2) => _PartialPointCopyWithImpl(v, t, t2));
}

abstract class PartialPointCopyWith<$R>
    implements RecordCopyWith<$R, PartialPoint> {
  $R call({double? x, double? y});
  PartialPointCopyWith<$R2> $chain<$R2>(Then<PartialPoint, $R2> t);
}

class _PartialPointCopyWithImpl<$R> extends RecordCopyWithBase<$R, PartialPoint>
    implements PartialPointCopyWith<$R> {
  _PartialPointCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final RecordMapperBase<PartialPoint> $mapper =
      PartialPointMapper.ensureInitialized();
  @override
  $R call({double? x, Object? y = $none}) =>
      $apply(FieldCopyWithData({if (x != null) #x: x, if (y != $none) #y: y}));
  @override
  PartialPoint $make(CopyWithData data) =>
      (x: data.get(#x, or: $value.x), y: data.get(#y, or: $value.y));

  @override
  PartialPointCopyWith<$R2> $chain<$R2>(Then<PartialPoint, $R2> t) =>
      _PartialPointCopyWithImpl($value, $cast, t);
}

