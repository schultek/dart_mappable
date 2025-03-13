import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'encoding_params_test.mapper.dart';

@MappableClass(
  shallowEncoding: true,
  includeTypeId: false,
)
class A with AMappable {
  final String a;
  final B? b;

  A(this.a, {this.b});
}

@MappableEnum(defaultValue: B.a)
enum B { a, bB, ccCc }

void main() {
  group('encoding params serialization', () {
    test('encodes shallow', () {
      expect(A('hi', b: B.bB).toMap(), equals({'a': 'hi', 'b': B.bB}));
      expect(AMapper.ensureInitialized().shallowEncoding, isTrue);
    });

    test('does not include type id', () {
      AMapper.ensureInitialized();
      expect(MapperContainer.globals.toMap<dynamic>(A('hi')),
          equals({'a': 'hi', 'b': null}));
      expect(AMapper.ensureInitialized().includeTypeId<dynamic>(null), isFalse);
    });
  });
}
