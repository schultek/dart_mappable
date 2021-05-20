import '../test.mapper.g.dart';

class Person with Mappable {
  final String name;
  final int age;
  final Car? car;

  Person(this.name, {this.age = 18, this.car});

  // optional factory wrapper
  factory Person.fromMap(Map<String, dynamic> map) => Mapper.fromMap(map);
}

enum Brand { Toyota, Audi, BMW }

class Car with Mappable {
  final double miles;
  final Brand brand;

  const Car(int drivenKm, this.brand) : miles = drivenKm * 0.62;

  int get drivenKm => (miles / 0.62).round();
}

class Box<T> {
  int size;
  T content;

  Box(this.size, {required this.content});
}

class Confetti {
  String color;
  Confetti(this.color);
}
