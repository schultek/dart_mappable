import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';
import 'package:test/test.dart';

import '../utils.dart';
import 'mapper_test.mapper.g.dart';

class Item with MappableMixin {}

void main() {
  group('Mapper utils', () {
    test('Use and unuse Mapper', () {
      var mapper = Mapper.unuse<int>()!;

      expect(
        () => Mapper.fromValue<int>('2'),
        throwsMapperException(MapperException.chain(
          MapperMethod.decode,
          '(int)',
          MapperException.unknownType(int),
        )),
      );

      Mapper.use(mapper);

      expect(() => Mapper.fromValue<int>('2'), returnsNormally);
    });

    test('Unallowed mappable', () {
      expect(Item().toString(), equals('Instance of \'Item\''));
      expect(() => Mapper.asString(Item()),
          throwsMapperException(MapperException.unallowedMappable()));
    });
  });
}
