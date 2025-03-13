// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'unknown_interface.dart';

class HOpacityMapper extends EnumMapper<HOpacity> {
  HOpacityMapper._();

  static HOpacityMapper? _instance;
  static HOpacityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HOpacityMapper._());
    }
    return _instance!;
  }

  static HOpacity fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  HOpacity decode(dynamic value) {
    switch (value) {
      case r'bzOpacityIntense':
        return HOpacity.bzOpacityIntense;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(HOpacity self) {
    switch (self) {
      case HOpacity.bzOpacityIntense:
        return r'bzOpacityIntense';
    }
  }
}

extension HOpacityMapperExtension on HOpacity {
  String toValue() {
    HOpacityMapper.ensureInitialized();
    return MapperContainer.globals.toValue<HOpacity>(this) as String;
  }
}

class DSOpacityDataMapper extends ClassMapperBase<DSOpacityData> {
  DSOpacityDataMapper._();

  static DSOpacityDataMapper? _instance;
  static DSOpacityDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DSOpacityDataMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DSOpacityData';

  static Map<BaseToken, double> _$data(DSOpacityData v) => v.data;
  static const Field<DSOpacityData, Map<BaseToken, double>> _f$data = Field(
      'data', _$data,
      opt: true, def: const {HOpacity.bzOpacityIntense: 0.4});
  static double _$fallback(DSOpacityData v) => v.fallback;
  static const Field<DSOpacityData, double> _f$fallback =
      Field('fallback', _$fallback, opt: true, def: 0.0);

  @override
  final MappableFields<DSOpacityData> fields = const {
    #data: _f$data,
    #fallback: _f$fallback,
  };

  static DSOpacityData _instantiate(DecodingData data) {
    return DSOpacityData(
        data: data.dec(_f$data), fallback: data.dec(_f$fallback));
  }

  @override
  final Function instantiate = _instantiate;

  static DSOpacityData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DSOpacityData>(map);
  }

  static DSOpacityData fromJson(String json) {
    return ensureInitialized().decodeJson<DSOpacityData>(json);
  }
}

mixin DSOpacityDataMappable {
  String toJson() {
    return DSOpacityDataMapper.ensureInitialized()
        .encodeJson<DSOpacityData>(this as DSOpacityData);
  }

  Map<String, dynamic> toMap() {
    return DSOpacityDataMapper.ensureInitialized()
        .encodeMap<DSOpacityData>(this as DSOpacityData);
  }

  DSOpacityDataCopyWith<DSOpacityData, DSOpacityData, DSOpacityData>
      get copyWith => _DSOpacityDataCopyWithImpl(
          this as DSOpacityData, $identity, $identity);
  @override
  String toString() {
    return DSOpacityDataMapper.ensureInitialized()
        .stringifyValue(this as DSOpacityData);
  }

  @override
  bool operator ==(Object other) {
    return DSOpacityDataMapper.ensureInitialized()
        .equalsValue(this as DSOpacityData, other);
  }

  @override
  int get hashCode {
    return DSOpacityDataMapper.ensureInitialized()
        .hashValue(this as DSOpacityData);
  }
}

extension DSOpacityDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DSOpacityData, $Out> {
  DSOpacityDataCopyWith<$R, DSOpacityData, $Out> get $asDSOpacityData =>
      $base.as((v, t, t2) => _DSOpacityDataCopyWithImpl(v, t, t2));
}

abstract class DSOpacityDataCopyWith<$R, $In extends DSOpacityData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, BaseToken, double, ObjectCopyWith<$R, double, double>>
      get data;
  $R call({Map<BaseToken, double>? data, double? fallback});
  DSOpacityDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DSOpacityDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DSOpacityData, $Out>
    implements DSOpacityDataCopyWith<$R, DSOpacityData, $Out> {
  _DSOpacityDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DSOpacityData> $mapper =
      DSOpacityDataMapper.ensureInitialized();
  @override
  MapCopyWith<$R, BaseToken, double, ObjectCopyWith<$R, double, double>>
      get data => MapCopyWith($value.data,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(data: v));
  @override
  $R call({Map<BaseToken, double>? data, double? fallback}) =>
      $apply(FieldCopyWithData({
        if (data != null) #data: data,
        if (fallback != null) #fallback: fallback
      }));
  @override
  DSOpacityData $make(CopyWithData data) => DSOpacityData(
      data: data.get(#data, or: $value.data),
      fallback: data.get(#fallback, or: $value.fallback));

  @override
  DSOpacityDataCopyWith<$R2, DSOpacityData, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DSOpacityDataCopyWithImpl($value, $cast, t);
}
