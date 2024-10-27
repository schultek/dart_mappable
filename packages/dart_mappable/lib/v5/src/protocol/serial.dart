part of 'common.dart';

abstract interface class SerialDecoding {
  Object? decodeValue();

  String decodeString();
  String? decodeStringOrNull();

  bool decodeBool();
  bool? decodeBoolOrNull();

  int decodeInt();
  int? decodeIntOrNull();

  double decodeDouble();
  double? decodeDoubleOrNull();

  T decodeDecodable<T>(Decoder<T> decoder);
  T? decodeDecodableOrNull<T>(Decoder<T> decoder);

  Object? nextKey();
  bool nextItem();

  void skipNext();
  bool skipNull();
  void skipRemainingKeys();
  void skipRemainingItems();

  SerialDecoding clone();
}

abstract interface class SerialEncoding {
  void startObject<Key>();

  void endObject();

  void startArray<E>();

  void endArray();

  void encodeKey(Object? key);

  void encodeNull();

  void encodeString(String value);

  void encodeInt(int value);

  void encodeDouble(double value);

  void encodeBool(bool value);

  void encodeEncodable<T>(T value, Encoder<T> encoder);
}
