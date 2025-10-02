import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'field_ignoring_test.mapper.dart';

@MappableClass()
class User with UserMappable {
  String name;
  String email;

  @MappableField(includeToJson: false)
  String? passwordValue;

  @MappableField(includeFromJson: false)
  DateTime? lastLoginValue;

  @MappableField(includeIfNull: true)
  String? secretFieldValue;

  User(this.name, this.email, this.passwordValue, this.lastLoginValue);
}

@MappableClass(ignoreNull: true)
class UserWithIgnoreNull with UserWithIgnoreNullMappable {
  String name;

  @MappableField(includeIfNull: true)
  String? emailValue;

  @MappableField(includeToJson: false)
  String? passwordValue;

  UserWithIgnoreNull(this.name, this.emailValue, this.passwordValue);
}

@MappableClass()
class MixedFieldModes with MixedFieldModesMappable {
  String name;

  @MappableField(includeIfNull: true)
  String? computedFieldValue;

  @MappableField(includeToJson: false, includeFromJson: false)
  String? ignoredFieldValue;

  MixedFieldModes(this.name, this.computedFieldValue, this.ignoredFieldValue);
}

void main() {
  group('Field Ignoring', () {
    test('includeToJson: false excludes field from serialization', () {
      var user = User('John', 'john@example.com', 'secret123', DateTime.now());

      var map = user.toMap();
      expect(map.containsKey('passwordValue'), isFalse);
      expect(map.containsKey('name'), isTrue);
      expect(map.containsKey('email'), isTrue);
    });

    test('includeFromJson: false excludes field from deserialization', () {
      var map = {
        'name': 'John',
        'email': 'john@example.com',
        'passwordValue': 'secret123',
        'lastLoginValue': '2023-01-01T00:00:00.000Z',
      };

      var user = UserMapper.fromMap(map);
      expect(user.name, equals('John'));
      expect(user.email, equals('john@example.com'));
      expect(user.passwordValue, equals('secret123'));
      expect(
        user.lastLoginValue,
        isNull,
      ); // Should be ignored during deserialization
    });

    test('includeIfNull: true includes null values in serialization', () {
      var user = User('John', 'john@example.com', null, null);

      var map = user.toMap();
      expect(map.containsKey('secretFieldValue'), isTrue);
      expect(map['secretFieldValue'], isNull);
    });

    test('includeIfNull overrides class-level ignoreNull', () {
      var user = UserWithIgnoreNull('John', null, 'secret123');

      var map = user.toMap();
      // emailValue should be included because includeIfNull: true
      expect(map.containsKey('emailValue'), isTrue);
      expect(map['emailValue'], isNull);
      // passwordValue should be excluded because includeToJson: false
      expect(map.containsKey('passwordValue'), isFalse);
    });

    test('field with both includeToJson: false and includeFromJson: false', () {
      var mixed = MixedFieldModes('John', null, 'should be ignored');

      // Should not appear in serialization
      var map = mixed.toMap();
      expect(map.containsKey('ignoredFieldValue'), isFalse);

      // Should not be set during deserialization
      var mapWithIgnored = {
        'name': 'Jane',
        'ignoredFieldValue': 'should be ignored',
        'computedFieldValue': 'computed value',
      };

      var decoded = MixedFieldModesMapper.fromMap(mapWithIgnored);
      expect(decoded.name, equals('Jane'));
      expect(decoded.ignoredFieldValue, isNull);
      expect(decoded.computedFieldValue, equals('computed value'));
    });

    test(
      'backward compatibility - fields without annotations work as before',
      () {
        var user = User(
          'John',
          'john@example.com',
          'secret123',
          DateTime.now(),
        );

        var map = user.toMap();
        expect(map.containsKey('name'), isTrue);
        expect(map.containsKey('email'), isTrue);
        expect(map['name'], equals('John'));
        expect(map['email'], equals('john@example.com'));
      },
    );

    test('JSON serialization respects field ignoring', () {
      var user = User('John', 'john@example.com', 'secret123', DateTime.now());

      var json = user.toJson();
      var decodedMap = jsonDecode(json);

      expect(decodedMap.containsKey('passwordValue'), isFalse);
      expect(decodedMap.containsKey('name'), isTrue);
      expect(decodedMap['name'], equals('John'));
    });

    test('JSON deserialization respects field ignoring', () {
      var json =
          '{"name": "John", "email": "john@example.com", "passwordValue": "secret123", "lastLoginValue": "2023-01-01T00:00:00.000Z"}';

      var user = UserMapper.fromJson(json);
      expect(user.name, equals('John'));
      expect(user.email, equals('john@example.com'));
      expect(user.passwordValue, equals('secret123'));
      expect(user.lastLoginValue, isNull); // Should be ignored
    });

    test('copyWith respects field ignoring for serialization', () {
      var user = User('John', 'john@example.com', 'secret123', DateTime.now());
      var copied = user.copyWith(name: 'Jane');

      var map = copied.toMap();
      expect(map.containsKey('passwordValue'), isFalse);
      expect(map['name'], equals('Jane'));
    });
  });
}
