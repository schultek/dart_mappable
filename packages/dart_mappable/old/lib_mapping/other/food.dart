import 'package:dart_mappable/dart_mappable.dart';

import '../lib_mapping_test.mapper.g.dart';

@MappableClass()
class Apple with AppleMappable {
  final bool isRed;

  Apple(this.isRed);
}

class Bread {
  final int slices;

  Bread(this.slices);
}

class Cake {
  final String type;

  Cake(this.type);
}
