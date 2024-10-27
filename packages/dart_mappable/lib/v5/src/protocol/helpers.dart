part of 'common.dart';

abstract mixin class DecoderMixin<T> implements Decoder<T> {
  T decode(Decoding decoding);

  @override
  T decodeStruct(StructDecoding decoding) {
    return CompatStructDecoding.decode(this, decoding);
  }

  @override
  T decodeSerial(SerialDecoding decoding) {
    return CompatSerialDecoding.decode(this, decoding);
  }
}

abstract mixin class EncoderMixin<T> implements Encoder<T> {
  Object? encode(T value, Encoding encoding);

  @override
  Object? encodeStruct(T value, StructEncoding encoding) {
    var encoded = encode(value, CompatStructEncoding(encoding));
    if (encoded is KeyedCompatStructEncoding) {
      return encoded.encoding;
    }
    return encoded;
  }

  @override
  void encodeSerial(T value, SerialEncoding encoding) {
    var encoded = encode(value, CompatSerialEncoding(encoding));
    if (encoded is KeyedCompatSerialEncoding) {
      encoding.endObject();
    }
  }
}

final class _DecoderFromHandlers<T> implements Decoder<T> {
  const _DecoderFromHandlers({
    required T Function(StructDecoding decoding) decodeStruct,
    required T Function(SerialDecoding decoding) decodeSerial,
  })  : _decodeStruct = decodeStruct,
        _decodeSerial = decodeSerial;

  final T Function(StructDecoding decoding) _decodeStruct;
  final T Function(SerialDecoding decoding) _decodeSerial;

  @override
  T decodeStruct(StructDecoding decoding) => _decodeStruct(decoding);
  @override
  T decodeSerial(SerialDecoding decoding) => _decodeSerial(decoding);
}

final class _DecoderFromHandler<T> with DecoderMixin<T> {
  const _DecoderFromHandler({
    required T Function(Decoding decoding) decode,
  }) : _decode = decode;

  final T Function(Decoding decoding) _decode;

  @override
  T decode(Decoding decoding) => _decode(decoding);
}

final class _EncoderFromHandlers<T> implements Encoder<T> {
  const _EncoderFromHandlers({
    required Object? Function(T value, StructEncoding encoding) encodeStruct,
    required void Function(T value, SerialEncoding encoding) encodeSerial,
  })  : _encodeStruct = encodeStruct,
        _encodeSerial = encodeSerial;

  final Object? Function(T value, StructEncoding encoding) _encodeStruct;
  final void Function(T value, SerialEncoding encoding) _encodeSerial;

  @override
  Object? encodeStruct(T value, StructEncoding encoding) =>
      _encodeStruct(value, encoding);
  @override
  void encodeSerial(T value, SerialEncoding encoding) =>
      _encodeSerial(value, encoding);
}

final class _EncoderFromHandler<T> with EncoderMixin<T> {
  const _EncoderFromHandler({
    required Object? Function(T value, Encoding encoding) encode,
  }) : _encode = encode;

  final Object? Function(T value, Encoding encoding) _encode;

  @override
  Object? encode(T value, Encoding encoding) => _encode(value, encoding);
}
