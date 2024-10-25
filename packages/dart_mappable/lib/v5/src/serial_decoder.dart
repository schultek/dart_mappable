import 'dart:convert';

import 'package:crimson/crimson.dart';

abstract interface class SerialDecoder {
  Object? nextKey();

  String decodeString();
  String? decodeStringOrNull();

  bool decodeBool();
  bool? decodeBoolOrNull();

  int decodeInt();
  int? decodeIntOrNull();

  double decodeDouble();
  double? decodeDoubleOrNull();

  T decodeDecodable<T>(T Function(SerialDecoder) decode);
  T? decodeDecodableOrNull<T>(T Function(SerialDecoder) decode);

  bool nextItem();

  void skipNext();
}

class JsonDecoder implements SerialDecoder {
  JsonDecoder._(this._reader);
  final Crimson _reader;

  static T decodeBytes<T>(List<int> value, T Function(SerialDecoder) decode) {
    return decode(JsonDecoder._(Crimson(value)));
  }

  static T decode<T>(String value, T Function(SerialDecoder) decode) {
    return decodeBytes(utf8.encode(value), decode);
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
  T decodeDecodable<T>(T Function(SerialDecoder) decode) {
    return decode(this);
  }

  @pragma('vm:prefer-inline')
  @override
  T? decodeDecodableOrNull<T>(T Function(SerialDecoder) decode) {
    return _reader.skipNull() ? null : decode(this);
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
}
