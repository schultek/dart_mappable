import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'collection_equality_test.mapper.dart';

@MappableClass()
class SetWrapper with SetWrapperMappable {
  final Set<String> values;

  SetWrapper(this.values);
}

@MappableClass()
class ListWrapper with ListWrapperMappable {
  final List<String> values;

  ListWrapper(this.values);
}

@MappableClass()
class MapWrapper with MapWrapperMappable {
  final Map<String, dynamic> values;

  MapWrapper(this.values);
}

void main() {
  var m = MapperContainer.globals;

  group('collection equality', () {
    test('of sets', () {
      final set1 = SetWrapper({'A', 'B'});
      final set2 = SetWrapper({'B', 'A'});

      expect(set1, equals(set2));
      expect(m.isEqual(set1.values, set2.values), isTrue);
    });

    test('of lists', () {
      final list1 = ListWrapper(['A', 'B']);
      final list2 = ListWrapper(['A', 'B']);
      final list3 = ListWrapper(['B', 'A']);

      expect(list1, equals(list2));
      expect(list1, isNot(equals(list3)));
      expect(m.isEqual(list1.values, list2.values), isTrue);
      expect(m.isEqual(list1.values, list3.values), isFalse);

      IterableMapper.equalityMode = IterableEqualityMode.unordered;

      expect(list1, equals(list2));
      expect(list1, equals(list3));
      expect(m.isEqual(list1.values, list2.values), isTrue);
      expect(m.isEqual(list1.values, list3.values), isTrue);
    });

    test('of maps', () {
      final map1 = MapWrapper({'a': 'A', 'b': 'B'});
      final map2 = MapWrapper({'b': 'B', 'a': 'A'});

      expect(map1, equals(map2));
      expect(m.isEqual(map1.values, map2.values), isTrue);
    });
  });
}
