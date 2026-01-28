import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import 'copy_with_test.dart';

part 'copy_with_subtype_test.mapper.dart';

@MappableClass(discriminatorKey: 'type', generateMethods: GenerateMethods.copy | GenerateMethods.stringify)
abstract class Animal with AnimalMappable {
  String name;
  Animal(this.name);
}

@MappableClass(generateMethods: GenerateMethods.copy | GenerateMethods.stringify)
class Cat extends Animal with CatMappable {
  String color;
  Cat(super.name, this.color);
}

@MappableClass(generateMethods: GenerateMethods.copy | GenerateMethods.stringify)
class Dog extends Animal with DogMappable {
  Dog(super.name);
}

@MappableClass(generateMethods: GenerateMethods.copy | GenerateMethods.stringify)
class Zoo with ZooMappable {
  Animal animal;

  Zoo(this.animal);
}

@MappableClass()
class A<T> with AMappable<T> {}

@MappableClass()
class C<T> extends A<T> with CMappable<T> {}

@MappableClass()
class B with BMappable {
  List<A?> list;
  A? a;
  B(this.list, this.a);
}

@MappableClass(generateMethods: GenerateMethods.copy)
class ItemContainer2<T> extends ItemContainer<T> with ItemContainer2Mappable<T> {
  ItemContainer2(super.items);
}

void main() {
  test('Copies subtype', () {
    var zoo = Zoo(Cat('Mauzi', 'Black'));
    var z2 = zoo.copyWith.animal.call(name: 'Copied');

    expect(z2.animal, isA<Cat>());
    expect(z2.animal.name, equals('Copied'));

    var z3 = zoo.copyWith.animal.$update((a) => Dog(a.name));
    expect(z3.animal, isA<Dog>());
    expect(z3.animal.name, equals('Mauzi'));
  });

  test('Copies imported subtype', () {
    var container = ItemContainer2([
      BrandList([Brand('Audi')]),
    ]);
    var c2 = container.copyWith.items.at(0).items.add(Brand('BMW'));
    expect(c2.items[0], isA<BrandList>());
    expect(c2.items[0].items.last, equals(Brand('BMW')));

    expect(identical(container.items, c2.items), isFalse);
    expect(identical(container.items[0], c2.items[0]), isFalse);
    expect(container.items[0].items, hasLength(1));
    expect(c2.items[0].items, hasLength(2));
  });
}
