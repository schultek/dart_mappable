import 'main.mapper.g.dart';

class Person {
  dynamic age;
  String name;
  bool isAdmin;
  Car? car;
  List<int> nums;
  List<Car> cars;

  Person(String nameabc, this.age, {this.car, this.isAdmin = false, this.nums = const [], required this.cars})
      : name = nameabc;
  String get nameabc => name;
}

class Animal {
  int age;
  Animal(this.age);
}

class Dog extends Animal {
  String breed;
  Dog(this.breed, int age) : super(age);
}

enum Brand { Toyota, Audi, BMW }

class Car {
  final Brand brand;
  final int miles;

  const Car(this.miles, this.brand);
}

void main() {
  var c = Car(2, Brand.Audi);

  c.toMap();
}
