import 'package:collection/collection.dart';

import 'mapper_exception.dart';
import 'mapper_base.dart';
import 'mapper_container.dart';
import 'mapper_mixins.dart';
import 'mapper_utils.dart';
import 'simple_mapper.dart';

class PrimitiveMapper<T> extends MapperBase<T> {
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
  const PrimitiveMapperElement(
      PrimitiveMapper<T> super.mapper, super.container);

  @override
  Function get decoder => mapper.decoder;
  @override
  Function get encoder => (T value) => value;
}

/// {@category Custom Mappers}
abstract class EnumMapper<T extends Enum> extends SimpleMapper<T> {
  const EnumMapper();
}

class DateTimeMapper extends SimpleMapper<DateTime> {
  const DateTimeMapper();

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

/// {@category Custom Mappers}
class IterableMapper<I extends Iterable> extends MapperBase<I> {
  IterableMapper(this.fromIterable, this.typeFactory);

  final Iterable<U> Function<U>(Iterable<U> iterable) fromIterable;

  @override
  final Function typeFactory;

  @override
  MapperElementBase<I> createElement(MapperContainer container) {
    return _IterableMapperElement<I>(this, container);
  }
}

class _IterableMapperElement<I extends Iterable> extends MapperElementBase<I>
    with MapperAs<IterableMapper<I>, I>, MapperEqualityMixin<I> {
  _IterableMapperElement(IterableMapper<I> super.mapper, super.container);

  @override
  Function get decoder => <T>(dynamic l) => checkedType(
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

/// {@category Custom Mappers}
class MapMapper<M extends Map> extends MapperBase<M> {
  MapMapper(this.fromMap, this.typeFactory);

  Map<K, V> Function<K, V>(Map<K, V> map) fromMap;
  @override
  final Function typeFactory;

  @override
  MapperElementBase<M> createElement(MapperContainer container) {
    return _MapMapperElement<M>(this, container);
  }
}

class _MapMapperElement<M extends Map> extends MapperElementBase<M>
    with MapperAs<MapMapper<M>, M>, MapperEqualityMixin<M> {
  _MapMapperElement(MapMapper<M> super.mapper, super.container);

  @override
  Function get decoder => <K, V>(dynamic m) => checkedType(
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
