part of 'extensions.dart';

extension CompatSerial on SerialDecoding {
  Decoding asDecoding() => CompatSerialDecoding._(this);
}

extension CompatStruct on StructDecoding {
  Decoding asDecoding() => CompatStructDecoding._(this);
}

class CompatStructDecoding implements Decoding {
  CompatStructDecoding._(this.decoding);

  static T decode<T>(T Function(Decoding) decode, StructDecoding decoding) {
    final d = CompatStructDecoding._(decoding);
    return decode(d);
  }

  final StructDecoding decoding;

  @override
  @pragma('vm:prefer-inline')
  Object? decodeValue() {
    return decoding.decodeValue();
  }

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
  T decodeObject<T>(Decoder<T> decoder) {
    return decoding.decodeObject(decoder);
  }

  @pragma('vm:prefer-inline')
  @override
  T? decodeObjectOrNull<T>(Decoder<T> decoder) {
    return decoding.decodeObjectOrNull(decoder);
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
  List<T> decodeListObject<T>(Decoder<T> decoder) {
    return decoding.decodeListObject<T>(decoder);
  }

  @pragma('vm:prefer-inline')
  @override
  List<T>? decodeListObjectOrNull<T>(Decoder<T> decoder) {
    return decoding.decodeListObjectOrNull<T>(decoder);
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
  KeyedCompatStructuredDecoder(this.decoding);

  final KeyedStructDecoding<Key> decoding;

  @override
  @pragma('vm:prefer-inline')
  Object? decodeValue(Key key) {
    return decoding.decodeValue(key);
  }

  @pragma('vm:prefer-inline')
  @override
  String decodeString(Key key) {
    return decoding.decodeString(key);
  }

  @pragma('vm:prefer-inline')
  @override
  String? decodeStringOrNull(Key key) {
    return decoding.decodeStringOrNull(key);
  }

  @pragma('vm:prefer-inline')
  @override
  bool decodeBool(Key key) {
    return decoding.decodeBool(key);
  }

  @pragma('vm:prefer-inline')
  @override
  bool? decodeBoolOrNull(Key key) {
    return decoding.decodeBoolOrNull(key);
  }

  @pragma('vm:prefer-inline')
  @override
  int decodeInt(Key key) {
    return decoding.decodeInt(key);
  }

  @pragma('vm:prefer-inline')
  @override
  int? decodeIntOrNull(Key key) {
    return decoding.decodeIntOrNull(key);
  }

  @pragma('vm:prefer-inline')
  @override
  double decodeDouble(Key key) {
    return decoding.decodeDouble(key);
  }

  @pragma('vm:prefer-inline')
  @override
  double? decodeDoubleOrNull(Key key) {
    return decoding.decodeDoubleOrNull(key);
  }

  @pragma('vm:prefer-inline')
  @override
  T decodeObject<T>(Key key, Decoder<T> decodable) {
    return decoding.decodeObject(key, decodable);
  }

  @pragma('vm:prefer-inline')
  @override
  T? decodeObjectOrNull<T>(Key key, Decoder<T> decodable) {
    return decoding.decodeObjectOrNull(key, decodable);
  }

  @pragma('vm:prefer-inline')
  @override
  List<T> decodeList<T>(Key key) {
    return decoding.decodeList(key);
  }

  @pragma('vm:prefer-inline')
  @override
  List<T>? decodeListOrNull<T>(Key key) {
    return decoding.decodeListOrNull(key);
  }

  @pragma('vm:prefer-inline')
  @override
  List<T> decodeListObject<T>(Key key, Decoder<T> decodable) {
    return decoding.decodeListObject(key, decodable);
  }

  @pragma('vm:prefer-inline')
  @override
  List<T>? decodeListObjectOrNull<T>(Key key, Decoder<T> decodable) {
    return decoding.decodeListObjectOrNull(key, decodable);
  }
}

class CompatSerialDecoding implements Decoding {
  CompatSerialDecoding._(this.decoding);

  static T decode<T>(T Function(Decoding) decode, SerialDecoding decoding) {
    final d = CompatSerialDecoding._(decoding);
    try {
      return decode(d);
    } finally {
      if (d._keyed != null && !d._keyed!._done) {
        d.decoding.skipRemainingKeys();
      }
    }
  }

  final SerialDecoding decoding;

  @override
  Object? decodeValue() {
    return decoding.decodeValue();
  }

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
  T decodeObject<T>(Decoder<T> decoder) {
    return decoding.decodeObject(decoder);
  }

  @override
  T? decodeObjectOrNull<T>(Decoder<T> decoder) {
    return decoding.decodeObjectOrNull(decoder);
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
  List<T> decodeListObject<T>(Decoder<T> decoder) {
    return [
      for (; decoding.nextItem();) decoding.decodeObject(decoder),
    ];
  }

  @override
  List<T>? decodeListObjectOrNull<T>(Decoder<T> decoder) {
    return decoding.skipNull()
        ? null
        : [
            for (; decoding.nextItem();) decoding.decodeObject(decoder),
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
  Object? decodeValue(Key key) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeValue();
    }
    final hasKey = skipTo(key);
    assert(hasKey);
    return decoding.decodeValue();
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
  T decodeObject<T>(Key key, Decoder<T> decoder) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeObject(decoder);
    }
    final hasKey = skipTo(key);
    assert(hasKey);
    return decoding.decodeObject(decoder);
  }

  @override
  T? decodeObjectOrNull<T>(Key key, Decoder<T> decoder) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeObjectOrNull(decoder);
    }
    final hasKey = skipTo(key);
    if (!hasKey) return null;
    return decoding.decodeObjectOrNull(decoder);
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
  List<T> decodeListObject<T>(Key key, Decoder<T> decoder) {
    if (_values.containsKey(key)) {
      final d = _values[key]!;
      return [
        for (; d.nextItem();) d.decodeObject(decoder),
      ];
    }
    final hasKey = skipTo(key);
    assert(hasKey);
    return [
      for (; decoding.nextItem();) decoding.decodeObject(decoder),
    ];
  }

  @override
  List<T>? decodeListObjectOrNull<T>(Key key, Decoder<T> decoder) {
    if (_values.containsKey(key)) {
      final d = _values[key]!;
      return d.skipNull()
          ? null
          : [
              for (; d.nextItem();) d.decodeObject(decoder),
            ];
    }
    final hasKey = skipTo(key);
    if (!hasKey) return null;
    return decoding.skipNull()
        ? null
        : [
            for (; decoding.nextItem();) decoding.decodeObject(decoder),
          ];
  }
}

class CompatStructEncoding implements Encoding {
  CompatStructEncoding._(this.encoding);

  static void encode<T>(
      T value, void Function(T, Encoding) encode, StructEncoding encoding) {
    encode(value, CompatStructEncoding._(encoding));
  }

  final StructEncoding encoding;

  @override
  void encodeValue(Object? value) {
    encoding.encodeValue(value);
  }

  @override
  void encodeObject<T>(T value, Encoder<T> encoder) {
    encoding.encodeObject<T>(value, encoder);
  }

  @override
  void encodeIterable<T>(Iterable<T> value, Encoder<T> Function(T) encode) {
    encoding.encodeIterable<T>(value, encode);
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
  void encodeObject<T>(Key key, T value, Encoder<T> encoder) {
    encoding.encodeObject<T>(key, value, encoder);
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
      T value, void Function(T, Encoding) encode, SerialEncoding encoding) {
    var comp = CompatSerialEncoding._(encoding);
    encode(value, comp);
    if (comp.isKeyed) {
      encoding.endObject();
    }
  }

  final SerialEncoding encoding;
  bool isKeyed = false;

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
  void encodeObject<T>(T value, Encoder<T> encoder) {
    encoding.encodeObject<T>(value, encoder);
  }

  @override
  void encodeIterable<T>(Iterable<T> value, Encoder<T> Function(T) encode) {
    encoding.startArray();
    for (final e in value) {
      encoding.encodeObject<T>(e, encode(e));
    }
    encoding.endArray();
  }

  @override
  KeyedEncoding<Key> encodeKeyed<Key>() {
    encoding.startObject<Key>();
    isKeyed = true;
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
  void encodeObject<T>(Key key, T value, Encoder<T> encoder) {
    encoding.encodeKey(key);
    encoding.encodeObject<T>(value, encoder);
  }

  @override
  void encodeIterable<T>(
      Key key, Iterable<T> value, Encoder<T> Function(T) encode) {
    encoding.encodeKey(key);
    encoding.startArray();
    for (final e in value) {
      encoding.encodeObject<T>(e, encode(e));
    }
    encoding.endArray();
  }
}
