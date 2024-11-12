import '../src/mapper/container.dart';
import '../src/mapper/mapper.dart';
import '../src/protocol/protocol.dart';
import '../benchmarks/raw_encodable.dart';

class Box<T> implements Encodable1<Box<T>, T>, RawEncodable {
  Box(this.data);

  final T data;

  static Mapper<Box> mapper() => const BoxMapper();
  static Codable1<Box<T>, T> codable<T>() => BoxCodable();
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
  void encodeStruct(Box<T> value, StructEncoding encoding) {
    encoding.encodeKeyed<String>().encodeObject(
        'data', value.data, encoder ?? findEncoderFor<T>(value.data));
  }

  @override
  void encodeSerial(Box<T> value, SerialEncoding encoding) {
    encoding.startObject<String>();
    encoding.encodeKey('data');
    encoding.encodeObject(value.data, encoder ?? findEncoderFor<T>(value.data));
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
          data = decoding.decodeObject(d1);
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
      keyed.decodeObject('data', d1),
    );
  }
}

class BoxMapper extends Mapper<Box> implements CodableMapper1<Box> {
  const BoxMapper();

  @override
  Codable1<Box<T>, T> codable<T>() => BoxCodable<T>();

  @override
  Function get typeFactory => <T>(f) => f<Box<T>>();
}

class BoxCodable<T> implements Codable1<Box<T>, T> {
  const BoxCodable();

  @override
  Decoder<Box<T>> decoder([Decoder<T>? d1]) => BoxDecoder<T>(d1);

  @override
  Encoder<Box<T>> encoder([Encoder<T>? e1]) => BoxEncoder<T>(e1);
}
