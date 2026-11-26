import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'implements_mixin_test.mapper.dart';

@MappableClass(discriminatorKey: 'type')
abstract class Vehicle with VehicleMappable {
  Vehicle(this.name);

  final String name;
}

@MappableClass()
class Car with CarMappable implements Vehicle {
  Car(this.name, this.doors);

  @override
  final String name;
  final int doors;
}

@MappableClass(discriminatorValue: 'bike')
class Bike with BikeMappable implements Vehicle {
  Bike(this.name, this.gears);

  @override
  final String name;
  final int gears;
}

mixin Tagged {
  String get tag;
}

@MappableClass()
class Box with Tagged, BoxMappable {
  Box(this.tag, this.size);

  @override
  final String tag;
  final int size;
}

@MappableClass(discriminatorKey: 'kind')
abstract class Shape with ShapeMappable {
  String get id;
}

@MappableClass()
class Circle with Tagged, CircleMappable implements Shape {
  Circle(this.id, this.tag, this.radius);

  @override
  final String id;
  @override
  final String tag;
  final double radius;
}

void main() {
  group('implements polymorphism', () {
    test('encodes and decodes through the interface mapper', () {
      final json = Car('Civic', 4).toJson();
      expect(json, equals('{"name":"Civic","doors":4,"type":"Car"}'));

      final Vehicle vehicle = VehicleMapper.fromJson(json);
      expect(vehicle, isA<Car>());
      expect(vehicle.name, equals('Civic'));
    });

    test('uses a custom discriminator value', () {
      final Vehicle vehicle = VehicleMapper.fromJson(
        '{"name":"Trail","gears":18,"type":"bike"}',
      );
      expect(vehicle, isA<Bike>());
      expect((vehicle as Bike).gears, equals(18));
    });
  });

  group('mixin fields', () {
    test('serializes constructor fields from a user mixin', () {
      final box = Box('red', 3);
      expect(box.toMap(), equals({'tag': 'red', 'size': 3}));

      final decoded = BoxMapper.fromMap({'tag': 'blue', 'size': 1});
      expect(decoded.tag, equals('blue'));
      expect(decoded.size, equals(1));
    });
  });

  group('mixin and implements', () {
    test('combines a user mixin with an interface', () {
      final json = Circle('c1', 'dot', 2.5).toJson();
      expect(
        json,
        equals('{"id":"c1","tag":"dot","radius":2.5,"kind":"Circle"}'),
      );

      final Shape shape = ShapeMapper.fromJson(json);
      expect(shape, isA<Circle>());
      expect((shape as Circle).tag, equals('dot'));
    });
  });
}
