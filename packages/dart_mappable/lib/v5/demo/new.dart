import 'dart:convert';

import 'package:collection/collection.dart';

import '../benchmarks/bench.dart';
import '../benchmarks/data.dart';
import '../benchmarks/raw_encodable.dart';
import '../models/person.dart';
import '../src/implementation/json.dart';
import '../src/implementation/json.dart';
import '../src/implementation/map.dart';
import '../src/implementation/map.dart';
import '../src/protocol/decoder.dart';
import '../src/protocol/encoder.dart';

final class PersonDecode implements DecodeKeyed<Person>, DecodeMapped<Person> {
  const PersonDecode();

  @override
  Person decodeKeyed(KeyedDecoder keyed) {
    late String name;
    late int a;
    late double b;
    late bool c;
    Person? d;
    late List<String> e;
    late List<Person> f;

    for (Object? key; (key = keyed.nextKey()) != null;) {
      switch (key) {
        case 'name':
          name = keyed.decodeString();
        case 'a':
          a = keyed.decodeInt();
        case 'b':
          b = keyed.decodeDouble();
        case 'c':
          c = keyed.decodeBool();
        case 'd':
          d = keyed.decodeObjectOrNull(const PersonDecode());
        case 'e':
          e = keyed.decodeList();
        case 'f':
          f = keyed.decodeList(PersonDecode());
        default:
          keyed.skipCurrentValue();
      }
    }

    return Person(name, a, b, c, d, e, f);
  }

  @override
  Person decodeMapped(MappedDecoder mapped) {
    return Person(
      mapped.decodeString('name'),
      mapped.decodeInt('a'),
      mapped.decodeDouble('b'),
      mapped.decodeBool('c'),
      mapped.useOrNull('d', PersonDecode()),
      mapped.decodeList('e'),
      mapped.decodeList('f', null, PersonDecode()),
    );
  }
}

final class PersonEncode implements Encode<Person> {
  const PersonEncode();

  @override
  void encode(Person value, Encoder encoder) {
    final keyed = encoder.encodeKeyed();
    keyed.encodeString('name', value.name);
    keyed.encodeInt('a', value.a);
    keyed.encodeDouble('b', value.b);
    keyed.encodeBool('c', value.c);
    if (value.d != null) {
      keyed.encodeObject('d', value.d!, const PersonEncode());
    } else {
      keyed.encodeNull('d');
    }
    keyed.encodeIterable('e', value.e);
    keyed.encodeIterable('f', value.f, encodeElement: (_) => const PersonEncode());
    keyed.end();
  }
}

class DateTimeDecoder implements DecodeString<DateTime>, DecodeInt<DateTime> {
  const DateTimeDecoder();

  @override
  DateTime decodeString(String value) {
    return DateTime.parse(value);
  }

  @override
  DateTime decodeInt(int value) {
    return DateTime.fromMillisecondsSinceEpoch(value);
  }
}

class ListDecode<E> implements DecodeList<List<E>>, DecodeIterated<List<E>> {
  const ListDecode(this.elementDecode);

  final Decode<E> elementDecode;

  @override
  List<E> decodeList<$E>(List<$E> value) {
    return value.cast();
  }

  @override
  List<E> decodeIterated(IteratedDecoder iterated) {
    return [for (; iterated.nextItem();) iterated.decodeObject(elementDecode)];
  }
}

void main() {
  var p = JsonDecoder.decode(personJsonBytes, PersonDecode());

  assert(utf8.decode(JsonEncoder.encode(p, PersonEncode())) ==
      utf8.decode(p.toJsonBytes()));
  assert(DeepCollectionEquality()
      .equals(MapEncoder.encode(p, PersonEncode()), p.toMapRaw()));

  compare(
    'MAP DECODING',
    self: () => p = MapDecoder.decode(personMap, PersonDecode()),
    other: () => p = Person.codable().fromMap(personMap),
  );
  compare(
    'MAP DECODING 1.5',
    self: () => p = MapDecoder.decode(personMap, PersonDecode()),
    other: () => p = MapDecoder.decode(personMap, PersonDecode()),
  );
  compare(
    'MAP DECODING 2',
    self: () => p = MapDecoder.decode(personMap, PersonDecode()),
    other: () => p = Person.fromMapRaw(personMap),
  );
  compare(
    'JSON BYTE DECODING',
    self: () => p = JsonDecoder.decode(personJsonBytes, PersonDecode()),
    other: () => p = Person.codable().fromJsonBytes(personJsonBytes),
  );

  compare(
    'MAP ENCODING',
    self: () => MapEncoder.encode(p, PersonEncode()),
    other: () => p.toMap(),
  );

  compare(
    'MAP ENCODING2',
    self: () => MapEncoder.encode(p, PersonEncode()),
    other: () => p.toMapRaw(),
  );
  compare(
    'JSON BYTE ENCODING',
    self: () => JsonEncoder.encode(p, PersonEncode()),
    other: () => p.toJsonBytes(),
  );
}
