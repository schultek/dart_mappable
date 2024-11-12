import 'package:collection/collection.dart';

import '../benchmarks/data.dart';
import '../benchmarks/raw_encodable.dart';
import '../models/person.dart';
import '../src/extensions/extensions.dart';
import '../src/implementation/json.dart';
import '../src/implementation/lazy.dart';
import '../src/implementation/map.dart';

void testBasicModel() {
  Person p = Person.fromMapRaw(personMap);

  assert(Person.codable().fromMap(personMap) == Person.fromMapRaw(personMap));
  assert(Person.codable().fromJson(personJson) == Person.fromMapRaw(personMap));

  Person.codable().toMap(p);

  assert(p.toJson() == p.toJsonRaw());
  assert(DeepCollectionEquality().equals(p.toMap(), p.toMapRaw()));
  assert(DeepCollectionEquality().equals(p.toLazyMap(), p.toMapRaw()));

  Person.codable().list().toJson([p, p]);
  Person.codable().map<String>().toJson({'a': p, 'b': p});
}
