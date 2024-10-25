import 'decoder.dart';

extension type StructuredDecoder._(Object? _value) {
  static T decode<T>(Object? value, Decodable<T> decodable) {
    return StructuredDecoder._(value).decodeDecodable(decodable);
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
  T decodeDecodable<T>(Decodable<T> decodable) {
    return decodable.decodeStructured(this);
  }

  @pragma('vm:prefer-inline')
  T? decodeDecodableOrNull<T>(Decodable<T> decodable) {
    if (_value == null) return null;
    return decodable.decodeStructured(this);
  }

  @pragma('vm:prefer-inline')
  KeyedStructuredDecoder<Key> decodeKeyed<Key>() {
    return KeyedStructuredDecoder._(_value as Map<Key, dynamic>);
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
  List<T> decodeListDecodable<T>(Decodable<T> decodable) {
    return [
      for (final e in _value as List)
        decodable.decodeStructured(StructuredDecoder._(e))
    ];
  }

  @pragma('vm:prefer-inline')
  List<T>? decodeListDecodableOrNull<T>(Decodable<T> decodable) {
    if (_value == null) return null;
    return [
      for (final e in _value as List)
        decodable.decodeStructured(StructuredDecoder._(e))
    ];
  }
}

extension type KeyedStructuredDecoder<Key>._(Map<Key, dynamic> _value) {
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
  T decodeDecodable<T>(Key key, Decodable<T> decodable) {
    return decodable.decodeStructured(StructuredDecoder._(_value[key]));
  }

  @pragma('vm:prefer-inline')
  T? decodeDecodableOrNull<T>(Key key, Decodable<T> decodable) {
    var v = _value[key];
    if (v == null) return null;
    return decodable.decodeStructured(StructuredDecoder._(v));
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
  List<T> decodeListDecodable<T>(Key key, Decodable<T> decodable) {
    return [
      for (final e in _value[key] as List)
        decodable.decodeStructured(StructuredDecoder._(e))
    ];
  }

  @pragma('vm:prefer-inline')
  List<T>? decodeListDecodableOrNull<T>(Key key, Decodable<T> decodable) {
    var v = _value[key];
    if (v == null) return null;
    return [
      for (final e in v as List)
        decodable.decodeStructured(StructuredDecoder._(e))
    ];
  }
}

class GeneralizedStructuredDecoder implements Decoder {
  GeneralizedStructuredDecoder._(this.decoder);

  static T decode<T>(DecodableMixin<T> decodable, StructuredDecoder decoder) {
    final d = GeneralizedStructuredDecoder._(decoder);
    return decodable.decode(d);
  }

  final StructuredDecoder decoder;

  @pragma('vm:prefer-inline')
  @override
  String decodeString() {
    return decoder.decodeString();
  }

  @pragma('vm:prefer-inline')
  @override
  String? decodeStringOrNull() {
    return decoder.decodeStringOrNull();
  }

  @pragma('vm:prefer-inline')
  @override
  bool decodeBool() {
    return decoder.decodeBool();
  }

  @pragma('vm:prefer-inline')
  @override
  bool? decodeBoolOrNull() {
    return decoder.decodeBoolOrNull();
  }

  @pragma('vm:prefer-inline')
  @override
  int decodeInt() {
    return decoder.decodeInt();
  }

  @pragma('vm:prefer-inline')
  @override
  int? decodeIntOrNull() {
    return decoder.decodeIntOrNull();
  }

  @pragma('vm:prefer-inline')
  @override
  double decodeDouble() {
    return decoder.decodeDouble();
  }

  @pragma('vm:prefer-inline')
  @override
  double? decodeDoubleOrNull() {
    return decoder.decodeDoubleOrNull();
  }

  @pragma('vm:prefer-inline')
  @override
  T decodeDecodable<T>(Decodable<T> decodable) {
    return decoder.decodeDecodable(decodable);
  }

  @pragma('vm:prefer-inline')
  @override
  T? decodeDecodableOrNull<T>(Decodable<T> decodable) {
    return decoder.decodeDecodableOrNull(decodable);
  }

  @pragma('vm:prefer-inline')
  @override
  List<T> decodeList<T>() {
    return decoder.decodeList<T>();
  }

  @pragma('vm:prefer-inline')
  @override
  List<T>? decodeListOrNull<T>() {
    return decoder.decodeListOrNull<T>();
  }

  @pragma('vm:prefer-inline')
  @override
  List<T> decodeListDecodable<T>(Decodable<T> decodable) {
    return decoder.decodeListDecodable<T>(decodable);
  }

  @pragma('vm:prefer-inline')
  @override
  List<T>? decodeListDecodableOrNull<T>(Decodable<T> decodable) {
    return decoder.decodeListDecodableOrNull<T>(decodable);
  }

  @pragma('vm:prefer-inline')
  @override
  KeyedDecoder<Key> decodeKeyed<Key>() {
    return KeyedGeneralizedStructuredDecoder<Key>(decoder.decodeKeyed());
  }
}

class KeyedGeneralizedStructuredDecoder<Key> implements KeyedDecoder<Key> {
  KeyedGeneralizedStructuredDecoder(this.decoder);

  final KeyedStructuredDecoder<Key> decoder;

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
  T decodeDecodable<T>(Key key, Decodable<T> decodable) {
    return decoder.decodeDecodable(key, decodable);
  }

  @pragma('vm:prefer-inline')
  @override
  T? decodeDecodableOrNull<T>(Key key, Decodable<T> decodable) {
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
  List<T> decodeListDecodable<T>(Key key, Decodable<T> decodable) {
    return decoder.decodeListDecodable(key, decodable);
  }

  @pragma('vm:prefer-inline')
  @override
  List<T>? decodeListDecodableOrNull<T>(Key key, Decodable<T> decodable) {
    return decoder.decodeListDecodableOrNull(key, decodable);
  }
}
