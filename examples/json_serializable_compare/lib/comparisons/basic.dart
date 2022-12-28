import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test/test.dart';

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

// === dart_mappable ===

@MappableClass()
// Required Boilerplate (Mixin)
class PersonB with PersonBMappable {
  final String name;

  PersonB({required this.name});

  // Optional Boilerplate
  static final fromMap = PersonBMapper.fromMap;
  static final fromJson = PersonBMapper.fromJson;
}

// === Comparison ===

void compareBasic() {
  group('basic', () {
    test('decode from json string', () {
      // json_serializable
      // -> required to use [jsonDecode] with additional import
      expect(
        PersonA.fromJson(jsonDecode('{"name": "Alice"}')),
        predicate<PersonA>((p) => p.name == 'Alice'),
      );

      // dart_mappable
      // -> allows to use [equals] because of [operator ==] override
      expect(
        PersonB.fromJson('{"name": "Bob"}'),
        equals(PersonB(name: 'Bob')),
      );
      // -> alternative with no boilerplate in model class
      expect(
        PersonBMapper.fromJson('{"name": "Bob"}'),
        equals(PersonB(name: 'Bob')),
      );
    });

    test('decode from map', () {
      // json_serializable
      expect(
        PersonA.fromJson({'name': 'Alice'}),
        predicate<PersonA>((p) => p.name == 'Alice'),
      );

      // dart_mappable
      // -> allows to use [equals] because of [operator ==] override
      expect(
        PersonB.fromMap({'name': 'Bob'}),
        equals(PersonB(name: 'Bob')),
      );
      // -> alternative with no boilerplate in model class
      expect(
        PersonBMapper.fromMap({'name': 'Bob'}),
        equals(PersonB(name: 'Bob')),
      );
    });

    test('encode to json string', () {
      // json_serializable
      // -> required to use [jsonEncode] with additional import
      expect(
        jsonEncode(PersonA(name: 'Alice').toJson()),
        equals('{"name":"Alice"}'),
      );

      // dart_mappable
      expect(
        PersonB(name: 'Bob').toJson(),
        equals('{"name":"Bob"}'),
      );
    });

    test('encode to map', () {
      // json_serializable
      expect(
        PersonA(name: 'Alice').toJson(),
        equals({'name': 'Alice'}),
      );

      // dart_mappable
      expect(
        PersonB(name: 'Bob').toMap(),
        equals({'name': 'Bob'}),
      );
    });
  });
}
