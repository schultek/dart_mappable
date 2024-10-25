import 'dart:convert' show jsonEncode, jsonDecode;

import 'package:collection/collection.dart';

import 'bench.dart';
import 'data.dart';
import 'models/box.dart';
import 'models/person.dart';
import 'models/uri.dart';
import 'src/decoding/decoding.dart';
import 'src/encoding/encoding.dart';
import 'src/mapper.dart';
import 'test/raw_encodable.dart';

void main() {
  //testGenerics();
  runBenchmarks();
}

void testGenerics() {
  useMappers(mappers: [UriMapper(), BoxMapper()], () {
    var b = Box.fromMap<Uri>(boxMap);
    print(b);
    var m = b.toMap();
    print(m);

    var b2 = Box.fromMap<Box<Uri>>(boxBoxMap);
    print(b2);
    var m2 = b2.toMap();
    print(m2);
  });

  var b2 = Box.fromMap<Box<Uri>>(
    boxBoxMap,
    Box.decoder(UriMapper().decoder()),
  );
  print(b2);
  var m2 = b2.toMap(BoxMapper().encoder());
  print(m2);

  return;
}

void runBenchmarks() {
  Person p = Person.fromMapRaw(personMap);

  assert(p.toJson() == p.toJsonRaw());
  assert(DeepCollectionEquality().equals(p.toMap(), p.toMapRaw()));
  assert(DeepCollectionEquality().equals(p.toLazyMap(), p.toMapRaw()));
  assert(StructDecoding.decode(personMap, Person.decoder) ==
      Person.fromMapRaw(personMap));
  assert(JsonDecoding.decode(personJson, Person.decoder) ==
      Person.fromMapRaw(personMap));

  print('== MAP DECODING ==');
  bench('dart_mappable          ', () {
    p = StructDecoding.decode(personMap, Person.decoder);
  });
  bench('json_serializable      ', () {
    p = Person.fromMapRaw(personMap);
  });

  print('== JSON STRING DECODING ==');
  bench('dart_mappable          ', () {
    p = JsonDecoding.decode(personJson, Person.decoder);
  });
  bench('json_serializable      ', () {
    p = Person.fromMapRaw(jsonDecode(personJson) as Map<String, dynamic>);
  });

  print('== JSON BYTE DECODING ==');
  bench('dart_mappable          ', () {
    p = JsonDecoding.decodeBytes(personJsonBytes, Person.decoder);
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
