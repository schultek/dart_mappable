import 'package:dart_mappable/dart_mappable.dart';

@MappableClass()
class Pet {
  final String name;

  Pet(this.name);
}

class Animal {
  final String color;

  Animal(this.color);
}
