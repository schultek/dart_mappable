part 'compat.dart';
part 'helpers.dart';
part 'interface.dart';
part 'serial.dart';
part 'structured.dart';

abstract interface class Decoding {
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

  List<T> decodeList<T>();
  List<T>? decodeListOrNull<T>();

  List<T> decodeListDecodable<T>(Decoder<T> decoder);
  List<T>? decodeListDecodableOrNull<T>(Decoder<T> decoder);

  KeyedDecoding<Key> decodeKeyed<Key>();

  Decoding clone();
}

abstract interface class KeyedDecoding<Key> {
  String decodeString(Key key);
  String? decodeStringOrNull(Key key);

  bool decodeBool(Key key);
  bool? decodeBoolOrNull(Key key);

  int decodeInt(Key key);
  int? decodeIntOrNull(Key key);

  double decodeDouble(Key key);
  double? decodeDoubleOrNull(Key key);

  T decodeDecodable<T>(Key key, Decoder<T> decoder);
  T? decodeDecodableOrNull<T>(Key key, Decoder<T> decoder);

  List<T> decodeList<T>(Key key);
  List<T>? decodeListOrNull<T>(Key key);

  List<T> decodeListDecodable<T>(Key key, Decoder<T> decoder);
  List<T>? decodeListDecodableOrNull<T>(Key key, Decoder<T> decoder);
}

abstract interface class Encoding {
  Object? encodeValue(Object? value);

  Object? encodeEncodable<T>(T value, Encoder<T> encoder);

  Object? encodeIterable<T>(Iterable<T> value, Encoder<T> Function(T) encode);

  KeyedEncoding<Key> encodeKeyed<Key>();
}

abstract interface class KeyedEncoding<Key> {
  void encodeValue(Key key, Object? value);

  void encodeEncodable<T>(Key key, T value, Encoder<T> encoder);

  void encodeIterable<T>(
      Key key, Iterable<T> value, Encoder<T> Function(T) encode);
}

abstract interface class Decoder<T> {
  T decodeSerial(SerialDecoding decoding);
  T decodeStruct(StructDecoding decoding);

  const factory Decoder.fromHandlers({
    required T Function(StructDecoding decoding) decodeStruct,
    required T Function(SerialDecoding decoding) decodeSerial,
  }) = _DecoderFromHandlers;

  const factory Decoder.fromHandler({
    required T Function(Decoding decoding) decode,
  }) = _DecoderFromHandler;
}

abstract class Encoder<T> {
  Object? encodeStruct(T value, StructEncoding encoding);
  void encodeSerial(T value, SerialEncoding encoding);

  const factory Encoder.fromHandlers({
    required Object? Function(T value, StructEncoding encoding) encodeStruct,
    required void Function(T value, SerialEncoding encoding) encodeSerial,
  }) = _EncoderFromHandlers;

  const factory Encoder.fromHandler({
    required Object? Function(T value, Encoding encoding) encode,
  }) = _EncoderFromHandler;
}
