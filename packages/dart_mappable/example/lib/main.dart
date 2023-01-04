import 'package:dart_mappable/dart_mappable.dart';

part 'main.mapper.dart';

@MappableClass()
class Person with PersonMappable {
  final String name;
  final int age;
  final Car? car;

  Person(this.name, {this.age = 18, this.car});

  static final fromMap = PersonMapper.fromMap;
}

@MappableEnum()
// ignore: constant_identifier_names
enum Brand { Toyota, Audi, BMW }

@MappableClass()
class Car with CarMappable {
  final double miles;
  final Brand brand;

  const Car(int drivenKm, this.brand) : miles = drivenKm * 0.62;

  int get drivenKm => (miles / 0.62).round();
}

@MappableClass()
class Box<T> with BoxMappable {
  int size;
  T content;

  Box(this.size, {required this.content});
}

@MappableClass()
class Confetti with ConfettiMappable {
  String color;
  Confetti(this.color);
}

void main() {
  // decode from json string
  String json = '{"name": "Max", "car": {"drivenKm": 1000, "brand": "Audi"}}';
  Person person = PersonMapper.fromJson(json);

  print(person);
  // Person(name: Max, age: 18, car: Car(miles: 620.0, brand: Brand.Audi))

  // make a copy
  Person person2 = person.copyWith(name: 'Anna', age: 20);
  print(person2); // Person(name: Anna, age: 20, car: ...

  // encode to map
  Map<String, dynamic> map = person.toMap();
  print(map); // {name: Max, age: 18, car: {drivenKm: 1000, brand: Audi}}

  // decode from map
  Person person3 = PersonMapper.fromMap(map);
  print(person3); // Person(name: Max, age: 18, car: ...

  // check equality
  print(person3 == person); // true

  // directly convert to json string
  print(person3.toJson()); // '{"name":"Max","age":18,"car":{...

  // link mappers to work together
  BoxMapper.container.link(ConfettiMapper.container);

  // use generic objects
  Box<dynamic> box = Box<Confetti>(10, content: Confetti('Rainbow'));
  String boxJson = BoxMapper.container.toJson(box);
  print(
      boxJson); // {"size":10,"content":{"color":"Rainbow"},"_type":"Box<Confetti>"}

  // ... somewhere else
  dynamic whatAmI = BoxMapper.fromJson(boxJson);
  print(whatAmI.runtimeType); // Box<Confetti>

  // also works with lists and sets
  List<int> numbers = MapperContainer().fromJson('[2, 4, 105]');
  print(numbers); // [2, 4, 105]
}
