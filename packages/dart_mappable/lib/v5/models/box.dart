import '../src/decoder.dart';
import '../src/encoder.dart';
import '../src/mapper.dart';
import '../src/serial_encoder.dart';
import '../src/structured_encoder.dart';
import '../test/raw_encodable.dart';

class Box<T> implements Encodable, RawEncodable {
  Box(this.data);

  final T data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Box<T> && runtimeType == other.runtimeType && data == other.data;

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() {
    return 'Box(data: $data)';
  }

  static Box<T> decode<T>(Decoder decoder) {
    final keyed = decoder.decodeKeyed<String>();
    return Box(
      keyed.decodeDecodable('data', findDecodeFor<T>()) as T,
    );
  }

  static Box<T> fromMapRaw<T>(
      Map<String, dynamic> map, T Function(Map<String, dynamic>) decodeT) {
    return Box(
      decodeT(map['data'] as Map<String, dynamic>),
    );
  }

  @override
  Object? encodeStructured(StructuredEncoder encoder) {
    final encoded = encoder.encodeKeyed<String>();
    encoded.encodeEncodable('data', findEncodableFor<T>(data));
    return encoded;
  }

  @override
  void encodeSerial(SerialEncoder encoder) {
    final encoded = encoder.encodeKeyed<String>();
    encoded.encodeEncodable('data', findEncodableFor<T>(data));
  }

  @override
  Map<String, dynamic> toMapRaw() {
    return {
      'data': data is RawEncodable ? (data as RawEncodable).toMapRaw() : data,
    };
  }
}
