import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import '../utils.dart';

part 'multi_poly_test.mapper.dart';

@MappableClass(discriminatorKey: 'type', ignoreNull: true)
abstract class Animal with AnimalMappable {
  String? name;
  Animal(this.name);
}

@MappableClass(discriminatorKey: 'breed')
abstract class Cat extends Animal with CatMappable {
  Cat(super.name);
}

@MappableClass()
class Siamese extends Cat with SiameseMappable {
  Siamese(super.name);
}

@MappableClass()
class Dog extends Animal with DogMappable {
  Dog(super.name);
}

@MappableClass()
class Shepherd extends Dog with ShepherdMappable {
  Shepherd(super.name);
}

@MappableClass()
class Human with HumanMappable {
  const Human(this.cat);

  final Cat cat;
}

void main() {
  group('Multi Polymorphism', () {
    test('Decode Level 1', () {
      var b = AnimalMapper.fromMap({'type': 'Dog'});
      expect(b, isA<Dog>());
    });

    test('Fail abstract Level 1', () {
      expect(
          () => AnimalMapper.fromMap({'type': 'Cat'}),
          throwsMapperException(MapperException.chain(
              MapperMethod.decode,
              '(Animal)',
              MapperException.missingSubclass('Cat', 'breed', 'null'))));
    });

    test('Decode Level 2 Inherit Key', () {
      var a = AnimalMapper.fromMap({'type': 'Shepherd'});
      expect(a, isA<Shepherd>());
    });

    test('Decode Level 2 Diff Key', () {
      var a = AnimalMapper.fromMap({'type': 'Cat', 'breed': 'Siamese'});
      expect(a, isA<Siamese>());
    });

    test('Encode Level 1', () {
      AnimalMapper.ensureInitialized();
      var b = MapperContainer.globals.toMap<Animal>(Dog(null));
      expect(b, equals({'type': 'Dog'}));
    });

    test('Encode Level 2 Inherit Key', () {
      AnimalMapper.ensureInitialized();
      var a = MapperContainer.globals.toMap<Animal>(Shepherd(null));
      expect(a, equals({'type': 'Shepherd'}));
    });

    test('Encode Level 2 Diff Key', () {
      AnimalMapper.ensureInitialized();
      var a = MapperContainer.globals.toMap<Animal>(Siamese(null));
      expect(a, equals({'type': 'Cat', 'breed': 'Siamese'}));
    });

    test('Encode dynamic', () {
      AnimalMapper.ensureInitialized();
      var a = MapperContainer.globals.toMap<dynamic>(Dog(null));
      expect(a, equals({'type': 'Dog', '__type': 'Dog'}));
    });

    test('Fail decode', () {
      expect(
        () => AnimalMapper.fromJson('{}'),
        throwsMapperException(MapperException.chain(
            MapperMethod.decode,
            '(Animal)',
            MapperException.missingSubclass('Animal', 'type', 'null'))),
      );
    });

    test('Decode wrapper', () {
      final human = HumanMapper.fromMap({
        'cat': {'breed': 'Siamese'}
      });
      expect(human, isA<Human>());
      expect(human.cat, isA<Siamese>());
    });
  });
}
