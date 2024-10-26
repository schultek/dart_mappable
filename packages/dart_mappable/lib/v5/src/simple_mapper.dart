import 'decoding/decoding.dart';
import 'encoding/encoding.dart';
import 'mapper.dart';

abstract class SimpleMapper<T> extends Mapper<T>
    implements DecoderOf<T>, EncoderOf<T> {
  late final Decoder<T> _decoder = Decoder.fromHandler(decode: decode);
  late final Encoder<T> _encoder = Encoder.fromHandler(encode: encode);

  @override
  Decoder<T> decoder() => _decoder;
  @override
  Encoder<T> encoder() => _encoder;

  T decode(Decoding decoding);
  Object? encode(T value, Encoding encoding);
}

abstract class SimpleMapper1<T> extends Mapper<T>
    implements DecoderOf1<T>, EncoderOf1<T> {
  @override
  Decoder<T> decoder<A>([Decoder<A>? d1]) {
    return Decoder.fromHandler(decode: (d) => decode<A>(d, d1));
  }

  @override
  Encoder<T> encoder<A>([Encoder<A>? e1]) {
    return Encoder.fromHandler(encode: (v, e) => encode<A>(v, e, e1));
  }

  T decode<A>(Decoding decoding, [Decoder<A>? d1]);
  Object? encode<A>(covariant T value, Encoding encoding, [Encoder<A>? e1]);
}
