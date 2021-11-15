import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import 'basic_json_test.mapper.g.dart';

@MappableClass()
class Person with Mappable {
  final String name;
  final int age;
  final Car? car;

  Person(this.name, {this.age = 18, this.car});
}

@MappableEnum(defaultValue: Brand.Audi)
// ignore: constant_identifier_names
enum Brand { Toyota, Audi, BMW }

@MappableClass()
class Car with Mappable {
  final double miles;
  final Brand brand;

  const Car(int drivenKm, this.brand) : miles = drivenKm * 0.62;

  int get drivenKm => (miles / 0.62).round();
}

void main() {
  group('Basic json decoding / encoding', () {
    late Person person;

    setUp(() {
      person = Person('Max', car: const Car(1000, Brand.Audi));
    });

    test('Should decode from json', () {
      expect(
        Mapper.fromJson<Person>('{"name": "Max", "car": '
            '{"driven_km": 1000, "brand": "audi"}}'),
        equals(person),
      );
    });

    test('Should decode from map', () {
      expect(
        Mapper.fromMap<Person>({
          'name': 'Max',
          'age': 18,
          'car': {'driven_km': 1000, 'brand': 'audi'}
        }),
        equals(person),
      );
    });

    test('Should encode to map', () {
      expect(
        person.toMap(),
        equals({
          'name': 'Max',
          'age': 18,
          'car': {'driven_km': 1000, 'brand': 'audi'}
        }),
      );
    });

    test('Should encode to json', () {
      expect(
        person.toJson(),
        equals('{"name":"Max","age":18,"car":'
            '{"driven_km":1000,"brand":"audi"}}'),
      );
    });

    test('Should use default enum value', () {
      Car car = Mapper.fromJson('{"driven_km": 1000, "brand": "some"}');
      expect(car.brand, equals(Brand.Audi));
    });
  });
}
