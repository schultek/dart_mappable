@MappableLib(
  createCombinedContainer: true,
  discoveryMode: DiscoveryMode.package,
)
library main;

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import '../serialization/basic_serialization_test.dart' as c;
import 'combined_container_package_test.container.dart';
import 'models/model.dart' as a;
import 'combined_container_lib_test.dart' as b;

void main() {
  group('combined container', () {
    test('links all mappers in the directory', () {
      expect(mainContainer.fromMap<a.A>({}), isA<a.A>());
      expect(mainContainer.fromMap<b.B>({}), isA<b.B>());
      expect(mainContainer.fromMap<b.A>({}), isA<b.A>());
      expect(mainContainer.fromMap<c.A>({'a': 'a', 'd': false}), isA<c.A>());
    });
  });
}
