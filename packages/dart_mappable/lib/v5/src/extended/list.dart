part of 'extended.dart';

extension WrapListCodable<T> on Codable<T> {
  Codable<List<T>> list() => ListCodable(this);
}

class ListCodable<E> implements Codable<List<E>> {
  const ListCodable(this.codable);

  final Codable<E> codable;

  @override
  Decode<List<E>> decode() => ListDecode(codable.decode());

  @override
  Encode<List<E>> encode() => IterableEncode(codable.encode());
}

class ListDecode<E> extends DecodeBase1<List<E>, E> implements DecodeIterated<List<E>>, DecodeAny<List<E>> {
  ListDecode(Decode<E> super.decodeA);

  @override
  List<E> decodeIterated(IteratedDecoder iterated) {
    return [for (; iterated.nextItem();) iterated.decodeObject(decodeA!)];
  }
  
  @override
  List<E> decodeAny(Decoder decoder) {
    return decoder.decodeList(decodeA!);
  }
}

class IterableEncode<I extends Iterable<E>, E> extends EncodeBase1<I, E> {
  IterableEncode(Encode<E> super.encodeA);
  
  @override
  void encode(I value, Encoder encoder) {
    encoder.encodeIterable(value, encodeElement: (_) => encodeA!);
  }
}
