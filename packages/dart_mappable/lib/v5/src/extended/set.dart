part of 'extended.dart';

extension WrapSetCodable<T> on Codable<T> {
  Codable<Set<T>> set() => SetCodable(this);
}

class SetCodable<E> implements Codable<Set<E>> {
  const SetCodable(this.codable);

  final Codable<E> codable;

  @override
  Decode<Set<E>> decode() => SetDecode(codable.decode());

  @override
  Encode<Set<E>> encode() => IterableEncode(codable.encode());
}

class SetDecode<E> extends DecodeBase1<Set<E>, E> implements DecodeIterated<Set<E>>, DecodeAny<Set<E>> {
  SetDecode(Decode<E> super.decodeA);

  @override
  Set<E> decodeIterated(IteratedDecoder iterated) {
    return {for (; iterated.nextItem();) iterated.decodeObject(decodeA!)};
  }
  
  @override
  Set<E> decodeAny(Decoder decode) {
    return decode.decodeList(decodeA!).toSet();
  }
}
