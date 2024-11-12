
import '../benchmarks/data.dart';
import '../models/box.dart';
import '../models/custom.dart';
import '../src/implementation/map.dart';

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

  Box<Uri> b2 = Box.codable<Uri>().fromMap(
    boxMap,
    UriMapper().codable().decoder(),
  );
  print(b2);
  var m2 = b2.toMap(UriMapper().codable().encoder());
  print(m2);
}