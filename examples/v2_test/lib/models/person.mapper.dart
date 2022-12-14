// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'package:v2_test/models/person.dart';

// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class PersonMapper with MapperBase<Person> {
  static MapperContainer container = MapperContainer(
    mappers: {
      PersonMapper(),
      SkillMapper(),
    },
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

  @override Function get decoder => decode;
  Person decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Person fromMap(Map<String, dynamic> map) => Person(container.$get(map, 'name'), container.$get(map, 'skill'));

  @override Function get encoder => encode;
  dynamic encode(Person v) => toMap(v);
  Map<String, dynamic> toMap(Person p) => {'name': container.$enc(p.name, 'name'), 'skill': container.$enc(p.skill, 'skill')};

  @override String stringify(Person self) => 'Person(name: ${container.asString(self.name)}, skill: ${container.asString(self.skill)})';
  @override int hash(Person self) => container.hash(self.name) ^ container.hash(self.skill);
  @override bool equals(Person self, Person other) => container.isEqual(self.name, other.name) && container.isEqual(self.skill, other.skill);
}

mixin PersonMappable {
  String toJson() => PersonMapper.container.toJson(this as Person);
  Map<String, dynamic> toMap() => PersonMapper.container.toMap(this as Person);
  PersonCopyWith<Person> get copyWith => _PersonCopyWithImpl(this as Person, $identity, $identity);
  @override String toString() => PersonMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && PersonMapper.container.isEqual(this, other));
  @override int get hashCode => PersonMapper.container.hash(this);
}

extension PersonObjectCopy<$R> on ObjectCopyWith<$R, Person, Person> {
  PersonCopyWith<$R> get asPerson => base.as((v, t, t2) => _PersonCopyWithImpl(v, t, t2));
}

abstract class PersonCopyWith<$R> implements ObjectCopyWith<$R, Person, Person> {
  PersonCopyWith<$R2> _chain<$R2>(Then<Person, Person> t, Then<Person, $R2> t2);
  $R call({String? name, Skill? skill});
}

class _PersonCopyWithImpl<$R> extends BaseCopyWith<$R, Person, Person> implements PersonCopyWith<$R> {
  _PersonCopyWithImpl(super.value, super.then, super.then2);
  @override PersonCopyWith<$R2> _chain<$R2>(Then<Person, Person> t, Then<Person, $R2> t2) => _PersonCopyWithImpl($value, t, t2);

  @override $R call({String? name, Skill? skill}) => $then(Person(name ?? $value.name, skill ?? $value.skill));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===


