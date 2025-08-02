import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'retype_copy_with_test.mapper.dart';

@MappableClass()
class A with AMappable {
  final V v;
  V v2;

  A({required this.v, required this.v2});
}

@MappableClass()
class B extends A with BMappable {
  B({required W super.v, required W v2}) : super(v2: v2);
}

@MappableClass()
class V with VMappable {
  final int v;
  V(this.v);
}

@MappableClass()
class W extends V with WMappable {
  W(super.v);
}

void main() {
  group('retype copy with', () {
    test('can encode', () {
      var b = B(v: W(1), v2: W(2));
      var map = b.toMap();
      expect(
        map,
        equals({
          'v': {'v': 1, '__type': 'W'},
          'v2': {'v': 2, '__type': 'W'},
        }),
      );
    });

    test('should copy from base class', () {
      var b = B(v: W(1), v2: W(2));
      var b2 = b.copyWith.v(v: 2);
      expect(b2.v.v, equals(2));
    });

    test('should enncode when chaged', () {
      var b = B(v: W(1), v2: W(2));
      b.v2 = V(3);
      var map = b.toMap();
      expect(
        map,
        equals({
          'v': {'v': 1, '__type': 'W'},
          'v2': {'v': 3},
        }),
      );
    });
  });
}
