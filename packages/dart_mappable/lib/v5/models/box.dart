import '../src/decoding/decoding.dart';
import '../src/encoding/encoding.dart';
import '../src/mapper.dart';
import '../test/raw_encodable.dart';

class Box<T> implements Encodable1<Box<T>, T>, RawEncodable {
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

  static Box<T> fromMap<T>(Map<String, dynamic> value,
      [Decoder<T>? decodable1]) {
    return StructDecoding.decode(value, decoder<T>(decodable1));
  }

  static Box<T> fromMapRaw<T>(
      Map<String, dynamic> map, T Function(Map<String, dynamic>) decodeT) {
    return Box(
      decodeT(map['data'] as Map<String, dynamic>),
    );
  }

  static Decoder<Box<T>> decoder<T>([Decoder<T>? d1]) => BoxDecoder<T>(d1);

  @override
  Encoder<Box<T>> encoder([Encoder<T>? e1]) => BoxEncoder<T>(e1);

  @override
  Map<String, dynamic> toMapRaw() {
    return {
      'data': data is RawEncodable ? (data as RawEncodable).toMapRaw() : data,
    };
  }
}

class BoxEncoder<T> implements Encoder<Box<T>> {
  BoxEncoder([this.encoder1]);

  final Encoder<T>? encoder1;

  @override
  Object? encodeStruct(StructEncoding encoder, Box<T> value) {
    final encoded = encoder.encodeKeyed<String>();
    encoded.encodeEncodable(
        'data', value.data, encoder1 ?? findEncoderFor<T>(value.data));
    return encoded;
  }

  @override
  void encodeSerial(SerialEncoding encoder, Box<T> value) {
    encoder.startObject<String>();
    encoder.encodeKey('data');
    encoder.encodeEncodable(
        value.data, encoder1 ?? findEncoderFor<T>(value.data));
    encoder.endObject();
  }
}

class BoxDecoder<T> implements Decoder<Box<T>> {
  BoxDecoder([this.decoder1]);

  final Decoder<T>? decoder1;

  @override
  Box<T> decodeSerial(SerialDecoding decoder) {
    final d1 = decoder1 ?? findDecoderFor<T>();

    late T data;

    for (Object? key; (key = decoder.nextKey()) != null;) {
      switch (key) {
        case 'data':
          data = decoder.decodeDecodable(d1);
        default:
          decoder.skipNext();
      }
    }

    return Box(data);
  }

  @override
  Box<T> decodeStruct(StructDecoding decoder) {
    final d1 = decoder1 ?? findDecoderFor<T>();

    final keyed = decoder.decodeKeyed<String>();
    return Box(
      keyed.decodeDecodable('data', d1),
    );
  }
}

class BoxMapper extends Mapper<Box>
    with DecoderMapper1<Box>, EncoderMapper1<Box> {
  factory BoxMapper() => _instance;
  BoxMapper._();
  static final _instance = BoxMapper._();

  @override
  Decoder<Box<T>> decoder<T>([Decoder<T>? d1]) => BoxDecoder<T>(d1);

  @override
  Encoder<Box<T>> encoder<T>([Encoder<T>? e1]) => BoxEncoder<T>(e1);

  @override
  Function get typeFactory => <T>(f) => f<Box<T>>();
}
