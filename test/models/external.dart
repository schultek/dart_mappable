import 'dart:collection';

import 'package:dart_mappable/dart_mappable.dart';

class MyPrivateClass {}

@CustomMapper()
class HashMapMapper extends SimpleMapper<HashMap> {
  @override
  HashMap decode(dynamic value) {
    return HashMap();
  }

  @override
  dynamic encode(HashMap self) {
    return 'hash';
  }
}
