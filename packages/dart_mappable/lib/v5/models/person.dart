import '../src/decoder.dart';
import '../src/encoder.dart';
import '../src/mapper.dart';
import '../src/serial_encoder.dart';
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
          e == other.e &&
          f == other.f;

  @override
  int get hashCode => Object.hash(name, a, b, c, d, e, f);

  @override
  String toString() {
    return 'Person(name: $name, a: $a, b: $b, c: $c, d: $d, e: $e, f: $f)';
  }

  static Person decode(Decoder decoder) {
    var keyed = decoder.decodeKeyed<String>();
    if (keyed is SerialKeyedDecoder<String>) {
      late String name;
      late int a;
      late double b;
      late bool c;
      Person? d;
      late List<String> e;
      late List<Person> f;

      loop:
      while (true) {
        switch (keyed.nextKey()) {
          case null:
            break loop;

          case 'name':
            name = keyed.decodeNextString()!;
            break;
          case 'a':
            a = keyed.decodeNextInt()!;
            break;
          case 'b':
            b = keyed.decodeNextDouble()!;
            break;
          case 'c':
            c = keyed.decodeNextBool()!;
            break;
          case 'd':
            d = keyed.decodeNextDecodable(Person.decode);
            break;
          case 'e':
            e = keyed.decodeNextList()!;
            break;
          case 'f':
            f = keyed.decodeNextListDecodable(Person.decode)!;
            break;

          default:
            keyed.skipNext();
            break;
        }
      }

      return Person(
        name,
        a,
        b,
        c,
        d,
        e,
        f,
      );
    }

    return Person(
      keyed.decodeString('name')!,
      keyed.decodeInt('a')!,
      keyed.decodeDouble('b')!,
      keyed.decodeBool('c')!,
      keyed.decodeDecodable('d', Person.decode),
      keyed.decodeList('e')!,
      keyed.decodeListDecodable('f', Person.decode)!,
    );
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
    encoded.encodeValue(
        'f', f.map((e) => e.encodeStructured(encoder)).toList());
    return encoded;
  }

  @override
  void encodeSerial(SerialEncoder encoder) {
    final encoded = encoder.encodeKeyed<String>();
    encoded.encodeString('name', name);
    encoded.encodeInt('a', a);
    encoded.encodeDouble('b', b);
    encoded.encodeBool('c', c);
    if (d != null) {
      encoded.encodeEncodable('d', d!);
    } else {
      encoded.encodeNull('d');
    }
    encoded.encodeList('e', e);
    encoded.encodeList('f', f);
  }
}

class PersonMapper implements Mapper<Person> {
  factory PersonMapper() => _instance;
  PersonMapper._();
  static final _instance = PersonMapper._();

  @override
  Person decode(Decoder decoder) => Person.decode(decoder);

  @override
  Object? encodeStructured(StructuredEncoder encoder, Person value) {
    return value.encodeStructured(encoder);
  }

  @override
  void encodeSerial(SerialEncoder encoder, Person value) {
    value.encodeSerial(encoder);
  }
}
