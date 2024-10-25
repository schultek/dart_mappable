import 'decoding.dart';

extension type StructDecoding._(Object? _value) {
  static T decode<T>(Object? value, Decoder<T> decodable) {
    return StructDecoding._(value).decodeDecodable(decodable);
  }

  @pragma('vm:prefer-inline')
  String decodeString() {
    return _value as String;
  }

  @pragma('vm:prefer-inline')
  String? decodeStringOrNull() {
    return _value as String?;
  }

  @pragma('vm:prefer-inline')
  bool decodeBool() {
    return _value as bool;
  }

  @pragma('vm:prefer-inline')
  bool? decodeBoolOrNull() {
    return _value as bool?;
  }

  @pragma('vm:prefer-inline')
  int decodeInt() {
    return (_value as num).toInt();
  }

  @pragma('vm:prefer-inline')
  int? decodeIntOrNull() {
    return (_value as num?)?.toInt();
  }

  @pragma('vm:prefer-inline')
  double decodeDouble() {
    return (_value as num).toDouble();
  }

  @pragma('vm:prefer-inline')
  double? decodeDoubleOrNull() {
    return (_value as num?)?.toDouble();
  }

  @pragma('vm:prefer-inline')
  T decodeDecodable<T>(Decoder<T> decodable) {
    return decodable.decodeStruct(this);
  }

  @pragma('vm:prefer-inline')
  T? decodeDecodableOrNull<T>(Decoder<T> decodable) {
    if (_value == null) return null;
    return decodable.decodeStruct(this);
  }

  @pragma('vm:prefer-inline')
  KeyedStructDecoding<Key> decodeKeyed<Key>() {
    return KeyedStructDecoding._(_value as Map<Key, dynamic>);
  }

  @pragma('vm:prefer-inline')
  List<T> decodeList<T>() {
    return (_value as List).cast<T>();
  }

  @pragma('vm:prefer-inline')
  List<T>? decodeListOrNull<T>() {
    return (_value as List?)?.cast<T>();
  }

  @pragma('vm:prefer-inline')
  List<T> decodeListDecodable<T>(Decoder<T> decodable) {
    return [
      for (final e in _value as List)
        decodable.decodeStruct(StructDecoding._(e))
    ];
  }

  @pragma('vm:prefer-inline')
  List<T>? decodeListDecodableOrNull<T>(Decoder<T> decodable) {
    if (_value == null) return null;
    return [
      for (final e in _value as List)
        decodable.decodeStruct(StructDecoding._(e))
    ];
  }
}

extension type KeyedStructDecoding<Key>._(Map<Key, dynamic> _value) {
  @pragma('vm:prefer-inline')
  String decodeString(Key key) {
    return _value[key] as String;
  }

  @pragma('vm:prefer-inline')
  String? decodeStringOrNull(Key key) {
    return _value[key] as String?;
  }

  @pragma('vm:prefer-inline')
  bool decodeBool(Key key) {
    return _value[key] as bool;
  }

  @pragma('vm:prefer-inline')
  bool? decodeBoolOrNull(Key key) {
    return _value[key] as bool?;
  }

  @pragma('vm:prefer-inline')
  int decodeInt(Key key) {
    return (_value[key] as num).toInt();
  }

  @pragma('vm:prefer-inline')
  int? decodeIntOrNull(Key key) {
    return (_value[key] as num?)?.toInt();
  }

  @pragma('vm:prefer-inline')
  double decodeDouble(Key key) {
    return (_value[key] as num).toDouble();
  }

  @pragma('vm:prefer-inline')
  double? decodeDoubleOrNull(Key key) {
    return (_value[key] as num?)?.toDouble();
  }

  @pragma('vm:prefer-inline')
  T decodeDecodable<T>(Key key, Decoder<T> decodable) {
    return decodable.decodeStruct(StructDecoding._(_value[key]));
  }

  @pragma('vm:prefer-inline')
  T? decodeDecodableOrNull<T>(Key key, Decoder<T> decodable) {
    var v = _value[key];
    if (v == null) return null;
    return decodable.decodeStruct(StructDecoding._(v));
  }

  @pragma('vm:prefer-inline')
  List<T> decodeList<T>(Key key) {
    return (_value[key] as List).cast<T>();
  }

  @pragma('vm:prefer-inline')
  List<T>? decodeListOrNull<T>(Key key) {
    return (_value[key] as List?)?.cast<T>();
  }

  @pragma('vm:prefer-inline')
  List<T> decodeListDecodable<T>(Key key, Decoder<T> decodable) {
    return [
      for (final e in _value[key] as List)
        decodable.decodeStruct(StructDecoding._(e))
    ];
  }

  @pragma('vm:prefer-inline')
  List<T>? decodeListDecodableOrNull<T>(Key key, Decoder<T> decodable) {
    var v = _value[key];
    if (v == null) return null;
    return [
      for (final e in v as List) decodable.decodeStruct(StructDecoding._(e))
    ];
  }
}

class CompatStructDecoding implements Decoding {
  CompatStructDecoding._(this.decoding);

  static T decode<T>(DecoderMixin<T> decodable, StructDecoding decoding) {
    final d = CompatStructDecoding._(decoding);
    return decodable.decode(d);
  }

  final StructDecoding decoding;

  @pragma('vm:prefer-inline')
  @override
  String decodeString() {
    return decoding.decodeString();
  }

  @pragma('vm:prefer-inline')
  @override
  String? decodeStringOrNull() {
    return decoding.decodeStringOrNull();
  }

  @pragma('vm:prefer-inline')
  @override
  bool decodeBool() {
    return decoding.decodeBool();
  }

  @pragma('vm:prefer-inline')
  @override
  bool? decodeBoolOrNull() {
    return decoding.decodeBoolOrNull();
  }

  @pragma('vm:prefer-inline')
  @override
  int decodeInt() {
    return decoding.decodeInt();
  }

  @pragma('vm:prefer-inline')
  @override
  int? decodeIntOrNull() {
    return decoding.decodeIntOrNull();
  }

  @pragma('vm:prefer-inline')
  @override
  double decodeDouble() {
    return decoding.decodeDouble();
  }

  @pragma('vm:prefer-inline')
  @override
  double? decodeDoubleOrNull() {
    return decoding.decodeDoubleOrNull();
  }

  @pragma('vm:prefer-inline')
  @override
  T decodeDecodable<T>(Decoder<T> decodable) {
    return decoding.decodeDecodable(decodable);
  }

  @pragma('vm:prefer-inline')
  @override
  T? decodeDecodableOrNull<T>(Decoder<T> decodable) {
    return decoding.decodeDecodableOrNull(decodable);
  }

  @pragma('vm:prefer-inline')
  @override
  List<T> decodeList<T>() {
    return decoding.decodeList<T>();
  }

  @pragma('vm:prefer-inline')
  @override
  List<T>? decodeListOrNull<T>() {
    return decoding.decodeListOrNull<T>();
  }

  @pragma('vm:prefer-inline')
  @override
  List<T> decodeListDecodable<T>(Decoder<T> decodable) {
    return decoding.decodeListDecodable<T>(decodable);
  }

  @pragma('vm:prefer-inline')
  @override
  List<T>? decodeListDecodableOrNull<T>(Decoder<T> decodable) {
    return decoding.decodeListDecodableOrNull<T>(decodable);
  }

  @pragma('vm:prefer-inline')
  @override
  KeyedDecoding<Key> decodeKeyed<Key>() {
    return KeyedGeneralizedStructuredDecoder<Key>(decoding.decodeKeyed());
  }
}

class KeyedGeneralizedStructuredDecoder<Key> implements KeyedDecoding<Key> {
  KeyedGeneralizedStructuredDecoder(this.decoder);

  final KeyedStructDecoding<Key> decoder;

  @pragma('vm:prefer-inline')
  @override
  String decodeString(Key key) {
    return decoder.decodeString(key);
  }

  @pragma('vm:prefer-inline')
  @override
  String? decodeStringOrNull(Key key) {
    return decoder.decodeStringOrNull(key);
  }

  @pragma('vm:prefer-inline')
  @override
  bool decodeBool(Key key) {
    return decoder.decodeBool(key);
  }

  @pragma('vm:prefer-inline')
  @override
  bool? decodeBoolOrNull(Key key) {
    return decoder.decodeBoolOrNull(key);
  }

  @pragma('vm:prefer-inline')
  @override
  int decodeInt(Key key) {
    return decoder.decodeInt(key);
  }

  @pragma('vm:prefer-inline')
  @override
  int? decodeIntOrNull(Key key) {
    return decoder.decodeIntOrNull(key);
  }

  @pragma('vm:prefer-inline')
  @override
  double decodeDouble(Key key) {
    return decoder.decodeDouble(key);
  }

  @pragma('vm:prefer-inline')
  @override
  double? decodeDoubleOrNull(Key key) {
    return decoder.decodeDoubleOrNull(key);
  }

  @pragma('vm:prefer-inline')
  @override
  T decodeDecodable<T>(Key key, Decoder<T> decodable) {
    return decoder.decodeDecodable(key, decodable);
  }

  @pragma('vm:prefer-inline')
  @override
  T? decodeDecodableOrNull<T>(Key key, Decoder<T> decodable) {
    return decoder.decodeDecodableOrNull(key, decodable);
  }

  @pragma('vm:prefer-inline')
  @override
  List<T> decodeList<T>(Key key) {
    return decoder.decodeList(key);
  }

  @pragma('vm:prefer-inline')
  @override
  List<T>? decodeListOrNull<T>(Key key) {
    return decoder.decodeListOrNull(key);
  }

  @pragma('vm:prefer-inline')
  @override
  List<T> decodeListDecodable<T>(Key key, Decoder<T> decodable) {
    return decoder.decodeListDecodable(key, decodable);
  }

  @pragma('vm:prefer-inline')
  @override
  List<T>? decodeListDecodableOrNull<T>(Key key, Decoder<T> decodable) {
    return decoder.decodeListDecodableOrNull(key, decodable);
  }
}
