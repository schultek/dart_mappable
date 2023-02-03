// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'person.dart';

class PersonMapper extends ClassMapperBase<Person> {
  static final PersonMapper instance = PersonMapper();
  static final MapperContainer container = MapperContainer()
  ..use(instance);

  @override
  String get id => 'Person';

  static String _$name(Person v) => v.name;

  @override
  final Map<Symbol, Field<Person, dynamic>> fields = const {
    #name: Field<Person, String>('name', _$name),
  };

  static Person _instantiate(DecodingData data) {
    return Person(data.get(#name));
  }
  @override
  final Function instantiate = _instantiate;

  static final fromMap = container.fromMap<Person>;
  static final fromJson = container.fromJson<Person>;
}

mixin PersonMappable {
  String toJson() => PersonMapper.container.toJson(this as Person);
  Map<String, dynamic> toMap() => PersonMapper.container.toMap(this as Person);
  PersonCopyWith<Person, Person, Person> get copyWith => _PersonCopyWithImpl(this as Person, $identity, $identity);
  @override String toString() => PersonMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && PersonMapper.container.isEqual(this, other));
  @override int get hashCode => PersonMapper.container.hash(this);
}

extension PersonValueCopy<$R, $Out extends Person> on ObjectCopyWith<$R, Person, $Out> {
  PersonCopyWith<$R, Person, $Out> get asPerson => base.as((v, t, t2) => _PersonCopyWithImpl(v, t, t2));
}

typedef PersonCopyWithBound = Person;
abstract class PersonCopyWith<$R, $In extends Person, $Out extends Person> implements ObjectCopyWith<$R, $In, $Out> {
  PersonCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Person>(Then<Person, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? name});
}

class _PersonCopyWithImpl<$R, $Out extends Person> extends CopyWithBase<$R, Person, $Out> implements PersonCopyWith<$R, Person, $Out> {
  _PersonCopyWithImpl(super.value, super.then, super.then2);
  @override PersonCopyWith<$R2, Person, $Out2> chain<$R2, $Out2 extends Person>(Then<Person, $Out2> t, Then<$Out2, $R2> t2) => _PersonCopyWithImpl($value, t, t2);

  @override $R call({String? name}) => $then(Person(name ?? $value.name));
}
