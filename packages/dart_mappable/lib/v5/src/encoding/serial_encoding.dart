import 'dart:convert';

import 'package:crimson/crimson.dart';

import 'encoding.dart';

abstract interface class SerialEncoding {
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

  void encodeEncodable<T>(T value, Encoder<T> encoder);
}

class GeneralizedSerialEncoding implements Encoding {
  GeneralizedSerialEncoding(this.encoding);

  final SerialEncoding encoding;

  @override
  KeyedEncoding<Key> encodeKeyed<Key>() {
    encoding.startObject<Key>();
    return KeyedGeneralizedSerialEncoding(encoding);
  }

  @override
  Object? encodeValue(Object? value) {
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
    return null;
  }
}

class KeyedGeneralizedSerialEncoding<Key> implements KeyedEncoding<Key> {
  KeyedGeneralizedSerialEncoding(this.encoding);

  SerialEncoding encoding;

  @override
  void encodeEncodable<T>(Key key, T value, Encoder<T> encoder) {
    encoding.encodeKey(key);
    encoding.encodeEncodable(value, encoder);
  }

  @override
  void encodeValue(Key key, Object? value) {
    encoding.encodeKey(key);
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
      var enc = GeneralizedSerialEncoding(encoding);
      for (final e in value) {
        var encoded = enc.encodeValue(e);
        if (encoded is KeyedGeneralizedSerialEncoding) {
          encoding.endObject();
        }
      }
      encoding.endArray();
    } else {
      throw ArgumentError('Unsupported type: ${value.runtimeType}');
    }
  }
}

class JsonEncoding implements SerialEncoding {
  JsonEncoding._(this._writer);

  static String encode<T>(T value, Encoder<T> encoder) {
    return utf8.decode(encodeBytes(value, encoder));
  }

  static List<int> encodeBytes<T>(T value, Encoder<T> encoder) {
    var e = JsonEncoding._(CrimsonWriter());
    encoder.encodeSerial(e, value);
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
  void encodeEncodable<T>(T value, Encoder<T> encoder) {
    encoder.encodeSerial(this, value);
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
