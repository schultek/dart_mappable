import 'dart:convert';

import 'package:crimson/crimson.dart';

import '../extended/compat.dart';
import '../protocol/protocol.dart';
import 'map.dart';

extension JsonDecodable<T> on Decodable<T> {
  T fromJson(String json) {
    return fromJsonBytes(utf8.encode(json));
  }

  T fromJsonBytes(List<int> bytes) {
    return JsonDecoder.decode<T>(bytes, decode());
  }
}

extension JsonDecodable1<T, A> on Decodable1<T, A> {
  T fromJson(String json, [Decode<A>? d1]) {
    return fromJsonBytes(utf8.encode(json), d1);
  }

  T fromJsonBytes(List<int> bytes, [Decode<A>? d1]) {
    return JsonDecoder.decode<T>(bytes, decode(d1));
  }
}

extension JsonEncodable<T> on Encodable<T> {
  String toJson(T value) {
    return utf8.decode(toJsonBytes(value));
  }

  List<int> toJsonBytes(T value) {
    return JsonEncoder.encode<T>(value, encode());
  }
}

extension JsonEncodableSelf<T extends Encodable<T>> on T {
  String toJson() {
    return utf8.decode(toJsonBytes());
  }

  List<int> toJsonBytes() {
    return JsonEncoder.encode<T>(this, encode());
  }
}

extension JsonEncodable1<T, A> on Encodable1<T, A> {
  String toJson(T value, [Encode<A>? e1]) {
    return utf8.decode(toJsonBytes(value, e1));
  }

  List<int> toJsonBytes(T value, [Encode<A>? e1]) {
    return JsonEncoder.encode<T>(value, encode(e1));
  }
}

extension JsonEncodableSelf1<T extends Encodable1<T, A>, A> on T {
  String toJson([Encode<A>? e1]) {
    return utf8.decode(toJsonBytes(e1));
  }

  List<int> toJsonBytes([Encode<A>? e1]) {
    return JsonEncoder.encode<T>(this, encode(e1));
  }
}

class JsonDecoder implements Decoder, IteratedDecoder, KeyedDecoder {
  JsonDecoder._(this._reader);
  final Crimson _reader;

  static T decode<T>(List<int> value, Decode<T> decode) {
    return JsonDecoder._(Crimson(value)).decodeObject(decode);
  }

  @pragma('vm:prefer-inline')
  @override
  T decodeObject<T>(Decode<T> decode) {
    return decode.decode(this);
  }

  @pragma('vm:prefer-inline')
  @override
  T? decodeObjectOrNull<T>(Decode<T> decode) {
    if (skipNull()) return null;
    return decodeObject(decode);
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
  List<I> decodeList<I>([Decode<I>? decodeItem]) {
    return switch (decodeItem) {
      null => _reader.readArray().cast(),
      final di => [
          for (; _reader.iterArray();) decodeObject(di),
        ],
    };
  }

  @pragma('vm:prefer-inline')
  @override
  List<I>? decodeListOrNull<I>([Decode<I>? decodeItem]) {
    if (_reader.skipNull()) return null;
    return decodeList(decodeItem!);
  }

  @pragma('vm:prefer-inline')
  @override
  Map<K, V> decodeMap<K, V>([covariant Decode<K>? decodeKey, Decode<V>? decodeValue]) {
    return switch ((decodeKey, decodeValue)) {
      (null, null) => _reader.readObject().cast(),
      (final dk?, null) => {
          for (String? key; (key = _reader.iterObject()) != null;) MapDecoder.decode(key, dk): _reader.read() as V,
        },
      (null, final dv?) => {
          for (String? key; (key = _reader.iterObject()) != null;) key as K: decodeObject(dv),
        },
      (final dk?, final dv?) => {
          for (String? key; (key = _reader.iterObject()) != null;) MapDecoder.decode(key, dk): decodeObject(dv),
        },
    };
  }

  @pragma('vm:prefer-inline')
  @override
  Map<K, V>? decodeMapOrNull<K, V>([covariant Decode<K>? decodeKey, Decode<V>? decodeValue]) {
    if (_reader.skipNull()) return null;
    return decodeMap(decodeKey, decodeValue);
  }

  @pragma('vm:prefer-inline')
  @override
  num decodeNum() {
    return _reader.readNum();
  }

  @pragma('vm:prefer-inline')
  @override
  num? decodeNumOrNull() {
    return _reader.readNumOrNull();
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
  bool skipNull() {
    return _reader.skipNull();
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
  void skipCurrentItem() {
    return _reader.skip();
  }

  @pragma('vm:prefer-inline')
  @override
  void skipCurrentValue() {
    return _reader.skip();
  }

  @pragma('vm:prefer-inline')
  @override
  void skipRemainingKeys() {
    return _reader.skipPartialObject();
  }

  @pragma('vm:prefer-inline')
  @override
  void skipRemainingItems() {
    return _reader.skipPartialArray();
  }

  @override
  JsonDecoder clone() {
    return JsonDecoder._(Crimson(_reader.buffer, _reader.offset));
  }
  
  @override
  dynamic decodeDynamic() {
    return _reader.read();
  }
  
  @override
  IteratedDecoder decodeIterated() {
    return this;
  }
  
  @override
  KeyedDecoder decodeKeyed() {
    return this;
  }
  
  @override
  MappedDecoder decodeMapped() {
    return CompatMappedDecoder.wrap(this);
  }
  
  @override
  DecodingType whatsNext() {
    final type = _reader.whatIsNext();
    return switch (type) {
      JsonType.nil => DecodingType.nil,
      JsonType.bool => DecodingType.bool,
      JsonType.number => DecodingType.num,
      JsonType.string => DecodingType.string,
      JsonType.object => DecodingType.keyed,
      JsonType.array => DecodingType.iterated,
    };
  }
  
  @override
  Never expect(String expect) {
    throw FormatException('Expected $expect, but got ${whatsNext()}');
  }
  
  @override
  T decodeCustom<T>() {
    expect('$T');
  }
}

class JsonEncoder implements Encoder, IteratedEncoder {
  JsonEncoder._(this._writer) {
    _keyed = JsonKeyedEncoder._(_writer, this);
  }

  final CrimsonWriter _writer;
  late final JsonKeyedEncoder _keyed;

  static List<int> encode<T>(T value, Encode<T> encode) {
    var encoder = JsonEncoder._(CrimsonWriter());
    encode.encode(value, encoder);
    return encoder._writer.toBytes();
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeBool(bool value) {
    _writer.writeBool(value);
  }

  @pragma('vm:prefer-inline')
  @override
  IteratedEncoder encodeIterated() {
    _writer.writeArrayStart();
    return this;
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeDouble(double value) {
    _writer.writeNum(value);
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeInt(int value) {
    _writer.writeNum(value);
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeIterable<E>(Iterable<E> value, {Encode<E> Function(E p1)? encodeElement}) {
    _writer.writeArrayStart();
    for (final e in value) {
      if (encodeElement != null) {
        encodeElement(e).encode(e, this);
      } else {
        _writer.write(e);
      }
    }
    _writer.writeArrayEnd();
  }

  @pragma('vm:prefer-inline')
  @override
  KeyedEncoder encodeKeyed() {
    _writer.writeObjectStart();
    return _keyed;
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeMap<K, V>(Map<K, V> value, {Encode<K> Function(K p1)? encodeKey, Encode<V> Function(V p1)? encodeValue}) {
    _writer.writeObjectStart();
    for (final key in value.keys) {
      final v = value[key] as V;
      if (encodeKey != null) {
        encodeKey(key).encode(key, this);
        // TODO write colon
      } else {
        _writer.writeObjectKey(key as String);
      }
      if (encodeValue != null) {
        encodeValue(v).encode(v, this);
      } else {
        _writer.write(v);
      }
    }
    _writer.writeObjectEnd();
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeNull() {
    _writer.writeNull();
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeNum(num value) {
    _writer.writeNum(value);
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeObject<T>(T value, Encode<T> encode) {
    encode.encode(value, this);
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeString(String value) {
    _writer.writeString(value);
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeValue(Object? value) {
    _writer.write(value);
  }

  @override
  void end() {
    _writer.writeArrayEnd();
  }
}

class JsonKeyedEncoder implements KeyedEncoder {
  JsonKeyedEncoder._(this._writer, this._parent);

  final CrimsonWriter _writer;
  final JsonEncoder _parent;

  @pragma('vm:prefer-inline')
  @override
  void encodeBool(String key, bool value, {int? id}) {
    _writer.writeObjectKey(key);
    _writer.writeBool(value);
  }

  @pragma('vm:prefer-inline')
  @override
  IteratedEncoder encodeIterated(String key, {int? id}) {
    _writer.writeObjectKey(key);
    _writer.writeArrayStart();
    return _parent;
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeDouble(String key, double value, {int? id}) {
    _writer.writeObjectKey(key);
    _writer.writeNum(value);
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeInt(String key, int value, {int? id}) {
    _writer.writeObjectKey(key);
    _writer.writeNum(value);
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeIterable<E>(String key, Iterable<E> value, {int? id, Encode<E> Function(E p1)? encodeElement}) {
    _writer.writeObjectKey(key);
    _writer.writeArrayStart();
    for (final e in value) {
      if (encodeElement != null) {
        encodeElement(e).encode(e, _parent);
      } else {
        _writer.write(e);
      }
    }
    _writer.writeArrayEnd();
  }

  @pragma('vm:prefer-inline')
  @override
  KeyedEncoder encodeKeyed(String key, {int? id}) {
    _writer.writeObjectKey(key);
    _writer.writeObjectStart();
    return this;
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeMap<K, V>(String key, Map<K, V> value,
      {int? id, Encode<K> Function(K p1)? encodeKey, Encode<V> Function(V p1)? encodeValue}) {
    _writer.writeObjectKey(key);
    _writer.writeObjectStart();
    for (final key in value.keys) {
      final v = value[key] as V;
      if (encodeKey != null) {
        encodeKey(key).encode(key, _parent);
        // TODO write colon
      } else {
        _writer.writeObjectKey(key as String);
      }
      if (encodeValue != null) {
        encodeValue(v).encode(v, _parent);
      } else {
        _writer.write(v);
      }
    }
    _writer.writeObjectEnd();
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeNull(String key, {int? id}) {
    _writer.writeObjectKey(key);
    _writer.writeNull();
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeNum(String key, num value, {int? id}) {
    _writer.writeObjectKey(key);
    _writer.writeNum(value);
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeObject<T>(String key, T value, Encode<T> encode, {int? id}) {
    _writer.writeObjectKey(key);
    encode.encode(value, _parent);
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeString(String key, String value, {int? id}) {
    _writer.writeObjectKey(key);
    _writer.writeString(value);
  }

  @pragma('vm:prefer-inline')
  @override
  void encodeValue(String key, Object? value, {int? id}) {
    _writer.writeObjectKey(key);
    _writer.write(value);
  }

  @override
  void end() {
    _writer.writeObjectEnd();
  }
}
