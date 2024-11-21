part of 'extended.dart';

extension CodableHookExtension<T> on Codable<T> {
  Codable<T> hook(Hook hook) => CodableHook(this, hook);
}

abstract mixin class Hook {
  Decode<T> wrapDecode<T>(Decode<T> decode) => decode;
  Encode<T> wrapEncode<T>(Encode<T> encode) => encode;
}

class CodableHook<T> implements Codable<T> {
  const CodableHook(this.codable, this.hook);

  final Codable<T> codable;
  final Hook hook;

  @override
  Decode<T> decode() => hook.wrapDecode(codable.decode());

  @override
  Encode<T> encode() => hook.wrapEncode(codable.encode());
}


abstract mixin class ProxyHook implements Hook {
  @override
  T decode<T>(Decoder decoder, Decode<T> decode) {
    return ProxyDecoder(decoder, this).decodeObject(decode);
  }

  String visitString(String value) => value;
  String? visitStringOrNull(String? value) => value;

  @override
  void encode<T>(T value, Encoder encoder, Encode<T> encode) {
    encoder.encodeObject(value, encode);
  }
}

class ProxyDecoder extends WrappedDecoderBase {
  ProxyDecoder(super.wrapped, this.hook);

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
  Decoder clone() {
    return ProxyDecoder(wrapped.clone(), hook);
  }
}
