import 'package:dart_mappable/dart_mappable.dart';

import 'animal.dart';

part 'cat.mapper.dart';

typedef Dog2 = Dog;
typedef Dog4<T> = Map<T, Dog?>;

@MappableClass()
class Cat extends Animal with CatMappable {
  String color;
  Cat(String name, this.color) : super(name);
}