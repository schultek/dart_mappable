import 'package:dart_mappable/dart_mappable.dart';

import 'clothes.dart';

part 'person.mapper.dart';

@MappableClass()
class Person with PersonMappable {
  final String name;
  final List<Clothes>? clothes; //s

  const Person({required this.name, this.clothes});
}
