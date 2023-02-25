import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'copy_with_batch_test.mapper.dart';

@MappableClass()
class A with AMappable {
  final String? a;
  final B? b;

  A(this.a, this.b);
}

@MappableClass()
class B with BMappable {
  final String? a;
  final int? b;

  B(this.a, this.b);
}

void main() {
  group('copy with batch', () {
    test('copy with batch', () {
      var a = A(null, B('a', null));

      var a2 = a.copyWith.$batch((b) {
        b.a.$update((_) => 'hi');
        b.b?.call(b: 2);
      });

      expect(a2, equals(A('hi', B('a', 2))));
    });
  });
}
