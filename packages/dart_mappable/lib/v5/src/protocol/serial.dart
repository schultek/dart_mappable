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

  T decodeObject<T>(Decoder<T> decoder);
  T? decodeObjectOrNull<T>(Decoder<T> decoder);

  Object? nextKey();
  void skipRemainingKeys();

  bool nextItem();
  void skipRemainingItems();

  void skipNext();
  bool skipNull();

  SerialDecoding clone();
}

abstract interface class SerialEncoding {
  void encodeNull();

  void encodeString(String value);

  void encodeInt(int value);

  void encodeDouble(double value);

  void encodeBool(bool value);

  void encodeObject<T>(T value, Encoder<T> encoder);

  void startObject<Key>();
  void endObject();

  void startArray<E>();
  void endArray();

  void encodeKey(Object? key);

}
