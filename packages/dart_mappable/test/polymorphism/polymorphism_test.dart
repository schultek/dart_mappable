import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'polymorphism_test.mapper.dart';

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

@MappableClass(ignoreNull: true)
class Zoo with ZooMappable {
  Animal? animal;
  List<Animal>? animals;
  Map<String, Animal>? animalsMap;

  Zoo(this.animal, this.animals, this.animalsMap);
}

void main() {
  group('Polymorphism', () {
    test('Encode object', () {
      String catJson = Cat('Judy', 'Black').toJson();
      expect(catJson, equals('{"name":"Judy","color":"Black","type":"Cat"}'));

      Animal myPet = AnimalMapper.fromJson(catJson);
      expect(myPet, isA<Cat>());
    });

    test('Decode object', () {
      Animal myPet = AnimalMapper.fromJson('{"name":"Kobi","age": 4,"type":1}');
      expect(myPet, isA<Dog>());
      expect(myPet.toMap(), equals({'age': 4, 'type': 1}));
    });

    test('Decode fallback', () {
      Animal myPet = AnimalMapper.fromJson('{"name":"Kobi","type":null}');
      expect(myPet, isA<NullAnimal>());
    });

    test('Decode unknown', () {
      Animal myPet = AnimalMapper.fromJson('{"name":"Kobi","type":"Bear"}');
      expect(myPet, isA<DefaultAnimal>());
      expect((myPet as DefaultAnimal).type, equals('Bear'));
    });

    test('Encode wrapped', () {
      var zoo = Zoo(Dog(2), null, null);
      expect(
        zoo.toMap(),
        equals({
          'animal': {'age': 2, 'type': 1}
        }),
      );
    });
  });
}
