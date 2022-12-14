import 'package:dart_mappable/dart_mappable.dart';

import 'animal.dart';

part 'cat.mapper.dart';

@MappableClass()
class Cat extends Animal with CatMappable {
  String color;
  CatType type;

  Cat(String name, this.type, this.color) : super(name);
}

@MappableEnum()
enum CatType {
  black, siamese, tiger
}
