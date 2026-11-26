import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:dart_mappable_builder/src/builders/mappable_builder.dart';
import 'package:test/test.dart';

Future<String> generateMapper(String modelClass) async {
  final reader = TestReaderWriter(rootPackage: 'models');
  await reader.testing.loadIsolateSources();
  await testBuilder(MappableBuilder(BuilderOptions({})), {
    'models|lib/model.dart': '''
import 'package:dart_mappable/dart_mappable.dart';

part 'model.mapper.dart';

$modelClass
''',
  }, readerWriter: reader);
  return reader.testing.readString(
    AssetId(
      'models',
      '.dart_tool/build/generated/models/lib/model.mapper.dart',
    ),
  );
}

void main() {
  group('case style with private fields', () {
    test('pascalCase uses the name without the underscore', () async {
      var output = await generateMapper('''
@MappableClass(caseStyle: CaseStyle.pascalCase)
class Model with ModelMappable {
  @MappableField()
  final String _name = 'name';

  Model();
}
''');

      expect(output, contains("key: r'Name'"));
    });

    test('camelCase uses the name without the underscore', () async {
      var output = await generateMapper('''
@MappableClass(caseStyle: CaseStyle.camelCase)
class Model with ModelMappable {
  @MappableField()
  final String _name = 'name';

  Model();
}
''');

      expect(output, contains("key: r'name'"));
    });
  });
}
