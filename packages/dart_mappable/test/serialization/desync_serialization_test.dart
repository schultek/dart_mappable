import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'desync_serialization_test.mapper.dart';

//a
@MappableClass()
class A with AMappable {
  const A(this.a, this.b, this.c);
  const A.filled(this.a) : b = 1, c = const C(2);

  final int a;
  @MappableField()
  final int b;
  @MappableField()
  final C c;
}

@MappableClass()
class B extends A with BMappable {
  const B(super.a, this.d) : super.filled();

  final int d;
}

@MappableClass()
class C with CMappable {
  const C(this.x);

  final int x;
}

void main() {
  group('desync serialization', () {
    test('to json succeeds', () {
      var b = B(3, 5);
      expect(b.toJson(), equals('{"a":3,"d":5,"b":1,"c":{"x":2}}'));
    });
  });
}
