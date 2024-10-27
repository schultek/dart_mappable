part of 'common.dart';

extension CompatSerial on SerialDecoding {
  Decoding asDecoding() => CompatSerialDecoding._(this);
}

extension CompatStruct on StructDecoding {
  Decoding asDecoding() => CompatStructDecoding._(this);
}

class CompatStructDecoding implements Decoding {
  CompatStructDecoding._(this.decoding);

  static T decode<T>(DecoderMixin<T> decoder, StructDecoding decoding) {
    final d = CompatStructDecoding._(decoding);
    return decoder.decode(d);
  }

  final StructDecoding decoding;

  @pragma('vm:prefer-inline')
  @override
  String decodeString() {
    return decoding.decodeString();
  }

  @pragma('vm:prefer-inline')
  @override
  String? decodeStringOrNull() {
    return decoding.decodeStringOrNull();
  }

  @pragma('vm:prefer-inline')
  @override
  bool decodeBool() {
    return decoding.decodeBool();
  }

  @pragma('vm:prefer-inline')
  @override
  bool? decodeBoolOrNull() {
    return decoding.decodeBoolOrNull();
  }

  @pragma('vm:prefer-inline')
  @override
  int decodeInt() {
    return decoding.decodeInt();
  }

  @pragma('vm:prefer-inline')
  @override
  int? decodeIntOrNull() {
    return decoding.decodeIntOrNull();
  }

  @pragma('vm:prefer-inline')
  @override
  double decodeDouble() {
    return decoding.decodeDouble();
  }

  @pragma('vm:prefer-inline')
  @override
  double? decodeDoubleOrNull() {
    return decoding.decodeDoubleOrNull();
  }

  @pragma('vm:prefer-inline')
  @override
  T decodeDecodable<T>(Decoder<T> decoder) {
    return decoding.decodeDecodable(decoder);
  }

  @pragma('vm:prefer-inline')
  @override
  T? decodeDecodableOrNull<T>(Decoder<T> decoder) {
    return decoding.decodeDecodableOrNull(decoder);
  }

  @pragma('vm:prefer-inline')
  @override
  List<T> decodeList<T>() {
    return decoding.decodeList<T>();
  }

  @pragma('vm:prefer-inline')
  @override
  List<T>? decodeListOrNull<T>() {
    return decoding.decodeListOrNull<T>();
  }

  @pragma('vm:prefer-inline')
  @override
  List<T> decodeListDecodable<T>(Decoder<T> decoder) {
    return decoding.decodeListDecodable<T>(decoder);
  }

  @pragma('vm:prefer-inline')
  @override
  List<T>? decodeListDecodableOrNull<T>(Decoder<T> decoder) {
    return decoding.decodeListDecodableOrNull<T>(decoder);
  }

  @pragma('vm:prefer-inline')
  @override
  KeyedDecoding<Key> decodeKeyed<Key>() {
    return KeyedCompatStructuredDecoder<Key>(decoding.decodeKeyed());
  }

  @override
  Decoding clone() => this;
}

class KeyedCompatStructuredDecoder<Key> implements KeyedDecoding<Key> {
  KeyedCompatStructuredDecoder(this.decoder);

  final KeyedStructDecoding<Key> decoder;

  @pragma('vm:prefer-inline')
  @override
  String decodeString(Key key) {
    return decoder.decodeString(key);
  }

  @pragma('vm:prefer-inline')
  @override
  String? decodeStringOrNull(Key key) {
    return decoder.decodeStringOrNull(key);
  }

  @pragma('vm:prefer-inline')
  @override
  bool decodeBool(Key key) {
    return decoder.decodeBool(key);
  }

  @pragma('vm:prefer-inline')
  @override
  bool? decodeBoolOrNull(Key key) {
    return decoder.decodeBoolOrNull(key);
  }

  @pragma('vm:prefer-inline')
  @override
  int decodeInt(Key key) {
    return decoder.decodeInt(key);
  }

  @pragma('vm:prefer-inline')
  @override
  int? decodeIntOrNull(Key key) {
    return decoder.decodeIntOrNull(key);
  }

  @pragma('vm:prefer-inline')
  @override
  double decodeDouble(Key key) {
    return decoder.decodeDouble(key);
  }

  @pragma('vm:prefer-inline')
  @override
  double? decodeDoubleOrNull(Key key) {
    return decoder.decodeDoubleOrNull(key);
  }

  @pragma('vm:prefer-inline')
  @override
  T decodeDecodable<T>(Key key, Decoder<T> decodable) {
    return decoder.decodeDecodable(key, decodable);
  }

  @pragma('vm:prefer-inline')
  @override
  T? decodeDecodableOrNull<T>(Key key, Decoder<T> decodable) {
    return decoder.decodeDecodableOrNull(key, decodable);
  }

  @pragma('vm:prefer-inline')
  @override
  List<T> decodeList<T>(Key key) {
    return decoder.decodeList(key);
  }

  @pragma('vm:prefer-inline')
  @override
  List<T>? decodeListOrNull<T>(Key key) {
    return decoder.decodeListOrNull(key);
  }

  @pragma('vm:prefer-inline')
  @override
  List<T> decodeListDecodable<T>(Key key, Decoder<T> decodable) {
    return decoder.decodeListDecodable(key, decodable);
  }

  @pragma('vm:prefer-inline')
  @override
  List<T>? decodeListDecodableOrNull<T>(Key key, Decoder<T> decodable) {
    return decoder.decodeListDecodableOrNull(key, decodable);
  }
}

class CompatSerialDecoding implements Decoding {
  CompatSerialDecoding._(this.decoding);

  static T decode<T>(DecoderMixin<T> decoder, SerialDecoding decoding) {
    final d = CompatSerialDecoding._(decoding);
    try {
      return decoder.decode(d);
    } finally {
      if (d._keyed != null && !d._keyed!._done) {
        d.decoding.skipRemainingKeys();
      }
    }
  }

  final SerialDecoding decoding;

  @override
  String decodeString() {
    return decoding.decodeString();
  }

  @override
  String? decodeStringOrNull() {
    return decoding.decodeStringOrNull();
  }

  @override
  bool decodeBool() {
    return decoding.decodeBool();
  }

  @override
  bool? decodeBoolOrNull() {
    return decoding.decodeBoolOrNull();
  }

  @override
  int decodeInt() {
    return decoding.decodeInt();
  }

  @override
  int? decodeIntOrNull() {
    return decoding.decodeIntOrNull();
  }

  @override
  double decodeDouble() {
    return decoding.decodeDouble();
  }

  @override
  double? decodeDoubleOrNull() {
    return decoding.decodeDoubleOrNull();
  }

  @override
  T decodeDecodable<T>(Decoder<T> decoder) {
    return decoding.decodeDecodable(decoder);
  }

  @override
  T? decodeDecodableOrNull<T>(Decoder<T> decoder) {
    return decoding.decodeDecodableOrNull(decoder);
  }

  @override
  List<T> decodeList<T>() {
    return [
      for (; decoding.nextItem();) decoding.decodeValue() as T,
    ];
  }

  @override
  List<T>? decodeListOrNull<T>() {
    return decoding.skipNull()
        ? null
        : [
            for (; decoding.nextItem();) decoding.decodeValue() as T,
          ];
  }

  @override
  List<T> decodeListDecodable<T>(Decoder<T> decoder) {
    return [
      for (; decoding.nextItem();) decoding.decodeDecodable(decoder),
    ];
  }

  @override
  List<T>? decodeListDecodableOrNull<T>(Decoder<T> decoder) {
    return decoding.skipNull()
        ? null
        : [
            for (; decoding.nextItem();) decoding.decodeDecodable(decoder),
          ];
  }

  KeyedCompatSerialDecoding? _keyed;

  @override
  KeyedDecoding<Key> decodeKeyed<Key>() {
    _keyed ??= KeyedCompatSerialDecoding<Key>._(decoding);
    return _keyed! as KeyedDecoding<Key>;
  }

  @override
  Decoding clone() => CompatSerialDecoding._(decoding.clone());
}

class KeyedCompatSerialDecoding<Key> implements KeyedDecoding<Key> {
  KeyedCompatSerialDecoding._(this.decoding);

  final SerialDecoding decoding;

  bool _done = false;
  final Map<Key, SerialDecoding> _values = {};

  bool skipTo(Key key) {
    if (_done) return false;
    while (true) {
      var k = decoding.nextKey();
      if (k == null) {
        _done = true;
        return false;
      } else if (k == key) {
        return true;
      } else {
        _values[k as Key] = decoding.clone();
        decoding.skipNext();
      }
    }
  }

  @override
  String decodeString(Key key) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeString();
    }
    final hasKey = skipTo(key);
    assert(hasKey);
    return decoding.decodeString();
  }

  @override
  String? decodeStringOrNull(Key key) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeStringOrNull();
    }
    final hasKey = skipTo(key);
    if (!hasKey) return null;
    return decoding.decodeStringOrNull();
  }

  @override
  bool decodeBool(Key key) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeBool();
    }
    final hasKey = skipTo(key);
    assert(hasKey);
    return decoding.decodeBool();
  }

  @override
  bool? decodeBoolOrNull(Key key) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeBoolOrNull();
    }
    final hasKey = skipTo(key);
    if (!hasKey) return null;
    return decoding.decodeBoolOrNull();
  }

  @override
  double decodeDouble(Key key) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeDouble();
    }
    final hasKey = skipTo(key);
    assert(hasKey);
    return decoding.decodeDouble();
  }

  @override
  double? decodeDoubleOrNull(Key key) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeDoubleOrNull();
    }
    final hasKey = skipTo(key);
    if (!hasKey) return null;
    return decoding.decodeDoubleOrNull();
  }

  @override
  int decodeInt(Key key) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeInt();
    }
    final hasKey = skipTo(key);
    assert(hasKey);
    return decoding.decodeInt();
  }

  @override
  int? decodeIntOrNull(Key key) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeIntOrNull();
    }
    final hasKey = skipTo(key);
    if (!hasKey) return null;
    return decoding.decodeIntOrNull();
  }

  @override
  T decodeDecodable<T>(Key key, Decoder<T> decoder) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeDecodable(decoder);
    }
    final hasKey = skipTo(key);
    assert(hasKey);
    return decoding.decodeDecodable(decoder);
  }

  @override
  T? decodeDecodableOrNull<T>(Key key, Decoder<T> decoder) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeDecodableOrNull(decoder);
    }
    final hasKey = skipTo(key);
    if (!hasKey) return null;
    return decoding.decodeDecodableOrNull(decoder);
  }

  @override
  List<T> decodeList<T>(Key key) {
    if (_values.containsKey(key)) {
      final d = _values[key]!;
      return [
        for (; d.nextItem();) d.decodeValue() as T,
      ];
    }
    final hasKey = skipTo(key);
    assert(hasKey);
    return [
      for (; decoding.nextItem();) decoding.decodeValue() as T,
    ];
  }

  @override
  List<T>? decodeListOrNull<T>(Key key) {
    if (_values.containsKey(key)) {
      final d = _values[key]!;
      return d.skipNull()
          ? null
          : [
              for (; d.nextItem();) d.decodeValue() as T,
            ];
    }
    final hasKey = skipTo(key);
    if (!hasKey) return null;
    return decoding.skipNull()
        ? null
        : [
            for (; decoding.nextItem();) decoding.decodeValue() as T,
          ];
  }

  @override
  List<T> decodeListDecodable<T>(Key key, Decoder<T> decoder) {
    if (_values.containsKey(key)) {
      final d = _values[key]!;
      return [
        for (; d.nextItem();) d.decodeDecodable(decoder),
      ];
    }
    final hasKey = skipTo(key);
    assert(hasKey);
    return [
      for (; decoding.nextItem();) decoding.decodeDecodable(decoder),
    ];
  }

  @override
  List<T>? decodeListDecodableOrNull<T>(Key key, Decoder<T> decoder) {
    if (_values.containsKey(key)) {
      final d = _values[key]!;
      return d.skipNull()
          ? null
          : [
              for (; d.nextItem();) d.decodeDecodable(decoder),
            ];
    }
    final hasKey = skipTo(key);
    if (!hasKey) return null;
    return decoding.skipNull()
        ? null
        : [
            for (; decoding.nextItem();) decoding.decodeDecodable(decoder),
          ];
  }
}

class CompatStructEncoding implements Encoding {
  CompatStructEncoding._(this.encoding);

  static Object? encode<T>(
      T value, EncoderMixin<T> encoder, StructEncoding encoding) {
    var encoded = encoder.encode(value, CompatStructEncoding._(encoding));
    if (encoded is KeyedCompatStructEncoding) {
      return encoded.encoding;
    }
    return encoded;
  }

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
    return KeyedCompatStructEncoding._(encoding.encodeKeyed());
  }
}

class KeyedCompatStructEncoding<Key> implements KeyedEncoding<Key> {
  KeyedCompatStructEncoding._(this.encoding);

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

class CompatSerialEncoding implements Encoding {
  CompatSerialEncoding._(this.encoding);

  static void encode<T>(
      T value, EncoderMixin<T> encoder, SerialEncoding encoding) {
    var encoded = encoder.encode(value, CompatSerialEncoding._(encoding));
    if (encoded is KeyedCompatSerialEncoding) {
      encoding.endObject();
    }
  }

  final SerialEncoding encoding;

  @override
  void encodeValue(Object? value) {
    if (value == null) {
      encoding.encodeNull();
    } else if (value is bool) {
      encoding.encodeBool(value);
    } else if (value is int) {
      encoding.encodeInt(value);
    } else if (value is double) {
      encoding.encodeDouble(value);
    } else if (value is String) {
      encoding.encodeString(value);
    } else if (value is List) {
      encoding.startArray();
      for (final e in value) {
        encodeValue(e);
      }
      encoding.endArray();
    } else {
      throw ArgumentError('Unsupported type: ${value.runtimeType}');
    }
  }

  @override
  void encodeEncodable<T>(T value, Encoder<T> encoder) {
    encoding.encodeEncodable<T>(value, encoder);
  }

  @override
  void encodeIterable<T>(Iterable<T> value, Encoder<T> Function(T) encode) {
    encoding.startArray();
    for (final e in value) {
      encoding.encodeEncodable<T>(e, encode(e));
    }
    encoding.endArray();
  }

  @override
  KeyedEncoding<Key> encodeKeyed<Key>() {
    encoding.startObject<Key>();
    return KeyedCompatSerialEncoding._(encoding);
  }
}

class KeyedCompatSerialEncoding<Key> implements KeyedEncoding<Key> {
  KeyedCompatSerialEncoding._(this.encoding);

  SerialEncoding encoding;

  @override
  void encodeValue(Key key, Object? value) {
    encoding.encodeKey(key);
    CompatSerialEncoding._(encoding).encodeValue(value);
  }

  @override
  void encodeEncodable<T>(Key key, T value, Encoder<T> encoder) {
    encoding.encodeKey(key);
    encoding.encodeEncodable<T>(value, encoder);
  }

  @override
  void encodeIterable<T>(
      Key key, Iterable<T> value, Encoder<T> Function(T) encode) {
    encoding.encodeKey(key);
    encoding.startArray();
    for (final e in value) {
      encoding.encodeEncodable<T>(e, encode(e));
    }
    encoding.endArray();
  }
}
