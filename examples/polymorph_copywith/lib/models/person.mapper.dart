// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'person.dart';

class PersonMapper extends MapperBase<Person> {
  static MapperContainer container = MapperContainer(
    mappers: {PersonMapper()},
  );

  @override
  PersonMapperElement createElement(MapperContainer container) {
    return PersonMapperElement._(this, container);
  }

  static final fromMap = container.fromMap<Person>;
  static final fromJson = container.fromJson<Person>;
}

class PersonMapperElement extends MapperElementBase<Person> {
  PersonMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Person decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Person fromMap(Map<String, dynamic> map) =>
      Person(container.$get(map, 'name'));

  @override
  Function get encoder => encode;
  dynamic encode(Person v) => toMap(v);
  Map<String, dynamic> toMap(Person p) =>
      {'name': container.$enc(p.name, 'name')};

  @override
  String stringify(Person self) =>
      'Person(name: ${container.asString(self.name)})';
  @override
  int hash(Person self) => container.hash(self.name);
  @override
  bool equals(Person self, Person other) =>
      container.isEqual(self.name, other.name);
}

mixin PersonMappable {
  String toJson() => PersonMapper.container.toJson(this as Person);
  Map<String, dynamic> toMap() => PersonMapper.container.toMap(this as Person);
  PersonCopyWith<Person, Person, Person> get copyWith =>
      _PersonCopyWithImpl(this as Person, $identity, $identity);
  @override
  String toString() => PersonMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          PersonMapper.container.isEqual(this, other));
  @override
  int get hashCode => PersonMapper.container.hash(this);
}

extension PersonValueCopy<$R, $Out extends Person>
    on ObjectCopyWith<$R, Person, $Out> {
  PersonCopyWith<$R, Person, $Out> get asPerson =>
      base.as((v, t, t2) => _PersonCopyWithImpl(v, t, t2));
}

typedef PersonCopyWithBound = Person;

abstract class PersonCopyWith<$R, $In extends Person, $Out extends Person>
    implements ObjectCopyWith<$R, $In, $Out> {
  PersonCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Person>(
      Then<Person, $Out2> t, Then<$Out2, $R2> t2);
  $R call({String? name});
}

class _PersonCopyWithImpl<$R, $Out extends Person>
    extends CopyWithBase<$R, Person, $Out>
    implements PersonCopyWith<$R, Person, $Out> {
  _PersonCopyWithImpl(super.value, super.then, super.then2);
  @override
  PersonCopyWith<$R2, Person, $Out2> chain<$R2, $Out2 extends Person>(
          Then<Person, $Out2> t, Then<$Out2, $R2> t2) =>
      _PersonCopyWithImpl($value, t, t2);

  @override
  $R call({String? name}) => $then(Person(name ?? $value.name));
}
