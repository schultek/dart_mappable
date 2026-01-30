// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'other_base_b.dart';

class OtherBaseMapper extends ClassMapperBase<OtherBase> {
  OtherBaseMapper._();

  static OtherBaseMapper? _instance;
  static OtherBaseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OtherBaseMapper._());
      CMapper.ensureInitialized();
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
  static String? _$rev(OtherBase v) => v.rev;
  static const Field<OtherBase, String> _f$rev = Field(
    'rev',
    _$rev,
    key: r'_rev',
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
    #rev: _f$rev,
    #unmappedProps: _f$unmappedProps,
  };
  @override
  final bool ignoreNull = true;

  @override
  final MappingHook hook = const UnmappedPropertiesHook('unmappedProps');
  static OtherBase _instantiate(DecodingData data) {
    return OtherBase(
      id: data.dec(_f$id),
      rev: data.dec(_f$rev),
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
  $R call({String? id});
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
  $R call({Object? id = $none}) =>
      $apply(FieldCopyWithData({if (id != $none) #id: id}));
  @override
  OtherBase $make(CopyWithData data) => OtherBase(
    id: data.get(#id, or: $value.id),
    rev: data.get(#rev, or: $value.rev),
    unmappedProps: data.get(#unmappedProps, or: $value.unmappedProps),
  );

  @override
  OtherBaseCopyWith<$R2, OtherBase, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _OtherBaseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class CMapper extends SubClassMapperBase<C> {
  CMapper._();

  static CMapper? _instance;
  static CMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CMapper._());
      OtherBaseMapper.ensureInitialized().addSubMapper(_instance!);
      DMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'C';

  static String _$valueC(C v) => v.valueC;
  static const Field<C, String> _f$valueC = Field('valueC', _$valueC);
  static String? _$id(C v) => v.id;
  static const Field<C, String> _f$id = Field(
    'id',
    _$id,
    key: r'_id',
    opt: true,
  );
  static String? _$rev(C v) => v.rev;
  static const Field<C, String> _f$rev = Field('rev', _$rev, key: r'_rev');
  static Map<String, dynamic> _$unmappedProps(C v) => v.unmappedProps;
  static const Field<C, Map<String, dynamic>> _f$unmappedProps = Field(
    'unmappedProps',
    _$unmappedProps,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<C> fields = const {
    #valueC: _f$valueC,
    #id: _f$id,
    #rev: _f$rev,
    #unmappedProps: _f$unmappedProps,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'C';
  @override
  late final ClassMapperBase superMapper = OtherBaseMapper.ensureInitialized();

  @override
  final MappingHook superHook = const UnmappedPropertiesHook('unmappedProps');

  static C _instantiate(DecodingData data) {
    return C(valueC: data.dec(_f$valueC), id: data.dec(_f$id));
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
    implements OtherBaseCopyWith<$R, $In, $Out> {
  @override
  $R call({String? valueC, String? id});
  CCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, C, $Out>
    implements CCopyWith<$R, C, $Out> {
  _CCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<C> $mapper = CMapper.ensureInitialized();
  @override
  $R call({String? valueC, Object? id = $none}) => $apply(
    FieldCopyWithData({
      if (valueC != null) #valueC: valueC,
      if (id != $none) #id: id,
    }),
  );
  @override
  C $make(CopyWithData data) => C(
    valueC: data.get(#valueC, or: $value.valueC),
    id: data.get(#id, or: $value.id),
  );

  @override
  CCopyWith<$R2, C, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class DMapper extends SubClassMapperBase<D> {
  DMapper._();

  static DMapper? _instance;
  static DMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DMapper._());
      CMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'D';

  static int _$valueD(D v) => v.valueD;
  static const Field<D, int> _f$valueD = Field('valueD', _$valueD);
  static String _$valueC(D v) => v.valueC;
  static const Field<D, String> _f$valueC = Field('valueC', _$valueC);
  static String? _$id(D v) => v.id;
  static const Field<D, String> _f$id = Field(
    'id',
    _$id,
    key: r'_id',
    opt: true,
  );
  static String? _$rev(D v) => v.rev;
  static const Field<D, String> _f$rev = Field('rev', _$rev, key: r'_rev');
  static Map<String, dynamic> _$unmappedProps(D v) => v.unmappedProps;
  static const Field<D, Map<String, dynamic>> _f$unmappedProps = Field(
    'unmappedProps',
    _$unmappedProps,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<D> fields = const {
    #valueD: _f$valueD,
    #valueC: _f$valueC,
    #id: _f$id,
    #rev: _f$rev,
    #unmappedProps: _f$unmappedProps,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'D';
  @override
  late final ClassMapperBase superMapper = CMapper.ensureInitialized();

  @override
  final MappingHook superHook = const UnmappedPropertiesHook('unmappedProps');

  static D _instantiate(DecodingData data) {
    return D(
      valueD: data.dec(_f$valueD),
      valueC: data.dec(_f$valueC),
      id: data.dec(_f$id),
    );
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
      _DCopyWithImpl<D, D>(this as D, $identity, $identity);
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
      $base.as((v, t, t2) => _DCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DCopyWith<$R, $In extends D, $Out>
    implements CCopyWith<$R, $In, $Out> {
  @override
  $R call({int? valueD, String? valueC, String? id});
  DCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, D, $Out>
    implements DCopyWith<$R, D, $Out> {
  _DCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<D> $mapper = DMapper.ensureInitialized();
  @override
  $R call({int? valueD, String? valueC, Object? id = $none}) => $apply(
    FieldCopyWithData({
      if (valueD != null) #valueD: valueD,
      if (valueC != null) #valueC: valueC,
      if (id != $none) #id: id,
    }),
  );
  @override
  D $make(CopyWithData data) => D(
    valueD: data.get(#valueD, or: $value.valueD),
    valueC: data.get(#valueC, or: $value.valueC),
    id: data.get(#id, or: $value.id),
  );

  @override
  DCopyWith<$R2, D, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _DCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

