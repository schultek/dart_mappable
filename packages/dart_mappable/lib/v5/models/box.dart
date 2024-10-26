import '../src/decoding/decoding.dart';
import '../src/encoding/encoding.dart';
import '../src/mapper.dart';
import '../test/raw_encodable.dart';

class Box<T> implements Encodable1<Box<T>, T>, RawEncodable {
  Box(this.data);

  final T data;

  static Box<T> fromMap<T>(Map<String, dynamic> value, [Decoder<T>? decoder1]) {
    return StructDecoding.decode(value, decoder<T>(decoder1));
  }

  static Mapper<Box> mapper() => const BoxMapper();
  static Decoder<Box<T>> decoder<T>([Decoder<T>? d1]) => BoxDecoder<T>(d1);
  @override
  Encoder<Box<T>> encoder([Encoder<T>? e1]) => BoxEncoder<T>(e1);

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

  static Box<T> fromMapRaw<T>(
      Map<String, dynamic> map, T Function(Map<String, dynamic>) decodeT) {
    return Box(
      decodeT(map['data'] as Map<String, dynamic>),
    );
  }

  @override
  Map<String, dynamic> toMapRaw() {
    return {
      'data': data is RawEncodable ? (data as RawEncodable).toMapRaw() : data,
    };
  }
}

class BoxEncoder<T> implements Encoder<Box<T>> {
  BoxEncoder([this.encoder]);

  final Encoder<T>? encoder;

  @override
  Object? encodeStruct(Box<T> value, StructEncoding encoding) {
    final keyed = encoding.encodeKeyed<String>();
    keyed.encodeEncodable(
        'data', value.data, encoder ?? findEncoderFor<T>(value.data));
    return keyed;
  }

  @override
  void encodeSerial(Box<T> value, SerialEncoding encoding) {
    encoding.startObject<String>();
    encoding.encodeKey('data');
    encoding.encodeEncodable(
        value.data, encoder ?? findEncoderFor<T>(value.data));
    encoding.endObject();
  }
}

class BoxDecoder<T> implements Decoder<Box<T>> {
  BoxDecoder([this.decoder]);

  final Decoder<T>? decoder;

  @override
  Box<T> decodeSerial(SerialDecoding decoding) {
    final d1 = decoder ?? findDecoderFor<T>();

    late T data;

    for (Object? key; (key = decoding.nextKey()) != null;) {
      switch (key) {
        case 'data':
          data = decoding.decodeDecodable(d1);
        default:
          decoding.skipNext();
      }
    }

    return Box(data);
  }

  @override
  Box<T> decodeStruct(StructDecoding decoding) {
    final d1 = decoder ?? findDecoderFor<T>();

    final keyed = decoding.decodeKeyed<String>();
    return Box(
      keyed.decodeDecodable('data', d1),
    );
  }
}

class BoxMapper extends Mapper<Box>
    implements DecoderOf1<Box>, EncoderOf1<Box> {
  const BoxMapper();

  @override
  Decoder<Box<T>> decoder<T>([Decoder<T>? d1]) => BoxDecoder<T>(d1);

  @override
  Encoder<Box<T>> encoder<T>([Encoder<T>? e1]) => BoxEncoder<T>(e1);

  @override
  Function get typeFactory => <T>(f) => f<Box<T>>();
}
