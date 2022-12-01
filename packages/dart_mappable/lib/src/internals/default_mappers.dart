import 'package:collection/collection.dart';

import '../core/mapper_exception.dart';
import '../core/mappers.dart';
import 'mapper_container.dart';
import 'mapper_utils.dart';

mixin MapperAs<B extends MapperBase<T>, T> on MapperElementBase<T> {
  @override
  B get mapper => super.mapper as B;
}

class PrimitiveMapper<T> with MapperBase<T> {
  const PrimitiveMapper(this.decoder);
  final T Function(dynamic value) decoder;

  @override
  bool isFor(dynamic v) => v.runtimeType == T;

  @override
  MapperElementBase<T> createElement(MapperContainer container) {
    return PrimitiveMapperElement<T>(this, container);
  }
}

class PrimitiveMapperElement<T> extends MapperElementBase<T>
    with MapperAs<PrimitiveMapper<T>, T>, PrimitiveMethodsMixin<T> {
  const PrimitiveMapperElement(PrimitiveMapper<T> super.mapper, super.container);

  @override
  Function get decoder => mapper.decoder;
  @override
  Function get encoder => (T value) => value;
}

abstract class EnumMapperElement<T> extends SimpleMapperElement<T>
    with PrimitiveMethodsMixin<T> {
  EnumMapperElement(super.mapper, super.container);
}

class DateTimeMapper with MapperBase<DateTime> {
  const DateTimeMapper();

  @override
  MapperElementBase<DateTime> createElement(MapperContainer container) {
    return DateTimeMapperElement(this, container);
  }
}

class DateTimeMapperElement extends SimpleMapperElement<DateTime>
    with PrimitiveMethodsMixin<DateTime> {
  DateTimeMapperElement(super.mapper, super.container);

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

class IterableMapper<I extends Iterable> with MapperBase<I> {
  IterableMapper(this.fromIterable, this.typeFactory);

  final Iterable<U> Function<U>(Iterable<U> iterable) fromIterable;

  @override
  final Function typeFactory;

  @override
  MapperElementBase<I> createElement(MapperContainer container) {
    return IterableMapperElement<I>(this, container);
  }
}

class IterableMapperElement<I extends Iterable> extends MapperElementBase<I>
    with MapperAs<IterableMapper<I>, I>, MapperEqualityMixin<I> {
  IterableMapperElement(super.mapper, super.container);

  @override
  Function get decoder => <T>(dynamic l) => checked(
      l,
      (Iterable l) =>
          mapper.fromIterable(l.map((v) => container.$dec<T>(v, 'item'))));
  @override
  Function get encoder => <T>(Iterable<T> self) =>
      self.map((v) => container.$enc<T>(v, 'item')).toList();

  @override
  late Equality equality = IterableEquality(MapperEquality(container));

  @override
  String stringify(I self) =>
      '(${self.map((e) => container.asString(e)).join(', ')})';
}

class MapMapper<M extends Map> with MapperBase<M> {
  MapMapper(this.fromMap, this.typeFactory);

  Map<K, V> Function<K, V>(Map<K, V> map) fromMap;
  @override
  final Function typeFactory;

  @override
  MapperElementBase<M> createElement(MapperContainer container) {
    return MapMapperElement<M>(this, container);
  }
}

class MapMapperElement<M extends Map> extends MapperElementBase<M>
    with MapperAs<MapMapper<M>, M>, MapperEqualityMixin<M> {
  MapMapperElement(super.mapper, super.container);

  @override
  Function get decoder => <K, V>(dynamic m) => checked(
      m,
      (Map m) => mapper.fromMap(m.map((key, value) => MapEntry(
          container.$dec<K>(key, 'key'), container.$dec<V>(value, 'value')))));
  @override
  Function get encoder => <K, V>(Map<K, V> self) => self.map((key, value) =>
      MapEntry(container.toValue<K>(key), container.toValue<V>(value)));

  @override
  late Equality equality = MapEquality(
      keys: MapperEquality(container), values: MapperEquality(container));

  @override
  String stringify(M self) =>
      '{${self.entries.map((e) => '${container.asString(e.key)}: '
          '${container.asString(e.value)}').join(', ')}}';
}

mixin PrimitiveMethodsMixin<T> implements MapperElementBase<T> {
  @override
  bool equals(T self, T other) => self == other;
  @override
  int hash(T self) => self.hashCode;
  @override
  String stringify(T self) => self.toString();
}

mixin MapperEqualityMixin<T> implements MapperElementBase<T> {
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
