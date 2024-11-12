part of 'extensions.dart';

abstract mixin class DecoderMixin<T> implements Decoder<T> {
  T decode(Decoding decoding);

  @override
  T decodeStruct(StructDecoding decoding) {
    return CompatStructDecoding.decode(decode, decoding);
  }

  @override
  T decodeSerial(SerialDecoding decoding) {
    return CompatSerialDecoding.decode(decode, decoding);
  }
}

abstract mixin class EncoderMixin<T> implements Encoder<T> {
  void encode(T value, Encoding encoding);

  @override
  void encodeStruct(T value, StructEncoding encoding) {
    CompatStructEncoding.encode(value, encode, encoding);
  }

  @override
  void encodeSerial(T value, SerialEncoding encoding) {
    CompatSerialEncoding.encode(value, encode, encoding);
  }
}
