import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/type.dart';

import '../../utils.dart';

abstract class MapperParamElement {
  String get name;

  DartType get type;

  String get superName => name;

  bool get isCovariant => false;

  bool get isOptional => false;

  FormalParameterElement? get parameter => null;

  Future<String?> getHook();

  PropertyInducingElement2? get accessor => null;

  String? get key => annotation?.read('key')?.toStringValue();

  DartObject? get annotation;
}
