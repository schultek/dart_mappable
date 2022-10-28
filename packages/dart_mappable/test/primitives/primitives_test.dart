import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import 'primitives_test.mapper.g.dart';

class MyClass {
  final String name;
  MyClass(this.name);

  @override
  String toString() {
    return 'MyClass{$name}';
  }
}

@MappableClass()
class Items with ItemsMappable {
  List<Item> items;
  Map<int, Item> items2;

  Items(this.items, this.items2);
}

@MappableClass()
class Item with ItemMappable {
  int index;

  Item(this.index);
}

void main() {
  group('Mapping of primitive types', () {
    test('Mapping of strings', () {
      expect(Mapper.fromValue<String>('abc'), equals('abc'));
      expect(Mapper.toValue('abc'), equals('abc'));
      expect(Mapper.toJson('abc'), equals('"abc"'));

      expect(Mapper.fromValue<String>(100), equals('100'));
      expect(Mapper.fromValue<String>(MyClass('Max')), equals('MyClass{Max}'));
    });

    test('Mapping of numbers', () {
      expect(Mapper.fromValue<num>(123), equals(123));
      expect(Mapper.fromValue<int>('1'), equals(1));
      expect(Mapper.fromValue<double>('1.1'), equals(1.1));
      expect(Mapper.toJson(100.234), equals('100.234'));

      expect(
        () => Mapper.fromValue<int>('a'),
        throwsA(const TypeMatcher<MapperException>()),
      );
    });

    test('Mapping of booleans', () {
      expect(Mapper.fromValue<bool>(false), equals(false));
      expect(Mapper.fromValue<bool>('true'), equals(true));

      expect(
        () => Mapper.fromValue<int>('a'),
        throwsA(const TypeMatcher<MapperException>()),
      );
    });

    test('Mapping of DateTime', () {
      var date = DateTime(1234, 5, 6, 11, 22, 33, 4567);
      var dateStr = date.toUtc().toIso8601String();
      var dateMillis = date.millisecondsSinceEpoch;
      expect(Mapper.toValue(date), equals(dateStr));
      expect(Mapper.fromValue<DateTime>(dateStr), equals(date.toUtc()));
      expect(Mapper.fromValue<DateTime>(dateMillis), equals(date));
    });

    test('Mapping of List and Set', () {
      expect(Mapper.fromJson<List<int>>('[2, 4, 105.6]'), equals([2, 4, 106]));
      expect(Mapper.fromValue<List<String>>([1, 'a', MyClass('Tom')]),
          equals(['1', 'a', 'MyClass{Tom}']));

      expect(Mapper.fromJson<Set<int>>('[2, 4, 105.6]'), equals({2, 4, 106}));
      expect(Mapper.fromValue<Set<String>>([1, 'a', MyClass('Tom')]),
          equals({'1', 'a', 'MyClass{Tom}'}));

      Items a = Items([Item(1), Item(2)], {1: Item(3)});
      Items b = Items([Item(1), Item(2)], {1: Item(3)});
      expect(Mapper.isEqual(a, b), equals(true));
    });

    test('Mapping of Map', () {
      expect(Mapper.fromJson<Map<String, int>>('{"a": 2}'), equals({'a': 2}));
      expect(Mapper.fromValue<Map<String, String>>({'a': MyClass('Tom')}),
          equals({'a': 'MyClass{Tom}'}));
    });
  });
}
