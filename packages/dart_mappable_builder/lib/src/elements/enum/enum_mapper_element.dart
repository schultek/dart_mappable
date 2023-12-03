import 'package:analyzer/dart/element/element.dart';

import '../mapper_element.dart';

abstract class EnumMapperElement extends MapperElement<EnumElement> {
  EnumMapperElement(
      super.parent, super.element, super.options, super.annotation);

  @override
  late final String className = element.name;
}
