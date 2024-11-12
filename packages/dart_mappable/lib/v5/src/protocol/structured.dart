part of 'protocol.dart';

abstract interface class StructDecoding {
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

  KeyedStructDecoding<Key> decodeKeyed<Key>();

  List<T> decodeList<T>();
  List<T>? decodeListOrNull<T>();

  List<T> decodeListObject<T>(Decoder<T> decoder);
  List<T>? decodeListObjectOrNull<T>(Decoder<T> decoder);

  Map<K, V> decodeMap<K, V>();
  Map<K, V>? decodeMapOrNull<K, V>();

  Map<K, V> decodeMapObject<K, V>(Decoder<V> decoder);
  Map<K, V>? decodeMapObjectOrNull<K, V>(Decoder<V> decoder);
}

abstract interface class KeyedStructDecoding<Key> {
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

  Map<K, V> decodeMap<K, V>(Key key);
  Map<K, V>? decodeMapOrNull<K, V>(Key key);

  Map<K, V> decodeMapObject<K, V>(Key key, Decoder<V> decoder);
  Map<K, V>? decodeMapObjectOrNull<K, V>(Key key, Decoder<V> decoder);
}

abstract interface class StructEncoding {
  void encodeValue(Object? value);

  void encodeObject<T>(T value, Encoder<T> encoder);

  KeyedStructEncoding<Key> encodeKeyed<Key>();

  void encodeIterable<T>(Iterable<T> value, Encoder<T> Function(T) encode);

  void encodeMap<K, V>(Map<K, V> value, Encoder<V> Function(V) encode);
}

abstract interface class KeyedStructEncoding<Key> {
  void encodeValue(Key key, Object? value);

  void encodeObject<T>(Key key, T value, Encoder<T> encoder);

  void encodeIterable<T>(
      Key key, Iterable<T> value, Encoder<T> Function(T) encode);
}


