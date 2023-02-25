@MappableLib(
  generateInitializerForScope: InitializerScope.package,
)
library main;

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import '../serialization/basic_serialization_test.dart' as c;
import 'init_lib_test.dart' as b;
import 'init_package_test.init.dart';
import 'models/model.dart' as a;

void main() {
  group('combined container', () {
    test('links all mappers in the package', () {
      initializeMappers();

      expect(MapperContainer.globals.fromMap<a.A>({}), isA<a.A>());
      expect(MapperContainer.globals.fromMap<b.B>({}), isA<b.B>());
      expect(MapperContainer.globals.fromMap<b.A>({}), isA<b.A>());
      expect(MapperContainer.globals.fromMap<c.A>({'a': 'a', 'd': false}),
          isA<c.A>());
    });
  });
}
