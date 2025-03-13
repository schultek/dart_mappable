import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'copy_with_generic_bounded_test.mapper.dart';

@MappableClass()
class Container<T extends A<B>> with ContainerMappable<T> {
  final T content;

  const Container(this.content);
}

@MappableClass()
class Container1<T extends A> with Container1Mappable<T> {
  final T content;

  const Container1(this.content);
}

@MappableClass()
class Container2<T extends A<V>, V extends B> with Container2Mappable<T, V> {
  final T content;

  const Container2(this.content);
}

@MappableClass()
class A<T extends B> with AMappable<T> {
  final T b;

  const A(this.b);
}

@MappableClass()
class Container3<T extends A2> with Container3Mappable<T> {
  final T content;
  final List<T> contents;

  const Container3(this.content, this.contents);
}

@MappableClass()
class Container4<T extends A2<B>> with Container4Mappable<T> {
  final T content;
  final List<T> contents;

  const Container4(this.content, this.contents);
}

@MappableClass()
class Container5<T extends B?> with Container5Mappable<T> {
  final T content;

  const Container5(this.content);
}

@MappableClass()
class A2<T> with A2Mappable<T> {
  final T t;

  const A2(this.t);
}

@MappableClass()
class B with BMappable {
  final String b;

  const B(this.b);
}

@MappableClass()
class B2 extends B with B2Mappable {
  const B2(super.b);
}

void main() {
  test('Copies bounded generic parameter', () {
    final c0 = Container<A<B2>>(A(B2('abc')));
    final c1 = Container1<A<B2>>(A(B2('def')));
    final c2 = Container2<A<B2>, B2>(A(B2('ghi')));
    final c3 = Container3<A2<B2>>(A2(B2('jkl')), []);
    final c4 = Container4<A2<B2>>(A2(B2('mno')), []);

    var c02 = c0.copyWith.content.b(b: 'jkl');
    expect(c02.content.b, equals(B2('jkl')));

    var c12 = c1.copyWith.content.b(b: 'mno');
    expect(c12.content.b, equals(B2('mno')));

    var c22 = c2.copyWith.content.b(b: 'pqr');
    expect(c22.content.b, equals(B2('pqr')));

    var c32 = c3.copyWith.content(t: B2('stu'));
    expect(c32.content.t.b, equals('stu'));

    var c42 = c4.copyWith.content(t: B2('vwx'));
    expect(c42.content.t.b, equals('vwx'));
  });
}
