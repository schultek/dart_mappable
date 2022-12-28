@MappableLib(caseStyle: CaseStyle.snakeCase)
library lib;

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import 'other/food.dart' as f;
import 'other/models.dart' as m;
import 'other/other.dart' as o;

part 'lib_mapping_test.mapper.dart';

@MappableClass()
class Cake = f.Cake with CakeMappable;

@MappableClass()
class Person2 = m.Person with Person2Mappable;

@MappableClass(discriminatorKey: 'type')
abstract class Animal = o.Animal with AnimalMappable;

@MappableClass()
class Pet = o.Pet with PetMappable implements Animal;

@MappableClass()
class Person with PersonMappable {
  final String firstName;

  Person(this.firstName);
}

void main() {
  group('Lib mapping', () {
    test('Mappers are generated correctly', () {
      expect(Person('Tom').toMap(), equals({'first_name': 'Tom'}));
      expect(Cake('Lemon').toMap(), equals({'type': 'Lemon'}));
      expect(Person('Anna').toMap(), equals({'first_name': 'Anna'}));
      expect(
        Pet(Person2('Clara'), 'Buddy').toMap(),
        equals({
          'owner': {'first_name': 'Clara'},
          'color': 'Buddy',
          'type': 'Pet',
        }),
      );

      expect(
        AnimalMapper.fromMap({
          'type': 'Pet',
          'owner': {'first_name': 'Clara'},
          'color': 'Buddy',
        }),
        equals(Pet(Person2('Clara'), 'Buddy')),
      );
    });
  });
}
