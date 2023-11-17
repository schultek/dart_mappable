import 'package:build/build.dart';
import 'package:dart_mappable_builder/src/utils.dart';
import 'package:test/test.dart';

import 'utils/test_mappable.dart';

void main() {
  group('simple model', () {
    test('generates correct mapper code', () async {
      await testMappable(
        {
          'model': '''
            import 'package:dart_mappable/dart_mappable.dart';
            
            part 'model.mapper.dart';
            
            @MappableClass()
            class Model with ModelMappable {
              final String a;
              final int b;
              final double? c;
              final bool d;
            
              Model(this.a, {this.b = 18, this.c, required this.d});
            }
          ''',
        },
        expect: {
          "Model('hello', d: true).toMap()":
              equals({'a': 'hello', 'b': 18, 'c': null, 'd': true}),
          "ModelMapper.fromMap({'a': 'hi', 'b': 1, 'd': false}).toMap()":
              equals({'a': 'hi', 'b': 1, 'c': null, 'd': false}),
        },
      );
    });

    test('uriOfPartial', () {
      AssetId input = AssetId('package', 'lib/models/model.dart');
      AssetId output = AssetId('package',
          'lib/models/subfolder1/subfolder2/subfolder3/model.mapper.dart');
      expect(uriOfPartial(input, output), '../../../model.dart');
      expect(uriOfPartial(output, input),
          'subfolder1/subfolder2/subfolder3/model.mapper.dart');

      //add test for default path
      input = AssetId('package', 'lib/model.dart');
      output = AssetId('package', 'lib/model.mapper.dart');
      expect(uriOfPartial(input, output), 'model.dart');
      expect(uriOfPartial(output, input), 'model.mapper.dart');
    });


  });
}
