import 'package:test/test.dart';

import 'models/inheritance.dart';
import 'models/model.dart';
import 'models/polymorphism.dart';
import 'test.mapper.g.dart';

void main() {
  group('basic decoding / encoding', () {
    late Person person;

    setUp(() {
      person = Person('Max', car: const Car(1000, Brand.Audi));
    });

    test('Decode from json', () {
      String personJson =
          '{"name": "Max", "car": {"driven_km": 1000, "brand": "audi"}}';
      Person person1 = Mapper.fromJson(personJson);
      expect(person1, equals(person));
    });

    test('Decode from map', () {
      var map = {
        'name': 'Max',
        'age': 18,
        'car': {'driven_km': 1000, 'brand': 'audi'}
      };

      Person person1 = Person.fromMap(map);
      expect(person1, equals(person));
    });

    test('Encode to map', () {
      Map<String, dynamic> map = person.toMap();
      expect(
          map,
          equals({
            'name': 'Max',
            'age': 18,
            'car': {'driven_km': 1000, 'brand': 'audi'}
          }));
    });

    test('Encode to json', () {
      expect(
          person.toJson(),
          equals(
              '{"name":"Max","age":18,"car":{"driven_km":1000,"brand":"audi"}}'));
    });

    test('Enum default', () {
      Car car = Mapper.fromJson('{"driven_km": 1000, "brand": "some"}');
      expect(car.brand, equals(Brand.Audi));
    });
  });

  group('Mapper functions', () {
    test('Test copyWith', () {
      var person1 = Person('Max', age: 19, car: const Car(100, Brand.Audi));
      var person2 = person1.copyWith(name: 'Anna', age: 20);
      expect(person2.name, equals('Anna'));
      expect(person2.age, equals(20));
      expect(person2.car, equals(person1.car));
    });

    test('Mapper functions', () {
      var person1 = Person('Max', car: const Car(1000, Brand.Audi));
      var person2 = Person('Max', car: const Car(1000, Brand.Audi));

      // optionally use Mapper functions
      expect(Mapper.isEqual(person1, person2), equals(true));
      expect(
          Mapper.asString(person1),
          equals(
              'Person(name: Max, age: 18, car: Car(miles: 620.0, brand: Brand.Audi))'));
    });
  });

  group('Generics', () {
    test('Generic objects', () {
      Box<Confetti> box = Box(10, content: Confetti('Rainbow'));
      String boxJson = box.toJson();
      expect(
          boxJson,
          equals(
              '{"size":10,"content":{"color":"Rainbow"},"__type":"Box<Confetti>"}'));

      dynamic whatAmI = Mapper.fromJson(boxJson);
      expect(whatAmI.runtimeType, equals(type<Box<Confetti>>()));
    });
  });

  group('Iterables', () {
    test('Decode list', () {
      List<int> numbers = Mapper.fromJson('[2, 4, 105]');
      expect(numbers, equals([2, 4, 105]));
    });
  });

  group('Polymorphism', () {
    test('Encode object', () {
      String catJson = Mapper.toJson(Cat('Judy', 'Black'));
      expect(catJson, equals('{"name":"Judy","color":"Black","type":"Cat"}'));

      Animal myPet = Mapper.fromJson(catJson);
      expect(myPet.runtimeType, equals(type<Cat>()));
    });

    test('Decode object', () {
      Animal myPet = Mapper.fromJson('{"name":"Kobi","age": 4,"type":142}');
      expect(myPet.runtimeType, equals(type<Dog>()));
    });

    test('Decode fallback', () {
      Animal myPet = Mapper.fromJson('{"name":"Kobi","type":null}');
      expect(myPet.runtimeType, equals(type<NullAnimal>()));
    });

    test('Decode unknown', () {
      Animal myPet = Mapper.fromJson('{"name":"Kobi","type":"Bear"}');
      expect(myPet.runtimeType, equals(type<DefaultAnimal>()));
      expect((myPet as DefaultAnimal).type, equals('Bear'));
    });
  });

  group('Hooks', () {
    test('Before Decode Hook', () {
      Game game = Mapper.fromJson('{"player": {"id": "Tom"}}');
      expect(game.player.id, equals('Tom'));

      Game game2 = Mapper.fromJson('{"player": "John"}');
      expect(game2.player.id, equals('John'));
    });

    test('After Encode Hook', () {
      Game game = Game(Player('Tom'));
      expect(game.toJson(), equals('{"player":"Tom"}'));
    });
  });

  group('Inheritance', () {
    test('Decode Inherited', () {
      Jeans jeans = Mapper.fromJson('{"age": 2, "howbig": 1, "color": "blue"}');
      expect(jeans.size, equals(1));

      var json = jeans.toJson();
      expect(
          json, equals('{"age":2,"color":"blue","howbig":1,"label":"Jeans"}'));
    });
  });

  group('Class Hooks', () {
    test('Unmapped Properties', () {
      TShirt tshirt = Mapper.fromJson(
          '{"neck": "V", "howbig": 1, "color": "green", "tag": "wool", "quality": "good"}');
      expect(tshirt.unmappedProps, equals({'tag': 'wool', 'quality': 'good'}));
    });
  });
}

Type type<T>() => T;
