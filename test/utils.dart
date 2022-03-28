import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

Matcher throwsMapperException(MapperException e) {
  return throwsA(isA<MapperException>()
      .having((e) => e.message, 'message', equals(e.message)));
}

Type type<T>() => T;
