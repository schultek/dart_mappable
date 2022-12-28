
import 'package:dart_mappable/dart_mappable.dart';
part 'person.mapper.dart';

@MappableClass(
)
class Person with PersonMappable {
  String name;

  Person(this.name);
}