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

  T fromString(String value);
  String toStringValue(T value);

  @override
  T decode(dynamic value) => checked(value, fromString);
  @override
  dynamic encode(T self) => toStringValue(self);
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
  Function get encoder =>
      (I self) => self.map((v) => mapper.$enc(v, 'item')).toList();
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
  Function get encoder => (M self) => self.map(
      (key, value) => MapEntry(mapper.toValue(key), mapper.toValue(value)));
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
