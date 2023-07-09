abstract class MapperGenerator<T> {
  final T element;

  MapperGenerator(this.element);

  Future<String> generate();
}
