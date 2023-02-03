// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'basic.dart';

class PersonCMapper extends ClassMapperBase<PersonC> {
  static final PersonCMapper instance = PersonCMapper();
  static final MapperContainer container = MapperContainer()
  ..use(instance);

  @override
  String get id => 'PersonC';

  static String _$name(PersonC v) => v.name;

  @override
  final Map<Symbol, Field<PersonC, dynamic>> fields = const {
    #name: Field<PersonC, String>('name', _$name),
  };

  static PersonC _instantiate(DecodingData data) {
    return PersonC(name: data.get(#name));
  }
  @override
  final Function instantiate = _instantiate;

  static final fromMap = container.fromMap<PersonC>;
  static final fromJson = container.fromJson<PersonC>;
}

mixin PersonCMappable {
  String toJson() => PersonCMapper.container.toJson(this as PersonC);
  Map<String, dynamic> toMap() => PersonCMapper.container.toMap(this as PersonC);
  PersonCCopyWith<PersonC, PersonC, PersonC> get copyWith => _PersonCCopyWithImpl(this as PersonC, $identity, $identity);
  @override String toString() => PersonCMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && PersonCMapper.container.isEqual(this, other));
  @override int get hashCode => PersonCMapper.container.hash(this);
}

extension PersonCValueCopy<$R, $Out extends PersonC> on ObjectCopyWith<$R, PersonC, $Out> {
  PersonCCopyWith<$R, PersonC, $Out> get asPersonC => base.as((v, t, t2) => _PersonCCopyWithImpl(v, t, t2));
}

typedef PersonCCopyWithBound = PersonC;
abstract class PersonCCopyWith<$R, $In extends PersonC, $Out extends PersonC> implements ObjectCopyWith<$R, $In, $Out> {
  PersonCCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends PersonC>(Then<PersonC, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? name});
}

class _PersonCCopyWithImpl<$R, $Out extends PersonC> extends CopyWithBase<$R, PersonC, $Out> implements PersonCCopyWith<$R, PersonC, $Out> {
  _PersonCCopyWithImpl(super.value, super.then, super.then2);
  @override PersonCCopyWith<$R2, PersonC, $Out2> chain<$R2, $Out2 extends PersonC>(Then<PersonC, $Out2> t, Then<$Out2, $R2> t2) => _PersonCCopyWithImpl($value, t, t2);

  @override $R call({String? name}) => $then(PersonC(name: name ?? $value.name));
}
