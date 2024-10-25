import 'encoding.dart';

class CompatStructEncoding implements Encoding {
  CompatStructEncoding(this.encoding);

  final StructEncoding encoding;

  @override
  KeyedEncoding<Key> encodeKeyed<Key>() {
    return KeyedCompatStructEncoding(encoding.encodeKeyed());
  }

  @override
  Object? encodeValue(Object? value) {
    return encoding.encodeValue(value);
  }
}

class KeyedCompatStructEncoding<Key> implements KeyedEncoding<Key> {
  KeyedCompatStructEncoding(this.encoding);

  final KeyedStructEncoding<Key> encoding;

  @override
  void encodeEncodable<T>(Key key, T value, Encoder<T> encoder) {
    encoding.encodeEncodable(key, value, encoder);
  }

  @override
  void encodeValue(Key key, Object? value) {
    encoding.encodeValue(key, value);
  }
}

extension type StructEncoding._(Null _) {
  static final _i = StructEncoding._(null);

  static Object? encode<T>(T value, Encoder<T> encoder) {
    return _i.encodeEncodable(value, encoder);
  }

  @pragma('vm:prefer-inline')
  Object? encodeValue(Object? value) => value;

  @pragma('vm:prefer-inline')
  Object? encodeEncodable<T>(T value, Encoder<T> encoder) =>
      encoder.encodeStruct(this, value);

  @pragma('vm:prefer-inline')
  KeyedStructEncoding<Key> encodeKeyed<Key>() {
    return KeyedStructEncoding._(<Key, dynamic>{});
  }

  @pragma('vm:prefer-inline')
  Object? encodeIterable<T>(
      Iterable<T> value, Object? Function(T, StructEncoding) encode) {
    return [for (final e in value) encode(e, StructEncoding._i)];
  }
}

extension type KeyedStructEncoding<Key>._(Map<Key, dynamic> _value) {
  @pragma('vm:prefer-inline')
  void encodeValue(Key key, Object? value) {
    _value[key] = value;
  }

  @pragma('vm:prefer-inline')
  void encodeEncodable<T>(Key key, T value, Encoder<T> encoder) {
    _value[key] = encoder.encodeStruct(StructEncoding._(null), value);
  }

  @pragma('vm:prefer-inline')
  void encodeIterable<T>(
      Key key, Iterable<T> value, Encoder<T> Function(T) encode) {
    _value[key] = [
      for (final e in value) encode(e).encodeStruct(StructEncoding._i, e)
    ];
  }
}
