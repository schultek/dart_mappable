import 'class_mapper_element.dart';

/// Element interface for an un-annotated class.
class NoneClassMapperElement extends ClassMapperElement {
  NoneClassMapperElement(super.parent, super.element, super.options);

  @override
  bool shouldGenerate(int method) {
    return false;
  }
}
