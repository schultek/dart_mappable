import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'string_hooks_test.mapper.dart';

@MappableClass(ignoreNull: true)
class A with AMappable {
  @MappableField(hook: UnescapeNewlinesHook())
  final String? a;
  @MappableField(hook: EmptyToNullHook())
  final String? b;
  @MappableField(hook: StringMapHook())
  final Map<int, dynamic>? c;

  A(this.a, this.b, this.c);
}

class StringMapHook extends MappingHook {
  const StringMapHook();

  @override
  Object? afterEncode(Object? value) {
    if (value is Map) return value.map((k, v) => MapEntry(k.toString(), v));
    return value;
  }
}

void main() {
  group('string hooks', () {
    test('unescape newlines', () {
      var a = AMapper.fromMap({'a': 'hello\\nworld'});
      expect(a.a, equals('hello\nworld'));
    });

    test('empty to null', () {
      var a = AMapper.fromMap({'b': ''});
      expect(a.b, equals(null));
      var b = AMapper.fromMap({'b': 'hello'});
      expect(b.b, equals('hello'));
    });

    test('string map', () {
      var a = A(null, null, {1: 'one', 2: 'two'});
      expect(
        a.toMap(),
        equals({
          'c': {'1': 'one', '2': 'two'}
        }),
      );
    });
  });
}
