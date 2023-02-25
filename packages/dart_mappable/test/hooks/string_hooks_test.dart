import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'string_hooks_test.mapper.dart';

@MappableClass()
class A with AMappable {
  @MappableField(hook: UnescapeNewlinesHook())
  final String? a;
  @MappableField(hook: EmptyToNullHook())
  final String? b;

  A(this.a, this.b);
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
  });
}
