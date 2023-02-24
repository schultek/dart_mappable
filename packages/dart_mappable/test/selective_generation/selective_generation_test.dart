import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'selective_generation_test.mapper.dart';

@MappableClass(
  generateMethods: GenerateMethods.encode | GenerateMethods.copy,
)
class A with AMappable {
  final String a;

  A(this.a);
}

@MappableClass(
  generateMethods: GenerateMethods.equals | GenerateMethods.stringify,
)
class B with BMappable {
  final String b;

  B(this.b);
}

void main() {
  group('Selective generation', () {
    test('Should only generate encode and copy methods', () {
      AMapper.ensureInitialized();
      var a = A('test');

      // should work
      expect(a.toMap(), equals({'a': 'test'}));
      expect(a.toJson(), equals('{"a":"test"}'));
      expect(a.copyWith(a: 'test2').a, equals('test2'));

      // should not work
      expect(a, isNot(equals(A('test'))));
      expect(a.toString(), equals("Instance of 'A'"));
    });

    test('Should only generate equals and stringify', () {
      BMapper.ensureInitialized();
      var b = B('hi');

      // should work
      expect(b, equals(B('hi')));
      expect(MapperContainer.globals.isEqual(b, B('hi')), equals(true));
      expect(b.toString(), equals('B(b: hi)'));
      expect(MapperContainer.globals.asString(b), equals('B(b: hi)'));

      // should not work
      expect(() => (b as dynamic).toMap, throwsNoSuchMethodError);
      expect(() => (b as dynamic).copyWith, throwsNoSuchMethodError);
    });
  });
}
