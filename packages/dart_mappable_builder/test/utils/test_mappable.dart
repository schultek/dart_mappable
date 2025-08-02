import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:dart_mappable_builder/src/builders/mappable_builder.dart';

Map<String, String> singleModel(String modelClass) => {
  'model': '''
  import 'package:dart_mappable/dart_mappable.dart';
     
  part 'model.mapper.dart';
  
  $modelClass
''',
};

Future<void> testMappable(
  Map<String, String> inputs, {
  Map<String, String>? outputs,
}) async {
  final reader = TestReaderWriter(rootPackage: 'models');
  await reader.testing.loadIsolateSources();
  await testBuilder(
    MappableBuilder(BuilderOptions({})),
    inputs.map((key, value) => MapEntry('models|lib/$key.dart', value)),
    outputs: outputs?.map(
      (key, value) => MapEntry('models|lib/$key.mapper.dart', value),
    ),
    readerWriter: reader,
  );
}
