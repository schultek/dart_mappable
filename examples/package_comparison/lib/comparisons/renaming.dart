import 'package:dart_mappable/dart_mappable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test/test.dart';

part 'renaming.g.dart';
part 'renaming.mapper.dart';

// 1️⃣ === json_serializable ===

@JsonSerializable(fieldRename: FieldRename.snake)
class PersonA {
  final String firstName;
  @JsonKey(name: 'surName')
  final String lastName;

  PersonA({required this.firstName, required this.lastName});

  // Required Boilerplate
  factory PersonA.fromJson(Map<String, dynamic> json) =>
      _$PersonAFromJson(json);

  // Required Boilerplate
  Map<String, dynamic> toJson() => _$PersonAToJson(this);
}

// 3️⃣ === dart_mappable ===

@MappableClass(caseStyle: CaseStyle.snakeCase)
// Required Boilerplate (Mixin)
class PersonB with PersonBMappable {
  final String firstName;
  @MappableField(key: 'surName')
  final String lastName;

  PersonB({required this.firstName, required this.lastName});
}

// 🆚 === Comparison ===

void compareRenaming() {
  group('renaming', () {
    group('🆚 decode from map', () {
      test('1️⃣ json_serializable', () {
        expect(
          PersonA.fromJson({'first_name': 'Alice', 'surName': 'A'}),
          predicate<PersonA>(
              (p) => p.firstName == 'Alice' && p.lastName == 'A'),
        );
      });

      test('3️⃣ dart_mappable', () {
        expect(
          PersonBMapper.fromMap({'first_name': 'Bob', 'surName': 'B'}),
          equals(PersonB(firstName: 'Bob', lastName: 'B')),
        );
      });
    });

    group('🆚 encode to map', () {
      test('1️⃣ json_serializable', () {
        expect(
          PersonA(firstName: 'Alice', lastName: 'A').toJson(),
          equals({'first_name': 'Alice', 'surName': 'A'}),
        );
      });

      test('3️⃣ dart_mappable', () {
        expect(
          PersonB(firstName: 'Bob', lastName: 'B').toMap(),
          equals({'first_name': 'Bob', 'surName': 'B'}),
        );
      });
    });
  });
}
