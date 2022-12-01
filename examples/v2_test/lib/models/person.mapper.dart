part of 'person.dart';

class PersonMapper with MapperBase<Person> {
  static MapperContainer container = MapperContainer(
    mappers: {PersonMapper()},
  );

  @override
  PersonMapperElement createElement(MapperContainer container) {
    return PersonMapperElement._(this, container);
  }
}

class PersonMapperElement extends MapperElementBase<Person> {
  PersonMapperElement._(super.mapper, super.container);

  @override Function get decoder => decode;
  Person decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  Person fromMap(Map<String, dynamic> map) => Person(container.$dec(map['name'], 'name'));

  @override Function get encoder => encode;
  dynamic encode(Person v) => toMap(v);
  Map<String, dynamic> toMap(Person a) => {'name': container.$enc(a.name, 'name')};

  @override String stringify(Person self) => 'Person(name: ${container.asString(self.name)})';
  @override int hash(Person self) => container.hash(self.name);
  @override bool equals(Person self, Person other) => container.isEqual(self.name, other.name);
}

mixin PersonMappable implements MappableMixin {
  String toJson() => PersonMapper.container.toJson(this as Person);
  Map<String, dynamic> toMap() => PersonMapper.container.toMap(this as Person);
  @override String toString() => PersonMapper.container.asString(this);
  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && PersonMapper.container.isEqual(this, other));
  @override int get hashCode => PersonMapper.container.hash(this);
}