import 'package:dart_mappable/dart_mappable.dart';

import '../test.mapper.g.dart';

class Person with Mappable {
  final String name;
  final int age;
  final Car? car;

  Person(this.name, {this.age = 18, this.car});

  // optional factory wrapper
  factory Person.fromMap(Map<String, dynamic> map) => Mapper.fromMap(map);
}

@MappableEnum(defaultValue: Brand.Audi)
enum Brand { Toyota, Audi, BMW }

@MappableClass(
    generateMethods: GenerateMethods.decode |
        GenerateMethods.encode |
        GenerateMethods.stringify |
        GenerateMethods.equals)
class Car with Mappable {
  final double miles;
  final Brand brand;

  const Car(int drivenKm, this.brand) : miles = drivenKm * 0.62;

  int get drivenKm => (miles / 0.62).round();
}

class Box<T extends Object> {
  int size;
  T content;

  Box(this.size, {required this.content});
}

class Confetti {
  String color;
  Confetti(this.color);
}

class PlayerHooks extends MappingHooks {
  const PlayerHooks();

  @override
  dynamic beforeDecode(dynamic value) {
    if (value is String) {
      return {'id': value};
    }
    return value;
  }

  @override
  dynamic afterEncode(dynamic value) {
    if (value is Map<String, dynamic>) {
      return value['id'];
    }
    return value;
  }
}

class Game {
  @MappableField(hooks: PlayerHooks())
  Player player;

  Game(this.player);
}

class Player {
  String id;
  Player(this.id);
}

@MappableClass(generateMethods: GenerateMethods.equals)
class CheckBoard {
  bool checked;
  int count;

  CheckBoard({required this.checked, required this.count});
}
