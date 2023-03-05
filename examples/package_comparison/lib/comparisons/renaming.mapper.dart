// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

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

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'PersonB';

  static String _$firstName(PersonB v) => v.firstName;
  static String _$lastName(PersonB v) => v.lastName;

  @override
  final Map<Symbol, Field<PersonB, dynamic>> fields = const {
    #firstName:
        Field<PersonB, String>('firstName', _$firstName, key: 'first_name'),
    #lastName: Field<PersonB, String>('lastName', _$lastName, key: 'surName'),
  };

  static PersonB _instantiate(DecodingObject data) {
    return PersonB(
        firstName: data.get(#firstName), lastName: data.get(#lastName));
  }

  @override
  final Function instantiate = _instantiate;

  static PersonB fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<PersonB>(map));
  }

  static PersonB fromJson(String json) {
    return _guard((c) => c.fromJson<PersonB>(json));
  }
}

mixin PersonBMappable {
  String toJson() {
    return PersonBMapper._guard((c) => c.toJson(this as PersonB));
  }

  Map<String, dynamic> toMap() {
    return PersonBMapper._guard((c) => c.toMap(this as PersonB));
  }

  PersonBCopyWith<PersonB, PersonB, PersonB> get copyWith =>
      _PersonBCopyWithImpl(this as PersonB, $identity, $identity);
  @override
  String toString() {
    return PersonBMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PersonBMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return PersonBMapper._guard((c) => c.hash(this));
  }
}

extension PersonBValueCopy<$R, $Out extends PersonB>
    on ObjectCopyWith<$R, PersonB, $Out> {
  PersonBCopyWith<$R, PersonB, $Out> get $asPersonB =>
      $base.as((v, t, t2) => _PersonBCopyWithImpl(v, t, t2));
}

typedef PersonBCopyWithBound = PersonB;

abstract class PersonBCopyWith<$R, $In extends PersonB, $Out extends PersonB>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? firstName, String? lastName});
  PersonBCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends PersonB>(
      Then<PersonB, $Out2> t, Then<$Out2, $R2> t2);
}

class _PersonBCopyWithImpl<$R, $Out extends PersonB>
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
  PersonBCopyWith<$R2, PersonB, $Out2> $chain<$R2, $Out2 extends PersonB>(
          Then<PersonB, $Out2> t, Then<$Out2, $R2> t2) =>
      _PersonBCopyWithImpl($value, t, t2);
}
