import 'package:dart_mappable/dart_mappable.dart';

import '../lib_mapping_test.mapper.g.dart';

class Car with Mappable {
  final String brandName;

  Car(this.brandName);
}

@MappableClass()
class Person with Mappable {
  final String firstName;

  Person(this.firstName);
}