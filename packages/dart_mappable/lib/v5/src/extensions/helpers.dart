part of 'extensions.dart';

final class CodableUtils {
  static Codable<T> fromHandlers<T>({
    required Decoder<T> Function() decoder,
    required Encoder<T> Function() encoder,
  }) => _CodableFromHandlers(decoder, encoder);

  static Codable1<T, A> fromHandlers1<T, A>({
    required Decoder<T> Function([Decoder<A>? d1]) decoder,
    required Encoder<T> Function([Encoder<A>? e1]) encoder,
  }) => _Codable1FromHandlers(decoder, encoder);

  static Codable2<T,A, B> fromHandlers2<T, A, B>({
    required Decoder<T> Function([Decoder<A>? d1, Decoder<B>? d2]) decoder,
    required Encoder<T> Function([Encoder<A>? e1, Encoder<B>? e2]) encoder,
  }) => _Codable2FromHandlers(decoder, encoder);
}

final class DecoderUtils {

  static Decoder<T> fromHandlers<T>({
    required T Function(StructDecoding decoding) decodeStruct,
    required T Function(SerialDecoding decoding) decodeSerial,
  }) => _DecoderFromHandlers(decodeStruct, decodeSerial);

  static Decoder<T> fromHandler<T>({
    required T Function(Decoding decoding) decode,
  }) => _DecoderFromHandler(decode);
}

final class EncoderUtils {

  static Encoder<T> fromHandlers<T>({
    required void Function(T value, StructEncoding encoding) encodeStruct,
    required void Function(T value, SerialEncoding encoding) encodeSerial,
  }) => _EncoderFromHandlers(encodeStruct, encodeSerial);

  static Encoder<T> fromHandler<T>({
    required void Function(T value, Encoding encoding) encode,
  }) => _EncoderFromHandler(encode);
}

final class _DecoderFromHandlers<T> implements Decoder<T> {
  const _DecoderFromHandlers(this._decodeStruct, this._decodeSerial);

  final T Function(StructDecoding decoding) _decodeStruct;
  final T Function(SerialDecoding decoding) _decodeSerial;

  @override
  T decodeStruct(StructDecoding decoding) => _decodeStruct(decoding);
  @override
  T decodeSerial(SerialDecoding decoding) => _decodeSerial(decoding);

}

final class _DecoderFromHandler<T> with DecoderMixin<T> {
  const _DecoderFromHandler(this._decode);

  final T Function(Decoding decoding) _decode;

  @override
  T decode(Decoding decoding) => _decode(decoding);

}

final class _EncoderFromHandlers<T> implements Encoder<T> {
  const _EncoderFromHandlers(this._encodeStruct, this._encodeSerial);

  final void Function(T value, StructEncoding encoding) _encodeStruct;
  final void Function(T value, SerialEncoding encoding) _encodeSerial;

  @override
  void encodeStruct(T value, StructEncoding encoding) =>
      _encodeStruct(value, encoding);
  @override
  void encodeSerial(T value, SerialEncoding encoding) =>
      _encodeSerial(value, encoding);

}

final class _EncoderFromHandler<T> with EncoderMixin<T> {
  const _EncoderFromHandler(this._encode);

  final Object? Function(T value, Encoding encoding) _encode;

  @override
  Object? encode(T value, Encoding encoding) => _encode(value, encoding);

}


final class _CodableFromHandlers<T> implements Codable<T> {
  const _CodableFromHandlers(this._decoder, this._encoder);

  final Decoder<T> Function() _decoder;
  final Encoder<T> Function() _encoder;

  @override
  Decoder<T> decoder() => _decoder();
  @override
  Encoder<T> encoder() => _encoder();
}

final class _Codable1FromHandlers<T, A> implements Codable1<T, A> {
  const _Codable1FromHandlers(this._decoder, this._encoder);

  final Decoder<T> Function([Decoder<A>? d1]) _decoder;
  final Encoder<T> Function([Encoder<A>? e1]) _encoder;

  @override
  Decoder<T> decoder([Decoder<A>? d1]) => _decoder(d1);
  @override
  Encoder<T> encoder([Encoder<A>? e1]) => _encoder(e1);
}

final class _Codable2FromHandlers<T, A, B> implements Codable2<T, A, B> {
  const _Codable2FromHandlers(this._decoder, this._encoder);

  final Decoder<T> Function([Decoder<A>? d1, Decoder<B>? d2]) _decoder;
  final Encoder<T> Function([Encoder<A>? e1, Encoder<B>? e2]) _encoder;

  @override
  Decoder<T> decoder([Decoder<A>? d1, Decoder<B>? d2]) => _decoder(d1, d2);
  @override
  Encoder<T> encoder([Encoder<A>? e1, Encoder<B>? e2]) => _encoder(e1, e2);
}
