import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart' as d;
import 'package:dart_json_mapper/dart_json_mapper.dart' show JsonMapper;
import 'package:dart_mappable/dart_mappable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test/test.dart';

import '../main.mapper.g.dart';

part 'basic.g.dart';
part 'basic.mapper.dart';

// 1️⃣ === json_serializable ===

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

// 2️⃣ === dart_json_mapper ===

@d.jsonSerializable
class PersonB {
  final String name;

  PersonB({required this.name});
}

// 3️⃣ === dart_mappable ===

@MappableClass()
// Required Boilerplate (Mixin)
class PersonC with PersonCMappable {
  final String name;

  PersonC({required this.name});
}

// 🆚 === Comparison ===

void compareBasic() {
  group('basic', () {
    setUpAll(() {
      // 🟠 required for dart_json_mapper
      initializeJsonMapper();
    });

    group('🆚 decode from json string', () {
      test('1️⃣ json_serializable', () {
        // 🟠 required to use [jsonDecode] with additional 'dart:convert' import
        expect(
          PersonA.fromJson(jsonDecode('{"name": "Alice"}')),
          predicate<PersonA>((p) => p.name == 'Alice'),
        );
      });

      test('2️⃣ dart_json_mapper', () {
        expect(
          JsonMapper.fromJson<PersonB>('{"name": "Bob"}'),
          predicate<PersonB>((p) => p.name == 'Bob'),
        );
      });

      test('3️⃣ dart_mappable', () {
        // 🟢 allows to use [equals] because of [operator ==] override
        expect(
          PersonCMapper.fromJson('{"name": "Clara"}'),
          equals(PersonC(name: 'Clara')),
        );
      });
    });

    group('🆚 decode from map', () {
      test('1️⃣ json_serializable', () {
        expect(
          PersonA.fromJson({'name': 'Alice'}),
          predicate<PersonA>((p) => p.name == 'Alice'),
        );
      });

      test('2️⃣ dart_json_mapper', () {
        expect(
          JsonMapper.fromMap<PersonB>({'name': 'Bob'}),
          predicate<PersonB>((p) => p.name == 'Bob'),
        );
      });

      test('3️⃣ dart_mappable', () {
        // 🟢 allows to use [equals] because of [operator ==] override
        expect(
          PersonCMapper.fromMap({'name': 'Clara'}),
          equals(PersonC(name: 'Clara')),
        );
      });
    });

    group('🆚 encode to json string', () {
      test('1️⃣ json_serializable', () {
        // 🟠 required to use [jsonEncode] with additional 'dart:convert' import
        expect(
          jsonEncode(PersonA(name: 'Alice').toJson()),
          equals('{"name":"Alice"}'),
        );
      });

      test('2️⃣ dart_json_mapper', () {
        expect(
          JsonMapper.toJson(
              PersonB(name: 'Bob'), d.SerializationOptions(indent: '')),
          equals('{"name":"Bob"}'),
        );
      });

      test('3️⃣ dart_mappable', () {
        expect(
          PersonC(name: 'Clara').toJson(),
          equals('{"name":"Clara"}'),
        );
      });
    });

    group('🆚 encode to map', () {
      test('1️⃣ json_serializable', () {
        expect(
          PersonA(name: 'Alice').toJson(),
          equals({'name': 'Alice'}),
        );
      });

      test('2️⃣ dart_json_mapper', () {
        expect(
          JsonMapper.toMap(PersonB(name: 'Bob')),
          equals({'name': 'Bob'}),
        );
      });

      test('3️⃣ dart_mappable', () {
        expect(
          PersonC(name: 'Clara').toMap(),
          equals({'name': 'Clara'}),
        );
      });
    });
  });
}
