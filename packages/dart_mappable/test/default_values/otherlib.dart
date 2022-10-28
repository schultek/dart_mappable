import 'package:dart_mappable/dart_mappable.dart';

import 'default_values_test.mapper.g.dart';

@MappableClass()
class A with A1Mappable {
  final B b;

  const A({this.b = const B(c: C(def))});
}

@MappableClass()
class B with B1Mappable {
  final C c;

  const B({required this.c});
}

@MappableClass()
class C with C1Mappable {
  final String d;

  const C(this.d);
}

const def = 'default';
