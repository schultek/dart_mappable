import 'package:dart_mappable/dart_mappable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test/test.dart';

part 'polymorph.g.dart';
part 'polymorph.mapper.dart';

// 1️⃣ === json_serializable ===

// Needed to disable [fromJson] generation for abstract class
@JsonSerializable(createFactory: false)
abstract class AnimalA {
  final String name;

  AnimalA(this.name);

  // Required Boilerplate
  Map<String, dynamic> toJson() => _$AnimalAToJson(this);
}

@JsonSerializable()
class CatA extends AnimalA {
  String color;

  CatA(String name, this.color) : super(name);

  // Required Boilerplate
  factory CatA.fromJson(Map<String, dynamic> json) => _$CatAFromJson(json);

  // Required Boilerplate
  @override
  Map<String, dynamic> toJson() => _$CatAToJson(this);
}

@JsonSerializable()
class DogA extends AnimalA {
  int age;

  DogA(String name, this.age) : super(name);

  // Required Boilerplate
  factory DogA.fromJson(Map<String, dynamic> json) => _$DogAFromJson(json);

  // Required Boilerplate
  @override
  Map<String, dynamic> toJson() => _$DogAToJson(this);
}

// 3️⃣ === dart_mappable ===

@MappableClass(discriminatorKey: 'type')
// Required Boilerplate (Mixin)
abstract class AnimalB with AnimalBMappable {
  String name;

  AnimalB(this.name);
}

@MappableClass()
// Required Boilerplate (Mixin)
class CatB extends AnimalB with CatBMappable {
  String color;

  CatB(String name, this.color) : super(name);
}

@MappableClass(discriminatorValue: 'dog')
// Required Boilerplate (Mixin)
class DogB extends AnimalB with DogBMappable {
  int age;

  DogB(String name, this.age) : super(name);
}

// 🆚 === Comparison ===

void comparePolymorph() {
  group('polymorph', () {
    group('🆚 decode explicit subtype from map', () {
      test('1️⃣ json_serializable', () {
        expect(
          CatA.fromJson({'name': 'Kitty', 'color': 'brown'}),
          predicate<CatA>((c) => c.name == 'Kitty'),
        );
      });

      test('3️⃣ dart_mappable', () {
        expect(
          CatBMapper.fromMap({'name': 'Kitty', 'color': 'brown'}),
          equals(CatB('Kitty', 'brown')),
        );
      });
    });

    group('🆚 decode implicitly with discriminator from map', () {
      test('1️⃣ json_serializable', () {
        // 🔴 not supported
      });

      test('3️⃣ dart_mappable', () {
        // 🟢 built in
        expect(
          AnimalBMapper.fromMap(
              {'type': 'CatB', 'name': 'Kitty', 'color': 'brown'}),
          equals(CatB('Kitty', 'brown')),
        );
        expect(
          AnimalBMapper.fromMap({'type': 'dog', 'name': 'Bello', 'age': 2}),
          equals(DogB('Bello', 2)),
        );
      });
    });
  });
}
