import 'mapper_base.dart';
import '../mapper_container.dart';
import 'mapper_mixins.dart';

/// Interface to define custom mappers.
///
/// {@category Custom Mappers}
abstract class SimpleMapper<T> extends _SimpleMapperBase<T> {
  const SimpleMapper();

  T decode(dynamic value);
  dynamic encode(T self);

  @override
  Function get _encoder => encode;
  @override
  Function get _decoder => decode;
}

/// Interface to define custom mappers for generic types with 1 argument.
///
/// {@category Custom Mappers}
abstract class SimpleMapper1<T> extends _SimpleMapperBase<T> {
  const SimpleMapper1();

  /// Override as `MyClass<A> encode<A>(dynamic value)`
  T decode<A>(dynamic value);

  /// Override as `dynamic encode<A>(MyClass<A> self)`
  dynamic encode<A>(T self);

  @override
  Function get _encoder => encode;
  @override
  Function get _decoder => decode;
}

/// Interface to define custom mappers for generic types with 2 arguments.
///
/// {@category Custom Mappers}
abstract class SimpleMapper2<T> extends _SimpleMapperBase<T> {
  const SimpleMapper2();

  /// Override as `MyClass<A, B> encode<A, B>(dynamic value)`
  T decode<A, B>(dynamic value);

  /// Override as `dynamic encode<A, B>(MyClass<A, B> self)`
  dynamic encode<A, B>(T self);

  @override
  Function get _encoder => encode;
  @override
  Function get _decoder => decode;
}

abstract class _SimpleMapperBase<T> extends MapperBase<T> {
  const _SimpleMapperBase();

  Function get _encoder;
  Function get _decoder;

  bool equals(T self, T other) => self == other;
  int hash(T self) => self.hashCode;
  String stringify(T self) => self.toString();

  @override
  MapperElementBase<T> createElement(MapperContainer container) {
    return _SimpleMapperElement<T>(this, container);
  }
}

class _SimpleMapperElement<T> extends MapperElementBase<T>
    with MapperAs<_SimpleMapperBase<T>, T> {
  const _SimpleMapperElement(
      _SimpleMapperBase<T> super.mapper, super.container);

  @override
  Function get encoder => mapper._encoder;

  @override
  Function get decoder => mapper._decoder;

  @override
  bool equals(T self, T other) => mapper.equals(self, other);
  @override
  int hash(T self) => mapper.hash(self);
  @override
  String stringify(T self) => mapper.stringify(self);
}
