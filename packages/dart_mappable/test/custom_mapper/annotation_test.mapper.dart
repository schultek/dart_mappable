// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'annotation_test.dart';

class PrivateContainerMapper extends ClassMapperBase<PrivateContainer> {
  PrivateContainerMapper._();

  static PrivateContainerMapper? _instance;
  static PrivateContainerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PrivateContainerMapper._());
      MapperContainer.globals.useAll([PrivateClassMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'ABC';

  static MyPrivateClass _$value(PrivateContainer v) => v.value;
  static const Field<PrivateContainer, MyPrivateClass> _f$value = Field(
    'value',
    _$value,
  );

  @override
  final MappableFields<PrivateContainer> fields = const {#value: _f$value};
  @override
  final bool ignoreNull = true;

  static PrivateContainer _instantiate(DecodingData data) {
    return PrivateContainer(data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static PrivateContainer fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PrivateContainer>(map);
  }

  static PrivateContainer fromJson(String json) {
    return ensureInitialized().decodeJson<PrivateContainer>(json);
  }
}

mixin PrivateContainerMappable {
  String toJson() {
    return PrivateContainerMapper.ensureInitialized()
        .encodeJson<PrivateContainer>(this as PrivateContainer);
  }

  Map<String, dynamic> toMap() {
    return PrivateContainerMapper.ensureInitialized()
        .encodeMap<PrivateContainer>(this as PrivateContainer);
  }

  PrivateContainerCopyWith<PrivateContainer, PrivateContainer, PrivateContainer>
  get copyWith =>
      _PrivateContainerCopyWithImpl<PrivateContainer, PrivateContainer>(
        this as PrivateContainer,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return PrivateContainerMapper.ensureInitialized().stringifyValue(
      this as PrivateContainer,
    );
  }

  @override
  bool operator ==(Object other) {
    return PrivateContainerMapper.ensureInitialized().equalsValue(
      this as PrivateContainer,
      other,
    );
  }

  @override
  int get hashCode {
    return PrivateContainerMapper.ensureInitialized().hashValue(
      this as PrivateContainer,
    );
  }
}

extension PrivateContainerValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PrivateContainer, $Out> {
  PrivateContainerCopyWith<$R, PrivateContainer, $Out>
  get $asPrivateContainer =>
      $base.as((v, t, t2) => _PrivateContainerCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PrivateContainerCopyWith<$R, $In extends PrivateContainer, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({MyPrivateClass? value});
  PrivateContainerCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _PrivateContainerCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PrivateContainer, $Out>
    implements PrivateContainerCopyWith<$R, PrivateContainer, $Out> {
  _PrivateContainerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PrivateContainer> $mapper =
      PrivateContainerMapper.ensureInitialized();
  @override
  $R call({MyPrivateClass? value}) =>
      $apply(FieldCopyWithData({if (value != null) #value: value}));
  @override
  PrivateContainer $make(CopyWithData data) =>
      PrivateContainer(data.get(#value, or: $value.value));

  @override
  PrivateContainerCopyWith<$R2, PrivateContainer, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PrivateContainerCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class PrivateContainer2Mapper extends ClassMapperBase<PrivateContainer2> {
  PrivateContainer2Mapper._();

  static PrivateContainer2Mapper? _instance;
  static PrivateContainer2Mapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PrivateContainer2Mapper._());
      MapperContainer.globals.useAll([PrivateClassMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'ABC';

  static MyPrivateClass _$value(PrivateContainer2 v) => v.value;
  static const Field<PrivateContainer2, MyPrivateClass> _f$value = Field(
    'value',
    _$value,
  );

  @override
  final MappableFields<PrivateContainer2> fields = const {#value: _f$value};
  @override
  final bool ignoreNull = true;

  static PrivateContainer2 _instantiate(DecodingData data) {
    return PrivateContainer2(data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static PrivateContainer2 fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PrivateContainer2>(map);
  }

  static PrivateContainer2 fromJson(String json) {
    return ensureInitialized().decodeJson<PrivateContainer2>(json);
  }
}

mixin PrivateContainer2Mappable {
  String toJson() {
    return PrivateContainer2Mapper.ensureInitialized()
        .encodeJson<PrivateContainer2>(this as PrivateContainer2);
  }

  Map<String, dynamic> toMap() {
    return PrivateContainer2Mapper.ensureInitialized()
        .encodeMap<PrivateContainer2>(this as PrivateContainer2);
  }

  PrivateContainer2CopyWith<
    PrivateContainer2,
    PrivateContainer2,
    PrivateContainer2
  >
  get copyWith =>
      _PrivateContainer2CopyWithImpl<PrivateContainer2, PrivateContainer2>(
        this as PrivateContainer2,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return PrivateContainer2Mapper.ensureInitialized().stringifyValue(
      this as PrivateContainer2,
    );
  }

  @override
  bool operator ==(Object other) {
    return PrivateContainer2Mapper.ensureInitialized().equalsValue(
      this as PrivateContainer2,
      other,
    );
  }

  @override
  int get hashCode {
    return PrivateContainer2Mapper.ensureInitialized().hashValue(
      this as PrivateContainer2,
    );
  }
}

extension PrivateContainer2ValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PrivateContainer2, $Out> {
  PrivateContainer2CopyWith<$R, PrivateContainer2, $Out>
  get $asPrivateContainer2 => $base.as(
    (v, t, t2) => _PrivateContainer2CopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class PrivateContainer2CopyWith<
  $R,
  $In extends PrivateContainer2,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({MyPrivateClass? value});
  PrivateContainer2CopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _PrivateContainer2CopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PrivateContainer2, $Out>
    implements PrivateContainer2CopyWith<$R, PrivateContainer2, $Out> {
  _PrivateContainer2CopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PrivateContainer2> $mapper =
      PrivateContainer2Mapper.ensureInitialized();
  @override
  $R call({MyPrivateClass? value}) =>
      $apply(FieldCopyWithData({if (value != null) #value: value}));
  @override
  PrivateContainer2 $make(CopyWithData data) =>
      PrivateContainer2(data.get(#value, or: $value.value));

  @override
  PrivateContainer2CopyWith<$R2, PrivateContainer2, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PrivateContainer2CopyWithImpl<$R2, $Out2>($value, $cast, t);
}

