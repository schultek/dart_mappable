// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'renaming.dart';

class PersonBMapper extends ClassMapperBase<PersonB> {
  static final PersonBMapper instance = PersonBMapper();
  static final MapperContainer container = MapperContainer()
  ..use(instance);

  @override
  String get id => 'PersonB';

  static String _$firstName(PersonB v) => v.firstName;
  static String _$lastName(PersonB v) => v.lastName;

  @override
  final Map<Symbol, Field<PersonB, dynamic>> fields = const {
    #firstName: Field<PersonB, String>('firstName', _$firstName, key: 'first_name'),
    #lastName: Field<PersonB, String>('lastName', _$lastName, key: 'surName'),
  };

  static PersonB _instantiate(DecodingData data) {
    return PersonB(firstName: data.get(#firstName), lastName: data.get(#lastName));
  }
  @override
  final Function instantiate = _instantiate;

  static final fromMap = container.fromMap<PersonB>;
  static final fromJson = container.fromJson<PersonB>;
}

mixin PersonBMappable {
  String toJson() => PersonBMapper.container.toJson(this as PersonB);
  Map<String, dynamic> toMap() => PersonBMapper.container.toMap(this as PersonB);
  PersonBCopyWith<PersonB, PersonB, PersonB> get copyWith => _PersonBCopyWithImpl(this as PersonB, $identity, $identity);
  @override String toString() => PersonBMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && PersonBMapper.container.isEqual(this, other));
  @override int get hashCode => PersonBMapper.container.hash(this);
}

extension PersonBValueCopy<$R, $Out extends PersonB> on ObjectCopyWith<$R, PersonB, $Out> {
  PersonBCopyWith<$R, PersonB, $Out> get asPersonB => base.as((v, t, t2) => _PersonBCopyWithImpl(v, t, t2));
}

typedef PersonBCopyWithBound = PersonB;
abstract class PersonBCopyWith<$R, $In extends PersonB, $Out extends PersonB> implements ObjectCopyWith<$R, $In, $Out> {
  PersonBCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends PersonB>(Then<PersonB, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? firstName, String? lastName});
}

class _PersonBCopyWithImpl<$R, $Out extends PersonB> extends CopyWithBase<$R, PersonB, $Out> implements PersonBCopyWith<$R, PersonB, $Out> {
  _PersonBCopyWithImpl(super.value, super.then, super.then2);
  @override PersonBCopyWith<$R2, PersonB, $Out2> chain<$R2, $Out2 extends PersonB>(Then<PersonB, $Out2> t, Then<$Out2, $R2> t2) => _PersonBCopyWithImpl($value, t, t2);

  @override $R call({String? firstName, String? lastName}) => $then(PersonB(firstName: firstName ?? $value.firstName, lastName: lastName ?? $value.lastName));
}
