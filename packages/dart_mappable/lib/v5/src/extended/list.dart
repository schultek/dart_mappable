part of 'extended.dart';

extension WrapListCodable<T> on Codable<T> {
  Codable<List<T>> list() => ListCodable(this);
}

class ListCodable<E> implements Codable<List<E>> {
  const ListCodable(this.codable);

  final Codable<E> codable;

  @override
  Decoder<List<E>> decoder() => ListDecoder(codable.decoder());

  @override
  Encoder<List<E>> encoder() => IterableEncoder(codable.encoder());
}

class ListDecoder<E> extends DecoderBase1<List<E>, E> {
  ListDecoder(Decoder<E> super.decoderA);

  @override
  List<E> decodeSerial(SerialDecoding decoding) {
    return [for (; decoding.nextItem();) decoding.decodeObject(decoderA!)];
  }

  @override
  List<E> decodeStruct(StructDecoding decoding) {
    return decoding.decodeListObject(decoderA!);
  }
}

class IterableEncoder<I extends Iterable<E>, E> extends EncoderBase1<I, E> {
  IterableEncoder(Encoder<E> super.encoderA);

  @override
  void encodeSerial(I value, SerialEncoding encoding) {
    encoding.startArray();
    for (final e in value){
      encoding.encodeObject(e, encoderA!);
    }
    encoding.endArray();
  }

  @override
  void encodeStruct(I value, StructEncoding encoding) {
    encoding.encodeIterable(value, (_) => encoderA!);
  }
}
