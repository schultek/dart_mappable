part of 'extensions.dart';
abstract interface class Decoding {
  Object? decodeValue();

  String decodeString();
  String? decodeStringOrNull();

  bool decodeBool();
  bool? decodeBoolOrNull();

  int decodeInt();
  int? decodeIntOrNull();

  double decodeDouble();
  double? decodeDoubleOrNull();

  T decodeObject<T>(Decoder<T> decoder);
  T? decodeObjectOrNull<T>(Decoder<T> decoder);

  List<T> decodeList<T>();
  List<T>? decodeListOrNull<T>();

  List<T> decodeListObject<T>(Decoder<T> decoder);
  List<T>? decodeListObjectOrNull<T>(Decoder<T> decoder);

  KeyedDecoding<Key> decodeKeyed<Key>();

  Decoding clone();
}

abstract interface class KeyedDecoding<Key> {
  Object? decodeValue(Key key);

  String decodeString(Key key);
  String? decodeStringOrNull(Key key);

  bool decodeBool(Key key);
  bool? decodeBoolOrNull(Key key);

  int decodeInt(Key key);
  int? decodeIntOrNull(Key key);

  double decodeDouble(Key key);
  double? decodeDoubleOrNull(Key key);

  T decodeObject<T>(Key key, Decoder<T> decoder);
  T? decodeObjectOrNull<T>(Key key, Decoder<T> decoder);

  List<T> decodeList<T>(Key key);
  List<T>? decodeListOrNull<T>(Key key);

  List<T> decodeListObject<T>(Key key, Decoder<T> decoder);
  List<T>? decodeListObjectOrNull<T>(Key key, Decoder<T> decoder);
}

abstract interface class Encoding {
  void encodeValue(Object? value);

  void encodeObject<T>(T value, Encoder<T> encoder);

  void encodeIterable<T>(Iterable<T> value, Encoder<T> Function(T) encode);

  KeyedEncoding<Key> encodeKeyed<Key>();
}

abstract interface class KeyedEncoding<Key> {
  void encodeValue(Key key, Object? value);

  void encodeObject<T>(Key key, T value, Encoder<T> encoder);

  void encodeIterable<T>(
      Key key, Iterable<T> value, Encoder<T> Function(T) encode);
}