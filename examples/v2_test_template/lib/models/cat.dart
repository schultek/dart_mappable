import 'package:dart_mappable/dart_mappable.dart';

import 'animal.dart';

part 'cat.mapper.dart';

@MappableClass()
class Cat extends Animal with CatMappable {
  String color;
  Cat(String name, this.color) : super(name);
}