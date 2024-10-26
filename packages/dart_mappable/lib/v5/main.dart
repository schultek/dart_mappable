import 'dart:convert' show jsonEncode, jsonDecode;

import 'package:collection/collection.dart';

import 'bench.dart';
import 'data.dart';
import 'models/animal.dart';
import 'models/animal_gen.dart';
import 'models/box.dart';
import 'models/custom.dart';
import 'models/person.dart';
import 'src/decoding/decoding.dart';
import 'src/encoding/encoding.dart';
import 'src/mapper.dart';
import 'test/raw_encodable.dart';

void main() {
  testPolymorphism();
  //testGenerics();
  //runBenchmarks();
}

void testPolymorphism() {
  Cat cat = StructDecoding.decode(catMap, Cat.decoder());
  print(cat.toMap());
  assert(DeepCollectionEquality().equals(cat.toMap(), catMap));

  Dog dog = StructDecoding.decode(dogMap, Dog.decoder());
  print(dog.toMap());
  assert(DeepCollectionEquality().equals(dog.toMap(), dogMap));

  Animal animal = StructDecoding.decode(dogMap, Animal.decoder());
  print(animal);
  assert(animal.runtimeType == Dog);
  assert(DeepCollectionEquality().equals(animal.toMap(), dogMap));

  useMappers(mappers: [BirdMapper()], () {
    Animal animal = StructDecoding.decode(birdMap, Animal.decoder());
    print(animal);
    assert(animal.runtimeType == Bird);
    assert(DeepCollectionEquality().equals(animal.toMap(), birdMap));
  });

  AnimalGen<int> animalGen =
      StructDecoding.decode(birdMap, AnimalGen.decoder());
  print(animalGen.runtimeType);
}

void testGenerics() {
  // useMappers(mappers: [UriMapper(), BoxMapper()], () {
  //   var b = Box.fromMap<Uri>(boxMap);
  //   print(b);
  //   var m = b.toMap();
  //   print(m);
  //
  //   var b2 = Box.fromMap<Box<Uri>>(boxBoxMap);
  //   print(b2);
  //   var m2 = b2.toMap();
  //   print(m2);
  // });

  var b2 = Box.fromMap<Uri>(
    boxMap,
    UriMapper().decoder(),
  );
  print(b2);
  var m2 = b2.toMap(UriMapper().encoder());
  print(m2);

  var b3 = Box.fromMap<Uri>(
    boxMap,
    Uri2Mapper().decoder(),
  );
  print(b3);
  var m3 = b3.toMap(Uri2Mapper().encoder());
  print(m3);

  return;
}

void runBenchmarks() {
  Person p = Person.fromMapRaw(personMap);

  assert(p.toJson() == p.toJsonRaw());
  assert(DeepCollectionEquality().equals(p.toMap(), p.toMapRaw()));
  assert(DeepCollectionEquality().equals(p.toLazyMap(), p.toMapRaw()));
  assert(StructDecoding.decode(personMap, Person.decoder()) ==
      Person.fromMapRaw(personMap));
  assert(JsonDecoding.decode(personJson, Person.decoder()) ==
      Person.fromMapRaw(personMap));

  print('== MAP DECODING ==');
  bench('dart_mappable          ', () {
    p = StructDecoding.decode(personMap, Person.decoder());
  });
  bench('json_serializable      ', () {
    p = Person.fromMapRaw(personMap);
  });

  print('== JSON STRING DECODING ==');
  bench('dart_mappable          ', () {
    p = JsonDecoding.decode(personJson, Person.decoder());
  });
  bench('json_serializable      ', () {
    p = Person.fromMapRaw(jsonDecode(personJson) as Map<String, dynamic>);
  });

  print('== JSON BYTE DECODING ==');
  bench('dart_mappable          ', () {
    p = JsonDecoding.decodeBytes(personJsonBytes, Person.decoder());
  });
  bench('json_serializable      ', () {
    p = Person.fromMapRaw(
        jsonBytes.decode(personJsonBytes) as Map<String, dynamic>);
  });

  print('');

  print('== MAP ENCODING ==');
  bench('dart_mappable          ', () {
    p.toMap();
  });
  // bench('dart_mappable (lazy)   ', () {
  //   p.toLazyMap();
  // });
  bench('json_serializable      ', () {
    p.toMapRaw();
  });
  print('== JSON STRING ENCODING ==');
  bench('dart_mappable          ', () {
    p.toJson();
  });
  bench('json_serializable      ', () {
    p.toJsonRaw();
  });
  print('== JSON BYTE ENCODING ==');
  bench('dart_mappable          ', () {
    p.toJsonBytes();
  });
  bench('json_serializable      ', () {
    p.toJsonBytesRaw();
  });
}
