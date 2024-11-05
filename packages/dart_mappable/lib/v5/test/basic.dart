import 'package:collection/collection.dart';

import '../benchmarks/data.dart';
import '../benchmarks/raw_encodable.dart';
import '../models/person.dart';
import '../src/implementation/json.dart';
import '../src/implementation/lazy.dart';
import '../src/implementation/map.dart';

void testBasicModel() {
  Person p = Person.fromMapRaw(personMap);

  assert(MapDecoding.decode(personMap, Person.decoder()) ==
      Person.fromMapRaw(personMap));
  assert(jsonCoding.decode(personJson, Person.decoder()) ==
      Person.fromMapRaw(personMap));

  assert(p.toJson() == p.toJsonRaw());
  assert(DeepCollectionEquality().equals(p.toMap(), p.toMapRaw()));
  assert(DeepCollectionEquality().equals(p.toLazyMap(), p.toMapRaw()));
}