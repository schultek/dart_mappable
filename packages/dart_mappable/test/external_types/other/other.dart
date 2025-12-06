import 'color.dart';
import 'models.dart';

abstract class Animal {
  final String name;
  final Color color;

  const Animal(this.name, this.color);
}

class Pet extends Animal {
  final Person owner;

  const Pet(this.owner, super.name, super.color);
}
