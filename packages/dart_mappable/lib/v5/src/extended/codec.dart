part of 'extended.dart';

abstract interface class Coding<Out> {
  T decode<T>(Out value, Decoder<T> decoder);
  Out encode<T>(T value, Encoder<T> encoder);
}

extension JoinCoding<Out> on Coding<Out> {
  Codec<In, Out> join<In>(Codable<In> codable) {
    return JoinedCodec(codable, this);
  }
}

class JoinedCodec<In, Out> extends Codec<In, Out> {
  JoinedCodec(this.codable, this.coding);

  final Codable<In> codable;
  final Coding<Out> coding;

  @override
  late final Converter<Out, In> decoder = DecodingConverter(this);

  @override
  late  final Converter<In, Out> encoder = EncodingConverter(this);

}

class DecodingConverter<In, Out> extends Converter<Out, In> {
  DecodingConverter(this.codec);
  final JoinedCodec<In, Out> codec;

  @override
  In convert(Out input) {
    return codec.coding.decode(input, codec.codable.decoder());
  }
}

class EncodingConverter<In, Out> extends Converter<In, Out> {
  EncodingConverter(this.codec);
  final JoinedCodec<In, Out> codec;

  @override
  Out convert(In input) {
    return codec.coding.encode(input, codec.codable.encoder());
  }
}