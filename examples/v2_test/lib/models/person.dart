
import 'package:dart_mappable/dart_mappable.dart';
part 'person.mapper.dart';

@MappableClass(
  includeCustomMappers: [SkillMapper]
)
class Person with PersonMappable {
  String name;
  Skill skill;

  Person(this.name, this.skill);
}

class Skill {}

class SkillMapper with MapperBase<Skill> {
  @override
  MapperElementBase<Skill> createElement(MapperContainer container) {
    return SkillMapperElement(this, container);
  }
}

class SkillMapperElement extends SimpleMapperElement<Skill> {
  SkillMapperElement(super.mapper, super.container);

  @override
  Skill decode(value) {
    return Skill();
  }

  @override
  encode(Skill self) {
    return 'skill';
  }
}