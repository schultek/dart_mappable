part of 'common.dart';

abstract interface class StructDecoding {
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
  KeyedStructDecoding<Key> decodeKeyed<Key>();
  List<T> decodeList<T>();
  List<T>? decodeListOrNull<T>();
  List<T> decodeListObject<T>(Decoder<T> decoder);
  List<T>? decodeListObjectOrNull<T>(Decoder<T> decoder);
}

abstract interface class KeyedStructDecoding<Key> {
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

abstract interface class StructEncoding {
  Object? encodeValue(Object? value);
  Object? encodeObject<T>(T value, Encoder<T> encoder);
  KeyedStructEncoding<Key> encodeKeyed<Key>();
  Object? encodeIterable<T>(Iterable<T> value, Encoder<T> Function(T) encode);
}

abstract interface class KeyedStructEncoding<Key> {
  void encodeValue(Key key, Object? value);
  void encodeObject<T>(Key key, T value, Encoder<T> encoder);
  void encodeIterable<T>(
      Key key, Iterable<T> value, Encoder<T> Function(T) encode);
}
