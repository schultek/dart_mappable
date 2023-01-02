import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'custom_discriminator_test.mapper.dart';

@MappableClass(
  hook: CheckTypesHook({
    B: B.checkType,
    C: C.checkType,
  }),
)
abstract class A with AMappable {
  A();
}

@MappableClass()
class B extends A with BMappable {
  B();

  static bool checkType(value) {
    return value is Map && value['isB'] == true;
  }
}

@MappableClass()
class C extends A with CMappable {
  C();

  static bool checkType(value) {
    return value is Map && value['isWhat'] == 'C';
  }
}

void main() {
  group('custom discriminator', () {
    test('decodes with custom discriminator', () {
      var a = AMapper.fromMap({'isB': true});
      expect(a, isA<B>());

      var b = AMapper.fromMap({'isWhat': 'C'});
      expect(b, isA<C>());
    });
  });
}
