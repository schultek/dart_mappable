import '../src/decoding/decoding.dart';
import '../src/encoding/encoding.dart';
import '../src/mapper.dart';

class UriMapper extends Mapper<Uri>
    with DecoderMapper<Uri>, EncoderMapper<Uri> {
  @override
  Decoder<Uri> decoder() {
    return Decoder.fromHandler(decode: (decoding) {
      return Uri.parse(decoding.decodeString());
    });
  }

  @override
  Encoder<Uri> encoder() {
    return Encoder.fromHandler(encode: (encoding, value) {
      return encoding.encodeValue(value.toString());
    });
  }
}
