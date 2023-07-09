import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';

import '../../utils.dart';
import '../mapper_element.dart';

abstract class EnumMapperElement extends MapperElement<EnumElement> {
  EnumMapperElement(super.parent, super.element, super.options);

  @override
  late final String className = element.name;

  @override
  DartObject? getAnnotation() =>
      enumChecker.firstAnnotationOf(annotatedElement);
}
