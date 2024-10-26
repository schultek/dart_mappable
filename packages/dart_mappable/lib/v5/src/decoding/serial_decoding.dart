import 'dart:convert';

import 'package:crimson/crimson.dart';

import 'decoding.dart';

abstract interface class SerialDecoding {
  Object? decodeValue();

  String decodeString();
  String? decodeStringOrNull();

  bool decodeBool();
  bool? decodeBoolOrNull();

  int decodeInt();
  int? decodeIntOrNull();

  double decodeDouble();
  double? decodeDoubleOrNull();

  T decodeDecodable<T>(Decoder<T> decoder);
  T? decodeDecodableOrNull<T>(Decoder<T> decoder);

  Object? nextKey();
  bool nextItem();

  void skipNext();
  bool skipNull();
  void skipRemainingKeys();
  void skipRemainingItems();

  SerialDecoding clone();
}

class JsonDecoding implements SerialDecoding {
  JsonDecoding._(this._reader);
  final Crimson _reader;

  static T decodeBytes<T>(List<int> value, Decoder<T> decoder) {
    return JsonDecoding._(Crimson(value)).decodeDecodable(decoder);
  }

  static T decode<T>(String value, Decoder<T> decoder) {
    return decodeBytes(utf8.encode(value), decoder);
  }

  @pragma('vm:prefer-inline')
  @override
  Object? decodeValue() {
    return _reader.read();
  }

  @pragma('vm:prefer-inline')
  @override
  String decodeString() {
    return _reader.readString();
  }

  @pragma('vm:prefer-inline')
  @override
  String? decodeStringOrNull() {
    return _reader.readStringOrNull();
  }

  @pragma('vm:prefer-inline')
  @override
  bool decodeBool() {
    return _reader.read() as bool;
  }

  @pragma('vm:prefer-inline')
  @override
  bool? decodeBoolOrNull() {
    return _reader.read() as bool?;
  }

  @pragma('vm:prefer-inline')
  @override
  int decodeInt() {
    return _reader.readInt();
  }

  @pragma('vm:prefer-inline')
  @override
  int? decodeIntOrNull() {
    return _reader.readIntOrNull();
  }

  @pragma('vm:prefer-inline')
  @override
  double decodeDouble() {
    return _reader.readDouble();
  }

  @pragma('vm:prefer-inline')
  @override
  double? decodeDoubleOrNull() {
    return _reader.readDoubleOrNull();
  }

  @pragma('vm:prefer-inline')
  @override
  T decodeDecodable<T>(Decoder<T> decoder) {
    return decoder.decodeSerial(this);
  }

  @pragma('vm:prefer-inline')
  @override
  T? decodeDecodableOrNull<T>(Decoder<T> decoder) {
    return _reader.skipNull() ? null : decoder.decodeSerial(this);
  }

  @pragma('vm:prefer-inline')
  @override
  bool nextItem() {
    return _reader.iterArray();
  }

  @pragma('vm:prefer-inline')
  @override
  Object? nextKey() {
    return _reader.iterObject();
  }

  @pragma('vm:prefer-inline')
  @override
  void skipNext() {
    _reader.skip();
  }

  @pragma('vm:prefer-inline')
  @override
  bool skipNull() {
    return _reader.skipNull();
  }

  @override
  void skipRemainingKeys() {
    _reader.skipPartialObject();
  }

  @override
  void skipRemainingItems() {
    _reader.skipPartialArray();
  }

  @override
  SerialDecoding clone() {
    return JsonDecoding._(Crimson(_reader.buffer, _reader.offset));
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
    _keyed ??= KeyedCompatSerialDecoding<Key>(decoding);
    return _keyed! as KeyedDecoding<Key>;
  }

  @override
  Decoding clone() => CompatSerialDecoding._(decoding.clone());
}

class KeyedCompatSerialDecoding<Key> implements KeyedDecoding<Key> {
  KeyedCompatSerialDecoding(this.decoding);

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
