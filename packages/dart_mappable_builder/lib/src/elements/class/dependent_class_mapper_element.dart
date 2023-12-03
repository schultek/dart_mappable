import 'package:analyzer/dart/element/element.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../builder_options.dart';
import '../../mapper_group.dart';
import '../constructor/constructor_mapper_element.dart';
import '../mapper_element.dart';
import 'class_mapper_element.dart';

/// Element interface for an annotated class that is defined in another
/// library than [parent].
class DependentClassMapperElement extends ClassMapperElement {
  DependentClassMapperElement._(super.parent, super.element, super.options,
      super.annotation, super.constructor);

  static Future<DependentClassMapperElement> from(MapperElementGroup parent,
      ClassElement element, MappableOptions options) async {
    var constructor = await ConstructorMapperElement.fromClass(element);
    var annotation = await MapperAnnotation.from<MappableClass>(element);

    return DependentClassMapperElement._(
        parent, element, options, annotation, constructor);
  }
}
