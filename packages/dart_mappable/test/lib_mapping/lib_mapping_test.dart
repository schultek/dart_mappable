@MappableLib(include: [Person], caseStyle: CaseStyle.snakeCase)
library main;

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import 'lib_mapping_test.mapper.g.dart';
@MappableLib(exclude: [Bread, Apple])
import 'other/food.dart';
@MappableLib(include: [Car])
import 'other/models.dart';
@MappableLib(include: [Animal], ignoreAnnotated: true)
import 'other/other.dart';

class Person {
  final String firstName;

  Person(this.firstName);
}

void main() {
  group('Lib mapping', () {
    test('Mappers are generated correctly', () {
      expect(Mapper.get<Person>(), isNotNull);
      expect(Mapper.get<Car>(), isNotNull);
      expect(Mapper.get<Pet>(), isNull);
      expect(Mapper.get<Animal>(), isNotNull);
      expect(Mapper.get<Apple>(), isNotNull);
      expect(Mapper.get<Bread>(), isNull);
      expect(Mapper.get<Cake>(), isNotNull);
    });
  });
}
