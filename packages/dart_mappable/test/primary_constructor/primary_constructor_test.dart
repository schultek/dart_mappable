// @dart = 3.13

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'primary_constructor_test.mapper.dart';

@MappableClass()
class Person(final String name, {final int age = 20}) with PersonMappable;

@MappableClass()
class Point(final int x, int delta) with PointMappable {
  final int y = delta;
}

@MappableClass()
class Animal(final String name) with AnimalMappable;

@MappableClass()
// ignore: use_super_parameters
class Dog(String name, final int barkVolume) extends Animal with DogMappable {
  this : super(name);
}

@MappableClass()
class Cat(super.name, final bool isLazy) extends Animal with CatMappable;

@MappableClass()
class Config.named({final String host = 'localhost', final int port = 8080})
    with ConfigMappable;

@MappableClass()
class Box<T>(final T value) with BoxMappable<T>;

void main() {
  group('primary constructor', () {
    test('basic serialization and copyWith', () {
      final person = Person('Alice', age: 30);

      expect(person.toMap(), equals({'name': 'Alice', 'age': 30}));
      expect(person.toJson(), equals('{"name":"Alice","age":30}'));

      final fromMap = PersonMapper.fromMap({'name': 'Bob'});
      expect(fromMap.name, equals('Bob'));
      expect(fromMap.age, equals(20));

      final fromJson = PersonMapper.fromJson('{"name":"Charlie","age":25}');
      expect(fromJson.name, equals('Charlie'));
      expect(fromJson.age, equals(25));

      final updated = person.copyWith(name: 'Alicia');
      expect(updated, equals(Person('Alicia', age: 30)));
      expect(person.toString(), equals('Person(name: Alice, age: 30)'));
    });

    test('field initialized from parameter', () {
      final point = Point(10, 20);

      expect(point.x, equals(10));
      expect(point.y, equals(20));
      expect(point.toMap(), equals({'x': 10, 'delta': 20}));

      final decoded = PointMapper.fromMap({'x': 5, 'delta': 15});
      expect(decoded.x, equals(5));
      expect(decoded.y, equals(15));

      final updated = point.copyWith(delta: 30);
      expect(updated.y, equals(30));
    });

    test('inheritance with super constructor invocation', () {
      final dog = Dog('Rex', 9);

      expect(dog.name, equals('Rex'));
      expect(dog.barkVolume, equals(9));
      expect(dog.toMap(), equals({'name': 'Rex', 'barkVolume': 9}));

      final decoded = DogMapper.fromMap({'name': 'Buddy', 'barkVolume': 5});
      expect(decoded.name, equals('Buddy'));
      expect(decoded.barkVolume, equals(5));

      final updated = dog.copyWith(barkVolume: 10);
      expect(updated.barkVolume, equals(10));
      expect(updated.name, equals('Rex'));

      final cat = Cat('Whiskers', true);
      expect(cat.name, equals('Whiskers'));
      expect(cat.isLazy, isTrue);
      expect(cat.toMap(), equals({'name': 'Whiskers', 'isLazy': true}));

      final decodedCat = CatMapper.fromMap({'name': 'Felix', 'isLazy': false});
      expect(decodedCat.name, equals('Felix'));
      expect(decodedCat.isLazy, isFalse);
      expect(decodedCat.copyWith(isLazy: true).isLazy, isTrue);
    });

    test('named primary constructor', () {
      final config = ConfigMapper.fromMap({});
      expect(config.host, equals('localhost'));
      expect(config.port, equals(8080));
      expect(config.toMap(), equals({'host': 'localhost', 'port': 8080}));

      final custom = Config.named(host: 'example.com', port: 443);
      expect(custom.toMap(), equals({'host': 'example.com', 'port': 443}));
      expect(
        custom.copyWith(port: 8443),
        equals(Config.named(host: 'example.com', port: 8443)),
      );
    });

    test('generics with primary constructor', () {
      final intBox = Box<int>(42);
      expect(intBox.toMap(), equals({'value': 42}));

      final decodedInt = BoxMapper.fromMap<int>({'value': 100});
      expect(decodedInt.value, equals(100));

      final stringBox = Box<String>('hello');
      expect(stringBox.toMap(), equals({'value': 'hello'}));

      final decodedString = BoxMapper.fromMap<String>({'value': 'world'});
      expect(decodedString.value, equals('world'));

      final updated = intBox.copyWith(value: 99);
      expect(updated.value, equals(99));
    });
  });
}
