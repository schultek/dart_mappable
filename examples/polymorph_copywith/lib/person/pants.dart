import 'package:dart_mappable/dart_mappable.dart';

part 'pants.mapper.dart';

@MappableClass()
class Pants with PantsMappable {
  final String material;

  const Pants({required this.material});
}
