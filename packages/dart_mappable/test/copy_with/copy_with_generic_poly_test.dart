import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'copy_with_generic_poly_test.mapper.dart';

@MappableClass()
class A<T extends C> with AMappable {
  A(this.value);

  final T value;
}

@MappableClass()
class B extends A<D> with BMappable {
  B(super.value);
}

@MappableClass()
sealed class C with CMappable {
  C({
    required this.data,
  });

  final String data;
}

@MappableClass()
class D extends C with DMappable {
  D({
    required super.data,
  });
}

class E {}

void main() {
  test('Copies generic polymorphic parameter', () {
    final b = B(D(data: 'abc'));

    var b2 = b.copyWith.value(data: 'def');

    expect(b2.value.data, equals('def'));

    A a = b;

    var a2 = a.copyWith.value(data: 'ghi');

    expect(a2.value, isA<D>());
    expect(a2.value.data, equals('ghi'));
  });
}
