import '../mapper_container.dart';
import 'mapper_base.dart';
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

/// An interface to define custom mappers for generic types with one bounded argument.
///
/// {@category Custom Mappers}
abstract class SimpleMapper1Bounded<T extends Object, B1>
    extends _SimpleMapperBase<T> {
  const SimpleMapper1Bounded();

  /// Override as `MyClass<A> decode<A extends ...>(Object value)`
  T decode<A extends B1>(Object value);

  /// Override as `Object? encode<A extends ...>(MyClass<A> self)`
  Object? encode<A extends B1>(covariant T self);

  @override
  T _decode(Object value, DecodingContext context) {
    assert(context.args.length == 1);
    return context.callWith(decode, value);
  }

  @override
  Object? _encode(T value, EncodingContext context) {
    assert(context.args.length == 1);
    return context.callWith(encode, value);
  }
}

/// An interface to define custom mappers for generic types with one argument.
///
/// For generic types with one bounded type argument extend the [SimpleMapper1Bounded]
/// interface instead.
///
/// {@category Custom Mappers}
abstract class SimpleMapper1<T extends Object>
    extends SimpleMapper1Bounded<T, dynamic> {
  const SimpleMapper1();

  /// Override as `MyClass<A> decode<A>(Object value)`
  @override
  T decode<A>(Object value);

  /// Override as `Object? encode<A>(MyClass<A> self)`
  @override
  Object? encode<A>(covariant T self);
}

/// An interface to define custom mappers for generic types with two bounded arguments.
///
/// {@category Custom Mappers}
abstract class SimpleMapper2Bounded<T extends Object, B1, B2>
    extends _SimpleMapperBase<T> {
  const SimpleMapper2Bounded();

  /// Override as `MyClass<A, B> decode<A extends ..., B extends ...>(Object value)`
  T decode<A extends B1, B extends B2>(Object value);

  /// Override as `Object? encode<A, B>(MyClass<A, B> self)`
  Object? encode<A extends B1, B extends B2>(covariant T self);

  @override
  T _decode(Object value, DecodingContext context) {
    assert(context.args.length == 2);
    return context.callWith(decode, value);
  }

  @override
  Object? _encode(T value, EncodingContext context) {
    assert(context.args.length == 2);
    return context.callWith(encode, value);
  }
}

/// An interface to define custom mappers for generic types with two arguments.
///
/// For generic types with two bounded type arguments extend the [SimpleMapper2Bounded]
/// interface instead.
///
/// {@category Custom Mappers}
abstract class SimpleMapper2<T extends Object>
    extends SimpleMapper2Bounded<T, dynamic, dynamic> {
  const SimpleMapper2();

  /// Override as `MyClass<A, B> decode<A, B>(Object value)`
  @override
  T decode<A, B>(Object value);

  /// Override as `Object? encode<A, B>(MyClass<A, B> self)`
  @override
  Object? encode<A, B>(covariant T self);
}

abstract class _SimpleMapperBase<T extends Object> extends MapperBase<T> {
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

  @override
  bool equals(value, other, MappingContext context) => value == other;

  @override
  int hash(T value, MappingContext context) => value.hashCode;

  @override
  String stringify(T value, MappingContext context) => value.toString();
}
