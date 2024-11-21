part of 'extended.dart';

abstract mixin class WrappedDecoder {
  Decoder wrap(Decoder decoder) => decoder;
}

 abstract class WrappedDecoderBase with WrappedDecoder implements Decoder {
  WrappedDecoderBase(this.wrapped);
  final Decoder wrapped;

  @override
  T decodeObject<T>(Decode<T> decode) => wrapped.decodeObject(decode.wrapped(this));

  @override
  T? decodeObjectOrNull<T>(Decode<T> decode) => wrapped.decodeObjectOrNull(decode.wrapped(this));
  
  @override
  bool decodeBool() => wrapped.decodeBool();
  
  @override
  bool? decodeBoolOrNull() => wrapped.decodeBoolOrNull();
  
  @override
  double decodeDouble() => wrapped.decodeDouble();
  
  @override
  double? decodeDoubleOrNull() => wrapped.decodeDoubleOrNull();
  
  @override
  int decodeInt() => wrapped.decodeInt();
  
  @override
  int? decodeIntOrNull() => wrapped.decodeIntOrNull();
  
  @override
  List<E> decodeList<E>([Decode<E>? decodeElement]) => wrapped.decodeList(decodeElement?.wrapped(this));
  
  @override
  List<E>? decodeListOrNull<E>([Decode<E>? decodeElement]) => wrapped.decodeListOrNull(decodeElement?.wrapped(this));
  
  @override
  Map<K, V> decodeMap<K, V>([Decode<K>? decodeKey, Decode<V>? decodeValue]) => wrapped.decodeMap(decodeKey?.wrapped(this), decodeValue?.wrapped(this));
  
  @override
  Map<K, V>? decodeMapOrNull<K, V>([Decode<K>? decodeKey, Decode<V>? decodeValue]) => wrapped.decodeMapOrNull(decodeKey?.wrapped(this), decodeValue?.wrapped(this));
  @override
  num decodeNum() => wrapped.decodeNum();
  
  @override
  num? decodeNumOrNull() => wrapped.decodeNumOrNull();
  
  @override
  String decodeString() => wrapped.decodeString();
  
  @override
  String? decodeStringOrNull() => wrapped.decodeStringOrNull();
  
  @override
  Object? decodeValue() => wrapped.decodeValue();
  
  @override
  bool skipNull() => wrapped.skipNull();



}

extension _Wrap<T> on Decode<T> {
  Decode<T> wrapped(WrappedDecoder decoder) => _WrappedDecode(this, decoder);
}

class _WrappedDecode<T> implements DecodeAny<T> {
  _WrappedDecode(this.decode, this.parent);

  final Decode<T> decode;
  final WrappedDecoder parent;

  @override
  T decodeAny(Decoder decoder) {
    return parent.wrap(decoder).decodeObject(decode);
  }
}
