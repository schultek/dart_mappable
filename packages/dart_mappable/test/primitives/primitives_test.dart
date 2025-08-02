import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'primitives_test.mapper.dart';

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
  var m = MapperContainer.globals;
  group('Mapping of primitive types', () {
    test('Mapping of strings', () {
      expect(m.fromValue<String>('abc'), equals('abc'));
      expect(m.toValue('abc'), equals('abc'));
      expect(m.toJson('abc'), equals('"abc"'));

      expect(m.fromValue<String>(100), equals('100'));
      expect(m.fromValue<String>(MyClass('Max')), equals('MyClass{Max}'));
    });

    test('Mapping of numbers', () {
      expect(m.fromValue<num>(123), equals(123));
      expect(m.fromValue<int>('1'), equals(1));
      expect(m.fromValue<double>('1.1'), equals(1.1));
      expect(m.toJson(100.234), equals('100.234'));

      expect(
        () => m.fromValue<int>('a'),
        throwsA(const TypeMatcher<MapperException>()),
      );
    });

    test('Mapping of booleans', () {
      expect(m.fromValue<bool>(false), equals(false));
      expect(m.fromValue<bool>('true'), equals(true));

      expect(
        () => m.fromValue<int>('a'),
        throwsA(const TypeMatcher<MapperException>()),
      );
    });

    test('Mapping of DateTime', () {
      var date = DateTime(1234, 5, 6, 11, 22, 33, 4567);
      var dateStr = date.toUtc().toIso8601String();
      var dateMillis = date.millisecondsSinceEpoch;
      expect(m.toValue(date), equals(dateStr));
      expect(m.fromValue<DateTime>(dateStr), equals(date.toUtc()));
      expect(m.fromValue<DateTime>(dateMillis), equals(date));
    });

    test('Mapping of List and Set', () {
      expect(m.fromJson<List<int>>('[2, 4, 105.6]'), equals([2, 4, 106]));
      expect(
        m.fromValue<List<String>>([1, 'a', MyClass('Tom')]),
        equals(['1', 'a', 'MyClass{Tom}']),
      );

      expect(m.fromJson<Set<int>>('[2, 4, 105.6]'), equals({2, 4, 106}));
      expect(
        m.fromValue<Set<String>>([1, 'a', MyClass('Tom')]),
        equals({'1', 'a', 'MyClass{Tom}'}),
      );

      Items a = Items([Item(1), Item(2)], {1: Item(3)});
      Items b = Items([Item(1), Item(2)], {1: Item(3)});
      expect(m.isEqual(a, b), equals(true));
    });

    test('Mapping of Map', () {
      expect(m.fromJson<Map<String, int>>('{"a": 2}'), equals({'a': 2}));
      expect(
        m.fromValue<Map<String, String>>({'a': MyClass('Tom')}),
        equals({'a': 'MyClass{Tom}'}),
      );

      expect(
        m.toValue<Map<String, dynamic>>({'a': 2, 'b': 'test'}),
        allOf(isA<Map<String, dynamic>>(), equals({'a': 2, 'b': 'test'})),
      );
    });
  });
}
