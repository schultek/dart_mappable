import 'package:dart_mappable/dart_mappable.dart';

@MappableLib(include: [c.Cat, c.Dog2])
import 'package:v2_test/models/cat.dart' as c;

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
  Dog(this.age) : super('Good Boy');
}
