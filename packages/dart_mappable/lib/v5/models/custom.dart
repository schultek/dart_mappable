import '../src/mapper/container.dart';
import '../src/mapper/simple.dart';
import '../src/protocol/common.dart';

class UriMapper extends SimpleMapper<Uri> {
  @override
  Uri decode(Decoding decoding) {
    return Uri.parse(decoding.decodeString());
  }

  @override
  Object? encode(Uri value, Encoding encoding) {
    return encoding.encodeValue(value.toString());
  }
}

class Uri2Mapper extends SimpleMapper<Uri> {
  @override
  Uri decode(Decoding decoding) {
    return Uri.parse(decoding.decodeString()).replace(scheme: 'file');
  }

  @override
  Object? encode(Uri value, Encoding encoding) {
    return encoding.encodeValue(value.toString().toUpperCase());
  }
}

class SetMapper extends SimpleMapper1<Set> {
  @override
  Set<E> decode<E>(Decoding decoding, [Decoder<E>? d1]) {
    return decoding.decodeListDecodable(d1 ?? findDecoderFor<E>()).toSet();
  }

  @override
  Object? encode<E>(Set<E> value, Encoding encoding, [Encoder<E>? e1]) {
    return encoding.encodeIterable<E>(value, (e) => e1 ?? findEncoderFor<E>(e));
  }
}
