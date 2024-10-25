import 'package:collection/collection.dart';

import '../src/decoder.dart';
import '../src/encoder.dart';
import '../src/mapper.dart';
import '../src/serial_decoder.dart';
import '../src/serial_encoder.dart';
import '../src/structured_decoder.dart';
import '../src/structured_encoder.dart';
import '../test/raw_encodable.dart';

class Person implements Encodable, RawEncodable {
  Person(this.name, this.a, this.b, this.c, this.d, this.e, this.f);

  final String name;
  final int a;
  final double b;
  final bool c;
  final Person? d;
  final List<String> e;
  final List<Person> f;

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

  static final Decodable<Person> decodable = PersonDecodable();

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

  @override
  Object? encodeStructured(StructuredEncoder encoder) {
    final encoded = encoder.encodeKeyed<String>();
    encoded.encodeValue('name', name);
    encoded.encodeValue('a', a);
    encoded.encodeValue('b', b);
    encoded.encodeValue('c', c);
    if (d != null) {
      encoded.encodeEncodable('d', d!);
    } else {
      encoded.encodeValue('d', null);
    }
    encoded.encodeValue('e', e);
    encoded.encodeIterable('f', f, (v, e) => v.encodeStructured(e));
    return encoded;
  }

  @override
  void encodeSerial(SerialEncoder encoder) {
    encoder.startObject<String>();
    encoder.encodeKey('name');
    encoder.encodeString(name);
    encoder.encodeKey('a');
    encoder.encodeInt(a);
    encoder.encodeKey('b');
    encoder.encodeDouble(b);
    encoder.encodeKey('c');
    encoder.encodeBool(c);
    encoder.encodeKey('d');
    if (d != null) {
      encoder.encodeEncodable(d!);
    } else {
      encoder.encodeNull();
    }
    encoder.encodeKey('e');
    encoder.startArray();
    for (final e in e) {
      encoder.encodeString(e);
    }
    encoder.endArray();
    encoder.encodeKey('f');
    encoder.startArray();
    for (final e in f) {
      encoder.encodeEncodable(e);
    }
    encoder.endArray();
    encoder.endObject();
  }
}

final class PersonDecodable implements Decodable<Person> {
  @override
  Person decodeSerial(SerialDecoder decoder) {
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
          d = decoder.decodeDecodableOrNull(Person.decodable);
        case 'e':
          e = [for (; decoder.nextItem();) decoder.decodeString()];
        case 'f':
          f = [
            for (; decoder.nextItem();)
              decoder.decodeDecodable(Person.decodable)
          ];
        default:
          decoder.skipNext();
      }
    }

    return Person(name, a, b, c, d, e, f);
  }

  @override
  Person decodeStructured(StructuredDecoder decoder) {
    var keyed = decoder.decodeKeyed<String>();
    return Person(
      keyed.decodeString('name'),
      keyed.decodeInt('a'),
      keyed.decodeDouble('b'),
      keyed.decodeBool('c'),
      keyed.decodeDecodableOrNull('d', Person.decodable),
      keyed.decodeList('e'),
      keyed.decodeListDecodable('f', Person.decodable),
    );
  }
}

class PersonMapper implements Mapper<Person> {
  factory PersonMapper() => _instance;
  PersonMapper._();
  static final _instance = PersonMapper._();

  @override
  final Decodable<Person> decodable = Person.decodable;

  @override
  Encodable encodableOf(Person value) => value;
}
