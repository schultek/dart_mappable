import '../mapper_container.dart';
import 'mapper_base.dart';
import 'mapper_mixins.dart';

/// An interface to define a custom mapper.
///
/// Implementation should extend this interface and implement the
/// [decodeValue] and [encodeValue] methods.
/// For a generic type with one or two generic type arguments, extend the
/// [SimpleMapper1] or [SimpleMapper2] interface instead, respectively.
///
/// {@category Custom Mappers}
abstract class SimpleMapper<T extends Object> extends _SimpleMapperBase<T> {
  const SimpleMapper();

  T decodeValue(Object value);
  Object? encodeValue(T self);

  @override
  T _decode(Object value, DecodingContext context) {
    return decodeValue(value);
  }

  @override
  Object? _encode(T value, EncodingContext context) {
    return encodeValue(value);
  }
}

/// An interface to define custom mappers for generic types with 1 argument.
///
/// {@category Custom Mappers}
abstract class SimpleMapper1<T extends Object> extends _SimpleMapperBase<T> {
  const SimpleMapper1();

  /// Override as `MyClass<A> decodeValue<A>(Object value)`
  T decodeValue<A>(Object value);

  /// Override as `Object encodeValue<A>(MyClass<A> self)`
  Object? encodeValue<A>(covariant T self);

  @override
  T _decode(Object value, DecodingContext context) {
    return context.callWith1(decodeValue, value);
  }

  @override
  Object? _encode(T value, EncodingContext context) {
    return context.callWith1(encodeValue, value);
  }
}

/// An interface to define custom mappers for generic types with 2 arguments.
///
/// {@category Custom Mappers}
abstract class SimpleMapper2<T extends Object> extends _SimpleMapperBase<T> {
  const SimpleMapper2();

  /// Override as `MyClass<A, B> decodeValue<A, B>(Object value)`
  T decodeValue<A, B>(Object value);

  /// Override as `Object? encodeValue<A, B>(MyClass<A, B> self)`
  Object? encodeValue<A, B>(covariant T self);

  @override
  T _decode(Object value, DecodingContext context) {
    return context.callWith2(decodeValue, value);
  }

  @override
  Object? _encode(T value, EncodingContext context) {
    return context.callWith2(encodeValue, value);
  }
}

abstract class _SimpleMapperBase<T extends Object> extends MapperBase<T>
    with PrimitiveMethodsMixin<T> {
  const _SimpleMapperBase();

  static MapperContainer? _container;
  MapperContainer get container {
    assert(_container != null,
        'SimpleMapper.container can only be accessed inside the decode() or encode() functions.');
    return _container!;
  }

  T _decode(Object value, DecodingContext context);
  Object? _encode(T value, EncodingContext context);

  @override
  T decoder(Object value, DecodingContext context) {
    _container = context.container;
    try {
      return _decode(value, context);
    } finally {
      _container = null;
    }
  }

  @override
  Object? encoder(T value, EncodingContext context) {
    _container = context.container;
    try {
      return _encode(value, context);
    } finally {
      _container = null;
    }
  }
}
