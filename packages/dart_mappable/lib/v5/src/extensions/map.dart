part of 'extensions.dart';

extension WrapMapCodable<T> on Codable<T> {
  Codable<Map<K, T>> map<K>() => MapCodable(this);
}

class MapCodable<K, V> implements Codable<Map<K, V>> {
  const MapCodable(this.codable);

  final Codable<V> codable;

  @override
  Decoder<Map<K, V>> decoder() => MapDecoder(codable.decoder());

  @override
  Encoder<Map<K, V>> encoder() => MapEncoder(codable.encoder());
}

class MapDecoder<K, V> extends DecoderBase1<Map<K, V>, V> {
  MapDecoder(Decoder<V> super.decoderA);

  @override
  Map<K, V> decodeSerial(SerialDecoding decoding) {
    final map = <K, V>{};
    for (Object? key; (key = decoding.nextKey()) != null;) {
      map[key as K] = decoding.decodeObject(decoderA!);
    }
    return map;
  }

  @override
  Map<K, V> decodeStruct(StructDecoding decoding) {
    return decoding.decodeMapObject(decoderA!);
  }
}

class MapEncoder<K, V> extends EncoderBase1<Map<K, V>, V> {
  MapEncoder(Encoder<V> super.encoderA);

  @override
  void encodeSerial(Map<K, V> value, SerialEncoding encoding) {
    encoding.startObject<K>();
    for (final key in value.keys) {
      encoding.encodeKey(key);
      encoding.encodeObject(value[key], encoderA!);
    }
    encoding.endArray();
  }

  @override
  void encodeStruct(Map<K, V> value, StructEncoding encoding) {
    encoding.encodeMap(value, (_) => encoderA!);
  }
}
