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
  T _decode(DecodingOptions<Object> options) {
    return decode(options.value);
  }

  @override
  Object? _encode(EncodingOptions<T> options) {
    return encode(options.value);
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
  Object? encode<A>(T self);

  @override
  T _decode(DecodingOptions<Object> options) {
    return options.callWith1(decode, _$value);
  }

  @override
  Object? _encode(EncodingOptions<T> options) {
    return options.callWith1(encode, _$value);
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
  Object? encode<A, B>(T self);

  @override
  T _decode(DecodingOptions<Object> options) {
    return options.callWith2(decode, _$value);
  }

  @override
  Object? _encode(EncodingOptions<T> options) {
    return options.callWith2(encode, _$value);
  }
}

abstract class _SimpleMapperBase<T extends Object> extends MapperBase<T> with PrimitiveMethodsMixin<T> {
  const _SimpleMapperBase();

  T _decode(DecodingOptions<Object> options);
  Object? _encode(EncodingOptions<T> options);

  V _$value<V extends Object>(MappingOptions<V> o) => o.value;

  @override
  T decoder(DecodingOptions<Object> options) {
    return _decode(options);
  }

  @override
  Object? encoder(EncodingOptions<Object> options) {
    return _encode(options.checked<T>());
  }
}
