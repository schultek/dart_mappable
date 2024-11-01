part of 'common.dart';

extension type StructDecoding._(Object? _value) {
  static T decode<T>(Object? value, Decoder<T> decoder) {
    return StructDecoding._(value).decodeObject(decoder);
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
  T decodeObject<T>(Decoder<T> decoder) {
    return decoder.decodeStruct(this);
  }

  @pragma('vm:prefer-inline')
  T? decodeObjectOrNull<T>(Decoder<T> decoder) {
    if (_value == null) return null;
    return decoder.decodeStruct(this);
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
  List<T> decodeListObject<T>(Decoder<T> decoder) {
    return [
      for (final e in _value as List) decoder.decodeStruct(StructDecoding._(e))
    ];
  }

  @pragma('vm:prefer-inline')
  List<T>? decodeListObjectOrNull<T>(Decoder<T> decoder) {
    if (_value == null) return null;
    return [
      for (final e in _value as List) decoder.decodeStruct(StructDecoding._(e))
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
  T decodeObject<T>(Key key, Decoder<T> decoder) {
    return decoder.decodeStruct(StructDecoding._(_value[key]));
  }

  @pragma('vm:prefer-inline')
  T? decodeObjectOrNull<T>(Key key, Decoder<T> decoder) {
    var v = _value[key];
    if (v == null) return null;
    return decoder.decodeStruct(StructDecoding._(v));
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
  List<T> decodeListObject<T>(Key key, Decoder<T> decoder) {
    return [
      for (final e in _value[key] as List)
        decoder.decodeStruct(StructDecoding._(e))
    ];
  }

  @pragma('vm:prefer-inline')
  List<T>? decodeListObjectOrNull<T>(Key key, Decoder<T> decoder) {
    var v = _value[key];
    if (v == null) return null;
    return [
      for (final e in v as List) decoder.decodeStruct(StructDecoding._(e))
    ];
  }
}

extension type StructEncoding._(Null _) {
  static final _i = StructEncoding._(null);

  static Object? encode<T>(T value, Encoder<T> encoder) {
    return _i.encodeObject(value, encoder);
  }

  @pragma('vm:prefer-inline')
  Object? encodeValue(Object? value) => value;

  @pragma('vm:prefer-inline')
  Object? encodeObject<T>(T value, Encoder<T> encoder) =>
      encoder.encodeStruct(value, this);

  @pragma('vm:prefer-inline')
  KeyedStructEncoding<Key> encodeKeyed<Key>() {
    return KeyedStructEncoding._(<Key, dynamic>{});
  }

  @pragma('vm:prefer-inline')
  Object? encodeIterable<T>(Iterable<T> value, Encoder<T> Function(T) encode) {
    return [
      for (final e in value) encode(e).encodeStruct(e, StructEncoding._i)
    ];
  }
}

extension type KeyedStructEncoding<Key>._(Map<Key, dynamic> _value) {
  @pragma('vm:prefer-inline')
  void encodeValue(Key key, Object? value) {
    _value[key] = value;
  }

  @pragma('vm:prefer-inline')
  void encodeObject<T>(Key key, T value, Encoder<T> encoder) {
    _value[key] = encoder.encodeStruct(value, StructEncoding._(null));
  }

  @pragma('vm:prefer-inline')
  void encodeIterable<T>(
      Key key, Iterable<T> value, Encoder<T> Function(T) encode) {
    _value[key] = [
      for (final e in value) encode(e).encodeStruct(e, StructEncoding._i)
    ];
  }
}
