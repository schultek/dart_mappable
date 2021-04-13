import 'main.mapper.g.dart';

class Person {
  String name;
  int age;
  Car? car;

  Person(this.name, {this.age = 18, this.car});
}

enum Brand { Toyota, Audi, BMW }

class Car {
  final Brand brand;
  final double miles;

  const Car(int drivenKm, this.brand) : miles = drivenKm * 0.62;

  int get drivenKm => (miles / 0.62).round();
}

class Animal {
  int? age;
  Animal([this.age]);
}

class Dog extends Animal {
  String breed;
  Dog(this.breed, [int? age]) : super(age);
}

void main() {
  // decode from json string
  String personJson = '{"name": "Max", "age": 20, "car": {"driven_km": 1000, "brand": "audi"}}';
  Person person = Mapper.fromJson(personJson);
  print('Person(name: ${person.name}, age: ${person.age})'); // Person(name: Max, age: 20)
  print('Car(miles: ${person.car!.miles}, brand: ${person.car!.brand})'); // Car(miles: 620.0, brand: Brand.Audi)

  // make a copy
  Person person2 = person.copyWith(name: 'Anna');
  print('Person(name: ${person2.name})'); // Person(name: Anna)

  // encode to map
  Dog dog = Dog('Shiba', 4);
  Map<String, dynamic> map = dog.toMap();
  print(map); // {breed: Shiba, age: 4}

  // decode from map
  Dog dog2 = DogMapper.fromMap(map);
  print('Dog(breed: ${dog2.breed}, age: ${dog2.age})'); // Dog(breed: Shiba, age: 4)
}
