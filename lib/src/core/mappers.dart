import 'mapper_exception.dart';

/// This class needs to be implemented by all mappers.
/// It defaults to throwing unsupported exceptions for all methods.
abstract class BaseMapper<T> {
  const BaseMapper();

  Function get decoder =>
      (_) => throw MapperException.unsupportedMethod(MapperMethod.decode, type);
  Function get encoder =>
      (_) => throw MapperException.unsupportedMethod(MapperMethod.encode, type);

  Function get typeFactory => (f) => f<T>();

  bool equals(T self, T other) =>
      throw MapperException.unsupportedMethod(MapperMethod.equals, type);
  int hash(T self) =>
      throw MapperException.unsupportedMethod(MapperMethod.hash, type);
  String stringify(T self) =>
      throw MapperException.unsupportedMethod(MapperMethod.stringify, type);

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
