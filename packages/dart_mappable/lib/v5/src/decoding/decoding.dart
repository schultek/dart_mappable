import 'serial_decoding.dart';
import 'struct_decoding.dart';

export 'serial_decoding.dart';
export 'struct_decoding.dart';

abstract interface class Decoder<T> {
  T decodeSerial(SerialDecoding decoding);
  T decodeStruct(StructDecoding decoding);

  const factory Decoder.fromHandlers({
    required T Function(StructDecoding decoding) decodeStruct,
    required T Function(SerialDecoding decoding) decodeSerial,
  }) = _DecoderFromHandlers;

  const factory Decoder.fromHandler({
    required T Function(Decoding decoding) decode,
  }) = _DecoderFromHandler;
}

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

abstract interface class Decoding {
  String decodeString();
  String? decodeStringOrNull();

  bool decodeBool();
  bool? decodeBoolOrNull();

  int decodeInt();
  int? decodeIntOrNull();

  double decodeDouble();
  double? decodeDoubleOrNull();

  T decodeDecodable<T>(Decoder<T> decodable);
  T? decodeDecodableOrNull<T>(Decoder<T> decodable);

  List<T> decodeList<T>();
  List<T>? decodeListOrNull<T>();

  List<T> decodeListDecodable<T>(Decoder<T> decodable);
  List<T>? decodeListDecodableOrNull<T>(Decoder<T> decodable);

  KeyedDecoding<Key> decodeKeyed<Key>();
}

abstract interface class KeyedDecoding<Key> {
  String decodeString(Key key);
  String? decodeStringOrNull(Key key);

  bool decodeBool(Key key);
  bool? decodeBoolOrNull(Key key);

  int decodeInt(Key key);
  int? decodeIntOrNull(Key key);

  double decodeDouble(Key key);
  double? decodeDoubleOrNull(Key key);

  T decodeDecodable<T>(Key key, Decoder<T> decodable);
  T? decodeDecodableOrNull<T>(Key key, Decoder<T> decodable);

  List<T> decodeList<T>(Key key);
  List<T>? decodeListOrNull<T>(Key key);

  List<T> decodeListDecodable<T>(Key key, Decoder<T> decodable);
  List<T>? decodeListDecodableOrNull<T>(Key key, Decoder<T> decodable);
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
