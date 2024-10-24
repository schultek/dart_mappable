import 'bench.dart';
import 'data.dart';
import 'models/person.dart';
import 'src/decoder.dart';
import 'src/encoder.dart';
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

  late Person p;

  print("== MAP DECODING ==");
  bench('dart_mappable          ', () {
    p = Person.decode(Decoder.raw(personMap));
  });
  bench('json_serializable      ', () {
    p = Person.fromMapRaw(personMap);
  });
  //
  // print("== JSON DECODING ==");
  // bench('dart_mappable          ', () {
  //   p = Person.decode(Decoder.json(personJsonBytes));
  // });
  // bench('json_serializable       ', () {
  //   p = Person.fromMapRaw(jsonDecode(personJson) as Map<String, dynamic>);
  // });
  //
  // assert(p.toJson() == p.toJsonRaw());
  // assert(DeepCollectionEquality().equals(p.toMap(), p.toMapRaw()));
  // assert(DeepCollectionEquality().equals(p.toLazyMap(), p.toMapRaw()));

  print("== MAP ENCODING ==");
  bench('toMap()                 ', () {
    p.toMap();
  });
  bench('toLazyMap()             ', () {
    p.toLazyMap();
  });
  bench('toMapRaw()              ', () {
    p.toMapRaw();
  });
  print("== JSON ENCODING ==");
  bench('toJson()                ', () {
    p.toJson();
  });
  bench('jsonEncode(toMapRaw())  ', () {
    p.toJsonRaw();
  });
  // bench('jsonEncode(toMap())     ', () {
  //   jsonEncode(p.toMap());
  // });
  // bench('jsonEncode(toLazyMap()) ', () {
  //   jsonEncode(p.toLazyMap());
  // });
}
