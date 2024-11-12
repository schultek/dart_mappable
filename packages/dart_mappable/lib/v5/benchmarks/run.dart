import 'dart:convert';

import '../models/person.dart';
import '../src/implementation/json.dart';
import '../src/implementation/map.dart';
import 'bench.dart';
import 'data.dart';
import 'raw_encodable.dart';

void runBenchmarks() {
  Person p = Person.fromMapRaw(personMap);

  compare(
    'MAP DECODING',
    self: () => p = Person.codable().fromMap(personMap),
    other: () => p = Person.fromMapRaw(personMap),
  );
  compare(
    'JSON STRING DECODING',
    self: () => p = Person.codable().fromJson(personJson),
    other: () =>
    p = Person.fromMapRaw(jsonDecode(personJson) as Map<String, dynamic>),
  );
  compare(
    'JSON BYTE DECODING',
    self: () => p = Person.codable().fromJsonBytes(personJsonBytes),
    other: () => p = Person.fromMapRaw(
        jsonBytes.decode(personJsonBytes) as Map<String, dynamic>),
  );

  print('');

  compare(
    'MAP ENCODING',
    self: () => p.toMap(),
    other: () => p.toMapRaw(),
  );
  compare(
    'JSON STRING ENCODING',
    self: () => p.toJson(),
    other: () => p.toJsonRaw(),
  );
  compare(
    'JSON BYTE ENCODING',
    self: () => p.toJsonBytes(),
    other: () => p.toJsonBytesRaw(),
  );
}