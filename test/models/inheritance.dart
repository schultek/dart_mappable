import 'package:dart_mappable/src/annotations.dart';

@MappableClass(
    hooks: UnmappedPropertiesHooks('unmapped_props'), discriminatorKey: 'label')
abstract class Clothes {
  @MappableField(key: 'howbig')
  int size;
  String? color;
  Map<String, dynamic> unmappedProps;

  Clothes(this.size, {this.color, this.unmappedProps = const {}});
}

abstract class SummerClothes extends Clothes {
  SummerClothes(int size, String? color, Map<String, dynamic> unmappedProps)
      : super(size, color: color, unmappedProps: unmappedProps);
}

class TShirt extends Clothes {
  String neck;
  TShirt(this.neck, int size, String? color, Map<String, dynamic> props)
      : super(size, color: color, unmappedProps: props);
}

class JeansHooks extends MappingHooks {
  const JeansHooks();
}

@MappableClass(hooks: JeansHooks())
class Jeans extends Clothes {
  int age;
  Jeans(this.age, String? color, int size) : super(size, color: color);
}

class Shorts extends SummerClothes {
  String tag;

  Shorts(this.tag, int size, String? color, Map<String, dynamic> unmappedProps)
      : super(size, color, unmappedProps);
}

@MappableClass(discriminatorValue: ['ATop', 'BTop'])
class Top extends SummerClothes {
  int length;

  Top(this.length, int size, String? color, Map<String, dynamic> unmappedProps)
      : super(size, color, unmappedProps);
}
