import 'dart:convert';

import 'package:crimson/crimson.dart';

import 'encoder.dart';

abstract interface class SerialEncoder {
  void encodeNull();

  void encodeString(String value);

  void encodeInt(int value);

  void encodeDouble(double value);

  void encodeBool(bool value);

  void encodeEncodable(Encodable value);

  void encodeList<T>(List<T> value);

  KeyedSerialEncoder<Key> encodeKeyed<Key>();
}

abstract interface class KeyedSerialEncoder<Key> {
  void encodeNull(Key key);

  void encodeString(Key key, String value);

  void encodeInt(Key key, int value);

  void encodeDouble(Key key, double value);

  void encodeBool(Key key, bool value);

  void encodeEncodable(Key key, Encodable value);

  void encodeList<T>(Key key, List<T> value);
}

class GeneralizedSerialEncoder implements Encoder {
  GeneralizedSerialEncoder(this.encoder);

  final SerialEncoder encoder;

  @override
  KeyedEncoder<Key> encodeKeyed<Key>() {
    return KeyedGeneralizedSerialEncoder(encoder.encodeKeyed());
  }

  @override
  Object? encodeValue(Object? value) {
    if (value == null) {
      encoder.encodeNull();
    } else if (value is bool) {
      encoder.encodeBool(value);
    } else if (value is int) {
      encoder.encodeInt(value);
    } else if (value is double) {
      encoder.encodeDouble(value);
    } else if (value is String) {
      encoder.encodeString(value);
    } else if (value is List) {
      encoder.encodeList(value);
    } else {
      throw ArgumentError('Unsupported type: ${value.runtimeType}');
    }
    return null;
  }
}

class KeyedGeneralizedSerialEncoder<Key> implements KeyedEncoder<Key> {
  KeyedGeneralizedSerialEncoder(this.encoder);

  KeyedSerialEncoder<Key> encoder;

  @override
  void encodeEncodable(Key key, Encodable value) {
    encoder.encodeEncodable(key, value);
  }

  @override
  void encodeValue(Key key, Object? value) {
    if (value == null) {
      encoder.encodeNull(key);
    } else if (value is bool) {
      encoder.encodeBool(key, value);
    } else if (value is int) {
      encoder.encodeInt(key, value);
    } else if (value is double) {
      encoder.encodeDouble(key, value);
    } else if (value is String) {
      encoder.encodeString(key, value);
    } else if (value is List) {
      encoder.encodeList(key, value);
    } else {
      throw ArgumentError('Unsupported type: ${value.runtimeType}');
    }
  }
}

class JsonEncoder implements SerialEncoder {
  JsonEncoder._(this._writer, this._objects);

  static String encode(Encodable value) {
    return utf8.decode(encodeBytes(value));
  }

  static List<int> encodeBytes(Encodable value) {
    var e = JsonEncoder._(CrimsonWriter(), 0);
    value.encodeSerial(e);
    if (e._objects > 0) {
      e._writer.writeObjectEnd();
      e._objects--;
    }
    assert(e._objects == 0);
    return e._writer.toBytes();
  }

  final CrimsonWriter _writer;
  int _objects;

  @pragma('vm:prefer-inline')
  @override
  KeyedSerialEncoder<Key> encodeKeyed<Key>() {
    assert(Key == String);
    _writer.writeObjectStart();
    _objects++;
    return KeyedJsonEncoder._(_writer, _objects) as KeyedSerialEncoder<Key>;
  }

  @override
  void encodeNull() {
    _writer.writeNull();
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeString(String value) {
    _writer.writeString(value);
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeBool(bool value) {
    _writer.writeBool(value);
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeInt(int value) {
    _writer.writeNum(value);
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeDouble(double value) {
    _writer.writeNum(value);
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeEncodable(Encodable value) {
    value.encodeSerial(this);
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeList<T>(List<T> value) {
    _writer.writeArray(value);
  }
}

class KeyedJsonEncoder implements KeyedSerialEncoder<String> {
  KeyedJsonEncoder._(this._writer, this._objects);

  final CrimsonWriter _writer;
  final int _objects;

  @override
  @pragma('vm:prefer-inline')
  void encodeNull(String key) {
    _writer.writeObjectKey(key);
    _writer.writeNull();
  }

  @override
  @pragma('vm:prefer-inline')
  void encodeString(String key, String value) {
    _writer.writeObjectKey(key);
    _writer.writeString(value);
  }

  @override
  @pragma('vm:prefer-inline')
  void encodeInt(String key, int value) {
    _writer.writeObjectKey(key);
    _writer.writeNum(value);
  }

  @override
  @pragma('vm:prefer-inline')
  void encodeDouble(String key, double value) {
    _writer.writeObjectKey(key);
    _writer.writeNum(value);
  }

  @override
  @pragma('vm:prefer-inline')
  void encodeBool(String key, bool value) {
    _writer.writeObjectKey(key);
    _writer.writeBool(value);
  }

  @override
  @pragma('vm:prefer-inline')
  void encodeEncodable(String key, Encodable value) {
    _writer.writeObjectKey(key);

    var e = JsonEncoder._(_writer, _objects);
    value.encodeSerial(e);
    if (e._objects > _objects) {
      e._writer.writeObjectEnd();
      e._objects--;
    }
    assert(e._objects == _objects);
  }

  @override
  void encodeList<T>(String key, List<T> value) {
    _writer.writeObjectKey(key);
    _writer.writeArray(value);
  }
}
