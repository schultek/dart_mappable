// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'basic.dart';

class PersonCMapper extends ClassMapperBase<PersonC> {
  PersonCMapper._();

  static PersonCMapper? _instance;
  static PersonCMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PersonCMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PersonC';

  static String _$name(PersonC v) => v.name;
  static const Field<PersonC, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<PersonC> fields = const {
    #name: _f$name,
  };

  static PersonC _instantiate(DecodingData data) {
    return PersonC(name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static PersonC fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PersonC>(map);
  }

  static PersonC fromJson(String json) {
    return ensureInitialized().decodeJson<PersonC>(json);
  }
}

mixin PersonCMappable {
  String toJson() {
    return PersonCMapper.ensureInitialized()
        .encodeJson<PersonC>(this as PersonC);
  }

  Map<String, dynamic> toMap() {
    return PersonCMapper.ensureInitialized()
        .encodeMap<PersonC>(this as PersonC);
  }

  PersonCCopyWith<PersonC, PersonC, PersonC> get copyWith =>
      _PersonCCopyWithImpl(this as PersonC, $identity, $identity);
  @override
  String toString() {
    return PersonCMapper.ensureInitialized().stringifyValue(this as PersonC);
  }

  @override
  bool operator ==(Object other) {
    return PersonCMapper.ensureInitialized()
        .equalsValue(this as PersonC, other);
  }

  @override
  int get hashCode {
    return PersonCMapper.ensureInitialized().hashValue(this as PersonC);
  }
}

extension PersonCValueCopy<$R, $Out> on ObjectCopyWith<$R, PersonC, $Out> {
  PersonCCopyWith<$R, PersonC, $Out> get $asPersonC =>
      $base.as((v, t, t2) => _PersonCCopyWithImpl(v, t, t2));
}

abstract class PersonCCopyWith<$R, $In extends PersonC, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name});
  PersonCCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PersonCCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PersonC, $Out>
    implements PersonCCopyWith<$R, PersonC, $Out> {
  _PersonCCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PersonC> $mapper =
      PersonCMapper.ensureInitialized();
  @override
  $R call({String? name}) =>
      $apply(FieldCopyWithData({if (name != null) #name: name}));
  @override
  PersonC $make(CopyWithData data) =>
      PersonC(name: data.get(#name, or: $value.name));

  @override
  PersonCCopyWith<$R2, PersonC, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PersonCCopyWithImpl($value, $cast, t);
}
