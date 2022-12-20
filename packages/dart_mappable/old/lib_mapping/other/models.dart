import 'package:dart_mappable/dart_mappable.dart';

import '../lib_mapping_test.mapper.g.dart';

class Car {
  final String brandName;

  Car(this.brandName);
}

@MappableClass()
class Person with Person1Mappable {
  final String firstName;

  Person(this.firstName);
}