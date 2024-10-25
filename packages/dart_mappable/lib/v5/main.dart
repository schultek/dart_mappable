import 'dart:convert' show jsonEncode, jsonDecode;

import 'package:collection/collection.dart';

import 'bench.dart';
import 'data.dart';
import 'models/person.dart';
import 'src/encoder.dart';
import 'src/serial_decoder.dart';
import 'src/structured_decoder.dart';
import 'test/raw_encodable.dart';

void main() {
  // useMappers(mappers: [UriMapper()], () {
  //   var b = Box.decode<Uri>(Decoder.map(boxMap));
  //   print(b);
  //   var m = b.toMap();
  //   print(m);
  // });
  //
  // return;

  Person p = Person.fromMapRaw(personMap);

  assert(p.toJson() == p.toJsonRaw());
  assert(DeepCollectionEquality().equals(p.toMap(), p.toMapRaw()));
  assert(DeepCollectionEquality().equals(p.toLazyMap(), p.toMapRaw()));
  assert(StructuredDecoder.decode(personMap, Person.decodeStructured) ==
      Person.fromMapRaw(personMap));
  assert(JsonDecoder.decode(personJson, Person.decodeSerial) ==
      Person.fromMapRaw(personMap));

  print('== MAP DECODING ==');
  bench('dart_mappable          ', () {
    p = StructuredDecoder.decode(personMap, Person.decodeStructured);
  });
  bench('json_serializable      ', () {
    p = Person.fromMapRaw(personMap);
  });

  print('== JSON STRING DECODING ==');
  bench('dart_mappable          ', () {
    p = JsonDecoder.decode(personJson, Person.decodeSerial);
  });
  bench('json_serializable      ', () {
    p = Person.fromMapRaw(jsonDecode(personJson) as Map<String, dynamic>);
  });

  print('== JSON BYTE DECODING ==');
  bench('dart_mappable          ', () {
    p = JsonDecoder.decodeBytes(personJsonBytes, Person.decodeSerial);
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
