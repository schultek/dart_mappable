import '../mapper_container.dart';
import 'mapper_base.dart';
import 'mapper_mixins.dart';
import 'mapping_context.dart';

/// An interface to define a custom mapper.
///
/// Implementation should extend this interface and implement the
/// [decode] and [encode] methods.
/// For a generic type with one or two generic type arguments, extend the
/// [SimpleMapper1] or [SimpleMapper2] interface instead, respectively.
///
/// {@category Custom Mappers}
abstract class SimpleMapper<T extends Object> extends _SimpleMapperBase<T> {
  const SimpleMapper();

  T decode(Object value);
  Object? encode(T self);

  @override
  T _decode(Object value, DecodingContext context) {
    return decode(value);
  }

  @override
  Object? _encode(T value, EncodingContext context) {
    return encode(value);
  }
}

/// An interface to define custom mappers for generic types with 1 argument.
///
/// {@category Custom Mappers}
abstract class SimpleMapper1<T extends Object> extends _SimpleMapperBase<T> {
  const SimpleMapper1();

  /// Override as `MyClass<A> decode<A>(Object value)`
  T decode<A>(Object value);

  /// Override as `Object encode<A>(MyClass<A> self)`
  Object? encode<A>(covariant T self);

  @override
  T _decode(Object value, DecodingContext context) {
    return context.callWith1(decode, value);
  }

  @override
  Object? _encode(T value, EncodingContext context) {
    return context.callWith1(encode, value);
  }
}

/// An interface to define custom mappers for generic types with 2 arguments.
///
/// {@category Custom Mappers}
abstract class SimpleMapper2<T extends Object> extends _SimpleMapperBase<T> {
  const SimpleMapper2();

  /// Override as `MyClass<A, B> decode<A, B>(Object value)`
  T decode<A, B>(Object value);

  /// Override as `Object? encode<A, B>(MyClass<A, B> self)`
  Object? encode<A, B>(covariant T self);

  @override
  T _decode(Object value, DecodingContext context) {
    return context.callWith2(decode, value);
  }

  @override
  Object? _encode(T value, EncodingContext context) {
    return context.callWith2(encode, value);
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
