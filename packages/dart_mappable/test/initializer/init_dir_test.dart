@MappableLib(generateInitializerForScope: InitializerScope.directory)
library;

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

import '../copy_with/copy_with_test.dart' as c;
import '../utils.dart';
import 'init_dir_test.init.dart';
import 'init_lib_test.dart' as a;
import 'models/model.dart' as b;

void main() {
  group('combined container', () {
    test('links all mappers in the directory', () {
      initializeMappers();

      expect(MapperContainer.globals.fromMap<a.A>({}), isA<a.A>());
      expect(MapperContainer.globals.fromMap<a.B>({}), isA<a.B>());
      expect(MapperContainer.globals.fromMap<b.A>({}), isA<b.A>());
      expect(
        () => MapperContainer.globals.fromMap<c.Person>({}),
        throwsMapperException(MapperException.chain(MapperMethod.decode,
            '(Person)', MapperException.unknownType(c.Person))),
      );
    });
  });
}
