import 'package:dart_mappable/annotations.dart';

@MappableClass(hooks: UnmappedPropertiesHooks('unmapped_props'))
abstract class Clothes {
  @MappableField(key: 'howbig')
  int size;
  String? color;
  Map<String, dynamic> unmappedProps;

  Clothes(this.size, {this.color, this.unmappedProps = const {}});
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
