import '../src/mapper/mapper.dart';
import '../src/protocol/protocol.dart';

class Measures implements Encodable<Measures> {
  Measures(this.a, this.b, this.c, this.d);

  final String a;
  final int? b;
  final double c;
  final bool? d;

  @override
  String toString() {
    return 'Measures{a: $a, b: $b, c: $c, d: $d}';
  }

  static Mapper<Measures> mapper() => const MeasuresMapper();
  static Codable<Measures> codable() => const MeasuresCodable();
  @override
  Encoder<Measures> encoder() => const MeasuresEncoder();
}

final class MeasuresEncoder implements Encoder<Measures> {
  const MeasuresEncoder();

  @override
  void encodeStruct(Measures value, StructEncoding encoding) {
    encoding.encodeKeyed<String>()
      ..encodeValue('a', value.a)
      ..encodeValue('b', value.b)
      ..encodeValue('c', value.c)
      ..encodeValue('d', value.d);
  }

  @override
  void encodeSerial(Measures value, SerialEncoding encoder) {
    encoder.startObject<String>();
    encoder.encodeKey('a');
    encoder.encodeString(value.a);
    encoder.encodeKey('b');
    if (value.b != null) {
      encoder.encodeInt(value.b!);
    } else {
      encoder.encodeNull();
    }
    encoder.encodeKey('c');
    encoder.encodeDouble(value.c);
    encoder.encodeKey('d');
    if (value.d != null) {
      encoder.encodeBool(value.d!);
    } else {
      encoder.encodeNull();
    }
    encoder.endObject();
  }
}

final class MeasuresDecoder implements Decoder<Measures> {
  const MeasuresDecoder();

  @override
  Measures decodeSerial(SerialDecoding decoder) {
    late String a;
    late int? b;
    late double c;
    late bool? d;

    for (Object? key; (key = decoder.nextKey()) != null;) {
      switch (key) {
        case 'a':
          a = decoder.decodeString();
        case 'b':
          b = decoder.decodeIntOrNull();
        case 'c':
          c = decoder.decodeDouble();
        case 'd':
          d = decoder.decodeBoolOrNull();
        default:
          decoder.skipNext();
      }
    }

    return Measures(a, b, c, d);
  }

  @override
  Measures decodeStruct(StructDecoding decoder) {
    var keyed = decoder.decodeKeyed<String>();
    return Measures(
      keyed.decodeString('a'),
      keyed.decodeIntOrNull('b'),
      keyed.decodeDouble('c'),
      keyed.decodeBoolOrNull('d'),
    );
  }
}

class MeasuresMapper extends Mapper<Measures>
    implements CodableMapper<Measures> {
  const MeasuresMapper();

  @override
  Codable<Measures> codable() => const MeasuresCodable();
}

class MeasuresCodable implements Codable<Measures> {
  const MeasuresCodable();

  @override
  Decoder<Measures> decoder() => const MeasuresDecoder();

  @override
  Encoder<Measures> encoder() => const MeasuresEncoder();
}
