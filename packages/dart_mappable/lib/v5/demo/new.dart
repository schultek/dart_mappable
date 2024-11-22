import 'dart:convert';

import 'package:collection/collection.dart';

import '../benchmarks/bench.dart';
import '../benchmarks/data.dart';
import '../benchmarks/raw_encodable.dart';
import '../src/implementation/json.dart';
import '../src/implementation/map.dart';
import '../src/protocol/protocol.dart';

class Person implements RawEncodable {
  Person(this.name, this.a, this.b, this.c, this.d, this.e, this.f);

  final String name;
  final int a;
  final double b;
  final bool c;
  final Person? d;
  final List<String> e;
  final List<Person> f;


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

final class PersonDecode implements Decode<Person> {
  const PersonDecode();

  @override
  Person decode(Decoder decoder) {
    return switch (decoder.whatsNext()) {
      DecodingType.keyed || DecodingType.unknown => decodeKeyed(decoder.decodeKeyed()),
      DecodingType.mapped || DecodingType.map => decodeMapped(decoder.decodeMapped()),
      _ => decoder.expect('mapped or keyed'),
    };
  }

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

  Person decodeMapped(MappedDecoder mapped) {
    return Person(
      mapped.decodeString('name'),
      mapped.decodeInt('a'),
      mapped.decodeDouble('b'),
      mapped.decodeBool('c'),
      mapped.decodeObjectOrNull('d', PersonDecode()),
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

class DateTimeDecoder implements Decode<DateTime> {
  const DateTimeDecoder();

  @override
  DateTime decode(Decoder decoder) {
    return switch (decoder.whatsNext()) {
      DecodingType.string => DateTime.parse(decoder.decodeString()),
      DecodingType.int || DecodingType.num  => DateTime.fromMillisecondsSinceEpoch(decoder.decodeInt()),
      const DecodingType.custom(DateTime) => decoder.decodeCustom<DateTime>(),
      DecodingType.unknown => DateTime.fromMillisecondsSinceEpoch(decoder.decodeNum().toInt()),
      _ => decoder.expect('string or int'),
    };
  }
}

class ListDecode<E> implements Decode<List<E>> {
  const ListDecode(this.elementDecode);

  final Decode<E> elementDecode;

  @override
  List<E> decode(Decoder decoder) {
    return switch (decoder.whatsNext()) {
      DecodingType.list => decoder.decodeList(elementDecode),
      DecodingType.iterated => [for (final i = decoder.decodeIterated(); i.nextItem();) i.decodeObject(elementDecode)],
      _ => decoder.expect('list or iterated'),
    };
  }
}

void main() {
  var p = JsonDecoder.decode(personJsonBytes, PersonDecode());

  assert(utf8.decode(JsonEncoder.encode(p, PersonEncode())) == p.toJsonRaw());
  assert(DeepCollectionEquality().equals(MapEncoder.encode(p, PersonEncode()), p.toMapRaw()));

  compare(
    'MAP DECODING',
    self: () => p = MapDecoder.decode(personMap, PersonDecode()),
    other: () => p = Person.fromMapRaw(personMap),
  );
  compare(
    'JSON BYTE DECODING',
    self: () => p = JsonDecoder.decode(personJsonBytes, PersonDecode()),
    other: () => p = Person.fromMapRaw(jsonDecode(personJson) as Map<String, dynamic>),
  );

  compare(
    'MAP ENCODING',
    self: () => MapEncoder.encode(p, PersonEncode()),
    other: () => p.toMapRaw(),
  );
  compare(
    'JSON BYTE ENCODING',
    self: () => JsonEncoder.encode(p, PersonEncode()),
    other: () => p.toJsonBytesRaw(),
  );
}
