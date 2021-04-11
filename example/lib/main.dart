
import 'main.g.dart';


class Person {
  dynamic age;
  String name;
  bool isAdmin;
  Car? car;
  List<int> nums;
  List<Car> cars;

  Person(this.name, this.age, {this.car, this.isAdmin = false, this.nums = const [], required this.cars});
}

class Animal {
  int age;
  Animal(this.age);
}

class Dog extends Animal {
  String breed;
  Dog(this.breed, int age) : super(age);
}

enum Brand {
  Toyota, Audi, BMW
}

class Car {
  final Brand brand;
  final int miles;

  const Car(this.miles, this.brand);
}

void main() {


  Car(2, BrandMapper.fromString("asd"));


  Dog d = ObjectMapper.fromMap({"age": 10, "breed": "Shiba"});

  print(d.toMap());

}