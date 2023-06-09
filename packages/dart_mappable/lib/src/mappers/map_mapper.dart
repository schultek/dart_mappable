import 'package:collection/collection.dart';
import 'package:type_plus/type_plus.dart';

import '../mapper_utils.dart';
import 'mapper_base.dart';
import 'mapper_mixins.dart';
import 'mapping_context.dart';

/// The default mapper for [Map]s.
///
/// {@category Custom Mappers}
class MapMapper<M extends Map> extends MapperBase<M>
    with MapperEqualityMixin<M> {
  MapMapper(this.fromMap, this.typeFactory);

  Map<K, V> Function<K, V>(Map<K, V> map) fromMap;
  @override
  final Function typeFactory;

  @override
  bool includeTypeId<V>(v) => false;

  @override
  M decoder(Object value, DecodingContext context) {
    return _MapDecoder(this, context, value.checked<Map>()).decode();
  }

  @override
  Object encoder(M value, EncodingContext context) {
    return _MapEncoder(this, context, value).encode();
  }

  @override
  Equality equality(Equality child) => MapEquality(keys: child, values: child);

  @override
  String stringify(M value, MappingContext context) =>
      '{${value.entries.map((e) => '${context.container.asString(e.key)}: '
          '${context.container.asString(e.value)}').join(', ')}}';
}

/// {@nodoc}
class _MapDecoder<M extends Map> {
  final MapMapper<M> mapper;
  final DecodingContext context;
  final Map value;

  _MapDecoder(this.mapper, this.context, this.value);

  M decode() {
    assert(context.args.length == 2);
    return context.args.first.provideTo<Map>(_decode) as M;
  }

  Map<K, dynamic> _decode<K>() {
    return _MapDecoder2<M, K>(mapper, context, value).decode();
  }
}

/// {@nodoc}
class _MapDecoder2<M extends Map, K> {
  final MapMapper<M> mapper;
  final DecodingContext context;
  final Map value;

  _MapDecoder2(this.mapper, this.context, this.value);

  Map<K, dynamic> decode() {
    assert(context.args.length == 2);
    return context.args.last.provideTo(_decode);
  }

  Map<K, V> _decode<V>() {
    return mapper.fromMap(value.checked<Map>().map((key, value) {
      return MapEntry(
        context.$dec<K>(key, 'key'),
        context.$dec<V>(value, 'value'),
      );
    }));
  }
}

/// {@nodoc}
class _MapEncoder<M extends Map> {
  final MapMapper<M> mapper;
  final EncodingContext context;
  final M value;

  _MapEncoder(this.mapper, this.context, this.value);

  Object encode() {
    assert(context.args.length == 2);
    return context.args.first.provideTo(_encode);
  }

  Map<dynamic, dynamic> _encode<K>() {
    return _MapEncoder2<M, K>(mapper, context, value).encode();
  }
}

/// {@nodoc}
class _MapEncoder2<M extends Map, K> {
  final MapMapper<M> mapper;
  final EncodingContext context;
  final M value;

  _MapEncoder2(this.mapper, this.context, this.value);

  Map<dynamic, dynamic> encode() {
    assert(context.args.length == 2);
    return context.args.last.provideTo(_encode);
  }

  Map<dynamic, dynamic> _encode<V>() {
    var onlyStringKeys = true;
    var result = value.map((key, value) {
      var resultKey = context.$enc<K>(key as K, 'key', context.options);
      if (onlyStringKeys && resultKey is! String) {
        onlyStringKeys = false;
      }
      return MapEntry(
        resultKey,
        context.$enc<V>(value as V, 'value', context.options),
      );
    });
    if (onlyStringKeys) {
      return result.cast<String, dynamic>();
    }
    return result;
  }
}
