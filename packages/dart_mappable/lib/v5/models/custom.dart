import '../src/extended/extended.dart';
import '../src/mapper/simple.dart';

class UriMapper extends SimpleMapper<Uri> {
  @override
  Uri decode(Decoding decoding) {
    return Uri.parse(decoding.decodeString());
  }

  @override
  void encode(Uri value, Encoding encoding) {
    encoding.encodeValue(value.toString());
  }
}