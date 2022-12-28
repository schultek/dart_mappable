import 'package:dart_mappable/dart_mappable.dart';

import 'animal.dart';

part 'cat.mapper.dart';

@MappableClass()
class Cat extends Animal with CatMappable {
  String color;
  CatType breed;

  Cat(String name, this.breed, this.color) : super(name);
}

@MappableEnum()
enum CatType {
  black, siamese, tiger
}
