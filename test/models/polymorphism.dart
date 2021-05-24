import 'package:dart_mappable/annotations.dart';

import '../test.mapper.g.dart';

@MappableClass(discriminatorKey: 'type')
abstract class Animal with Mappable {
  static const int Dog = 142;

  String name;
  Animal(this.name);
}

class Cat extends Animal {
  String color;
  Cat(String name, this.color) : super(name);
}

@MappableClass(discriminatorValue: Animal.Dog)
class Dog extends Animal {
  int age;
  Dog(String name, this.age) : super(name);
}

@MappableClass(discriminatorValue: null)
class NullAnimal extends Animal {
  NullAnimal(String name) : super(name);
}

@MappableClass(discriminatorValue: MappableClass.useAsDefault)
class DefaultAnimal extends Animal {
  String type;

  DefaultAnimal(String name, this.type) : super(name);
}
