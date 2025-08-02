// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'enum_map_test.mapper.dart';

@MappableEnum(defaultValue: EnumA.unknown)
enum EnumA { a, aa, unknown }

@MappableClass()
class ClassA with ClassAMappable {
  final Map<EnumA, bool?> someVariable;

  const ClassA(this.someVariable);
}

void main() {
  group('enum map', () {
    test('equality', () {
      var a = ClassA({EnumA.a: true, EnumA.aa: false});
      var b = ClassA({EnumA.aa: false, EnumA.a: true});
      expect(a == b, isTrue);
    });

    test('toString', () {
      var a = ClassA({EnumA.a: true, EnumA.aa: false});
      expect(
        a.toString(),
        equals('ClassA(someVariable: {EnumA.a: true, EnumA.aa: false})'),
      );
    });
  });
}
