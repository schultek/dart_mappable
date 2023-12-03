import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import '../../utils.dart';

abstract class MapperParamElement {
  String get name;

  DartType get type;

  String get superName => name;

  bool get isCovariant => false;

  bool get isOptional => false;

  ParameterElement? get parameter => null;

  Future<String?> getHook();

  PropertyInducingElement? get accessor => null;

  String? get key => annotation?.read('key')?.toStringValue();

  DartObject? get annotation;
}
