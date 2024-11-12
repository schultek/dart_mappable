part of 'extensions.dart';

extension WrapSetCodable<T> on Codable<T> {
  Codable<Set<T>> set() => SetCodable(this);
}

class SetCodable<E> implements Codable<Set<E>> {
  const SetCodable(this.codable);

  final Codable<E> codable;

  @override
  Decoder<Set<E>> decoder() => SetDecoder(codable.decoder());

  @override
  Encoder<Set<E>> encoder() => IterableEncoder(codable.encoder());
}

class SetDecoder<E> extends DecoderBase1<Set<E>, E> {
  SetDecoder(Decoder<E> super.decoderA);

  @override
  Set<E> decodeSerial(SerialDecoding decoding) {
    return {for (; decoding.nextItem();) decoding.decodeObject(decoderA!)};
  }

  @override
  Set<E> decodeStruct(StructDecoding decoding) {
    return decoding.decodeListObject(decoderA!).toSet();
  }
}