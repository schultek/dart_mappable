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

      MapperContainer.defaults.use(mapper);

      expect(container.fromValue<int>('2'), equals(2));

      container
          .use(PrimitiveMapper((value) => int.parse(value.toString()) * 10));

      expect(container.fromValue<int>('2'), 20);
    });
  });
}
