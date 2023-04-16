import 'package:collection/collection.dart';
import 'package:type_plus/type_plus.dart';

import '../mapper_utils.dart';
import 'mapper_base.dart';
import 'mapper_mixins.dart';

/// The default mapper for iterables like [List] and [Set].
///
/// {@category Custom Mappers}
class IterableMapper<I extends Iterable> extends MapperBase<I>
    with MapperEqualityMixin<I> {
  IterableMapper(this.fromIterable, this.typeFactory);

  final Iterable<U> Function<U>(Iterable<U> iterable) fromIterable;

  @override
  final Function typeFactory;

  @override
  bool includeTypeId<V>(v) => false;

  @override
  I decoder(Object value, DecodingContext context) {
    return _IterableDecoder(this, context, value.checked<Iterable>()).decode();
  }

  @override
  Object encoder(I value, EncodingContext context) {
    return _IterableEncoder(this, context, value).encode();
  }

  @override
  Equality equality(Equality child) => IterableEquality(child);

  @override
  String stringify(I value, MappingContext context) =>
      '(${value.map((e) => context.container.asString(e)).join(', ')})';
}

/// {@nodoc}
class _IterableDecoder<I extends Iterable> {
  final IterableMapper<I> mapper;
  final DecodingContext context;
  final Iterable value;

  _IterableDecoder(this.mapper, this.context, this.value);

  I decode() {
    return context.args.single.provideTo<Iterable>(_decode) as I;
  }

  Iterable<T> _decode<T>() {
    return mapper.fromIterable(value.map((v) {
      return context.container.$dec<T>(v, 'item');
    }));
  }
}

/// {@nodoc}
class _IterableEncoder<I extends Iterable> {
  final IterableMapper<I> mapper;
  final EncodingContext context;
  final I value;

  _IterableEncoder(this.mapper, this.context, this.value);

  Object encode() {
    return context.args.single.provideTo(_encode);
  }

  Iterable<dynamic> _encode<T>() {
    return value
        .map((v) => context.container.$enc<T>(v as T, 'item', context.options))
        .toList();
  }
}
