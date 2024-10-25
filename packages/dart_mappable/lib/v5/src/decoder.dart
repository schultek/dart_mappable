import 'serial_decoder.dart';
import 'structured_decoder.dart';

abstract interface class Decodable<T> {
  T decodeSerial(SerialDecoder decoder);
  T decodeStructured(StructuredDecoder decoder);

  const factory Decodable.fromHandlers({
    required T Function(StructuredDecoder decoder) decodeStructured,
    required T Function(SerialDecoder decoder) decodeSerial,
  }) = _DecodableFromHandlers;

  const factory Decodable.fromHandler({
    required T Function(Decoder decoder) decode,
  }) = _DecodableFromHandler;
}

final class _DecodableFromHandlers<T> implements Decodable<T> {
  const _DecodableFromHandlers({
    required T Function(StructuredDecoder decoder) decodeStructured,
    required T Function(SerialDecoder decoder) decodeSerial,
  })  : _decodeStructured = decodeStructured,
        _decodeSerial = decodeSerial;

  final T Function(StructuredDecoder decoder) _decodeStructured;
  final T Function(SerialDecoder decoder) _decodeSerial;

  @override
  T decodeStructured(StructuredDecoder decoder) => _decodeStructured(decoder);
  @override
  T decodeSerial(SerialDecoder decoder) => _decodeSerial(decoder);
}

final class _DecodableFromHandler<T> with DecodableMixin<T> {
  const _DecodableFromHandler({
    required T Function(Decoder decoder) decode,
  }) : _decode = decode;

  final T Function(Decoder decoder) _decode;

  @override
  T decode(Decoder decoder) => _decode(decoder);
}

abstract mixin class DecodableMixin<T> implements Decodable<T> {
  T decode(Decoder decoder);

  @override
  T decodeStructured(StructuredDecoder decoder) {
    return GeneralizedStructuredDecoder.decode(this, decoder);
  }

  @override
  T decodeSerial(SerialDecoder decoder) {
    return GeneralizedSerialDecoder.decode(this, decoder);
  }
}

abstract interface class Decoder {
  String decodeString();
  String? decodeStringOrNull();

  bool decodeBool();
  bool? decodeBoolOrNull();

  int decodeInt();
  int? decodeIntOrNull();

  double decodeDouble();
  double? decodeDoubleOrNull();

  T decodeDecodable<T>(Decodable<T> decodable);
  T? decodeDecodableOrNull<T>(Decodable<T> decodable);

  List<T> decodeList<T>();
  List<T>? decodeListOrNull<T>();

  List<T> decodeListDecodable<T>(Decodable<T> decodable);
  List<T>? decodeListDecodableOrNull<T>(Decodable<T> decodable);

  KeyedDecoder<Key> decodeKeyed<Key>();
}

abstract interface class KeyedDecoder<Key> {
  String decodeString(Key key);
  String? decodeStringOrNull(Key key);

  bool decodeBool(Key key);
  bool? decodeBoolOrNull(Key key);

  int decodeInt(Key key);
  int? decodeIntOrNull(Key key);

  double decodeDouble(Key key);
  double? decodeDoubleOrNull(Key key);

  T decodeDecodable<T>(Key key, Decodable<T> decodable);
  T? decodeDecodableOrNull<T>(Key key, Decodable<T> decodable);

  List<T> decodeList<T>(Key key);
  List<T>? decodeListOrNull<T>(Key key);

  List<T> decodeListDecodable<T>(Key key, Decodable<T> decodable);
  List<T>? decodeListDecodableOrNull<T>(Key key, Decodable<T> decodable);
}
