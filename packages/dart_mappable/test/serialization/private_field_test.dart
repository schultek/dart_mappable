import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'private_field_test.mapper.dart';

@MappableClass(caseStyle: CaseStyle.pascalCase)
class PascalModel with PascalModelMappable {
  @MappableField()
  final String _name = 'name';

  PascalModel();
}

@MappableClass(caseStyle: CaseStyle.camelCase)
class CamelModel with CamelModelMappable {
  @MappableField()
  final String _name = 'name';

  CamelModel();
}

void main() {
  group('private field case style', () {
    test('pascalCase drops the leading underscore', () {
      expect(PascalModel().toMap(), equals({'Name': 'name'}));
    });

    test('camelCase drops the leading underscore', () {
      expect(CamelModel().toMap(), equals({'name': 'name'}));
    });
  });
}
