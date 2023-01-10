import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart' as d;
import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper;
import 'package:dart_mappable/dart_mappable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test/test.dart';

import '../main.mapper.g.dart';

part 'basic.g.dart';
part 'basic.mapper.dart';

// === json_serializable ===

@JsonSerializable()
class PersonA {
  final String name;

  PersonA({required this.name});

  // Required Boilerplate
  factory PersonA.fromJson(Map<String, dynamic> json) =>
      _$PersonAFromJson(json);

  // Required Boilerplate
  Map<String, dynamic> toJson() => _$PersonAToJson(this);
}

// === dart_json_mapper ===

@d.jsonSerializable
class PersonB {
  final String name;

  PersonB({required this.name});
}

// === dart_mappable ===

@MappableClass()
// Required Boilerplate (Mixin)
class PersonC with PersonCMappable {
  final String name;

  PersonC({required this.name});

  // Optional Boilerplate
  static final fromMap = PersonCMapper.fromMap;
  static final fromJson = PersonCMapper.fromJson;
}

// === Comparison ===

void compareBasic() {
  group('basic', () {
    setUpAll(() {
      // required for dart_json_mapper
      initializeJsonMapper();
    });

    group('decode from json string', () {
      test('json_serializable', () {
        // required to use [jsonDecode] with additional import
        expect(
          PersonA.fromJson(jsonDecode('{"name": "Alice"}')),
          predicate<PersonA>((p) => p.name == 'Alice'),
        );
      });

      test('dart_json_mapper', () {
        expect(
          JsonMapper.fromJson<PersonB>('{"name": "Bob"}'),
          predicate<PersonB>((p) => p.name == 'Bob'),
        );
      });

      test('dart_mappable', () {
        // allows to use [equals] because of [operator ==] override
        expect(
          PersonC.fromJson('{"name": "Clara"}'),
          equals(PersonC(name: 'Clara')),
        );
        // alternative with no boilerplate in model class
        expect(
          PersonCMapper.fromJson('{"name": "Clara"}'),
          equals(PersonC(name: 'Clara')),
        );
      });
    });

    group('decode from map', () {
      test('json_serializable', () {
        expect(
          PersonA.fromJson({'name': 'Alice'}),
          predicate<PersonA>((p) => p.name == 'Alice'),
        );
      });

      test('dart_json_mapper', () {
        expect(
          JsonMapper.fromMap<PersonB>({'name': 'Bob'}),
          predicate<PersonB>((p) => p.name == 'Bob'),
        );
      });

      test('dart_mappable', () {
        // allows to use [equals] because of [operator ==] override
        expect(
          PersonC.fromMap({'name': 'Clara'}),
          equals(PersonC(name: 'Clara')),
        );
        // alternative with no boilerplate in model class
        expect(
          PersonCMapper.fromMap({'name': 'Clara'}),
          equals(PersonC(name: 'Clara')),
        );
      });
    });

    group('encode to json string', () {
      test('json_serializable', () {
        // required to use [jsonEncode] with additional import
        expect(
          jsonEncode(PersonA(name: 'Alice').toJson()),
          equals('{"name":"Alice"}'),
        );
      });

      test('dart_json_mapper', () {
        expect(
          JsonMapper.toJson(
              PersonB(name: 'Bob'), d.SerializationOptions(indent: '')),
          equals('{"name":"Bob"}'),
        );
      });

      test('dart_mappable', () {
        expect(
          PersonC(name: 'Clara').toJson(),
          equals('{"name":"Clara"}'),
        );
      });
    });

    group('encode to map', () {
      test('json_serializable', () {
        expect(
          PersonA(name: 'Alice').toJson(),
          equals({'name': 'Alice'}),
        );
      });

      test('dart_json_mapper', () {
        expect(
          JsonMapper.toMap(PersonB(name: 'Bob')),
          equals({'name': 'Bob'}),
        );
      });

      test('dart_mappable', () {
        expect(
          PersonC(name: 'Clara').toMap(),
          equals({'name': 'Clara'}),
        );
      });
    });
  });
}
