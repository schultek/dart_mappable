import 'encoding.dart';

class CompatStructEncoding implements Encoding {
  CompatStructEncoding(this.encoding);

  final StructEncoding encoding;

  @override
  Object? encodeValue(Object? value) {
    return encoding.encodeValue(value);
  }

  @override
  Object? encodeEncodable<T>(T value, Encoder<T> encoder) {
    return encoding.encodeEncodable<T>(value, encoder);
  }

  @override
  Object? encodeIterable<T>(Iterable<T> value, Encoder<T> Function(T) encode) {
    return encoding.encodeIterable<T>(value, encode);
  }

  @override
  KeyedEncoding<Key> encodeKeyed<Key>() {
    return KeyedCompatStructEncoding(encoding.encodeKeyed());
  }
}

class KeyedCompatStructEncoding<Key> implements KeyedEncoding<Key> {
  KeyedCompatStructEncoding(this.encoding);

  final KeyedStructEncoding<Key> encoding;

  @override
  void encodeValue(Key key, Object? value) {
    encoding.encodeValue(key, value);
  }

  @override
  void encodeEncodable<T>(Key key, T value, Encoder<T> encoder) {
    encoding.encodeEncodable<T>(key, value, encoder);
  }

  @override
  void encodeIterable<T>(
      Key key, Iterable<T> value, Encoder<T> Function(T) encode) {
    encoding.encodeIterable<T>(key, value, encode);
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
      encoder.encodeStruct(value, this);

  @pragma('vm:prefer-inline')
  KeyedStructEncoding<Key> encodeKeyed<Key>() {
    return KeyedStructEncoding._(<Key, dynamic>{});
  }

  @pragma('vm:prefer-inline')
  Object? encodeIterable<T>(Iterable<T> value, Encoder<T> Function(T) encode) {
    return [
      for (final e in value) encode(e).encodeStruct(e, StructEncoding._i)
    ];
  }
}

extension type KeyedStructEncoding<Key>._(Map<Key, dynamic> _value) {
  @pragma('vm:prefer-inline')
  void encodeValue(Key key, Object? value) {
    _value[key] = value;
  }

  @pragma('vm:prefer-inline')
  void encodeEncodable<T>(Key key, T value, Encoder<T> encoder) {
    _value[key] = encoder.encodeStruct(value, StructEncoding._(null));
  }

  @pragma('vm:prefer-inline')
  void encodeIterable<T>(
      Key key, Iterable<T> value, Encoder<T> Function(T) encode) {
    _value[key] = [
      for (final e in value) encode(e).encodeStruct(e, StructEncoding._i)
    ];
  }
}
