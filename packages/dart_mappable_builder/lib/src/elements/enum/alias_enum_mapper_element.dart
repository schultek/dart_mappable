import 'package:analyzer/dart/element/element.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../builder_options.dart';
import '../../mapper_group.dart';
import '../mapper_element.dart';
import 'target_enum_mapper_element.dart';

/// Element interface for all annotated enum type aliases.
class AliasEnumMapperElement extends TargetEnumMapperElement {
  AliasEnumMapperElement._(
    super.parent,
    this.alias,
    super.element,
    super.options,
    super.annotation,
    super.valueNodes,
  );

  final TypeAliasElement alias;

  static Future<AliasEnumMapperElement> from(
    MapperElementGroup parent,
    TypeAliasElement alias,
    MappableOptions options,
  ) async {
    var element = alias.aliasedType.element as EnumElement;

    var annotation = await MapperAnnotation.from<MappableEnum>(alias);
    var valueNodes = await TargetEnumMapperElement.getValues(element);

    return AliasEnumMapperElement._(
      parent,
      alias,
      element,
      options,
      annotation,
      valueNodes,
    );
  }

  @override
  late final String uniqueClassName = alias.name ?? '';
}
