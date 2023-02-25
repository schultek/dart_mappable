import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'collection_copy_with_test.mapper.dart';

@MappableClass()
class A<T> with AMappable<T> {
  final List<T> items;

  A(this.items);
}

@MappableClass()
class B<T> with BMappable<T> {
  final Map<String, T> items;

  B(this.items);
}

void main() {
  group('list copy with', () {
    test('get item', () {
      var a = A<int>([1, 2, 3, 4, 5]);

      var a2 = a.copyWith.items[3].$update((i) => i * 2);
      expect(a2.items, equals([1, 2, 3, 8, 5]));

      var a3 = a.copyWith.items.at(2).$update((i) => -i);
      expect(a3.items, equals([1, 2, -3, 4, 5]));
    });

    test('add / insert', () {
      var a = A<int>([1, 2, 3]);

      var a2 = a.copyWith.items.add(4);
      expect(a2.items, equals([1, 2, 3, 4]));

      var a3 = a.copyWith.items.addAll([4, 5]);
      expect(a3.items, equals([1, 2, 3, 4, 5]));

      var a4 = a.copyWith.items.insert(2, 4);
      expect(a4.items, equals([1, 2, 4, 3]));

      var a5 = a.copyWith.items.insertAll(2, [4, 5]);
      expect(a5.items, equals([1, 2, 4, 5, 3]));
    });

    test('replace / remove', () {
      var a = A<int>([1, 2, 3]);

      var a2 = a.copyWith.items.replace(1, 4);
      expect(a2.items, equals([1, 4, 3]));

      var a3 = a.copyWith.items.removeAt(0);
      expect(a3.items, equals([2, 3]));
    });

    test('filter', () {
      var a = A<int>([1, 2, 3, 4, 5]);

      var a2 = a.copyWith.items.take(3);
      expect(a2.items, equals([1, 2, 3]));

      var a3 = a.copyWith.items.skip(2);
      expect(a3.items, equals([3, 4, 5]));

      var a4 = a.copyWith.items.where((i) => i % 2 == 0);
      expect(a4.items, equals([2, 4]));

      var a5 = a.copyWith.items.sublist(1, 4);
      expect(a5.items, equals([2, 3, 4]));
    });
  });

  group('map copy with', () {
    test('get item', () {
      var b = B<int>({'a': 1, 'b': 2});

      var b2 = b.copyWith.items['b']!.$update((i) => i * 2);
      expect(b2.items, equals({'a': 1, 'b': 4}));

      var b3 = b.copyWith.items.get('a')!.$update((i) => i + 1);
      expect(b3.items, equals({'a': 2, 'b': 2}));
    });

    test('put', () {
      var b = B<int>({'a': 1, 'b': 2});

      var b2 = b.copyWith.items.put('c', 3);
      expect(b2.items, equals({'a': 1, 'b': 2, 'c': 3}));

      var b3 = b.copyWith.items.putAll({'c': 3, 'b': 4});
      expect(b3.items, equals({'a': 1, 'b': 4, 'c': 3}));
    });

    test('replace / remove', () {
      var b = B<int>({'a': 1, 'b': 2});

      var b2 = b.copyWith.items.replace('a', 3);
      expect(b2.items, equals({'a': 3, 'b': 2}));

      var b3 = b.copyWith.items.remove('b');
      expect(b3.items, equals({'a': 1}));
    });
  });
}
