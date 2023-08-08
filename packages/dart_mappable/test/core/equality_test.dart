import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'equality_test.mapper.dart';

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
  group('equality', () {
    test('set', () {
      final set1 = SetWrapper({'UK - Solar', 'Italy PUN - Solar'});
      final set2 = SetWrapper({'Italy PUN - Solar', 'UK - Solar'});
      expect(set1, equals(set2));
    });

    test('list', () {
      final list1 = ListWrapper(['UK - Solar', 'Italy PUN - Solar']);
      final list2 = ListWrapper(['UK - Solar', 'Italy PUN - Solar']);
      expect(list1, equals(list2));
    });

    test('map', () {
      final map1 = MapWrapper({'uk': 'UK - Solar', 'it': 'Italy PUN - Solar'});
      final map2 = MapWrapper({'it': 'Italy PUN - Solar', 'uk': 'UK - Solar'});
      expect(map1, equals(map2));
    });
  });
}
