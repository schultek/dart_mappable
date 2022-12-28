import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import '../utils.dart';
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
      var a = A('test');

      // should work
      expect(a.toMap(), equals({'a': 'test'}));
      expect(a.toJson(), equals('{"a":"test"}'));
      expect(a.copyWith(a: 'test2').a, equals('test2'));

      // should not work
      expect(
        () => AMapper.container.fromJson<A>('{}'),
        throwsMapperException(MapperException.chain(
          MapperMethod.decode,
          '(A)',
          MapperException.unsupportedMethod(MapperMethod.decode, A),
        )),
      );

      expect(a, isNot(equals(A('test'))));
      expect(a.toString(), equals("Instance of 'A'"));
    });

    test('Should only generate equals and stringify', () {
      var b = B('hi');

      // should work
      expect(b, equals(B('hi')));
      expect(BMapper.container.isEqual(b, B('hi')), equals(true));
      expect(b.toString(), equals('B(b: hi)'));
      expect(BMapper.container.asString(b), equals('B(b: hi)'));

      // should not work
      expect(
        () => BMapper.container.fromJson<B>('{}'),
        throwsMapperException(MapperException.chain(
          MapperMethod.decode,
          '(B)',
          MapperException.unsupportedMethod(MapperMethod.decode, B),
        )),
      );

      expect(() => (b as dynamic).toMap, throwsNoSuchMethodError);
      expect(() => (b as dynamic).copyWith, throwsNoSuchMethodError);
    });
  });
}
