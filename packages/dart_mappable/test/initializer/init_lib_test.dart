@MappableLib(generateInitializerForScope: InitializerScope.library)
library main;

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import '../utils.dart';
import 'init_lib_test.init.dart';
import 'models/model.dart' as a;

part 'init_lib_test.mapper.dart';

@MappableClass()
class A with AMappable {}

@MappableClass()
class B with BMappable {}

void main() {
  group('combined container', () {
    test('links all mappers in the directory', () {
      initializeMappers();

      expect(MapperContainer.globals.fromMap<A>({}), isA<A>());
      expect(MapperContainer.globals.fromMap<B>({}), isA<B>());
      expect(
        () => MapperContainer.globals.fromMap<a.A>({}),
        throwsMapperException(MapperException.chain(
            MapperMethod.decode, '(A)', MapperException.unknownType(a.A))),
      );
    });
  });
}
