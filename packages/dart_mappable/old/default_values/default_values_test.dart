import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import 'otherlib.dart' as other;

part 'default_values_test.mapper.dart';

@MappableClass()
class A with AMappable {
  final B b;

  const A({this.b = const B(c: C(C.def))});
}

@MappableClass()
class B with BMappable {
  final C c;

  const B({required this.c});
}

@MappableClass()
class C with CMappable {
  final String d;

  const C(this.d);

  static const def = 'default';
}

void main() {
  group('Default values', () {
    test('should be prefixed', () {
      expect(
        AMapper.fromJson('{"b": {"c": {"d": "hi"}}}'),
        equals(A(b: B(c: C('hi')))),
      );
    });
  });

  group('Duplicate names', () {
    test('should be resolved', () {
      expect(
        AMapper.container.fromValue<List<A>>([]),
        isA<List<A>>(),
      );

      expect(
        other.AMapper.container.fromValue<List<other.A>>([]),
        isA<List<other.A>>(),
      );
    });
  });
}
