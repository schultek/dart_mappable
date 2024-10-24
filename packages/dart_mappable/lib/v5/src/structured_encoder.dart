import 'encoder.dart';

class GeneralizedStructuredEncoder implements Encoder {
  GeneralizedStructuredEncoder(this.encoder);

  final StructuredEncoder encoder;

  @override
  KeyedEncoder<Key> encodeKeyed<Key>() {
    return KeyedGeneralizedStructuredEncoder(encoder.encodeKeyed());
  }

  @override
  Object? encodeValue(Object? value) {
    return encoder.encodeValue(value);
  }
}

class KeyedGeneralizedStructuredEncoder<Key> implements KeyedEncoder<Key> {
  KeyedGeneralizedStructuredEncoder(this.encoder);

  final KeyedStructuredEncoder<Key> encoder;

  @override
  void encodeEncodable(Key key, Encodable value) {
    encoder.encodeEncodable(key, value);
  }

  @override
  void encodeValue(Key key, Object? value) {
    encoder.encodeValue(key, value);
  }
}

extension type StructuredEncoder._(Null _) {
  static Object? encode(Encodable value) {
    return value.encodeStructured(StructuredEncoder._(null));
  }

  Object? encodeValue(Object? value) => value;

  KeyedStructuredEncoder<Key> encodeKeyed<Key>() {
    return KeyedStructuredEncoder(<Key, dynamic>{});
  }
}

extension type KeyedStructuredEncoder<Key>(Map<Key, dynamic> _value) {
  @pragma('vm:prefer-inline')
  void encodeValue(Key key, Object? value) {
    _value[key] = value;
  }

  @pragma('vm:prefer-inline')
  void encodeEncodable(Key key, Encodable value) {
    _value[key] = value.encodeStructured(StructuredEncoder._(null));
  }
}
