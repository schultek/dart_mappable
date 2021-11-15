import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import 'copy_with_test.mapper.g.dart';

@MappableClass(generateMethods: GenerateMethods.copy)
class Person with Mappable {
  final String name;
  final Car car;

  Person(this.name, this.car);
}

@MappableClass(generateMethods: GenerateMethods.copy)
class Car with Mappable {
  final String model;
  final Brand brand;

  Car(this.brand, this.model);
}

@MappableClass(generateMethods: GenerateMethods.copy)
class Brand with Mappable {
  final String name;

  Brand(this.name);
}

void main() {
  group('Copy with extensions', () {
    test('Should generate copyWith extensions', () {
      var person = Person('Max', Car(Brand('Audi'), 'A8'));

      expect(person.copyWith(name: 'Tom').name, equals('Tom'));

      Person p1 = person.copyWith.car(model: 'A1');
      expect(p1.car, isNot(equals(person.car)));
      expect(person.car.model, equals('A8'));
      expect(p1.car.model, equals('A1'));

      Person p2 = person.copyWith.car.brand(name: 'BMW');
      expect(p2.car.brand, isNot(equals(person.car.brand)));
      expect(person.car.brand.name, equals('Audi'));
      expect(p2.car.brand.name, equals('BMW'));
    });
  });
}
