@MappableLib(
  createCombinedContainer: true,
  discoveryMode: DiscoveryMode.library,
)
library main;

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import '../utils.dart';
import 'combined_container_lib_test.container.dart';
import 'models/model.dart' as a;

part 'combined_container_lib_test.mapper.dart';

@MappableClass()
class A with AMappable {}

@MappableClass()
class B with BMappable {}

void main() {
  group('combined container', () {
    test('links all mappers in the directory', () {
      expect(mainContainer.fromMap<A>({}), isA<A>());
      expect(mainContainer.fromMap<B>({}), isA<B>());
      expect(
        () => mainContainer.fromMap<a.A>({}),
        throwsMapperException(MapperException.chain(
            MapperMethod.decode, '(A)', MapperException.unknownType(a.A))),
      );
    });
  });
}
