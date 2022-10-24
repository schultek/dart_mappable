
import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import 'copy_with_2_test.mapper.g.dart';

@MappableClass(discriminatorKey: 'type', generateMethods: GenerateMethods.copy | GenerateMethods.stringify)
abstract class Animal with Mappable, AnimalMixin {
  String name;
  Animal(this.name);
}

@MappableClass(generateMethods: GenerateMethods.copy | GenerateMethods.stringify)
class Cat extends Animal with CatMixin {
  String color;
  Cat(String name, this.color) : super(name);
}

@MappableClass(generateMethods: GenerateMethods.copy | GenerateMethods.stringify)
class Dog extends Animal with DogMixin {
  Dog(super.name);
}

@MappableClass(generateMethods: GenerateMethods.copy | GenerateMethods.stringify)
class Zoo with Mappable {
  Animal animal;

  Zoo(this.animal);
}

@MappableClass()
class A<T> with AMixin<T> {}

@MappableClass()
class C<T> extends A<T> with CMixin<T> {}

@MappableClass()
class B {
  List<A> list;
  A a;
  B(this.list, this.a);
}

void main() {
  test('Copies subtype', () {
    var zoo = Zoo(Cat('Mauzi', 'Black'));
    var z2 = zoo.copyWith.animal.call(name: 'Copied');

    expect(z2.animal, isA<Cat>());
    expect(z2.animal.name, equals('Copied'));

    var z3 = zoo.copyWith.animal.apply((a) => Dog(a.name));
    expect(z3.animal, isA<Dog>());
    expect(z3.animal.name, equals('Mauzi'));
  });
}