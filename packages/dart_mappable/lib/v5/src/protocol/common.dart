part of 'protocol.dart';


abstract interface class Decoder<T> {
  T decodeSerial(SerialDecoding decoding);
  T decodeStruct(StructDecoding decoding);

}

abstract class Encoder<T> {
  void encodeStruct(T value, StructEncoding encoding);
  void encodeSerial(T value, SerialEncoding encoding);

}
