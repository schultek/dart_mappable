import 'package:test/test.dart';

import '../utils.dart';
import 'mapper_test.mapper.g.dart';

void main() {
  group('Mapper utils', () {
    test('Use and unuse Mapper', () {
      var mapper = Mapper.unuse<int>()!;

      expect(() => Mapper.fromValue<int>('2'), throwsMapperException);

      Mapper.use(mapper);

      expect(() => Mapper.fromValue<int>('2'), returnsNormally);
    });
  });
}
