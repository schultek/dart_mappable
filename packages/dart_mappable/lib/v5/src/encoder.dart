import 'lazy_encoder.dart';
import 'serial_encoder.dart';
import 'structured_encoder.dart';

abstract interface class Encodable {
  Object? encodeStructured(StructuredEncoder encoder);
  void encodeSerial(SerialEncoder encoder);

  const factory Encodable.fromHandlers({
    required Object? Function(StructuredEncoder encoder) encodeStructured,
    required void Function(SerialEncoder encoder) encodeSerial,
  }) = _EncodableFromHandlers;

  const factory Encodable.fromHandler({
    required Object? Function(Encoder encoder) encode,
  }) = _EncodableFromHandler;
}

final class _EncodableFromHandlers<T> implements Encodable {
  const _EncodableFromHandlers({
    required Object? Function(StructuredEncoder encoder) encodeStructured,
    required void Function(SerialEncoder encoder) encodeSerial,
  })  : _encodeStructured = encodeStructured,
        _encodeSerial = encodeSerial;

  final Object? Function(StructuredEncoder encoder) _encodeStructured;
  final void Function(SerialEncoder encoder) _encodeSerial;

  @override
  Object? encodeStructured(StructuredEncoder encoder) =>
      _encodeStructured(encoder);
  @override
  void encodeSerial(SerialEncoder encoder) => _encodeSerial(encoder);
}

final class _EncodableFromHandler<T> with EncodableMixin {
  const _EncodableFromHandler({
    required Object? Function(Encoder encoder) encode,
  }) : _encode = encode;

  final Object? Function(Encoder encoder) _encode;

  @override
  Object? encode(Encoder encoder) => _encode(encoder);
}

abstract mixin class EncodableMixin implements Encodable {
  Object? encode(Encoder encoder);

  @override
  Object? encodeStructured(StructuredEncoder encoder) {
    var encoded = encode(GeneralizedStructuredEncoder(encoder));
    if (encoded is KeyedGeneralizedStructuredEncoder) {
      return encoded.encoder;
    }
    return encoded;
  }

  @override
  void encodeSerial(SerialEncoder encoder) {
    var encoded = encode(GeneralizedSerialEncoder(encoder));
    if (encoded is KeyedGeneralizedSerialEncoder) {
      encoder.endObject();
    }
  }
}

extension JsonEncodable on Encodable {
  Map<String, dynamic> toMap() {
    return StructuredEncoder.encode(this) as Map<String, dynamic>;
  }

  Map<String, dynamic> toLazyMap() {
    return LazyEncoder.encode(this) as Map<String, dynamic>;
  }

  String toJson() {
    return JsonEncoder.encode(this);
  }

  List<int> toJsonBytes() {
    return JsonEncoder.encodeBytes(this);
  }
}

abstract interface class Encoder {
  KeyedEncoder<Key> encodeKeyed<Key>();

  Object? encodeValue(Object? value);
}

abstract interface class KeyedEncoder<Key> {
  void encodeValue(Key key, Object? value);

  void encodeEncodable(Key key, Encodable value);
}
