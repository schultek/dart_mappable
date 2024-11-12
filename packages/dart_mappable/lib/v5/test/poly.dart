
import 'package:collection/collection.dart';

import '../benchmarks/data.dart';
import '../models/animal.dart';
import '../src/implementation/map.dart';
import '../src/mapper/container.dart';

void testPolymorphism() {
  Cat cat = MapDecoding.decode(catMap, Cat.decoder());
  print(cat.toMap());
  assert(DeepCollectionEquality().equals(cat.toMap(), catMap));

  Dog dog = MapDecoding.decode(dogMap, Dog.decoder());
  print(dog.toMap());
  assert(DeepCollectionEquality().equals(dog.toMap(), dogMap));

  Animal animal = MapDecoding.decode(dogMap, Animal.decoder());
  print(animal);
  assert(animal.runtimeType == Dog);
  assert(DeepCollectionEquality().equals(animal.toMap(), dogMap));

  useMappers(mappers: [BirdMapper()], () {
    Animal animal = MapDecoding.decode(birdMap, Animal.decoder());
    print(animal);
    assert(animal.runtimeType == Bird);
    assert(DeepCollectionEquality().equals(animal.toMap(), birdMap));
  });

  Animal animal2 = MapDecoding.decode(birdMap, Animal.decoder());
  print(animal2);
  assert(animal2.runtimeType == Animal);
  assert(DeepCollectionEquality().equals(animal2.toMap(), {'type': 'bird'}));
}
