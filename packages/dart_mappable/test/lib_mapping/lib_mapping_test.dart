@MappableLib(include: [Person], caseStyle: CaseStyle.snakeCase)
library main;

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import 'lib_mapping_test.mapper.g.dart';
@MappableLib(include: [Car])
import 'other/models.dart';

class Person with Mappable {
  final String firstName;

  Person(this.firstName);
}

void main() {
  group('Lib mapping', () {
    test('Mappers are generated correctly', () {
      expect(Person('Max').toMap(), equals({'first_name': 'Max'}));
      expect(Car('Audi').toMap(), equals({'brand_name': 'Audi'}));
    });
  });
}
