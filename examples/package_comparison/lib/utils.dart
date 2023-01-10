import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

Matcher throwsMapperException(String message) {
  return throwsA(isA<MapperException>()
      .having((e) => e.message, 'message', equals(message)));
}
