part of 'extended.dart';

extension CodableHookExtension<T> on Codable<T> {
  Codable<T> hook(Hook hook) => CodableHook(this, hook);
}

abstract mixin class Hook {
  T decodeSerial<T>(SerialDecoding decoding, Decoder<T> decoder) => decoding.decodeObject(decoder);
  T decodeStruct<T>(StructDecoding decoding, Decoder<T> decoder) => decoding.decodeObject(decoder);

  void encodeSerial<T>(T value, SerialEncoding encoding, Encoder<T> encoder) => encoding.encodeObject(value, encoder);
  void encodeStruct<T>(T value, StructEncoding encoding, Encoder<T> encoder) => encoding.encodeObject(value, encoder);
}

class CodableHook<T> implements Codable<T> {
  const CodableHook(this.codable, this.hook);

  final Codable<T> codable;
  final Hook hook;

  @override
  Decoder<T> decoder() => _HookDecoder(codable.decoder(), hook);

  @override
  Encoder<T> encoder() => _HookEncoder(codable.encoder(), hook);

}




class _HookDecoder<T> implements Decoder<T> {
  const _HookDecoder(this.decoder, this.hook);
  final Decoder<T> decoder;
  final Hook hook;

  @override
  T decodeSerial(SerialDecoding decoding) {
    return hook.decodeSerial<T>(decoding, decoder);
  }

  @override
  T decodeStruct(StructDecoding decoding) {
    return hook.decodeStruct<T>(decoding, decoder);
  }

}

class _HookEncoder<T> implements Encoder<T> {
  const _HookEncoder(this.encoder, this.hook);
  final Encoder<T> encoder;
  final Hook hook;

  @override
  void encodeSerial(T value, SerialEncoding encoding) {
    hook.encodeSerial<T>(value, encoding, encoder);
  }

  @override
  void encodeStruct(T value, StructEncoding encoding) {
    hook.encodeStruct<T>(value, encoding, encoder);
  }

}


abstract mixin class ProxyHook implements Hook {
  @override
  T decodeStruct<T>(StructDecoding decoding, Decoder<T> decoder) {
    return ProxyStructDecoding(decoding, this).decodeObject(decoder);
  }

  @override
  T decodeSerial<T>(SerialDecoding decoding, Decoder<T> decoder) {
    return ProxySerialDecoding(decoding, this).decodeObject(decoder);
  }

  String visitString(String value) => value;
  String? visitStringOrNull(String? value) => value;

  @override
  void encodeSerial<T>(T value, SerialEncoding encoding, Encoder<T> encoder) => encoding.encodeObject(value, encoder);
  @override
  void encodeStruct<T>(T value, StructEncoding encoding, Encoder<T> encoder) => encoding.encodeObject(value, encoder);
}

abstract mixin class ProxyDecoding implements WrappedDecoding {
  ProxyHook get hook;
  @override
  StructDecoding wrapStruct(StructDecoding decoding) => ProxyStructDecoding(decoding, hook);

  @override
  SerialDecoding wrapSerial(SerialDecoding decoding) => ProxySerialDecoding(decoding, hook);
}

class ProxyStructDecoding extends WrappedStructDecoding with ProxyDecoding {
  ProxyStructDecoding(super.wrapped, this.hook);

  @override
  final ProxyHook hook;

  @override
  String decodeString() {
    return hook.visitString(super.decodeString());
  }

  @override
  String? decodeStringOrNull() {
    return hook.visitStringOrNull(super.decodeStringOrNull());
  }

  @override
  KeyedStructDecoding<Key> decodeKeyed<Key>() => ProxyKeyedStructDecoding(super.decodeKeyed<Key>(), this, hook);

}


class ProxyKeyedStructDecoding<Key> extends WrappedKeyedStructDecoding<Key> {
  ProxyKeyedStructDecoding(super.wrapped, super.parent, this.hook);

  final ProxyHook hook;


  @override
  String decodeString(Key key) {
    return hook.visitString(super.decodeString(key));
  }

  @override
  String? decodeStringOrNull(Key key) {
    return hook.visitStringOrNull(super.decodeStringOrNull(key));
  }


}


class ProxySerialDecoding extends WrappedSerialDecoding with ProxyDecoding {
  ProxySerialDecoding(super.wrapped, this.hook);

  @override
  final ProxyHook hook;

  @override
  String decodeString() {
    return hook.visitString(super.decodeString());
  }

  @override
  String? decodeStringOrNull() {
    return hook.visitStringOrNull(super.decodeStringOrNull());
  }
}




mixin class HookMixin implements Hook {

  T decode<T>(Decoding decoding, Decoder<T> decoder) => decoding.decodeObject(decoder);

  @override
  T decodeSerial<T>(SerialDecoding decoding, Decoder<T> decoder) {
    return CompatSerialDecoding.decode((d) => decode<T>(d, decoder), decoding);
  }

  @override
  T decodeStruct<T>(StructDecoding decoding, Decoder<T> decoder) {
    return CompatStructDecoding.decode((d) => decode<T>(d, decoder), decoding);
  }

  void encode<T>(T value, Encoding encoding, Encoder<T> encoder) => encoding.encodeObject(value, encoder);

  @override
  void encodeSerial<T>(T value, SerialEncoding encoding, Encoder<T> encoder) {
    CompatSerialEncoding.encode(value, (v, e) => encode(v, e, encoder), encoding);
  }

  @override
  void encodeStruct<T>(T value, StructEncoding encoding, Encoder<T> encoder) {
    CompatStructEncoding.encode(value, (v, e) => encode(v, e, encoder), encoding);
  }

}