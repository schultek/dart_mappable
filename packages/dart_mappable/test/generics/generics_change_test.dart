import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import '../utils.dart';

part 'generics_change_test.mapper.dart';

@MappableClass(discriminatorKey: 'type')
class A<T> with AMappable<T> {}

@MappableClass()
class B<T> extends A<T> with BMappable<T> {}

@MappableClass()
class C<T extends num> extends A<T> with CMappable<T> {}

@MappableClass()
class D<T, V> extends A<V> with DMappable<T, V> {}

@MappableClass()
class E<T, V> extends D<V, List<T>> with EMappable<T, V> {}

@MappableClass()
class F extends E<int, String> with FMappable {}

@MappableClass()
class G<T, V extends A<T>> extends A<T> with GMappable<T, V> {}

@MappableClass()
class H<T extends C> extends A with HMappable<T> {}

@MappableClass()
class I<T extends C<V>, V extends num> extends A<V> with IMappable<T, V> {}

@MappableClass()
class J<T extends C<V>, V extends U, U extends num> extends D<V, U>
    with JMappable<T, V, U> {}

void main() {
  group('Generics Change Args', () {
    test('Unchanged Args', () {
      var a = AMapper.fromMap<int>({'type': 'B'});
      expect(a, isA<B<int>>());
    });

    test('Bounded Args', () {
      var a = AMapper.fromMap<int>({'type': 'C'});
      expect(a, isA<C<int>>());
    });

    test('Additional Args', () {
      var a = AMapper.fromMap<int>({'type': 'D'});
      expect(a, isA<D<dynamic, int>>());
    });

    test('Modified Args', () {
      var a = AMapper.fromMap<List<int>>({'type': 'E'});
      expect(a, isA<E<int, dynamic>>());

      var b = AMapper.fromMap<dynamic>({'type': 'E'});
      expect(b, isA<E<dynamic, dynamic>>());

      expect(
        () => AMapper.fromMap<Map>({'type': 'E'}),
        throwsMapperException(
          MapperException.chain(
            MapperMethod.decode,
            '(A<Map<dynamic, dynamic>>)',
            "type 'E<dynamic, dynamic>' is not a subtype of type 'A<Map<dynamic, dynamic>>' in type cast",
          ),
        ),
      );
    });

    test('Less Args', () {
      var f = EMapper.fromMap<dynamic, dynamic>({'type': 'F'});
      expect(f, isA<F>());
    });

    test('Additional bounded Args', () {
      var a = AMapper.fromMap<int>({'type': 'G'});
      expect(a, isA<G<int, A<int>>>());
    });

    test('Unspecified Args', () {
      var a = AMapper.fromMap({'type': 'H'});
      expect(a, isA<H<C<num>>>());
      expect(a, isNot(isA<H<C<int>>>()));
    });

    test('Double bounded Args', () {
      var a = AMapper.fromMap<int>({'type': 'I'});
      expect(a, isA<I<C<int>, int>>());
    });

    test('Triple bounded Args', () {
      var d = DMapper.fromMap<int, int>({'type': 'J'});
      expect(d, isA<J<C<int>, int, int>>());
    });
  });
}
