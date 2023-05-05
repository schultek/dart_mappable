import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'copy_with_data_test.mapper.dart';

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
  group('Copy with data', () {
    test('copy with merge', () {
      var a = A(null, B('a', null));

      var a2 = a.copyWith.$merge(A('hi', null));
      expect(a2, equals(A('hi', B('a', null))));

      var a3 = a2.copyWith.b!.$merge(B(null, 3));
      expect(a3, equals(A('hi', B('a', 3))));
    });

    test('copy with delta', () {
      var a = A(null, B('a', null));

      var a2 = a.copyWith.$delta({'a': 'hi'});
      expect(a2, equals(A('hi', B('a', null))));

      var a3 = a2.copyWith.b!.$delta({'b': 3, 'a': null});
      expect(a3, equals(A('hi', B(null, 3))));
    });
  });
}
