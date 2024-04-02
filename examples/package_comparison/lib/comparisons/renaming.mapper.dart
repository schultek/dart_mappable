// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'renaming.dart';

class PersonBMapper extends ClassMapperBase<PersonB> {
  PersonBMapper._();

  static PersonBMapper? _instance;
  static PersonBMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PersonBMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PersonB';

  static String _$firstName(PersonB v) => v.firstName;
  static const Field<PersonB, String> _f$firstName =
      Field('firstName', _$firstName, key: 'first_name');
  static String _$lastName(PersonB v) => v.lastName;
  static const Field<PersonB, String> _f$lastName =
      Field('lastName', _$lastName, key: 'surName');

  @override
  final MappableFields<PersonB> fields = const {
    #firstName: _f$firstName,
    #lastName: _f$lastName,
  };

  static PersonB _instantiate(DecodingData data) {
    return PersonB(
        firstName: data.dec(_f$firstName), lastName: data.dec(_f$lastName));
  }

  @override
  final Function instantiate = _instantiate;

  static PersonB fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PersonB>(map);
  }

  static PersonB fromJson(String json) {
    return ensureInitialized().decodeJson<PersonB>(json);
  }
}

mixin PersonBMappable {
  String toJson() {
    return PersonBMapper.ensureInitialized()
        .encodeJson<PersonB>(this as PersonB);
  }

  Map<String, dynamic> toMap() {
    return PersonBMapper.ensureInitialized()
        .encodeMap<PersonB>(this as PersonB);
  }

  PersonBCopyWith<PersonB, PersonB, PersonB> get copyWith =>
      _PersonBCopyWithImpl(this as PersonB, $identity, $identity);
  @override
  String toString() {
    return PersonBMapper.ensureInitialized().stringifyValue(this as PersonB);
  }

  @override
  bool operator ==(Object other) {
    return PersonBMapper.ensureInitialized()
        .equalsValue(this as PersonB, other);
  }

  @override
  int get hashCode {
    return PersonBMapper.ensureInitialized().hashValue(this as PersonB);
  }
}

extension PersonBValueCopy<$R, $Out> on ObjectCopyWith<$R, PersonB, $Out> {
  PersonBCopyWith<$R, PersonB, $Out> get $asPersonB =>
      $base.as((v, t, t2) => _PersonBCopyWithImpl(v, t, t2));
}

abstract class PersonBCopyWith<$R, $In extends PersonB, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? firstName, String? lastName});
  PersonBCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PersonBCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PersonB, $Out>
    implements PersonBCopyWith<$R, PersonB, $Out> {
  _PersonBCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PersonB> $mapper =
      PersonBMapper.ensureInitialized();
  @override
  $R call({String? firstName, String? lastName}) => $apply(FieldCopyWithData({
        if (firstName != null) #firstName: firstName,
        if (lastName != null) #lastName: lastName
      }));
  @override
  PersonB $make(CopyWithData data) => PersonB(
      firstName: data.get(#firstName, or: $value.firstName),
      lastName: data.get(#lastName, or: $value.lastName));

  @override
  PersonBCopyWith<$R2, PersonB, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PersonBCopyWithImpl($value, $cast, t);
}
