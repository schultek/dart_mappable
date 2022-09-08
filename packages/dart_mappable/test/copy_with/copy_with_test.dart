import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import 'copy_with_test.mapper.g.dart';

@MappableClass()
class Person with Mappable {
  final String name;
  final Car car;

  Person(this.name, this.car);
}

@MappableClass()
class Car with Mappable {
  final String model;
  final Brand? brand;

  Car(this.brand, this.model);
}

@MappableClass()
class Brand with Mappable {
  final dynamic name;

  Brand(this.name);
}

@MappableClass()
class Dealership with Mappable {
  final List<Car> cars;
  final Map<Brand, Person?> salesRep;

  Dealership(this.cars, this.salesRep);
}

@MappableClass()
class ItemList<T> {
  final List<T> items;

  ItemList(List<T>? items) : items = items ?? [];
}

@MappableClass()
class BrandList extends ItemList<Brand?> {
  BrandList(List<Brand?>? brands) : super(brands);
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

      Person p2 = person.copyWith.car.brand!(name: 'BMW');
      expect(p2.car.brand, isNot(equals(person.car.brand)));
      expect(person.car.brand!.name, equals('Audi'));
      expect(p2.car.brand!.name, equals('BMW'));

      p2 = p2.copyWith.car.brand!(name: null);
      expect(p2.car.brand!.name, equals(null));

      p2 = p2.copyWith.car(brand: null);
      expect(p2.car.brand, equals(null));

      Person p3 =
          person.copyWith.car.apply((c) => Car(c.brand, '${c.model}_xx'));
      expect(p3.car.brand, equals(person.car.brand));
      expect(p3.car.model, equals('A8_xx'));
    });

    test('Should generate copyWith extensions for Lists and Maps', () {
      var audi = Brand('Audi');
      var bmw = Brand('BMW');
      var porsche = Brand('Porsche');
      var cars = [Car(audi, 'A9'), Car(bmw, 'M4')];
      var salesRep = {
        audi: Person('Max', Car(audi, 'A9')),
        bmw: Person('Cathy', Car(bmw, 'M3')),
      };

      var dealership = Dealership([...cars], {...salesRep});

      expect(
        dealership.copyWith.cars.at(0).call(model: 'A8'),
        equals(Dealership([Car(audi, 'A8'), Car(bmw, 'M4')], salesRep)),
      );

      expect(
        dealership.copyWith.cars.add(Car(audi, 'A8')),
        equals(Dealership([...cars, Car(audi, 'A8')], salesRep)),
      );

      expect(
        dealership.copyWith.salesRep.get(audi)!(name: 'Tony'),
        equals(Dealership(cars, {
          ...salesRep,
          audi: Person('Tony', Car(audi, 'A9')),
        })),
      );

      expect(
        dealership.copyWith.salesRep
            .put(porsche, Person('Justus', Car(porsche, '911'))),
        equals(Dealership(cars, {
          ...salesRep,
          porsche: Person('Justus', Car(porsche, '911')),
        })),
      );
    });

    test('Should resolve parameters', () {
      var list = BrandList([Brand('Audi'), Brand('Bmw')]);
      expect(list.items.length, equals(2));
      list = list.copyWith.items.add(Brand('Skoda'));
      expect(list.items.length, equals(3));
      list = list.copyWith(brands: null);
      expect(list.items.length, equals(0));
    });
  });
}
