import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'param_rewrite_test.mapper.dart';

@MappableClass()
class A with AMappable {
  const A(this.a, int? b, int c)
      : b = b ?? 0,
        _c = c;

  final int a;
  final int b;
  final int _c;
}

@MappableClass()
class B with BMappable {
  const B(int a, int b)
      : a = b,
        b = a;

  final int a;
  final int b;
}

void main() {
  group('param rewrite', () {
    test('from json succeeds', () {
      var a = AMapper.fromMap({'a': 1, 'b': 2, 'c': 3});
      expect(a, equals(A(1, 2, 3)));
    });

    test('to json succeeds', () {
      var a = A(1, 2, 3);
      expect(a.toMap(), equals({'a': 1, 'b': 2, 'c': 3}));
    });

    test('swapped from json succeeds', () {
      var b = BMapper.fromMap({'a': 1, 'b': 2});
      expect(b, equals(B(1, 2)));
    });

    test('swapped to json succeeds', () {
      var b = B(1, 2);
      expect(b.toMap(), equals({'a': 1, 'b': 2}));
    });
  });
}
