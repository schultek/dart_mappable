import 'package:dart_mappable/dart_mappable.dart';

@MappableClass()
class Apple {
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
