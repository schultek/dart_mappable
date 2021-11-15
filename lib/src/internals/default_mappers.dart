import 'package:collection/collection.dart';

import '../core/mappers.dart';
import 'mapper_container.dart';
import 'mapper_utils.dart';

class PrimitiveMapper<T> extends BaseMapper<T> {
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

class EnumMapper<T> extends SimpleMapper<T> {
  EnumMapper(this._decoder, this._encoder);

  final T Function(String value) _decoder;
  final String Function(T value) _encoder;

  @override
  T decode(dynamic value) => checked(value, _decoder);
  @override
  dynamic encode(T self) => _encoder(self);
}

class DateTimeMapper extends SimpleMapper<DateTime> {
  @override
  DateTime decode(dynamic value) {
    if (value is String) {
      return DateTime.parse(value);
    } else if (value is num) {
      return DateTime.fromMillisecondsSinceEpoch(value.round());
    } else {
      throw MapperException(
          'Cannot decode value of type ${value.runtimeType} to type DateTime, '
          'because a value of type String or num is expected.');
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
      l, (Iterable l) => fromIterable(l.map((v) => mapper.fromValue<T>(v))));
  @override
  Function get encoder =>
      (I self) => self.map((v) => mapper.toValue(v)).toList();
  @override
  Function typeFactory;

  @override
  late Equality equality = IterableEquality(MapperEquality(mapper));
}

class MapMapper<M extends Map> extends BaseMapper<M>
    with MapperEqualityMixin<M> {
  Map<K, V> Function<K, V>(Map<K, V> map) fromMap;
  final MapperContainer mapper;
  MapMapper(this.fromMap, this.typeFactory, this.mapper);

  @override
  Function get decoder => <K, V>(dynamic m) => checked(
      m,
      (Map m) => fromMap(m.map((key, value) =>
          MapEntry(mapper.fromValue<K>(key), mapper.fromValue<V>(value)))));
  @override
  Function get encoder => (M self) => self.map(
      (key, value) => MapEntry(mapper.toValue(key), mapper.toValue(value)));
  @override
  Function typeFactory;

  @override
  late Equality equality =
      MapEquality(keys: MapperEquality(mapper), values: MapperEquality(mapper));
}

mixin MapperEqualityMixin<T> implements BaseMapper<T> {
  Equality get equality;

  @override
  bool? equals(T self, T other) => equality.equals(self, other);
  @override
  int? hash(T self) => equality.hash(self);
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
