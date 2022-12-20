import 'package:dart_mappable/dart_mappable.dart';

part 'otherlib.mapper.dart';

@MappableClass()
class A with AMappable {
  final B b;

  const A({this.b = const B(c: C(def))});
}

@MappableClass()
class B with BMappable {
  final C c;

  const B({required this.c});
}

@MappableClass()
class C with CMappable {
  final String d;

  const C(this.d);
}

const def = 'default';
