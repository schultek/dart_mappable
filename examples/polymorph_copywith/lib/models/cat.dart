import 'package:dart_mappable/dart_mappable.dart';

import 'animal.dart';

part 'cat.mapper.dart';

@MappableClass()
class Cat extends Animal with CatMappable {
  String color;
  CatType breed;

  Cat(super.name, this.breed, this.color);
}

@MappableEnum()
enum CatType { black, siamese, tiger }
