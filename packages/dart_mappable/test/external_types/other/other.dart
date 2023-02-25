import 'models.dart';

abstract class Animal {
  final String color;

  const Animal(this.color);
}

class Pet extends Animal {
  final Person owner;

  const Pet(this.owner, super.color);
}
