import 'package:dart_mappable/dart_mappable.dart';

import 'cat.dart' as c;
import 'person.dart' as p;

part 'animal.mapper.dart';

@MappableClass(discriminatorKey: 'type', includeSubClasses: [c.Cat])
abstract class Animal with AnimalMappable {
  String name;
  Animal(this.name);

  static final fromMap = AnimalMapper.fromMap;
  static final fromJson = AnimalMapper.fromJson;
}

@MappableClass(discriminatorValue: 1)
class Dog extends Animal with DogMappable {
  int age;

  p.Person owner;

  Dog(this.age, this.owner) : super('Good Boy');
}
