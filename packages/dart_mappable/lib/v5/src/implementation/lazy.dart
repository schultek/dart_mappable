import 'dart:collection';

import '../protocol/protocol.dart';

extension LazyEncodable on Encodable {
  Map<String, dynamic> toLazyMap() {
    return LazyEncoding.encode(this, encoder()) as Map<String, dynamic>;
  }
}

extension LazyEncodable1<T extends Encodable<T>, A> on Encodable1<T, A> {
  Map<String, dynamic> toLazyMap([Encoder<A>? e1]) {
    return LazyEncoding.encode(this, encoder(e1)) as Map<String, dynamic>;
  }
}

class LazyEncoding implements SerialEncoding {
  LazyEncoding._();

  Object? _value;
  final List<Object?> _stack = [];

  static Object? encode<T>(T value, Encoder<T> encoder) {
    var encoding = LazyEncoding._();
    encoder.encodeSerial(value, encoding);
    return encoding._value;
  }

  void _encodeValue(Object? value) {
    if (_stack case [..._, Map m, Object? key]) {
      m[key] = value;
      _stack.removeLast();
    } else if (_stack case [..._, List l]) {
      l.add(value);
    } else {
      _value = value;
    }
  }

  @override
  void encodeBool(bool value) {
    _encodeValue(value);
  }

  @override
  void encodeDouble(double value) {
    _encodeValue(value);
  }

  @override
  void encodeInt(int value) {
    _encodeValue(value);
  }

  @override
  void encodeNull() {
    _encodeValue(null);
  }

  @override
  void encodeString(String value) {
    _encodeValue(value);
  }

  @override
  void encodeObject<T>(T value, Encoder<T> encoder) {
    if (_stack case [..._, _LazyMap map, Object? key]) {
      map._lazy[key] = (value, encoder);
      _stack.removeLast();
    } else if (_stack case [..._, _LazyList l]) {
      l._lazy[l.length] = (value, encoder);
      l._value.add(null);
    } else {
      final encoding = LazyEncoding._();
      encoder.encodeSerial(value, encoding);
      _encodeValue(encoding._value);
    }
  }

  @override
  void encodeKey(Object? key) {
    assert(_stack.last is Map);
    _stack.add(key);
  }

  @override
  void startObject<Key>() {
    _stack.add(_LazyMap<Key, dynamic>());
  }

  @override
  void endObject() {
    assert(_stack.last is _LazyMap);
    var n = _stack.removeLast();
    _encodeValue(n);
  }

  @override
  void startArray<E>() {
    _stack.add(_LazyList<E>());
  }

  @override
  void endArray() {
    assert(_stack.last is List);
    var n = _stack.removeLast();
    _encodeValue(n);
  }
}

class _LazyMap<Key, Value> with MapMixin<Key, Value> {
  final Map<Key, Value> _value = {};
  final Map<Key, (dynamic, Encoder)> _lazy = {};

  @override
  Value? operator [](Object? key) {
    if (_value.containsKey(key)) {
      return _value[key];
    } else if (_lazy.containsKey(key)) {
      final encoding = LazyEncoding._();
      final (value, encoder) = _lazy.remove(key)!;
      encoder.encodeSerial(value, encoding);
      return _value[key as Key] = encoding._value as Value;
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
      final encoding = LazyEncoding._();
      final (value, encoder) = _lazy.remove(key)!;
      encoder.encodeSerial(value, encoding);
      return encoding._value as Value;
    } else {
      return null;
    }
  }
}

class _LazyList<E> with ListMixin<E> {
  final List<E?> _value = [];
  final Map<int, (dynamic, Encoder)> _lazy = {};

  @override
  int get length => _value.length;
  @override
  set length(int newLength) {
    _value.length = newLength;
  }

  @override
  E operator [](int index) {
    if (_lazy.containsKey(index)) {
      final encoding = LazyEncoding._();
      final (value, encoder) = _lazy.remove(index)!;
      encoder.encodeSerial(value, encoding);
      return _value[index] = encoding._value as E;
    } else {
      return _value[index] as E;
    }
  }

  @override
  void operator []=(int index, E value) {
    _value[index] = value;
    _lazy.remove(index);
  }
}
