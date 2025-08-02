import 'package:analyzer/dart/element/element2.dart';

import '../../builder_options.dart';
import '../../mapper_group.dart';
import 'alias_record_mapper_element.dart';

class DependentRecordMapperElement extends AliasRecordMapperElement {
  DependentRecordMapperElement(
    super.parent,
    super.element,
    super.options,
    super.annotation,
  );

  static Future<DependentRecordMapperElement> from(
    MapperElementGroup parent,
    TypeAliasElement2 element,
    MappableOptions options,
  ) async {
    var annotation = await RecordMapperAnnotation.from(element);
    return DependentRecordMapperElement(parent, element, options, annotation);
  }
}
