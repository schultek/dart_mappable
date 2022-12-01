
import 'package:dart_mappable/dart_mappable.dart';
part 'person.mapper.dart';

@MappableClass(discriminatorKey: 'type')
class Person with PersonMappable {
  String name;
  Person(this.name);
}