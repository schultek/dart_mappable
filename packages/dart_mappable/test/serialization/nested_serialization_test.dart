import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import '../utils.dart';

part 'nested_serialization_test.mapper.dart';

@MappableClass()
class Person with PersonMappable {
  final String name;
  final int age;
  final Car? car;

  Person(this.name, {this.age = 18, this.car});
}

@MappableEnum(defaultValue: Brand.Audi)
// ignore: constant_identifier_names
enum Brand { Toyota, Audi, BMW }

@MappableClass()
class Car with CarMappable {
  final double miles;
  final Brand brand;

  const Car(int drivenKm, this.brand) : miles = drivenKm * 0.62;

  int get drivenKm => (miles / 0.62).round();
}

void main() {
  group('nested serialization', () {
    test('from map succeeds', () {
      expect(
        PersonMapper.fromMap({
          'name': 'Max',
          'age': 18,
          'car': {'drivenKm': 1000, 'brand': 'audi'},
        }),
        equals(Person('Max', car: const Car(1000, Brand.Audi))),
      );
      expect(
        PersonMapper.fromMap({'name': 'Eva', 'age': 21}),
        equals(Person('Eva', age: 21)),
      );
    });

    test('from map throws', () {
      expect(
        () => PersonMapper.fromMap({'name': 'Andi', 'car': 'None'}),
        throwsMapperException(
          MapperException.chain(
            MapperMethod.decode,
            '(Person).car(Car?)',
            MapperException.unexpectedType(String, 'Map<String, dynamic>'),
          ),
        ),
      );
    });

    test('to map succeeds', () {
      expect(
        Person('Max', car: const Car(1000, Brand.Audi)).toMap(),
        equals({
          'name': 'Max',
          'age': 18,
          'car': {'drivenKm': 1000, 'brand': 'Audi'},
        }),
      );

      expect(
        Person('Eva', age: 21).toMap(),
        equals({'name': 'Eva', 'age': 21, 'car': null}),
      );
    });
  });
}
