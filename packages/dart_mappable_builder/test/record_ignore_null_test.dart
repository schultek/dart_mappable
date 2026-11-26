import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:dart_mappable_builder/src/builders/mappable_builder.dart';
import 'package:test/test.dart';

Future<String> generateMapper(String source, {BuilderOptions? options}) async {
  final reader = TestReaderWriter(rootPackage: 'models');
  await reader.testing.loadIsolateSources();
  await testBuilder(MappableBuilder(options ?? BuilderOptions({})), {
    'models|lib/model.dart': source,
  }, readerWriter: reader);
  return reader.testing.readString(
    AssetId(
      'models',
      '.dart_tool/build/generated/models/lib/model.mapper.dart',
    ),
  );
}

void main() {
  group('record ignoreNull', () {
    test('annotation adds the ignoreNull override', () async {
      var output = await generateMapper('''
import 'package:dart_mappable/dart_mappable.dart';

part 'model.mapper.dart';

@MappableRecord(ignoreNull: true)
typedef Model = ({String a, int? b});
''');

      expect(output, contains('final bool ignoreNull = true;'));
    });

    test('global option adds the ignoreNull override', () async {
      var output = await generateMapper('''
import 'package:dart_mappable/dart_mappable.dart';

part 'model.mapper.dart';

@MappableRecord()
typedef Model = ({String a, int? b});
''', options: BuilderOptions({'ignoreNull': true}));

      expect(output, contains('final bool ignoreNull = true;'));
    });
  });
}
