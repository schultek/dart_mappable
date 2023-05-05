import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'interface_copy_with.mapper.dart';

@MappableClass()
class A with AMappable {
  final num a;

  A(this.a);
}

@MappableClass()
class B with BMappable {
  final String b;

  B(this.b);
}

@MappableClass()
class C with CMappable implements A, B {
  @override
  final int a;
  @override
  final String b;

  C(this.a, this.b);
}

void main() {
  group('interface copy with', () {
    test('should copy from base class', () {
      var c = C(1, 'hi');

      var c2 = c.copyWith(a: 2);
      expect(c2.a, equals(2));

      A a = C(2, 'ho');

      var a2 = a.copyWith(a: 1);
      expect(a2, isA<C>());
      expect(a2.a, equals(1));

      expect(() => a.copyWith(a: 0.5), throwsA(isA<TypeError>()));
    });
  });
}
