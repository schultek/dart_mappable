import 'package:collection/collection.dart';

import '../mapper_exception.dart';
import '../mapper_container.dart';
import '../mapper_utils.dart';
import 'mapper_base.dart';
import 'mapper_mixins.dart';
import 'simple_mapper.dart';

class PrimitiveMapper<T extends Object> extends MapperBase<T> {
  const PrimitiveMapper([T Function(Object value)? decoder, this.exactType])
      : decoder = decoder ?? _cast<T>;

  final T Function(Object value) decoder;
  final Type? exactType;

  @override
  Type get type => exactType ?? super.type;
  @override
  bool isFor(dynamic v) => exactType != null ? v.runtimeType == exactType : super.isFor(v);

  @override
  MapperElementBase<PrimitiveMapper<T>, T> createElement(MapperContainer container) {
    return _PrimitiveMapperElement<T>(this, container);
  }

  static T _cast<T>(v) => v as T;
}

class _PrimitiveMapperElement<T extends Object> extends MapperElementBase<PrimitiveMapper<T>, T>
    with PrimitiveMethodsMixin<PrimitiveMapper<T>, T> {
  const _PrimitiveMapperElement(
      super.mapper, super.container);

  @override
  T decoder(DecodingOptions<Object> options) {
    return mapper.decoder(options.value);
  }

  @override
  Object encoder(EncodingOptions<Object> options) {
    return options.value;
  }
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
  MapperElementBase<IterableMapper<I>, I> createElement(MapperContainer container) {
    return _IterableMapperElement<I>(this, container);
  }
}

class _IterableMapperElement<I extends Iterable> extends MapperElementBase<IterableMapper<I>, I>
    with  MapperEqualityMixin<IterableMapper<I>, I> {
  _IterableMapperElement(super.mapper, super.container);

  @override
  I decoder(DecodingOptions options) {
    return options.apply(this).checked<Iterable>().call1(<T>(o) {
      return mapper.fromIterable(o.value.map((v) {
        return container.$dec<T>(v, 'item');
      })) as I;
    });
  }


  @override
  Object encoder(EncodingOptions<Object> options) {
    return options.apply(this).checked<I>().call1(<T>(o) => o.value.map((v) => container.$enc<T>(v as T, 'item')).toList());
  }

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
  MapperElementBase<MapMapper<M>, M> createElement(MapperContainer container) {
    return _MapMapperElement<M>(this, container);
  }
}

class _MapMapperElement<M extends Map> extends MapperElementBase<MapMapper<M>, M>
    with  MapperEqualityMixin<MapMapper<M>, M> {
  _MapMapperElement(super.mapper, super.container);

  @override
  M decoder(DecodingOptions options) {
    return options.apply(this).checked<Map>().call2(<K, V>(o) {
      return mapper.fromMap(o.value.map((key, value) {
        return MapEntry(
            container.$dec<K>(key, 'key'), container.$dec<V>(value, 'value'));
      })) as M;
    });
  }

  @override
  Object encoder(EncodingOptions<Object> options) {
    return options.apply(this).checked<M>().call2(<K, V>(o) => o.value.map((key, value) {
      return MapEntry(container.toValue<K>(key as K), container.toValue<V>(value as V));
    }));
  }

  @override
  late Equality equality = MapEquality(
      keys: MapperEquality(container), values: MapperEquality(container));

  @override
  String stringify(M self) =>
      '{${self.entries.map((e) => '${container.asString(e.key)}: '
          '${container.asString(e.value)}').join(', ')}}';
}

typedef SerializableDecoder1<T, V> = T Function<A>(V, A Function(Object?));
typedef SerializableEncoder1<T> = Object Function(Object? Function(dynamic))
    Function(T);

typedef SerializableDecoder2<T, V> = T Function<A, B>(
    V, A Function(Object?), B Function(Object?));
typedef SerializableEncoder2<T> = Object Function(
        Object? Function(dynamic), Object? Function(dynamic))
    Function(T);

class SerializableMapper<T extends Object, V extends Object> extends MapperBase<T> {
  late T Function(DecodingContext<V, SerializableMapper<T, V>, T> c) decoder;
  late Object Function(EncodingContext<T, SerializableMapper<T, V>, T> c) encoder;

  @override
  late Function typeFactory;

  SerializableMapper({
    required T Function(V) decode,
    required Object Function() Function(T) encode,
  })  : decoder = ((c) => decode(c.value)),
        encoder = ((c) => encode(c.value)()),
        typeFactory = ((f) => f<T>());

  SerializableMapper.arg1({
    required SerializableDecoder1<T, V> decode,
    required SerializableEncoder1<T> encode,
    required TypeFactory1 type,
  }) {
    decoder = ((c) => c.call1(<A>(c) => decode<A>(c.value, c.context.container.fromValue<A>)));
    encoder = ((c) => c.call1(<A>(c) => encode(c.value)((o) => c.context.container.toValue<A>(o as A)))!);
    typeFactory = type;
  }

  SerializableMapper.arg2({
    required SerializableDecoder2<T, V> decode,
    required SerializableEncoder2<T> encode,
    required TypeFactory2 type,
  }) {
    decoder = ((c) => c.call2(<A, B>(c) => decode<A, B>(c.value, c.context.container.fromValue<A>, c.context.container.fromValue<B>)));
    encoder = ((c) => c.call2(<A, B>(c) => encode(c.value)((o) => c.context.container.toValue<A>(o as A), (o) => c.context.container.toValue<B>(o as B))));
    typeFactory = type;
  }

  @override
  MapperElementBase<SerializableMapper<T, V>, T> createElement(MapperContainer container) {
    return _SerializableMapperElement(this, container);
  }
}

class _SerializableMapperElement<T extends Object, V extends Object> extends MapperElementBase<SerializableMapper<T, V>, T>
    with PrimitiveMethodsMixin<SerializableMapper<T, V>, T> {
  _SerializableMapperElement(super.mapper, super.container);

  @override
  T decoder(DecodingOptions<Object> options) {
    return mapper.decoder(options.apply(this).checked<V>());
  }

  @override
  Object encoder(EncodingOptions<Object> options) {
    var context = options.apply(this).checked<T>();
    return mapper.encoder(context);
  }
}
