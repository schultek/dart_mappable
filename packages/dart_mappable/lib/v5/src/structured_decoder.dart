extension type StructuredDecoder._(Object? _value) {
  static T decode<T>(Object? value, T Function(StructuredDecoder) decode) {
    return decode(StructuredDecoder._(value));
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
  T decodeDecodable<T>(T Function(StructuredDecoder) decode) {
    return decode(this);
  }

  @pragma('vm:prefer-inline')
  T? decodeDecodableOrNull<T>(T Function(StructuredDecoder) decode) {
    if (_value == null) return null;
    return decode(this);
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
  List<T> decodeListDecodable<T>(T Function(StructuredDecoder) decode) {
    return [for (final e in _value as List) decode(StructuredDecoder._(e))];
  }

  @pragma('vm:prefer-inline')
  List<T>? decodeListDecodableOrNull<T>(T Function(StructuredDecoder) decode) {
    if (_value == null) return null;
    return [for (final e in _value as List) decode(StructuredDecoder._(e))];
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
  T decodeDecodable<T>(Key key, T Function(StructuredDecoder) decode) {
    return decode(StructuredDecoder._(_value[key]));
  }

  @pragma('vm:prefer-inline')
  T? decodeDecodableOrNull<T>(Key key, T Function(StructuredDecoder) decode) {
    var v = _value[key];
    if (v == null) return null;
    return decode(StructuredDecoder._(v));
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
  List<T> decodeListDecodable<T>(
      Key key, T Function(StructuredDecoder) decode) {
    return [
      for (final e in _value[key] as List) decode(StructuredDecoder._(e))
    ];
  }

  @pragma('vm:prefer-inline')
  List<T>? decodeListDecodableOrNull<T>(
      Key key, T Function(StructuredDecoder) decode) {
    var v = _value[key];
    if (v == null) return null;
    return [for (final e in v as List) decode(StructuredDecoder._(e))];
  }
}
