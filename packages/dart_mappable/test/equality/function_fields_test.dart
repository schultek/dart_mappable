import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'function_fields_test.mapper.dart';

@MappableClass(
  generateMethods:
      GenerateMethods.copy | GenerateMethods.equals | GenerateMethods.stringify,
)
class Example with ExampleMappable {
  const Example({required this.functionField});

  final int Function(int)? functionField;
}

void main() {
  group('function fields', () {
    test('should check equality with function field', () {
      int fn(int x) => x + 1;

      var example1 = Example(functionField: fn);
      var example2 = Example(functionField: fn);
      expect(example1, equals(example2));
    });

    test('should stringify with function field', () {
      var example = Example(functionField: (x) => x + 1);
      expect(
        example.toString(),
        equals('Example(functionField: Closure: (int) => int)'),
      );
    });

    test('should check equality with null function field', () {
      var example1 = Example(functionField: null);
      var example2 = Example(functionField: null);
      expect(example1, equals(example2));
    });

    test('should stringify with null function field', () {
      var example = Example(functionField: null);
      expect(example.toString(), equals('Example(functionField: null)'));
    });
  });
}
