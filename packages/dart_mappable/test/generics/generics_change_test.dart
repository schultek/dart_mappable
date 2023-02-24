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
          throwsMapperException(MapperException.chain(
              MapperMethod.decode,
              '(A<Map<dynamic, dynamic>>)',
              "type 'E<dynamic, dynamic>' is not a subtype of type 'A<Map<dynamic, dynamic>>' in type cast")));
    });
  });
}
