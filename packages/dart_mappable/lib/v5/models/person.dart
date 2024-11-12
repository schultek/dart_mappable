import 'package:collection/collection.dart';

import '../src/mapper/mapper.dart';
import '../src/protocol/protocol.dart';
import '../benchmarks/raw_encodable.dart';

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
  static Codable<Person> codable() => const PersonCodable();
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
  void encodeStruct(Person value, StructEncoding encoding) {
    final keyed = encoding.encodeKeyed<String>();
    keyed.encodeValue('name', value.name);
    keyed.encodeValue('a', value.a);
    keyed.encodeValue('b', value.b);
    keyed.encodeValue('c', value.c);
    if (value.d != null) {
      keyed.encodeObject('d', value.d!, value.d!.encoder());
    } else {
      keyed.encodeValue('d', null);
    }
    keyed.encodeValue('e', value.e);
    keyed.encodeIterable('f', value.f, (v) => v.encoder());
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
  Person decodeSerial(SerialDecoding decoding) {
    late String name;
    late int a;
    late double b;
    late bool c;
    Person? d;
    late List<String> e;
    late List<Person> f;

    for (Object? key; (key = decoding.nextKey()) != null;) {
      switch (key) {
        case 'name':
          name = decoding.decodeString();
        case 'a':
          a = decoding.decodeInt();
        case 'b':
          b = decoding.decodeDouble();
        case 'c':
          c = decoding.decodeBool();
        case 'd':
          d = decoding.decodeObjectOrNull(Person.codable().decoder());
        case 'e':
          e = [for (; decoding.nextItem();) decoding.decodeString()];
        case 'f':
          f = [
            for (; decoding.nextItem();) decoding.decodeObject(Person.codable().decoder())
          ];
        default:
          decoding.skipNext();
      }
    }

    return Person(name, a, b, c, d, e, f);
  }

  @override
  Person decodeStruct(StructDecoding decoding) {
    var keyed = decoding.decodeKeyed<String>();
    return Person(
      keyed.decodeString('name'),
      keyed.decodeInt('a'),
      keyed.decodeDouble('b'),
      keyed.decodeBool('c'),
      keyed.decodeObjectOrNull('d', Person.codable().decoder()),
      keyed.decodeList('e'),
      keyed.decodeListObject('f', Person.codable().decoder()),
    );
  }
}

class PersonMapper extends Mapper<Person> implements CodableMapper<Person> {
  const PersonMapper();

  @override
  Codable<Person> codable() => const PersonCodable();
}

class PersonCodable implements Codable<Person> {
  const PersonCodable();

  @override
  Decoder<Person> decoder() => const PersonDecoder();

  @override
  Encoder<Person> encoder() => const PersonEncoder();
}
