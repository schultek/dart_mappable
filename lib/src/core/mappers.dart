/// This class needs to be implemented by all mappers
abstract class BaseMapper<T> {
  const BaseMapper();

  Function get decoder =>
      (_) => throw MapperException('Decoding is not supported for $type.');
  Function get encoder =>
      (_) => throw MapperException('Encoding is not supported for $type.');

  Function get typeFactory => (f) => f<T>();

  bool? equals(T self, T other) => null;
  int? hash(T self) => null;
  String? stringify(T self) => null;

  Type get type => T;
  bool isFor(dynamic v) => v is T;
}

/// Simple wrapper around the [BaseMapper] class that provides direct abstract function declarations
abstract class SimpleMapper<T> extends BaseMapper<T> {
  const SimpleMapper();

  @override
  Function get encoder => encode;
  dynamic encode(T self);

  @override
  Function get decoder => decode;
  T decode(dynamic value);
}

class MapperException implements Exception {
  final String message;
  const MapperException(this.message);

  @override
  String toString() => 'MapperException: $message';
}
