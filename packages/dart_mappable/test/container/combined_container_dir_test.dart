@MappableLib(
  createCombinedContainer: true,
  discoveryMode: DiscoveryMode.directory,
)
library main;

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import '../copy_with/copy_with_test.dart' as c;
import '../utils.dart';
import 'combined_container_dir_test.container.dart';
import 'combined_container_lib_test.dart' as a;
import 'models/model.dart' as b;

void main() {
  group('combined container', () {
    test('links all mappers in the directory', () {
      expect(mainContainer.fromMap<a.A>({}), isA<a.A>());
      expect(mainContainer.fromMap<a.B>({}), isA<a.B>());
      expect(mainContainer.fromMap<b.A>({}), isA<b.A>());
      expect(
        () => mainContainer.fromMap<c.Person>({}),
        throwsMapperException(MapperException.chain(MapperMethod.decode,
            '(Person)', MapperException.unknownType(c.Person))),
      );
    });
  });
}
