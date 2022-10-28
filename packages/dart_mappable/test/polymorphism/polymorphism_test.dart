import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import 'polymorphism_test.mapper.g.dart';

@MappableClass(discriminatorKey: 'type')
abstract class Animal with AnimalMappable {
  String name;
  Animal(this.name);
}

@MappableClass()
class Cat extends Animal with CatMappable {
  String color;
  Cat(String name, this.color) : super(name);
}

@MappableClass(discriminatorValue: 1)
class Dog extends Animal with DogMappable {
  int age;
  Dog(this.age) : super('Good Boy');
}

@MappableClass(discriminatorValue: null)
class NullAnimal extends Animal with NullAnimalMappable {
  NullAnimal(String name) : super(name);
}

@MappableClass(discriminatorValue: MappableClass.useAsDefault)
class DefaultAnimal extends Animal with DefaultAnimalMappable {
  String type;

  DefaultAnimal(String name, this.type) : super(name);
}

@MappableClass()
class Zoo with ZooMappable {
  Animal animal;
  List<Animal> animals;
  Map<String, Animal> animals2;

  Zoo(this.animal, this.animals, this.animals2);
}

void main() {
  group('Polymorphism', () {
    test('Encode object', () {
      String catJson = Mapper.toJson(Cat('Judy', 'Black'));
      expect(catJson, equals('{"name":"Judy","color":"Black","type":"Cat"}'));

      Animal myPet = Mapper.fromJson(catJson);
      expect(myPet, isA<Cat>());
    });

    test('Decode object', () {
      Animal myPet = Mapper.fromJson('{"name":"Kobi","age": 4,"type":1}');
      expect(myPet, isA<Dog>());
      expect(myPet.toMap(), equals({'age': 4, 'type': 1}));
    });

    test('Decode fallback', () {
      Animal myPet = Mapper.fromJson('{"name":"Kobi","type":null}');
      expect(myPet, isA<NullAnimal>());
    });

    test('Decode unknown', () {
      Animal myPet = Mapper.fromJson('{"name":"Kobi","type":"Bear"}');
      expect(myPet, isA<DefaultAnimal>());
      expect((myPet as DefaultAnimal).type, equals('Bear'));
    });
  });
}
