import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';

import '../../utils.dart';
import '../mapper_element.dart';

class TargetRecordMapperElement extends MapperElement<TypeAliasElement> {
  TargetRecordMapperElement(super.parent, super.element, super.options);

  @override
  late final String className = element.name;

  @override
  DartObject? getAnnotation() =>
      recordChecker.firstAnnotationOf(annotatedElement);
}
