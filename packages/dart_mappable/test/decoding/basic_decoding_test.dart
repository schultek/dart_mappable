import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import '../utils.dart';

part 'basic_decoding_test.mapper.dart';

@MappableClass()
class A with AMappable {
  final String a;
  final int b;
  final double? c;
  final bool d;

  A(this.a, {this.b = 0, this.c, required this.d});
}

@MappableEnum(defaultValue: B.a)
enum B { a, bB, ccCc }

void main() {
  group('basic decoding', () {
    test('from map succeeds', () {
      expect(
        AMapper.fromMap({'a': 'hi', 'd': false}),
        equals(A('hi', d: false)),
      );
      expect(
        AMapper.fromMap({'a': 'test', 'b': 1, 'c': 0.5, 'd': true}),
        equals(A('test', b: 1, c: 0.5, d: true)),
      );
    });

    test('from map throws', () {
      expect(
        () => AMapper.fromMap({'a': 'hi'}),
        throwsMapperException(MapperException.chain(
          MapperMethod.decode,
          '(A).d',
          MapperException.missingParameter('d'),
        )),
      );

      expect(
        () => AMapper.fromMap({'a': 'ok', 'b': 'fail', 'd': false}),
        throwsMapperException(MapperException.chain(
          MapperMethod.decode,
          '(A).b(int)',
          FormatException('fail'),
        )),
      );
    });
  });
}
