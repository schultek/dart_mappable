import 'package:analyzer/dart/element/element.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../builder_options.dart';
import '../../mapper_group.dart';
import '../mapper_element.dart';
import 'enum_mapper_element.dart';

class DependentEnumMapperElement extends EnumMapperElement {
  DependentEnumMapperElement._(
      super.parent, super.element, super.options, super.annotation);

  static Future<DependentEnumMapperElement> from(MapperElementGroup parent,
      EnumElement element, MappableOptions options) async {
    var annotation = await MapperAnnotation.from<MappableEnum>(element);

    return DependentEnumMapperElement._(parent, element, options, annotation);
  }
}
