// ignore_for_file: deprecated_member_use_from_same_package

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  group('Mapper utils', () {
    test('Use and unuse Mapper', () {
      var container = MapperContainer();
      var mapper = MapperContainer.defaults.unuse<int>()!;

      expect(
        () => container.fromValue<int>('2'),
        throwsMapperException(MapperException.chain(
          MapperMethod.decode,
          '(int)',
          MapperException.unknownType(int),
        )),
      );

      expect(
        () => container.toValue<int>(2),
        throwsMapperException(MapperException.chain(
          MapperMethod.encode,
          '[2]',
          MapperException.unknownType(int),
        )),
      );

      MapperContainer.defaults.use(mapper);

      expect(container.fromValue<int>('2'), equals(2));

      container
          .use(PrimitiveMapper((value) => int.parse(value.toString()) * 10));

      expect(container.fromValue<int>('2'), 20);

      expect(container.getAll(), hasLength(1));
    });

    test('link containers', () {
      var containerA = MapperContainer();
      var containerB = MapperContainer();

      var mapper = MapperContainer.defaults.unuse<int>()!;

      containerB.use(mapper);

      expect(
        () => containerA.fromValue<int>('2'),
        throwsMapperException(MapperException.chain(
          MapperMethod.decode,
          '(int)',
          MapperException.unknownType(int),
        )),
      );

      expect(containerB.fromValue<int>('2'), equals(2));

      containerA.link(containerB);

      expect(containerA.fromValue<int>('2'), equals(2));

      MapperContainer.defaults.use(mapper);
    });

    test('iterables', () {
      var container = MapperContainer();

      expect(
        container.fromIterable<List<int>>(['2', 1.5, 0]),
        equals([2, 2, 0]),
      );

      expect(
        container.toIterable([DateTime.utc(2000)]),
        equals(['2000-01-01T00:00:00.000Z']),
      );

      expect(
        () => container.toIterable(1),
        throwsMapperException(
            MapperException.incorrectEncoding(int, 'Iterable', int)),
      );
    });

    test('equals and tostring', () {
      var container = MapperContainer();

      var mapper = MapperContainer.defaults.unuse<int>()!;

      expect(container.isEqual(null, 2), isFalse);
      expect(container.hash(null), equals(null.hashCode));
      expect(container.asString(null), equals(null.toString()));

      expect(container.isEqual(2, 2), isTrue);
      expect(container.hash(2), equals(2.hashCode));
      expect(container.asString(2), equals(2.toString()));

      MapperContainer.defaults.use(mapper);
    });
  });
}
