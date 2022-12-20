import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/src/core/hooks/check_types_hook.dart';

import 'polymorphism_test.mapper.g.dart';

@MappableClass(
  hooks: CheckTypesHook({
    B: B.checkType,
    C: C.checkType,
  }, Mapper.fromValue),
)
abstract class A with AMappable {
  A();
}

@MappableClass()
class B extends A with BMappable {
  B();

  static bool checkType(value) {
    return value is Map && value['isB'] == true;
  }
}

@MappableClass()
class C extends A with CMappable {
  C();

  static bool checkType(value) {
    return value is Map && value['isWhat'] == 'C';
  }
}
