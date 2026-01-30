// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'other_base_a.dart';

class OtherBaseMapper extends ClassMapperBase<OtherBase> {
  OtherBaseMapper._();

  static OtherBaseMapper? _instance;
  static OtherBaseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OtherBaseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'OtherBase';

  static String? _$id(OtherBase v) => v.id;
  static const Field<OtherBase, String> _f$id = Field(
    'id',
    _$id,
    key: r'_id',
    opt: true,
  );
  static Map<String, dynamic> _$unmappedProps(OtherBase v) => v.unmappedProps;
  static const Field<OtherBase, Map<String, dynamic>> _f$unmappedProps = Field(
    'unmappedProps',
    _$unmappedProps,
    opt: true,
    def: const {},
  );

  @override
  final MappableFields<OtherBase> fields = const {
    #id: _f$id,
    #unmappedProps: _f$unmappedProps,
  };
  @override
  final bool ignoreNull = true;

  @override
  final MappingHook hook = const UnmappedPropertiesHook('unmappedProps');
  static OtherBase _instantiate(DecodingData data) {
    return OtherBase(
      id: data.dec(_f$id),
      unmappedProps: data.dec(_f$unmappedProps),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static OtherBase fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OtherBase>(map);
  }

  static OtherBase fromJson(String json) {
    return ensureInitialized().decodeJson<OtherBase>(json);
  }
}

mixin OtherBaseMappable {
  String toJson() {
    return OtherBaseMapper.ensureInitialized().encodeJson<OtherBase>(
      this as OtherBase,
    );
  }

  Map<String, dynamic> toMap() {
    return OtherBaseMapper.ensureInitialized().encodeMap<OtherBase>(
      this as OtherBase,
    );
  }

  OtherBaseCopyWith<OtherBase, OtherBase, OtherBase> get copyWith =>
      _OtherBaseCopyWithImpl<OtherBase, OtherBase>(
        this as OtherBase,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return OtherBaseMapper.ensureInitialized().stringifyValue(
      this as OtherBase,
    );
  }

  @override
  bool operator ==(Object other) {
    return OtherBaseMapper.ensureInitialized().equalsValue(
      this as OtherBase,
      other,
    );
  }

  @override
  int get hashCode {
    return OtherBaseMapper.ensureInitialized().hashValue(this as OtherBase);
  }
}

extension OtherBaseValueCopy<$R, $Out> on ObjectCopyWith<$R, OtherBase, $Out> {
  OtherBaseCopyWith<$R, OtherBase, $Out> get $asOtherBase =>
      $base.as((v, t, t2) => _OtherBaseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class OtherBaseCopyWith<$R, $In extends OtherBase, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
  get unmappedProps;
  $R call({String? id, String? rev, Map<String, dynamic>? unmappedProps});
  OtherBaseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OtherBaseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OtherBase, $Out>
    implements OtherBaseCopyWith<$R, OtherBase, $Out> {
  _OtherBaseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OtherBase> $mapper =
      OtherBaseMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
  get unmappedProps => MapCopyWith(
    $value.unmappedProps,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(unmappedProps: v),
  );
  @override
  $R call({
    Object? id = $none,
    Object? rev = $none,
    Map<String, dynamic>? unmappedProps,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (rev != $none) #rev: rev,
      if (unmappedProps != null) #unmappedProps: unmappedProps,
    }),
  );
  @override
  OtherBase $make(CopyWithData data) => OtherBase(
    id: data.get(#id, or: $value.id),
    unmappedProps: data.get(#unmappedProps, or: $value.unmappedProps),
  );

  @override
  OtherBaseCopyWith<$R2, OtherBase, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _OtherBaseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

