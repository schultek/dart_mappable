import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import '../utils.dart';
import 'other/models.dart';
import 'selective_generation_test.mapper.g.dart';

@MappableClass(
  generateMethods: GenerateMethods.encode | GenerateMethods.copy,
)
class Person with Mappable {
  final String name;

  Person(this.name);
}

void main() {
  group('Selective generation', () {
    test('Should only generate encode and copy methods', () {
      var person = Person('Tom');

      // should work
      expect(person.toMap(), equals({'name': 'Tom'}));
      expect(person.toJson(), equals('{"name":"Tom"}'));
      expect(person.copyWith(name: 'Max').name, equals('Max'));

      // should not work
      expect(
        () => Mapper.fromJson<Person>('{}'),
        throwsMapperException(MapperException.chain(
          MapperMethod.decode,
          '(Person)',
          MapperException.unsupportedMethod(MapperMethod.decode, Person),
        )),
      );
      expect(person, isNot(equals(Person('Tom'))));
      expect(person.toString(), equals("Instance of 'Person'"));
    });

    test('Should only generate equals and stringify', () {
      var car = Car('Audi');

      // should work
      expect(car, equals(Car('Audi')));
      expect(Mapper.isEqual(car, Car('Audi')), equals(true));
      expect(car.toString(), equals('Car(brand: Audi)'));
      expect(Mapper.asString(car), equals('Car(brand: Audi)'));

      // should not work
      expect(
        () => Mapper.fromJson<Car>('{}'),
        throwsMapperException(MapperException.chain(
          MapperMethod.decode,
          '(Car)',
          MapperException.unsupportedMethod(MapperMethod.decode, Car),
        )),
      );

      expect(
        () => car.toMap(),
        throwsMapperException(MapperException.chain(
          MapperMethod.encode,
          '(Car)',
          MapperException.unsupportedMethod(MapperMethod.encode, Car),
        )),
      );

      expect(() => (car as dynamic).copyWith, throwsNoSuchMethodError);
    });
  });
}
