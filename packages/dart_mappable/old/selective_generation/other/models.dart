import 'package:dart_mappable/dart_mappable.dart';

import '../selective_generation_test.mapper.g.dart';

@MappableClass(
  generateMethods: GenerateMethods.equals | GenerateMethods.stringify,
)
class Car with CarMappable {
  final String brand;

  Car(this.brand);
}
