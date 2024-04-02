import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

void main() {
  var m = MapperContainer.globals;
  group('primitive equality', () {
    test('of values', () {
      expect(m.isEqual('abc', 'abc'), isTrue);
      expect(m.isEqual('abc', 'def'), isFalse);

      expect(m.isEqual(1, 1), isTrue);
      expect(m.isEqual(1, 2), isFalse);

      expect(m.isEqual(0.5, 0.5), isTrue);
      expect(m.isEqual(0.5, 0.1), isFalse);
      expect(m.isEqual(1.0, 1), isTrue);

      expect(m.isEqual(true, true), isTrue);
      expect(m.isEqual(true, false), isFalse);
    });

    test('of nulls', () {
      expect(m.isEqual('abc', null), isFalse);
      expect(m.isEqual(null, 'abc'), isFalse);
      expect(m.isEqual(null, null), isTrue);
    });
  });
}
