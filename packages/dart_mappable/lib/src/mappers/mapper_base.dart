import 'package:type_plus/type_plus.dart';

import '../mapper_container.dart';
import '../mapper_exception.dart';

/// {@category Custom Mappers}
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
///
/// {@category Custom Mappers}
abstract class MapperElementBase<T> {
  const MapperElementBase(this.mapper, this.container);

  final MapperBase<T> mapper;
  final MapperContainer container;

  Function get decoder => (_) =>
      throw MapperException.unsupportedMethod(MapperMethod.decode, mapper.type);
  Function get encoder => (_) =>
      throw MapperException.unsupportedMethod(MapperMethod.encode, mapper.type);

  bool equals(T self, T other) =>
      throw MapperException.unsupportedMethod(MapperMethod.equals, mapper.type);
  int hash(T self) =>
      throw MapperException.unsupportedMethod(MapperMethod.hash, mapper.type);
  String stringify(T self) => throw MapperException.unsupportedMethod(
      MapperMethod.stringify, mapper.type);
}
