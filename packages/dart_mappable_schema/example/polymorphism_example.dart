import 'package:dart_mappable/dart_mappable.dart';

import 'package:json_schema_builder/json_schema.dart';

part 'polymorphism_example.mapper.dart';

@MappableClass(discriminatorKey: 'kind')
sealed class Animal with AnimalMappable {}

@MappableClass(discriminatorValue: 'cat')
final class Cat extends Animal with CatMappable {
  Cat(this.name, this.lives);
  final String name;
  final int lives;
}

@MappableClass(discriminatorValue: 'dog')
final class Dog extends Animal with DogMappable {
  Dog(this.name, this.barkVolume);
  final String name;
  final int barkVolume;
}

void main() {
  AnimalMapper.ensureInitialized();

  final schema = buildJsonSchemaFor<Animal>();
  print(schema.toJson());
}
