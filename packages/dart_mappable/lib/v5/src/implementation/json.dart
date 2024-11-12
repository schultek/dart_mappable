/// JSON reference implementation.
///
/// This uses package:crimson for the raw reading and writing operations.

import 'dart:convert';

import 'package:crimson/crimson.dart';

import '../extensions/extensions.dart';
import '../protocol/protocol.dart';

class JsonDecoding implements SerialDecoding {
  JsonDecoding._(this._reader);
  final Crimson _reader;

  static T decode<T>(List<int> value, Decoder<T> decoder) {
    return JsonDecoding._(Crimson(value)).decodeObject(decoder);
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
  T decodeObject<T>(Decoder<T> decoder) {
    return decoder.decodeSerial(this);
  }

  @pragma('vm:prefer-inline')
  @override
  T? decodeObjectOrNull<T>(Decoder<T> decoder) {
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

class JsonEncoding implements SerialEncoding {
  JsonEncoding._(this._writer);

  final CrimsonWriter _writer;

  static List<int> encode<T>(T value, Encoder<T> encoder) {
    var encoding = JsonEncoding._(CrimsonWriter());
    encoder.encodeSerial(value, encoding);
    return encoding._writer.toBytes();
  }

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
  void encodeObject<T>(T value, Encoder<T> encoder) {
    encoder.encodeSerial(value, this);
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

extension JsonDecodable<T> on Decodable<T> {
  T fromJson(String json) {
    return fromJsonBytes(utf8.encode(json));
  }

  T fromJsonBytes(List<int> bytes) {
    return JsonDecoding.decode<T>(bytes, decoder());
  }
}

extension JsonDecodable1<T, A> on Decodable1<T, A> {
  T fromJson(String json, [Decoder<A>? d1]) {
    return fromJsonBytes(utf8.encode(json), d1);
  }

  T fromJsonBytes(List<int> bytes, [Decoder<A>? d1]) {
    return JsonDecoding.decode<T>(bytes, decoder(d1));
  }
}

extension JsonEncodable<T> on Encodable<T> {
  String toJson(T value) {
    return utf8.decode(toJsonBytes(value));
  }

  List<int> toJsonBytes(T value) {
    return JsonEncoding.encode<T>(value, encoder());
  }
}

extension JsonEncodableSelf<T extends Encodable<T>> on T {
  String toJson() {
    return utf8.decode(toJsonBytes());
  }

  List<int> toJsonBytes() {
    return JsonEncoding.encode<T>(this, encoder());
  }
}

extension JsonEncodable1<T, A> on Encodable1<T, A> {
  String toJson(T value, [Encoder<A>? e1]) {
    return utf8.decode(toJsonBytes(value, e1));
  }

  List<int> toJsonBytes(T value, [Encoder<A>? e1]) {
    return JsonEncoding.encode<T>(value, encoder(e1));
  }
}

extension JsonEncodableSelf1<T extends Encodable1<T, A>, A> on T {
  String toJson([Encoder<A>? e1]) {
    return utf8.decode(toJsonBytes(e1));
  }

  List<int> toJsonBytes([Encoder<A>? e1]) {
    return JsonEncoding.encode<T>(this, encoder(e1));
  }
}

const jsonCoding = JsonCoding();
const jsonByteCoding = JsonByteCoding();

class JsonCoding implements Coding<String> {
  const JsonCoding();

  @override
  T decode<T>(String value, Decoder<T> decoder) {
    return JsonDecoding.decode(utf8.encode(value), decoder);
  }

  @override
  String encode<T>(T value, Encoder<T> encoder) {
    return utf8.decode(JsonEncoding.encode(value, encoder));
  }
}

class JsonByteCoding implements Coding<List<int>> {
  const JsonByteCoding();

  @override
  T decode<T>(List<int> value, Decoder<T> decoder) {
    return JsonDecoding.decode(value, decoder);
  }

  @override
  List<int> encode<T>(T value, Encoder<T> encoder) {
    return JsonEncoding.encode(value, encoder);
  }
}