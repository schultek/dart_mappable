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
  });
}
