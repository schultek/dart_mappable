import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

part 'decode_test.mapper.dart';

@MappableClass()
class Model with ModelMappable {
  final String a;
  final int b;
  final double? c;
  final bool d;

  Model(this.a, {this.b = 18, this.c, required this.d});
}

void main() {
  group('decode', () {
    test('simple model', () async {

          expect(
            ModelMapper.fromMap({'a': 'hi', 'b': 1, 'd': false}),
            equals(Model('hi', b: 1, d: false)),
          );

    });
  });
}
