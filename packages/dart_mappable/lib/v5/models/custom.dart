import '../src/mapper/container.dart';
import '../src/mapper/simple.dart';
import '../src/protocol/common.dart';

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

class UriDecoder with DecoderMixin<Uri> implements Decoder<Uri> {
  @override
  Uri decode(Decoding decoding) {
    decoding.decodeKeyed();
    return Uri.parse(decoding.decodeString());
  }
}

class Uri2Mapper extends SimpleMapper<Uri> {
  @override
  Uri decode(Decoding decoding) {
    return Uri.parse(decoding.decodeString()).replace(scheme: 'file');
  }

  @override
  void encode(Uri value, Encoding encoding) {
    encoding.encodeValue(value.toString().toUpperCase());
  }
}

class SetMapper extends SimpleMapper1<Set> {
  @override
  Set<E> decode<E>(Decoding decoding, [Decoder<E>? d1]) {
    return decoding.decodeListObject(d1 ?? findDecoderFor<E>()).toSet();
  }

  @override
  void encode<E>(Set<E> value, Encoding encoding, [Encoder<E>? e1]) {
    encoding.encodeIterable<E>(value, (e) => e1 ?? findEncoderFor<E>(e));
  }
}
