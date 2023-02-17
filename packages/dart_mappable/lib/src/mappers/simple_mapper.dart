
import '../mapper_container.dart';
import 'mapper_base.dart';
import 'mapper_mixins.dart';

/// Interface to define custom mappers.
///
/// {@category Custom Mappers}
abstract class SimpleMapper<T extends Object> extends _SimpleMapperBase<T> {
  const SimpleMapper();

  T decode(Object value);
  Object? encode(T self);

  @override
  T _decode(DecodingContext<Object> context) {
    return decode(context.value);
  }

  @override
  Object? _encode(EncodingContext<T> context) {
    return encode(context.value);
  }
}

/// Interface to define custom mappers for generic types with 1 argument.
///
/// {@category Custom Mappers}
abstract class SimpleMapper1<T extends Object> extends _SimpleMapperBase<T> {
  const SimpleMapper1();

  /// Override as `MyClass<A> encode<A>(Object value)`
  T decode<A>(Object value);

  /// Override as `Object encode<A>(MyClass<A> self)`
  Object? encode<A>(covariant T self);

  @override
  T _decode(DecodingContext<Object> context) {
    return context.callWith1(decode, _$value);
  }

  @override
  Object? _encode(EncodingContext<T> context) {
    return context.callWith1(encode, _$value);
  }
}

/// Interface to define custom mappers for generic types with 2 arguments.
///
/// {@category Custom Mappers}
abstract class SimpleMapper2<T extends Object> extends _SimpleMapperBase<T> {
  const SimpleMapper2();

  /// Override as `MyClass<A, B> encode<A, B>(Object value)`
  T decode<A, B>(Object value);

  /// Override as `Object? encode<A, B>(MyClass<A, B> self)`
  Object? encode<A, B>(covariant T self);

  @override
  T _decode(DecodingContext<Object> context) {
    return context.callWith2(decode, _$value);
  }

  @override
  Object? _encode(EncodingContext<T> context) {
    return context.callWith2(encode, _$value);
  }
}

abstract class _SimpleMapperBase<T extends Object> extends MapperBase<T> with PrimitiveMethodsMixin<T> {
  const _SimpleMapperBase();

  static MapperContainer? _container;
  MapperContainer get container {
    assert(_container != null, 'SimpleMapper.container can only be accessed inside the decode() or encode() functions.');
    return _container!;
  }

  T _decode(DecodingContext<Object> context);
  Object? _encode(EncodingContext<T> context);

  V _$value<V extends Object>(MappingContext<V> o) => o.value;

  @override
  T decoder(DecodingContext<Object> context) {
    _container = context.container;
    try {
      return _decode(context);
    } finally {
      _container = null;
    }
  }

  @override
  Object? encoder(EncodingContext<Object> context) {
    _container = context.container;
    try {
    return _encode(context.checked<T>());
    } finally {
      _container = null;
    }
  }
}
