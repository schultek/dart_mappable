import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import 'default_values_test.mapper.g.dart';
import 'otherlib.dart' as other;

@MappableClass()
class A with Mappable {
  final B b;

  const A({this.b = const B(c: C(def))});
}

@MappableClass()
class B with Mappable {
  final C c;

  const B({required this.c});
}

@MappableClass()
class C with Mappable {
  final String d;

  const C(this.d);
}

const def = 'default';

void main() {
  group('Default values', () {
    test('should be prefixed', () {
      expect(
        Mapper.fromJson<A>('{"b": {"c": {"d": "hi"}}}'),
        equals(A(b: B(c: C('hi')))),
      );
    });
  });

  group('Duplicate names', () {
    test('should be resolved', () {
      expect(
        Mapper.fromValue<List<A>>([]),
        isA<List<A>>(),
      );

      expect(
        Mapper.fromValue<List<other.A>>([]),
        isA<List<other.A>>(),
      );
    });
  });
}
