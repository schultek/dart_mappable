import 'package:collection/collection.dart';

import '../core/mapper_exception.dart';
import '../core/mappers.dart';
import 'mapper_container.dart';
import 'mapper_utils.dart';

class PrimitiveMapper<T> extends BaseMapper<T> with PrimitiveMethodsMixin<T> {
  const PrimitiveMapper(this.decoder);

  @override
  final T Function(dynamic value) decoder;
  @override
  Function get encoder => (T value) => value;
  @override
  Function get typeFactory => (f) => f<T>();

  @override
  bool isFor(dynamic v) => v.runtimeType == T;
}

abstract class EnumMapper<T> extends SimpleMapper<T>
    with PrimitiveMethodsMixin<T> {
  EnumMapper();
}

class DateTimeMapper extends SimpleMapper<DateTime>
    with PrimitiveMethodsMixin<DateTime> {
  @override
  DateTime decode(dynamic value) {
    if (value is String) {
      return DateTime.parse(value);
    } else if (value is num) {
      return DateTime.fromMillisecondsSinceEpoch(value.round());
    } else {
      throw MapperException.unexpectedType(
          value.runtimeType, DateTime, 'String or num');
    }
  }

  @override
  String encode(DateTime self) {
    return self.toUtc().toIso8601String();
  }
}

class IterableMapper<I extends Iterable> extends BaseMapper<I>
    with MapperEqualityMixin<I> {
  Iterable<U> Function<U>(Iterable<U> iterable) fromIterable;
  final MapperContainer mapper;
  IterableMapper(this.fromIterable, this.typeFactory, this.mapper);

  @override
  Function get decoder => <T>(dynamic l) => checked(
      l, (Iterable l) => fromIterable(l.map((v) => mapper.$dec<T>(v, 'item'))));
  @override
  Function get encoder => <T>(Iterable<T> self) =>
      self.map((v) => mapper.$enc<T>(v, 'item')).toList();
  @override
  Function typeFactory;

  @override
  late Equality equality = IterableEquality(MapperEquality(mapper));

  @override
  String stringify(I self) =>
      '(${self.map((e) => mapper.asString(e)).join(', ')})';
}

class MapMapper<M extends Map> extends BaseMapper<M>
    with MapperEqualityMixin<M> {
  Map<K, V> Function<K, V>(Map<K, V> map) fromMap;
  final MapperContainer mapper;
  MapMapper(this.fromMap, this.typeFactory, this.mapper);

  @override
  Function get decoder => <K, V>(dynamic m) => checked(
      m,
      (Map m) => fromMap(m.map((key, value) => MapEntry(
          mapper.$dec<K>(key, 'key'), mapper.$dec<V>(value, 'value')))));
  @override
  Function get encoder => <K, V>(Map<K, V> self) => self.map((key, value) =>
      MapEntry(mapper.toValue<K>(key), mapper.toValue<V>(value)));
  @override
  Function typeFactory;

  @override
  late Equality equality =
      MapEquality(keys: MapperEquality(mapper), values: MapperEquality(mapper));

  @override
  String stringify(M self) =>
      '{${self.entries.map((e) => '${mapper.asString(e.key)}: '
          '${mapper.asString(e.value)}').join(', ')}}';
}

mixin PrimitiveMethodsMixin<T> implements BaseMapper<T> {
  @override
  bool equals(T self, T other) => self == other;
  @override
  int hash(T self) => self.hashCode;
  @override
  String stringify(T self) => self.toString();
}

mixin MapperEqualityMixin<T> implements BaseMapper<T> {
  Equality get equality;

  @override
  bool equals(T self, T other) => equality.equals(self, other);
  @override
  int hash(T self) => equality.hash(self);
}

class MapperEquality implements Equality {
  final MapperContainer mapper;
  MapperEquality(this.mapper);

  @override
  bool equals(dynamic e1, dynamic e2) => mapper.isEqual(e1, e2);
  @override
  int hash(dynamic e) => mapper.hash(e);
  @override
  bool isValidKey(Object? o) => true;
}

typedef SerializableDecoder1<T> = T Function<A>(
    Map<String, dynamic>, A Function(Object?));
typedef SerializableEncoder1<T> = Object Function(Object? Function(dynamic))
    Function(T);
typedef TypeFactory1<T> = Object? Function<A>(
    Object? Function<V extends T>() f);

typedef SerializableDecoder2<T> = T Function<A, B>(
    Map<String, dynamic>, A Function(Object?), B Function(Object?));
typedef SerializableEncoder2<T> = Object Function(
        Object? Function(dynamic), Object? Function(dynamic))
    Function(T);
typedef TypeFactory2<T> = Object? Function<A, B>(
    Object? Function<V extends T>() f);

class SerializableMapper<T> extends BaseMapper<T> {
  factory SerializableMapper({
    required T Function(Map<String, dynamic>) decode,
    required Object Function() Function(T) encode,
    required Object Function(Object Function<V extends T>() f) type,
    required MapperContainer mapper,
  }) {
    return SerializableMapper._(
      decoder: (v) => checked<T, Map<String, dynamic>>(v, decode),
      encoder: (T value) => encode(value)(),
      typeFactory: type,
    );
  }

  factory SerializableMapper.arg1({
    required SerializableDecoder1<T> decode,
    required SerializableEncoder1<T> encode,
    required TypeFactory1<T> type,
    required MapperContainer mapper,
  }) {
    d<V>(dynamic v) => mapper.fromValue<V>(v);
    e<V>(dynamic v) => mapper.toValue<V>(v as V);
    return SerializableMapper._(
      decoder: <A>(v) =>
          checked<T, Map<String, dynamic>>(v, (m) => decode<A>(m, d)),
      encoder: <A>(T v) => type<A>(
          <V extends T>() => checked<Object?, V>(v, (d) => encode(d)(e<A>))),
      typeFactory: type,
    );
  }

  factory SerializableMapper.arg2({
    required SerializableDecoder2<T> decode,
    required SerializableEncoder2<T> encode,
    required TypeFactory2<T> type,
    required MapperContainer mapper,
  }) {
    d<V>(dynamic v) => mapper.fromValue<V>(v);
    e<V>(dynamic v) => mapper.toValue<V>(v as V);
    return SerializableMapper._(
      decoder: <A, B>(v) =>
          checked<T, Map<String, dynamic>>(v, (m) => decode<A, B>(m, d, d)),
      encoder: <A, B>(T v) => type<A, B>(<V extends T>() =>
          checked<Object?, V>(v, (x) => encode(x)(e<A>, e<B>))),
      typeFactory: type,
    );
  }

  SerializableMapper._({
    required this.decoder,
    required this.encoder,
    required this.typeFactory,
  });

  @override
  late Function decoder;

  @override
  late Function encoder;

  @override
  late Function typeFactory;
}
