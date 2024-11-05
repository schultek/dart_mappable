
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