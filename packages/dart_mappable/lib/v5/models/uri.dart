import '../src/decoder.dart';
import '../src/encoder.dart';
import '../src/mapper.dart';
import '../src/serial_decoder.dart';
import '../src/structured_decoder.dart';

class UriMapper implements Mapper<Uri> {
  @override
  Uri decodeStructured(StructuredDecoder decoder) {
    return Uri.parse(decoder.decodeString());
  }

  @override
  Uri decodeSerial(SerialDecoder decoder) {
    return Uri.parse(decoder.decodeString());
  }

  @override
  final Decodable<Uri> decodable = Decodable.fromHandler(decode: (decoder) {
    return Uri.parse(decoder.decodeString());
  });

  @override
  Encodable encodableOf(Uri value) {
    return Encodable.fromHandler(encode: (encoder) {
      return encoder.encodeValue(value.toString());
    });
  }
}
