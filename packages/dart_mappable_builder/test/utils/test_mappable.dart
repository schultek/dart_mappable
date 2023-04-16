import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:dart_mappable_builder/src/builders/mappable_builder.dart';
import 'package:test/test.dart';

import 'temp_asset_writer.dart';

Map<String, String> singleModel(String modelClass) => {
      'model': '''
  import 'package:dart_mappable/dart_mappable.dart';
     
  part 'model.mapper.dart';
  
  $modelClass
'''
    };

Future<void> testMappable(
  Map<String, String> inputs, {
  Map<String, Object>? expect,
  String? run,
}) async {
  var writer = TempAssetWriter();
  try {
    await testBuilder(
      MappableBuilder(BuilderOptions({})),
      inputs.map((key, value) => MapEntry('models|lib/$key.dart', value)),
      reader: await PackageAssetReader.currentIsolate(),
      writer: writer,
    );
    for (var id in inputs.keys) {
      writer.writeAsString(AssetId.parse('models|lib/$id.dart'), inputs[id]!);
    }
    if (run != null) {
      await writer.run(run);
    }
    if (expect != null) {
      await expectStatements(writer, expect);
    }
  } finally {
    writer.dispose();
  }
}

Future<void> expectStatements(
    TempAssetWriter writer, Map<String, Object> statements) async {
  var list = statements.entries.toList();

  var i = 0;
  await for (var result in writer.execAll(list.map((e) => e.key).toList())) {
    expect(result, list[i].value);
    i++;
  }
}
