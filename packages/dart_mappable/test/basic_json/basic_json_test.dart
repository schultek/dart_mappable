import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import '../utils.dart';
import 'basic_json_test.mapper.g.dart';

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

    test('Should stringify person', () {
      person = person.copyWith(car: null);
      expect(
          person.toString(), equals('Person(name: Max, age: 18, car: null)'));
    });

    test('Should use default enum value', () {
      Car car = Mapper.fromJson('{"driven_km": 1000, "brand": "some"}');
      expect(car.brand, equals(Brand.Audi));
    });

    test('Should throw mapper exception', () {
      Mapper.unuse<Brand>();

      expect(
        () => Mapper.fromJson<Person>('{"name": "Max", "car": '
            '{"driven_km": 1000, "brand": "audi"}}'),
        throwsMapperException(MapperException.chain(
          MapperMethod.decode,
          '(Person).car(Car).brand(Brand)',
          MapperException.unknownType(Brand),
        )),
      );

      expect(
        () => Mapper.fromJson<Map<String, Car>>('{"emma": '
            '{"driven_km": 1000, "brand": "audi"}}'),
        throwsMapperException(MapperException.chain(
          MapperMethod.decode,
          '(Map<String, Car>).value(Car).brand(Brand)',
          MapperException.unknownType(Brand),
        )),
      );

      expect(
        () => Mapper.toValue(person),
        throwsMapperException(MapperException.chain(
          MapperMethod.encode,
          '(Person).car(Car).brand[Brand.Audi]',
          MapperException.unknownType(Brand),
        )),
      );

      expect(
        () => Mapper.fromJson<Person>('{}'),
        throwsMapperException(MapperException.chain(
          MapperMethod.decode,
          '(Person).name',
          MapperException.missingParameter('name'),
        )),
      );
    });
  });
}
