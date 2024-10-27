import '../src/protocol/common.dart';

enum Color implements Encodable<Color> {
  Green,
  BLUE,
  bloodRED;

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
      'green' => Color.Green,
      'blue' => Color.BLUE,
      'blood-red' => Color.bloodRED,
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
  Object? encodeStruct(Color value, StructEncoding encoding) {
    return encoding.encodeValue(encode(value));
  }

  String encode(Color value) {
    return switch (value) {
      Color.Green => 'green',
      Color.BLUE => 'blue',
      Color.bloodRED => 'blood-red',
    };
  }
}
