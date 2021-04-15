import 'main.mapper.g.dart';

class Person with Mappable<Person> {
  final String name;
  final int age;
  final Car? car;

  Person(this.name, {this.age = 18, this.car});

  // optional factory wrapper
  factory Person.fromMap(Map<String, dynamic> map) => Mapper.fromMap(map);
}

enum Brand { Toyota, Audi, BMW }

class Car with Mappable<Car> {
  final Brand brand;
  final double miles;

  const Car(int drivenKm, this.brand) : miles = drivenKm * 0.62;

  int get drivenKm => (miles / 0.62).round();
}


void main() {

  // decode from json string
  String personJson = '{"name": "Max", "car": {"driven_km": 1000, "brand": "audi"}}';
  Person person = Mapper.fromJson(personJson);
  print(person); // Person(Max, age: 18, car: Car(1000, Brand.Audi))
  print(person.car); // Car(miles: 620.0, brand: Brand.Audi)

  // make a copy
  Person person2 = person.copyWith(name: 'Anna', age: 20);
  print(person2); // Person(Anna, age: 20, car: Car(1000, Brand.Audi))

  // encode to map
  Map<String, dynamic> map = person.toMap();
  print(map); // {name: Max, age: 18, car: {driven_km: 1000, brand: audi}}

  // decode from map
  Person person4 = Person.fromMap(map);
  print(person4); // Person(Max, age: 18, car: Car(1000, Brand.Audi))
  print(person4 == person); // true
  print(person4.toJson()); // {"name":"Max","age":18,"car":{"driven_km":1000,"brand":"audi"}}

  // optionally use Mapper functions
  print(Mapper.isEqual(person, person4)); // true
  print(Mapper.asString(person)); // Person(Max, age: 18, car: Car(1000, Brand.Audi))
}
