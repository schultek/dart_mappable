import '../elements/mapper_element.dart';

abstract class MapperGenerator<T> {
  final T element;

  MapperGenerator(this.element);

  Future<String> generate();
}

extension NodocGenerator on MapperGenerator<MapperElement> {
  String get nodocTag => element.options.nodocTag;
}
