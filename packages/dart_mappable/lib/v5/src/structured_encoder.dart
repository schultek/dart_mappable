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
  static final _i = StructuredEncoder._(null);

  static Object? encode(Encodable value) {
    return value.encodeStructured(_i);
  }

  @pragma('vm:prefer-inline')
  Object? encodeValue(Object? value) => value;

  @pragma('vm:prefer-inline')
  Object? encodeEncodable(Encodable value) => value.encodeStructured(this);

  @pragma('vm:prefer-inline')
  KeyedStructuredEncoder<Key> encodeKeyed<Key>() {
    return KeyedStructuredEncoder._(<Key, dynamic>{});
  }

  @pragma('vm:prefer-inline')
  Object? encodeIterable<T>(
      Iterable<T> value, Object? Function(T, StructuredEncoder) encode) {
    return [for (final e in value) encode(e, StructuredEncoder._i)];
  }
}

extension type KeyedStructuredEncoder<Key>._(Map<Key, dynamic> _value) {
  @pragma('vm:prefer-inline')
  void encodeValue(Key key, Object? value) {
    _value[key] = value;
  }

  @pragma('vm:prefer-inline')
  void encodeEncodable(Key key, Encodable value) {
    _value[key] = value.encodeStructured(StructuredEncoder._(null));
  }

  @pragma('vm:prefer-inline')
  void encodeIterable<T>(Key key, Iterable<T> value,
      Object? Function(T, StructuredEncoder) encode) {
    _value[key] = [for (final e in value) encode(e, StructuredEncoder._i)];
  }
}
