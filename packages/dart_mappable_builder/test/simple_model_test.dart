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

    // Test case for https://github.com/schultek/dart_mappable/issues/207
    test('raw string as key for field', () async {
      await testMappable(
        {
          'model': '''
            import 'package:dart_mappable/dart_mappable.dart';
            
            part 'model.mapper.dart';
            
            @MappableRecord()
            typedef FullName = (@MappableField(key: r'\$firstName') String, String);


            @MappableClass()
            class Rawkeymodel with RawkeymodelMappable {
              final String a;
              final FullName? b;
            
              Rawkeymodel({
                @MappableField(key: r'\$key') required this.a,
                this.b,
              });
            }
          ''',
        },
        expect: {
          "Rawkeymodel(a: 'hello', b: ('Max', 'Mustermann')).toMap()": equals({
            r'$key': 'hello',
            'b': {r'$firstName': 'Max', r'$2': 'Mustermann'}
          }),
          "RawkeymodelMapper.fromMap({r'\$key': 'hi', 'b': ('Max', 'Mustermann')}).toMap()":
              equals({
            r'$key': 'hi',
            'b': {r'$firstName': 'Max', r'$2': 'Mustermann'}
          }),
        },
      );
    });
  });
}
