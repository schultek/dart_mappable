import 'mapper_base.dart';
import '../mapper_container.dart';

/// Interface to define custom mappers.
///
/// {@category Custom Mappers}
abstract class SimpleMapper<T extends Object> extends _SimpleMapperBase<T> {
  const SimpleMapper();

  T decode(Object value);
  Object? encode(T self);

  @override
  T decoder(SimpleDecodingContext<T> context) {
    return decode(context.value);
  }

  @override
  Object? encoder(SimpleEncodingContext<T> context) {
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
  Object? encode<A>(T self);

  @override
  T decoder(SimpleDecodingContext<T> context) {
    return context.callWith1(decode, _$value);
  }

  @override
  Object? encoder(SimpleEncodingContext<T> context) {
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
  Object? encode<A, B>(T self);

  @override
  T decoder(SimpleDecodingContext<T> context) {
    return context.callWith2(decode, _$value);
  }

  @override
  Object? encoder(SimpleEncodingContext<T> context) {
    return context.callWith2(encode, _$value);
  }
}

typedef SimpleDecodingContext<T extends Object> = DecodingContext<Object, _SimpleMapperBase<T>, T>;
typedef SimpleEncodingContext<T extends Object> = EncodingContext<T, _SimpleMapperBase<T>, T>;

abstract class _SimpleMapperBase<T extends Object> extends MapperBase<T> {
  const _SimpleMapperBase();

  T decoder(SimpleDecodingContext<T> context);
  Object? encoder(EncodingContext<T, _SimpleMapperBase<T>, T> context);

  bool equals(T self, T other) => self == other;
  int hash(T self) => self.hashCode;
  String stringify(T self) => self.toString();

  @override
  _SimpleMapperElement<T> createElement(MapperContainer container) {
    return _SimpleMapperElement<T>(this, container);
  }

  V _$value<V extends Object>(MappingOptions<V> o) => o.value;
}

class _SimpleMapperElement<T extends Object>
    extends MapperElementBase<_SimpleMapperBase<T>, T> {
  const _SimpleMapperElement(super.mapper, super.container);

  @override
  T decoder(DecodingOptions<Object> options) {
    return mapper.decoder(options.apply<_SimpleMapperBase<T>, T>(this));
  }

  @override
  Object? encoder(EncodingOptions<Object> options) {
    return mapper.encoder(options.apply(this).checked<T>());
  }

  @override
  bool equals(T self, T other) => mapper.equals(self, other);
  @override
  int hash(T self) => mapper.hash(self);
  @override
  String stringify(T self) => mapper.stringify(self);
}
