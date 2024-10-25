import 'lazy_encoding.dart';
import 'serial_encoding.dart';
import 'struct_encoding.dart';

export 'lazy_encoding.dart';
export 'serial_encoding.dart';
export 'struct_encoding.dart';

abstract class Encoder<T> {
  Object? encodeStruct(StructEncoding encoding, T value);
  void encodeSerial(SerialEncoding encoding, T value);

  const factory Encoder.fromHandlers({
    required Object? Function(StructEncoding encoding, T value) encodeStruct,
    required void Function(SerialEncoding encoding, T value) encodeSerial,
  }) = _EncoderFromHandlers;

  const factory Encoder.fromHandler({
    required Object? Function(Encoding encoding, T value) encode,
  }) = _EncoderFromHandler;
}

abstract interface class Encodable<T extends Encodable<T>> {
  Encoder<T> encoder();
}

abstract interface class Encodable1<T extends Encodable<T>, A>
    implements Encodable<T> {
  @override
  Encoder<T> encoder([Encoder<A>? e1]);
}

abstract mixin class EncoderMixin<T> implements Encoder<T> {
  Object? encode(Encoding encoder, T value);

  @override
  Object? encodeStruct(StructEncoding encoder, T value) {
    var encoded = encode(CompatStructEncoding(encoder), value);
    if (encoded is KeyedCompatStructEncoding) {
      return encoded.encoding;
    }
    return encoded;
  }

  @override
  void encodeSerial(SerialEncoding encoder, T value) {
    var encoded = encode(GeneralizedSerialEncoding(encoder), value);
    if (encoded is KeyedGeneralizedSerialEncoding) {
      encoder.endObject();
    }
  }
}

extension UtilEncodable on Encodable {
  Map<String, dynamic> toMap() {
    return StructEncoding.encode(this, encoder()) as Map<String, dynamic>;
  }

  Map<String, dynamic> toLazyMap() {
    return LazyEncoding.encode(this, encoder()) as Map<String, dynamic>;
  }

  String toJson() {
    return JsonEncoding.encode(this, encoder());
  }

  List<int> toJsonBytes() {
    return JsonEncoding.encodeBytes(this, encoder());
  }
}

extension UtilEncodable1<T extends Encodable<T>, A> on Encodable1<T, A> {
  Map<String, dynamic> toMap([Encoder<A>? e1]) {
    return StructEncoding.encode(this, encoder(e1)) as Map<String, dynamic>;
  }

  Map<String, dynamic> toLazyMap([Encoder<A>? e1]) {
    return LazyEncoding.encode(this, encoder(e1)) as Map<String, dynamic>;
  }

  String toJson([Encoder<A>? e1]) {
    return JsonEncoding.encode(this, encoder(e1));
  }

  List<int> toJsonBytes([Encoder<A>? e1]) {
    return JsonEncoding.encodeBytes(this, encoder(e1));
  }
}

abstract interface class Encoding {
  KeyedEncoding<Key> encodeKeyed<Key>();

  Object? encodeValue(Object? value);
}

abstract interface class KeyedEncoding<Key> {
  void encodeValue(Key key, Object? value);

  void encodeEncodable<T>(Key key, T value, Encoder<T> encoder);
}

final class _EncoderFromHandlers<T> implements Encoder<T> {
  const _EncoderFromHandlers({
    required Object? Function(StructEncoding encoder, T value) encodeStruct,
    required void Function(SerialEncoding encoder, T value) encodeSerial,
  })  : _encodeStruct = encodeStruct,
        _encodeSerial = encodeSerial;

  final Object? Function(StructEncoding encoder, T value) _encodeStruct;
  final void Function(SerialEncoding encoder, T value) _encodeSerial;

  @override
  Object? encodeStruct(StructEncoding encoder, T value) =>
      _encodeStruct(encoder, value);
  @override
  void encodeSerial(SerialEncoding encoder, T value) =>
      _encodeSerial(encoder, value);
}

final class _EncoderFromHandler<T> with EncoderMixin<T> {
  const _EncoderFromHandler({
    required Object? Function(Encoding encoder, T value) encode,
  }) : _encode = encode;

  final Object? Function(Encoding encoder, T value) _encode;

  @override
  Object? encode(Encoding encoder, T value) => _encode(encoder, value);
}
