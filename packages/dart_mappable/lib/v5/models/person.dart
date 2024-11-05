import 'package:collection/collection.dart';

import '../src/mapper/mapper.dart';
import '../src/protocol/common.dart';
import '../benchmarks/raw_encodable.dart';

class PersonCodable implements Codable<Person> {
  @override
  Decoder<Person> decoder() {
    // TODO: implement decoder
    throw UnimplementedError();
  }

  @override
  Encoder<Person> encoder() {
    // TODO: implement encoder
    throw UnimplementedError();
  }

}

class Person implements Encodable<Person>, RawEncodable {
  Person(this.name, this.a, this.b, this.c, this.d, this.e, this.f);

  final String name;
  final int a;
  final double b;
  final bool c;
  final Person? d;
  final List<String> e;
  final List<Person> f;

  static Mapper<Person> mapper() => const PersonMapper();
  static Decoder<Person> decoder() => const PersonDecoder();
  @override
  Encoder<Person> encoder() => const PersonEncoder();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          a == other.a &&
          b == other.b &&
          c == other.c &&
          d == other.d &&
          DeepCollectionEquality().equals(e, other.e) &&
          DeepCollectionEquality().equals(f, other.f);

  @override
  int get hashCode => Object.hash(name, a, b, c, d, e, f);

  @override
  String toString() {
    return 'Person(name: $name, a: $a, b: $b, c: $c, d: $d, e: $e, f: $f)';
  }

  static Person fromMapRaw(Map<String, dynamic> map) {
    return Person(
      map['name'] as String,
      (map['a'] as num).toInt(),
      (map['b'] as num).toDouble(),
      map['c'] as bool,
      map['d'] == null
          ? null
          : Person.fromMapRaw(map['d'] as Map<String, dynamic>),
      (map['e'] as List).cast<String>(),
      (map['f'] as List)
          .map((e) => Person.fromMapRaw(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  Map<String, dynamic> toMapRaw() {
    return {
      'name': name,
      'a': a,
      'b': b,
      'c': c,
      'd': d?.toMapRaw(),
      'e': e,
      'f': f.map((e) => e.toMapRaw()).toList(),
    };
  }
}

final class PersonEncoder implements Encoder<Person> {
  const PersonEncoder();

  @override
  Object? encodeStruct(Person value, StructEncoding encoding) {
    final encoded = encoding.encodeKeyed<String>();
    encoded.encodeValue('name', value.name);
    encoded.encodeValue('a', value.a);
    encoded.encodeValue('b', value.b);
    encoded.encodeValue('c', value.c);
    if (value.d != null) {
      encoded.encodeObject('d', value.d!, value.d!.encoder());
    } else {
      encoded.encodeValue('d', null);
    }
    encoded.encodeValue('e', value.e);
    encoded.encodeIterable('f', value.f, (v) => v.encoder());
    return encoded;
  }

  @override
  void encodeSerial(Person value, SerialEncoding encoder) {
    encoder.startObject<String>();
    encoder.encodeKey('name');
    encoder.encodeString(value.name);
    encoder.encodeKey('a');
    encoder.encodeInt(value.a);
    encoder.encodeKey('b');
    encoder.encodeDouble(value.b);
    encoder.encodeKey('c');
    encoder.encodeBool(value.c);
    encoder.encodeKey('d');
    if (value.d != null) {
      encoder.encodeObject(value.d!, value.d!.encoder());
    } else {
      encoder.encodeNull();
    }
    encoder.encodeKey('e');
    encoder.startArray();
    for (final e in value.e) {
      encoder.encodeString(e);
    }
    encoder.endArray();
    encoder.encodeKey('f');
    encoder.startArray();
    for (final e in value.f) {
      encoder.encodeObject(e, e.encoder());
    }
    encoder.endArray();
    encoder.endObject();
  }
}

final class PersonDecoder implements Decoder<Person> {
  const PersonDecoder();

  @override
  Person decodeSerial(SerialDecoding decoder) {
    late String name;
    late int a;
    late double b;
    late bool c;
    Person? d;
    late List<String> e;
    late List<Person> f;

    for (Object? key; (key = decoder.nextKey()) != null;) {
      switch (key) {
        case 'name':
          name = decoder.decodeString();
        case 'a':
          a = decoder.decodeInt();
        case 'b':
          b = decoder.decodeDouble();
        case 'c':
          c = decoder.decodeBool();
        case 'd':
          d = decoder.decodeObjectOrNull(Person.decoder());
        case 'e':
          e = [for (; decoder.nextItem();) decoder.decodeString()];
        case 'f':
          f = [
            for (; decoder.nextItem();) decoder.decodeObject(Person.decoder())
          ];
        default:
          decoder.skipNext();
      }
    }

    return Person(name, a, b, c, d, e, f);
  }

  @override
  Person decodeStruct(StructDecoding decoder) {
    var keyed = decoder.decodeKeyed<String>();
    return Person(
      keyed.decodeString('name'),
      keyed.decodeInt('a'),
      keyed.decodeDouble('b'),
      keyed.decodeBool('c'),
      keyed.decodeObjectOrNull('d', Person.decoder()),
      keyed.decodeList('e'),
      keyed.decodeListObject('f', Person.decoder()),
    );
  }

}

class PersonMapper extends Mapper<Person>
    implements DecoderOf<Person>, EncoderOf<Person> {
  const PersonMapper();

  @override
  Decoder<Person> decoder() => const PersonDecoder();

  @override
  Encoder<Person> encoder() => const PersonEncoder();
}
