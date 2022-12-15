import 'package:dart_mappable/dart_mappable.dart';

import 'animal.dart';

part 'zoo.mapper.dart';

@MappableClass()
class Zoo<T extends Animal> with ZooMappable<T> {
  Dog animals;

  Zoo(this.animals);

  static final fromMap = ZooMapper.fromMap;
  static final fromJson = ZooMapper.fromJson;
}