import 'package:analyzer/dart/element/element2.dart';

import '../mapper_element.dart';

abstract class EnumMapperElement extends MapperElement<EnumElement2> {
  EnumMapperElement(
    super.parent,
    super.element,
    super.options,
    super.annotation,
  );

  @override
  late final String className = element.name3 ?? '';
}
