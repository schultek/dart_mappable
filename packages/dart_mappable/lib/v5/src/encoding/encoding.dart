import 'lazy_encoding.dart';
import 'serial_encoding.dart';
import 'struct_encoding.dart';

export 'lazy_encoding.dart';
export 'serial_encoding.dart';
export 'struct_encoding.dart';

abstract class Encoder<T> {
  Object? encodeStruct(T value, StructEncoding encoding);
  void encodeSerial(T value, SerialEncoding encoding);

  const factory Encoder.fromHandlers({
    required Object? Function(T value, StructEncoding encoding) encodeStruct,
    required void Function(T value, SerialEncoding encoding) encodeSerial,
  }) = _EncoderFromHandlers;

  const factory Encoder.fromHandler({
    required Object? Function(T value, Encoding encoding) encode,
  }) = _EncoderFromHandler;
}

abstract interface class Encodable<T> {
  Encoder<T> encoder();
}

abstract interface class Encodable1<T, A> implements Encodable<T> {
  @override
  Encoder<T> encoder([Encoder<A>? e1]);
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
  Object? encodeValue(Object? value);

  Object? encodeEncodable<T>(T value, Encoder<T> encoder);

  Object? encodeIterable<T>(Iterable<T> value, Encoder<T> Function(T) encode);

  KeyedEncoding<Key> encodeKeyed<Key>();
}

abstract interface class KeyedEncoding<Key> {
  void encodeValue(Key key, Object? value);

  void encodeEncodable<T>(Key key, T value, Encoder<T> encoder);

  void encodeIterable<T>(
      Key key, Iterable<T> value, Encoder<T> Function(T) encode);
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
