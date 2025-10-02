import 'package:dart_mappable/dart_mappable.dart';

part 'main.mapper.dart';

@MappableClass()
class Person with PersonMappable {
  final String name;
  final int age;
  final Car? car;
  @MappableField(includeFromJson: false)
  final String? description;
  @MappableField(includeToJson: false)
  final String? secret;
  @MappableField(includeIfNull: false)
  final String? metadata;
  @MappableField(includeIfNull: true)
  final String? password;
  @MappableField(includeFromJson: false, includeToJson: false)
  final String? lastLogin;

  Person(
    this.name, {
    this.age = 18,
    this.car,
    this.description,
    this.secret,
    this.metadata,
    this.password,
    this.lastLogin,
  });
}

@MappableEnum()
// ignore: constant_identifier_names
enum Brand { Toyota, Audi, BMW }

@MappableClass()
class Car with CarMappable {
  final double miles;
  final Brand brand;

  const Car(this.miles, this.brand);
}

@MappableClass()
class Box<T> with BoxMappable<T> {
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
  String json =
      '{"name": "Max", "car": {"miles": 1000, "brand": "Audi"}, "description": "Max is a good boy", "secret": "secret123", "metadata": "metadata123", "password": "password123", "lastLogin": "2023-01-01T00:00:00.000Z"}';
  Person person = PersonMapper.fromJson(json);

  // use toString()
  print(person);
  // Person(name: Max, age: 18, car: Car(miles: 1000.0, brand: Brand.Audi))

  // make a copy
  Person person2 = person.copyWith(
      name: 'Anna',
      age: 20,
      description: 'Anna is a good girl',
      secret: 'secret456',
      metadata: 'metadata456',
      password: 'password456',
      lastLogin: '2023-01-02T00:00:00.000Z');
  print(person2); // Person(name: Anna, age: 20, car: ...

  // check description for toMap when (includeFromJson: false)
  final map2 = person2.toMap();
  print(map2);

  // check secret for toMap when (includeToJson: false)
  final map3 = person2.toMap();
  print(map3);

  // check metadata for toMap when (includeIfNull: true)

  // check password for toMap when (includeIfNull: false)
  final map4 = person2.toMap();
  print(map4);

  // check lastLogin for toMap when (includeFromJson: false, includeToJson: false)
  final map5 = person2.toMap();
  print(map5);

  // check all fields for toMap
  final map6 = person2.toMap();
  print(map6);

  // encode to map
  Map<String, dynamic> map = person.toMap();
  print(map); // {name: Max, age: 18, car: {miles: 1000, brand: Audi}}

  // decode from map
  Person person3 = PersonMapper.fromMap(map);
  print(person3); // Person(name: Max, age: 18, car: ...

  // check equality
  print(person3 == person); // true

  // directly convert to json string
  print(person3.toJson()); // '{"name":"Max","age":18,"car":{...

  // make sure that Confetti can be serialized
  ConfettiMapper.ensureInitialized();

  // use generic objects
  var box = Box<Confetti>(10, content: Confetti('Rainbow'));
  String boxJson = box.toJson();
  print(boxJson); // {"size":10,"content":{"color":"Rainbow"}}

  // ... somewhere else
  dynamic whatAmI = BoxMapper.fromJson<Confetti>(boxJson);
  print(whatAmI.runtimeType); // Box<Confetti>

  // also works with lists and sets
  List<int> numbers = MapperContainer.globals.fromJson('[2, 4, 105]');
  print(numbers); // [2, 4, 105]
}
