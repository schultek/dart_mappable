import 'package:dart_mappable/annotations.dart';

abstract class Clothes {
  @MappableField(key: 'howbig')
  int size;
  String? color;

  Clothes(this.size, {this.color});
}

class TShirt extends Clothes {
  String neck;
  TShirt(this.neck, int size, String? color) : super(size, color: color);
}

class Jeans extends Clothes {
  int age;
  Jeans(this.age, String? color, int size) : super(size, color: color);
}
