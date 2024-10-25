import 'dart:convert';

import 'package:crimson/crimson.dart';

import 'decoder.dart';

abstract interface class SerialDecoder {
  Object? decodeValue();

  String decodeString();
  String? decodeStringOrNull();

  bool decodeBool();
  bool? decodeBoolOrNull();

  int decodeInt();
  int? decodeIntOrNull();

  double decodeDouble();
  double? decodeDoubleOrNull();

  T decodeDecodable<T>(Decodable<T> decodable);
  T? decodeDecodableOrNull<T>(Decodable<T> decodable);

  Object? nextKey();
  bool nextItem();

  void skipNext();
  bool skipNull();
  void skipRemainingKeys();
  void skipRemainingItems();

  SerialDecoder clone();
}

class JsonDecoder implements SerialDecoder {
  JsonDecoder._(this._reader);
  final Crimson _reader;

  static T decodeBytes<T>(List<int> value, Decodable<T> decodable) {
    return JsonDecoder._(Crimson(value)).decodeDecodable(decodable);
  }

  static T decode<T>(String value, Decodable<T> decodable) {
    return decodeBytes(utf8.encode(value), decodable);
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
  T decodeDecodable<T>(Decodable<T> decodable) {
    return decodable.decodeSerial(this);
  }

  @pragma('vm:prefer-inline')
  @override
  T? decodeDecodableOrNull<T>(Decodable<T> decodable) {
    return _reader.skipNull() ? null : decodable.decodeSerial(this);
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
  SerialDecoder clone() {
    return JsonDecoder._(Crimson(_reader.buffer, _reader.offset));
  }
}

class GeneralizedSerialDecoder implements Decoder {
  GeneralizedSerialDecoder._(this.decoder);

  static T decode<T>(DecodableMixin<T> decodable, SerialDecoder decoder) {
    final d = GeneralizedSerialDecoder._(decoder);
    try {
      return decodable.decode(d);
    } finally {
      if (d._keyed != null && !d._keyed!._done) {
        d.decoder.skipRemainingKeys();
      }
    }
  }

  final SerialDecoder decoder;

  @override
  String decodeString() {
    return decoder.decodeString();
  }

  @override
  String? decodeStringOrNull() {
    return decoder.decodeStringOrNull();
  }

  @override
  bool decodeBool() {
    return decoder.decodeBool();
  }

  @override
  bool? decodeBoolOrNull() {
    return decoder.decodeBoolOrNull();
  }

  @override
  int decodeInt() {
    return decoder.decodeInt();
  }

  @override
  int? decodeIntOrNull() {
    return decoder.decodeIntOrNull();
  }

  @override
  double decodeDouble() {
    return decoder.decodeDouble();
  }

  @override
  double? decodeDoubleOrNull() {
    return decoder.decodeDoubleOrNull();
  }

  @override
  T decodeDecodable<T>(Decodable<T> decodable) {
    return decoder.decodeDecodable(decodable);
  }

  @override
  T? decodeDecodableOrNull<T>(Decodable<T> decodable) {
    return decoder.decodeDecodableOrNull(decodable);
  }

  @override
  List<T> decodeList<T>() {
    return [
      for (; decoder.nextItem();) decoder.decodeValue() as T,
    ];
  }

  @override
  List<T>? decodeListOrNull<T>() {
    return decoder.skipNull()
        ? null
        : [
            for (; decoder.nextItem();) decoder.decodeValue() as T,
          ];
  }

  @override
  List<T> decodeListDecodable<T>(Decodable<T> decodable) {
    return [
      for (; decoder.nextItem();) decoder.decodeDecodable(decodable),
    ];
  }

  @override
  List<T>? decodeListDecodableOrNull<T>(Decodable<T> decodable) {
    return decoder.skipNull()
        ? null
        : [
            for (; decoder.nextItem();) decoder.decodeDecodable(decodable),
          ];
  }

  KeyedGeneralizedSerialDecoder? _keyed;

  @override
  KeyedDecoder<Key> decodeKeyed<Key>() {
    _keyed ??= KeyedGeneralizedSerialDecoder<Key>(decoder);
    return _keyed! as KeyedDecoder<Key>;
  }
}

class KeyedGeneralizedSerialDecoder<Key> implements KeyedDecoder<Key> {
  KeyedGeneralizedSerialDecoder(this.decoder);

  final SerialDecoder decoder;

  bool _done = false;
  final Map<Key, SerialDecoder> _values = {};

  bool skipTo(Key key) {
    if (_done) return false;
    while (true) {
      var k = decoder.nextKey();
      if (k == null) {
        _done = true;
        return false;
      } else if (k == key) {
        return true;
      } else {
        _values[k as Key] = decoder.clone();
        decoder.skipNext();
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
    return decoder.decodeString();
  }

  @override
  String? decodeStringOrNull(Key key) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeStringOrNull();
    }
    final hasKey = skipTo(key);
    if (!hasKey) return null;
    return decoder.decodeStringOrNull();
  }

  @override
  bool decodeBool(Key key) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeBool();
    }
    final hasKey = skipTo(key);
    assert(hasKey);
    return decoder.decodeBool();
  }

  @override
  bool? decodeBoolOrNull(Key key) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeBoolOrNull();
    }
    final hasKey = skipTo(key);
    if (!hasKey) return null;
    return decoder.decodeBoolOrNull();
  }

  @override
  double decodeDouble(Key key) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeDouble();
    }
    final hasKey = skipTo(key);
    assert(hasKey);
    return decoder.decodeDouble();
  }

  @override
  double? decodeDoubleOrNull(Key key) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeDoubleOrNull();
    }
    final hasKey = skipTo(key);
    if (!hasKey) return null;
    return decoder.decodeDoubleOrNull();
  }

  @override
  int decodeInt(Key key) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeInt();
    }
    final hasKey = skipTo(key);
    assert(hasKey);
    return decoder.decodeInt();
  }

  @override
  int? decodeIntOrNull(Key key) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeIntOrNull();
    }
    final hasKey = skipTo(key);
    if (!hasKey) return null;
    return decoder.decodeIntOrNull();
  }

  @override
  T decodeDecodable<T>(Key key, Decodable<T> decodable) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeDecodable(decodable);
    }
    final hasKey = skipTo(key);
    assert(hasKey);
    return decoder.decodeDecodable(decodable);
  }

  @override
  T? decodeDecodableOrNull<T>(Key key, Decodable<T> decodable) {
    if (_values.containsKey(key)) {
      return _values[key]!.decodeDecodableOrNull(decodable);
    }
    final hasKey = skipTo(key);
    if (!hasKey) return null;
    return decoder.decodeDecodableOrNull(decodable);
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
      for (; decoder.nextItem();) decoder.decodeValue() as T,
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
    return decoder.skipNull()
        ? null
        : [
            for (; decoder.nextItem();) decoder.decodeValue() as T,
          ];
  }

  @override
  List<T> decodeListDecodable<T>(Key key, Decodable<T> decodable) {
    if (_values.containsKey(key)) {
      final d = _values[key]!;
      return [
        for (; d.nextItem();) d.decodeDecodable(decodable),
      ];
    }
    final hasKey = skipTo(key);
    assert(hasKey);
    return [
      for (; decoder.nextItem();) decoder.decodeDecodable(decodable),
    ];
  }

  @override
  List<T>? decodeListDecodableOrNull<T>(Key key, Decodable<T> decodable) {
    if (_values.containsKey(key)) {
      final d = _values[key]!;
      return d.skipNull()
          ? null
          : [
              for (; d.nextItem();) d.decodeDecodable(decodable),
            ];
    }
    final hasKey = skipTo(key);
    if (!hasKey) return null;
    return decoder.skipNull()
        ? null
        : [
            for (; decoder.nextItem();) decoder.decodeDecodable(decodable),
          ];
  }
}
