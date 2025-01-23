import 'package:dart_mappable/dart_mappable.dart';

import 'animal.dart';
import 'person.dart';

part 'dog.mapper.dart';

@MappableClass(discriminatorValue: 1)
class Dog extends Animal with DogMappable {
  int age;

  Person owner;

  Dog(super.name, this.age, this.owner);
}
