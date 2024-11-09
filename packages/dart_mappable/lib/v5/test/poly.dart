
import 'package:collection/collection.dart';

import '../benchmarks/data.dart';
import '../models/animal.dart';
import '../models/animal_gen.dart';
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

  AnimalGen<int> animalGen =
  MapDecoding.decode(birdMap, AnimalGen.decoder());
  print(animalGen.runtimeType);
}