import 'package:type_plus/type_plus.dart';

import 'mapper_container.dart';
import 'mapper_exception.dart';
import 'mapper_mixins.dart';

abstract class MapperBase<T> {
  const MapperBase();

  /// A unique id for this type, defaults to the name of the type.
  /// Override this if you have two types with the same name.
  String get id => T.name;

  /// A type factory is what makes generic types work.
  Function get typeFactory => (f) => f<T>();

  Type get type => T;

  /// Optional type of the implementations of [T] used for decoding.
  Type get implType => type;

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

/// Simple wrapper around the [MapperBase] class that provides direct
/// abstract function declarations.
abstract class SimpleMapper<T> extends MapperBase<T> {
  const SimpleMapper();

  dynamic encode(T self);
  T decode(dynamic value);

  bool equals(T self, T other) => self == other;
  int hash(T self) => self.hashCode;
  String stringify(T self) => self.toString();

  @override
  MapperElementBase<T> createElement(MapperContainer container) {
    return SimpleMapperElement<T>(this, container);
  }
}

class SimpleMapperElement<T> extends MapperElementBase<T> with MapperAs<SimpleMapper<T>, T> {
  const SimpleMapperElement(SimpleMapper<T> super.mapper, super.container);

  @override
  Function get encoder => mapper.encode;

  @override
  Function get decoder => mapper.decode;

  @override
  bool equals(T self, T other) => mapper.equals(self, other);
  @override
  int hash(T self) => mapper.hash(self);
  @override
  String stringify(T self) => mapper.stringify(self);
}
