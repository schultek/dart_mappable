import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'main.mapper.g.dart';

@CustomMapper()
class IMapMapper extends SerializableMapper2<IMap> {
  IMapMapper()
      : super(
          decode: IMap.fromJson,
          encode: (map) => map.toJson,
          type: <Key, Val>(f) => f<IMap<Key, Val>>(),
        );
}

typedef SerializableDecoder2<T> = T Function<A, B>(
    Map<String, Object?>, A Function(Object?), B Function(Object?));

typedef SerializableEncoder2<T> = Object Function(
        Object? Function(dynamic), Object? Function(dynamic))
    Function(T);

typedef TypeFactory2<T> = Object Function<A, B>(
    Object Function<V extends T>() f);

class SerializableMapper2<T> extends BaseMapper<T> {
  SerializableMapper2(
      {required SerializableDecoder2<T> decode,
      required SerializableEncoder2<T> encode,
      required TypeFactory2<T> type})
      : _decoder = decode,
        _encoder = encode,
        _type = type;

  final SerializableDecoder2<T> _decoder;
  final SerializableEncoder2<T> _encoder;
  final TypeFactory2<T> _type;

  @override
  Function get decoder => <A, B>(value) {
        return _decoder<A, B>(
            value as Map<String, Object?>, Mapper.fromValue, Mapper.fromValue);
      };

  @override
  Function get encoder => <A, B>(T value) {
        return _encoder(value)(Mapper.toValue<A>, Mapper.toValue<B>);
      };

  @override
  Function get typeFactory => _type;
}

void main() {}
