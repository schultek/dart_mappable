import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'desync_serialization_test.mapper.dart';

//a
@MappableClass()
class A with AMappable {
  const A(this.a, this.b);
  const A.filled(this.a) : b = 1;

  final int a;
  @MappableField()
  final int b;
}

@MappableClass()
class B extends A with BMappable {
  const B(super.a, this.c) : super.filled();

  final int c;
}

void main() {
  group('desync serialization', () {
    test('to json succeeds', () {
      var b = B(3, 5);
      expect(b.toJson(), equals('{"a":3,"c":5,"b":1}'));
    });
  });
}
