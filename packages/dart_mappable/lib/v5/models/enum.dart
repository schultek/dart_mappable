import '../src/protocol/common.dart';

enum Color implements Encodable<Color> {
  green,
  blue,
  red;

  Decoder<Color> decoder() => const ColorDecoder();
  @override
  Encoder<Color> encoder() => const ColorEncoder();
}

class ColorDecoder implements Decoder<Color> {
  const ColorDecoder();

  @override
  Color decodeSerial(SerialDecoding decoding) {
    return decode(decoding.decodeStringOrNull());
  }

  @override
  Color decodeStruct(StructDecoding decoding) {
    return decode(decoding.decodeStringOrNull());
  }

  Color decode(String? value) {
    return switch (value) {
      'green' => Color.green,
      'blue' => Color.blue,
      'red' => Color.red,
      _ => throw 'Unknown enum value',
    };
  }
}

class ColorEncoder implements Encoder<Color> {
  const ColorEncoder();

  @override
  void encodeSerial(Color value, SerialEncoding encoding) {
    encoding.encodeString(encode(value));
  }

  @override
  void encodeStruct(Color value, StructEncoding encoding) {
    encoding.encodeValue(encode(value));
  }

  String encode(Color value) {
    return switch (value) {
      Color.green => 'green',
      Color.blue => 'blue',
      Color.red => 'red',
    };
  }
}
