import 'package:type_plus/type_plus.dart';

import '../internals/mapper_container.dart';
import 'mapper_exception.dart';

abstract class MapperBase<T> {
  /// A unique id for this type, defaults to the name of the type.
  /// Override this if you have two types with the same name.
  String get id => T.name;
  Function get typeFactory => (f) => f<T>();

  Type get type => T;
  bool isFor(dynamic v) => v is T;

  MapperElementBase<T> createElement(MapperContainer container);
}

/// This class needs to be implemented by all mappers.
/// It defaults to throwing unsupported exceptions for all methods.
abstract class MapperElementBase<T> {
  const MapperElementBase(this.mapper, this.container);

  final MapperBase<T> mapper;
  final MapperContainer container;

  Function get decoder =>
      (_) => throw MapperException.unsupportedMethod(MapperMethod.decode, mapper.type);
  Function get encoder =>
      (_) => throw MapperException.unsupportedMethod(MapperMethod.encode, mapper.type);

  bool equals(T self, T other) =>
      throw MapperException.unsupportedMethod(MapperMethod.equals, mapper.type);
  int hash(T self) =>
      throw MapperException.unsupportedMethod(MapperMethod.hash, mapper.type);
  String stringify(T self) =>
      throw MapperException.unsupportedMethod(MapperMethod.stringify, mapper.type);
}

/// Simple wrapper around the [MapperElementBase] class that provides direct abstract function declarations
abstract class SimpleMapperElement<T> extends MapperElementBase<T> {
  const SimpleMapperElement(super.mapper, super.container);

  @override
  Function get encoder => encode;
  dynamic encode(T self);

  @override
  Function get decoder => decode;
  T decode(dynamic value);
}
