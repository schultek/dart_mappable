part of 'common.dart';

abstract interface class Decodable<T> {
  Decoder<T> decoder();
}

abstract interface class Encodable<T> {
  Encoder<T> encoder();
}

abstract interface class Codable<T> implements Decodable<T>, Encodable<T> {
  const factory Codable.fromHandlers({
    required Decoder<T> Function() decoder,
    required Encoder<T> Function() encoder,
  }) = _CodableFromHandlers;
}

abstract interface class Decodable1<T, A> implements Decodable<T> {
  @override
  Decoder<T> decoder([Decoder<A>? d1]);
}

abstract interface class Encodable1<T, A> implements Encodable<T> {
  @override
  Encoder<T> encoder([Encoder<A>? e1]);
}

abstract interface class Codable1<T, A>
    implements Codable<T>, Decodable1<T, A>, Encodable1<T, A> {
  const factory Codable1.fromHandlers({
    required Decoder<T> Function([Decoder<A>? d1]) decoder,
    required Encoder<T> Function([Encoder<A>? e1]) encoder,
  }) = _Codable1FromHandlers;
}

abstract interface class Decodable2<T, A, B> implements Decodable<T> {
  @override
  Decoder<T> decoder([Decoder<A>? d1, Decoder<B>? d2]);
}

abstract interface class Encodable2<T, A, B> implements Encodable<T> {
  @override
  Encoder<T> encoder([Encoder<A>? e1, Encoder<B>? e2]);
}

abstract interface class Codable2<T, A, B>
    implements Codable<T>, Decodable2<T, A, B>, Encodable2<T, A, B> {
  const factory Codable2.fromHandlers({
    required Decoder<T> Function([Decoder<A>? d1, Decoder<B>? d2]) decoder,
    required Encoder<T> Function([Encoder<A>? e1, Encoder<B>? e2]) encoder,
  }) = _Codable2FromHandlers;
}

final class _CodableFromHandlers<T> implements Codable<T> {
  const _CodableFromHandlers({
    required Decoder<T> Function() decoder,
    required Encoder<T> Function() encoder,
  })  : _decoder = decoder,
        _encoder = encoder;

  final Decoder<T> Function() _decoder;
  final Encoder<T> Function() _encoder;

  @override
  Decoder<T> decoder() => _decoder();
  @override
  Encoder<T> encoder() => _encoder();
}

final class _Codable1FromHandlers<T, A> implements Codable1<T, A> {
  const _Codable1FromHandlers({
    required Decoder<T> Function([Decoder<A>? d1]) decoder,
    required Encoder<T> Function([Encoder<A>? e1]) encoder,
  })  : _decoder = decoder,
        _encoder = encoder;

  final Decoder<T> Function([Decoder<A>? d1]) _decoder;
  final Encoder<T> Function([Encoder<A>? e1]) _encoder;

  @override
  Decoder<T> decoder([Decoder<A>? d1]) => _decoder(d1);
  @override
  Encoder<T> encoder([Encoder<A>? e1]) => _encoder(e1);
}

final class _Codable2FromHandlers<T, A, B> implements Codable2<T, A, B> {
  const _Codable2FromHandlers({
    required Decoder<T> Function([Decoder<A>? d1, Decoder<B>? d2]) decoder,
    required Encoder<T> Function([Encoder<A>? e1, Encoder<B>? e2]) encoder,
  })  : _decoder = decoder,
        _encoder = encoder;

  final Decoder<T> Function([Decoder<A>? d1, Decoder<B>? d2]) _decoder;
  final Encoder<T> Function([Encoder<A>? e1, Encoder<B>? e2]) _encoder;

  @override
  Decoder<T> decoder([Decoder<A>? d1, Decoder<B>? d2]) => _decoder(d1, d2);
  @override
  Encoder<T> encoder([Encoder<A>? e1, Encoder<B>? e2]) => _encoder(e1, e2);
}
