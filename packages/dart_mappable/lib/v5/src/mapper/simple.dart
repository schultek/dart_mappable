import '../protocol/common.dart';
import 'mapper.dart';

abstract class SimpleMapper<T> extends Mapper<T> implements CodableMapper<T> {
  @override
  Codable<T> codable() => Codable.fromHandlers(
        decoder: () => Decoder.fromHandler(decode: decode),
        encoder: () => Encoder.fromHandler(encode: encode),
      );

  T decode(Decoding decoding);
  void encode(T value, Encoding encoding);
}

abstract class SimpleMapper1<T> extends Mapper<T> implements CodableMapper1<T> {
  @override
  Codable1<T, A> codable<A>() => Codable1.fromHandlers(
        decoder: ([Decoder<A>? d1]) =>
            Decoder.fromHandler(decode: (d) => decode<A>(d, d1)),
        encoder: ([Encoder<A>? e1]) =>
            Encoder.fromHandler(encode: (v, e) => encode<A>(v, e, e1)),
      );

  T decode<A>(Decoding decoding, [Decoder<A>? d1]);
  Object? encode<A>(covariant T value, Encoding encoding, [Encoder<A>? e1]);
}

abstract class SimpleMapper2<T> extends Mapper<T> implements CodableMapper2<T> {
  @override
  Codable2<T, A, B> codable<A, B>() => Codable2.fromHandlers(
        decoder: ([Decoder<A>? d1, Decoder<B>? d2]) =>
            Decoder.fromHandler(decode: (d) => decode<A, B>(d, d1, d2)),
        encoder: ([Encoder<A>? e1, Encoder<B>? e2]) =>
            Encoder.fromHandler(encode: (v, e) => encode<A, B>(v, e, e1, e2)),
      );

  T decode<A, B>(Decoding decoding, [Decoder<A>? d1, Decoder<B>? d2]);
  Object? encode<A, B>(covariant T value, Encoding encoding,
      [Encoder<A>? e1, Encoder<B>? e2]);
}
