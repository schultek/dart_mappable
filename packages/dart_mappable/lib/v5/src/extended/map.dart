part of 'extended.dart';

extension WrapMapCodable<T> on Codable<T> {
  Codable<Map<K, T>> map<K>() => MapCodable(this);
}

class MapCodable<K, V> implements Codable<Map<K, V>> {
  const MapCodable(this.codable);

  final Codable<V> codable;

  @override
  Decode<Map<K, V>> decode() => MapDecode(codable.decode());

  @override
  Encode<Map<K, V>> encode() => MapEncode(codable.encode());
}

class MapDecode<K, V> extends DecodeBase1<Map<K, V>, V> implements DecodeKeyed<Map<K, V>>, DecodeAny<Map<K, V>> {
  MapDecode(Decode<V> super.decodeA);

  @override
  Map<K, V> decodeKeyed(KeyedDecoder keyed) {
    final map = <K, V>{};
    for (Object? key; (key = keyed.nextKey()) != null;) {
      map[key as K] = keyed.decodeObject(decodeA!);
    }
    return map;
  }

  @override
  Map<K, V> decodeAny(Decoder decoder) {
    return decoder.decodeMap(null, decodeA!);
  }
}

class MapEncode<K, V> extends EncodeBase1<Map<K, V>, V> {
  MapEncode(Encode<V> super.encodeA);
  
  @override
  void encode(Map<K, V> value, Encoder encoder) {
    encoder.encodeMap(value, encodeValue: (_) => encodeA!);
  }
}
