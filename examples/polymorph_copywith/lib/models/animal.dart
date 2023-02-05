import 'package:dart_mappable/dart_mappable.dart';

import 'cat.dart' as c;
import 'dog.dart' as d;

part 'animal.mapper.dart';

@MappableClass(discriminatorKey: 'type', includeSubClasses: [c.Cat, d.Dog])
abstract class Animal with AnimalMappable {
  String name;
  Animal(this.name);
}


class A<T extends B<C>> {

}

class C extends A<B<C>> {}

class B<T extends A> {

}