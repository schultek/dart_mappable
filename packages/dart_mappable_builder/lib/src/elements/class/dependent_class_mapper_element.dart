import 'class_mapper_element.dart';

/// Element interface for an annotated class that is defined in another
/// library than [parent].
class DependentClassMapperElement extends ClassMapperElement {
  DependentClassMapperElement(super.parent, super.element, super.options);
}
