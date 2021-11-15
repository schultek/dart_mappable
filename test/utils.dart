import 'package:dart_mappable/dart_mappable.dart';
import 'package:test/test.dart';

final throwsMapperException = throwsA(const TypeMatcher<MapperException>());

Type type<T>() => T;
