import '../src/decoder.dart';
import '../src/mapper.dart';
import '../src/serial_encoder.dart';
import '../src/structured_encoder.dart';

class UriMapper implements Mapper<Uri> {
  @override
  Uri decode(Decoder decoder) {
    return Uri.parse(decoder.decodeString()!);
  }

  @override
  Object? encodeStructured(StructuredEncoder encoder, Uri value) {
    return encoder.encodeValue(value.toString());
  }

  @override
  void encodeSerial(SerialEncoder encoder, Uri value) {
    encoder.encodeString(value.toString());
  }
}
