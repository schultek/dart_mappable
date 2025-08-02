

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'recursive_generics_test.mapper.dart';

@MappableClass()
class ComparableBox<T extends Comparable<T>> with ComparableBoxMappable<T> {
  const ComparableBox(this.value);
  final T value;
}


void main() {
  group('Generic classes', () {
    test('Should encode generic objects', () {
      ComparableBox<num> box = ComparableBox(10);
      expect(box.toJson(), equals('{"value":10}'));
    });

    test('Should decode generic objects', () {
      ComparableBox<num> box = ComparableBoxMapper.fromJson('{"value":10}');
      expect(box.value, equals(10));
    });
  });
}