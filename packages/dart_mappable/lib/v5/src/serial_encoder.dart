import 'dart:convert';

import 'package:crimson/crimson.dart';

import 'encoder.dart';

abstract interface class SerialEncoder {
  void startObject<Key>();

  void endObject();

  void startArray<E>();

  void endArray();

  void encodeKey(Object? key);

  void encodeNull();

  void encodeString(String value);

  void encodeInt(int value);

  void encodeDouble(double value);

  void encodeBool(bool value);

  void encodeEncodable(Encodable value);
}

class GeneralizedSerialEncoder implements Encoder {
  GeneralizedSerialEncoder(this.encoder);

  final SerialEncoder encoder;

  @override
  KeyedEncoder<Key> encodeKeyed<Key>() {
    encoder.startObject<Key>();
    return KeyedGeneralizedSerialEncoder(encoder);
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
      encoder.startArray();
      for (final e in value) {
        encodeValue(e);
      }
      encoder.endArray();
    } else {
      throw ArgumentError('Unsupported type: ${value.runtimeType}');
    }
    return null;
  }
}

class KeyedGeneralizedSerialEncoder<Key> implements KeyedEncoder<Key> {
  KeyedGeneralizedSerialEncoder(this.encoder);

  SerialEncoder encoder;

  @override
  void encodeEncodable(Key key, Encodable value) {
    encoder.encodeKey(key);
    encoder.encodeEncodable(value);
  }

  @override
  void encodeValue(Key key, Object? value) {
    encoder.encodeKey(key);
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
      encoder.startArray();
      var enc = GeneralizedSerialEncoder(encoder);
      for (final e in value) {
        var encoded = enc.encodeValue(e);
        if (encoded is KeyedGeneralizedSerialEncoder) {
          encoder.endObject();
        }
      }
      encoder.endArray();
    } else {
      throw ArgumentError('Unsupported type: ${value.runtimeType}');
    }
  }
}

class JsonEncoder implements SerialEncoder {
  JsonEncoder._(this._writer);

  static String encode(Encodable value) {
    return utf8.decode(encodeBytes(value));
  }

  static List<int> encodeBytes(Encodable value) {
    var e = JsonEncoder._(CrimsonWriter());
    value.encodeSerial(e);
    return e._writer.toBytes();
  }

  final CrimsonWriter _writer;

  @pragma('vm:prefer-inline')
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
  void encodeKey(Object? key) {
    _writer.writeObjectKey(key.toString());
  }

  @pragma('vm:prefer-inline')
  @override
  void startObject<Key>() {
    assert(Key == String);
    _writer.writeObjectStart();
  }

  @pragma('vm:prefer-inline')
  @override
  void endObject() {
    _writer.writeObjectEnd();
  }

  @pragma('vm:prefer-inline')
  @override
  void startArray<E>() {
    _writer.writeArrayStart();
  }

  @pragma('vm:prefer-inline')
  @override
  void endArray() {
    _writer.writeArrayEnd();
  }
}
