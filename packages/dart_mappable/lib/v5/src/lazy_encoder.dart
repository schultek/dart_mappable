import 'dart:collection';

import 'encoder.dart';
import 'serial_encoder.dart';

class LazyEncoder implements SerialEncoder {
  LazyEncoder._();

  Object? _value;

  static Object? encode(Encodable value) {
    var e = LazyEncoder._();
    value.encodeSerial(e);
    return e._value;
  }

  @override
  KeyedSerialEncoder<Key> encodeKeyed<Key>() {
    return KeyedLazyEncoder._(_value = _LazyMap<Key, dynamic>());
  }

  @override
  void encodeBool(bool value) {
    _value = value;
  }

  @override
  void encodeDouble(double value) {
    _value = value;
  }

  @override
  void encodeEncodable(Encodable value) {
    value.encodeSerial(this);
  }

  @override
  void encodeInt(int value) {
    _value = value;
  }

  @override
  void encodeList<T>(List<T> value) {
    _value = value;
  }

  @override
  void encodeNull() {
    _value = null;
  }

  @override
  void encodeString(String value) {
    _value = value;
  }
}

class KeyedLazyEncoder<Key> implements KeyedSerialEncoder<Key> {
  KeyedLazyEncoder._(this._value);

  final _LazyMap<Key, dynamic> _value;

  @override
  void encodeEncodable(Key key, Encodable value) {
    _value._lazy[key] = value;
  }

  @override
  void encodeList<T>(Key key, List<T> value) {
    _value[key] = value;
  }

  @override
  void encodeBool(Key key, bool value) {
    _value[key] = value;
  }

  @override
  void encodeDouble(Key key, double value) {
    _value[key] = value;
  }

  @override
  void encodeInt(Key key, int value) {
    _value[key] = value;
  }

  @override
  void encodeNull(Key key) {
    _value[key] = null;
  }

  @override
  void encodeString(Key key, String value) {
    _value[key] = value;
  }
}

class _LazyMap<Key, Value> with MapMixin<Key, Value> {
  final Map<Key, Value> _value = {};
  final Map<Key, Encodable> _lazy = {};

  @override
  Value? operator [](Object? key) {
    if (_value.containsKey(key)) {
      return _value[key];
    } else if (_lazy.containsKey(key)) {
      final e = LazyEncoder._();
      _lazy.remove(key)!.encodeSerial(e);
      return _value[key as Key] = e._value as Value;
    } else {
      return null;
    }
  }

  @override
  void operator []=(Key key, Value value) {
    _value[key] = value;
    _lazy.remove(key);
  }

  @override
  void clear() {
    _value.clear();
    _lazy.clear();
  }

  @override
  Iterable<Key> get keys => [..._value.keys, ..._lazy.keys];

  @override
  Value? remove(Object? key) {
    if (_value.containsKey(key)) {
      return _value.remove(key);
    } else if (_lazy.containsKey(key)) {
      final e = LazyEncoder._();
      _lazy.remove(key)!.encodeSerial(e);
      return e._value as Value;
    } else {
      return null;
    }
  }
}
