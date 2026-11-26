// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'private_field_test.dart';

class PascalModelMapper extends ClassMapperBase<PascalModel> {
  PascalModelMapper._();

  static PascalModelMapper? _instance;
  static PascalModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PascalModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PascalModel';

  static String _$_name(PascalModel v) => v._name;
  static const Field<PascalModel, String> _f$_name = Field(
    '_name',
    _$_name,
    key: r'Name',
  );

  @override
  final MappableFields<PascalModel> fields = const {#_name: _f$_name};

  static PascalModel _instantiate(DecodingData data) {
    return PascalModel();
  }

  @override
  final Function instantiate = _instantiate;

  static PascalModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PascalModel>(map);
  }

  static PascalModel fromJson(String json) {
    return ensureInitialized().decodeJson<PascalModel>(json);
  }
}

mixin PascalModelMappable {
  String toJson() {
    return PascalModelMapper.ensureInitialized().encodeJson<PascalModel>(
      this as PascalModel,
    );
  }

  Map<String, dynamic> toMap() {
    return PascalModelMapper.ensureInitialized().encodeMap<PascalModel>(
      this as PascalModel,
    );
  }

  PascalModelCopyWith<PascalModel, PascalModel, PascalModel> get copyWith =>
      _PascalModelCopyWithImpl<PascalModel, PascalModel>(
        this as PascalModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return PascalModelMapper.ensureInitialized().stringifyValue(
      this as PascalModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return PascalModelMapper.ensureInitialized().equalsValue(
      this as PascalModel,
      other,
    );
  }

  @override
  int get hashCode {
    return PascalModelMapper.ensureInitialized().hashValue(this as PascalModel);
  }
}

extension PascalModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PascalModel, $Out> {
  PascalModelCopyWith<$R, PascalModel, $Out> get $asPascalModel =>
      $base.as((v, t, t2) => _PascalModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PascalModelCopyWith<$R, $In extends PascalModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  PascalModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PascalModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PascalModel, $Out>
    implements PascalModelCopyWith<$R, PascalModel, $Out> {
  _PascalModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PascalModel> $mapper =
      PascalModelMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  PascalModel $make(CopyWithData data) => PascalModel();

  @override
  PascalModelCopyWith<$R2, PascalModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PascalModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class CamelModelMapper extends ClassMapperBase<CamelModel> {
  CamelModelMapper._();

  static CamelModelMapper? _instance;
  static CamelModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CamelModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CamelModel';

  static String _$_name(CamelModel v) => v._name;
  static const Field<CamelModel, String> _f$_name = Field(
    '_name',
    _$_name,
    key: r'name',
  );

  @override
  final MappableFields<CamelModel> fields = const {#_name: _f$_name};

  static CamelModel _instantiate(DecodingData data) {
    return CamelModel();
  }

  @override
  final Function instantiate = _instantiate;

  static CamelModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CamelModel>(map);
  }

  static CamelModel fromJson(String json) {
    return ensureInitialized().decodeJson<CamelModel>(json);
  }
}

mixin CamelModelMappable {
  String toJson() {
    return CamelModelMapper.ensureInitialized().encodeJson<CamelModel>(
      this as CamelModel,
    );
  }

  Map<String, dynamic> toMap() {
    return CamelModelMapper.ensureInitialized().encodeMap<CamelModel>(
      this as CamelModel,
    );
  }

  CamelModelCopyWith<CamelModel, CamelModel, CamelModel> get copyWith =>
      _CamelModelCopyWithImpl<CamelModel, CamelModel>(
        this as CamelModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CamelModelMapper.ensureInitialized().stringifyValue(
      this as CamelModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return CamelModelMapper.ensureInitialized().equalsValue(
      this as CamelModel,
      other,
    );
  }

  @override
  int get hashCode {
    return CamelModelMapper.ensureInitialized().hashValue(this as CamelModel);
  }
}

extension CamelModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CamelModel, $Out> {
  CamelModelCopyWith<$R, CamelModel, $Out> get $asCamelModel =>
      $base.as((v, t, t2) => _CamelModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CamelModelCopyWith<$R, $In extends CamelModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  CamelModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CamelModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CamelModel, $Out>
    implements CamelModelCopyWith<$R, CamelModel, $Out> {
  _CamelModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CamelModel> $mapper =
      CamelModelMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  CamelModel $make(CopyWithData data) => CamelModel();

  @override
  CamelModelCopyWith<$R2, CamelModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CamelModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

