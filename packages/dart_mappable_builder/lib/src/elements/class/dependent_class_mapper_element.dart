import 'class_mapper_element.dart';
import 'linked_elements_mixin.dart';

class DependentClassMapperElement extends ClassMapperElement
    with LinkedElementsMixin {
  DependentClassMapperElement(super.parent, super.element, super.options);
}
