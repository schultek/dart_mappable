// ignore_for_file: overridden_fields

import 'package:analyzer/dart/element/element.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../builder_options.dart';
import '../../mapper_group.dart';
import '../constructor/constructor_mapper_element.dart';
import '../mapper_element.dart';
import 'target_class_mapper_element.dart';

/// Element interface for all annotated type aliases.
class AliasClassMapperElement extends TargetClassMapperElement {
  AliasClassMapperElement._(super.parent, this.alias, super.element,
      super.options, super.annotation, super.constructor);

  final TypeAliasElement alias;

  static Future<AliasClassMapperElement> from(MapperElementGroup parent,
      TypeAliasElement alias, MappableOptions options) async {
    var element = alias.aliasedType.element as ClassElement;
    var constructor = await ConstructorMapperElement.fromClass(element);
    var annotation = await MapperAnnotation.from<MappableClass>(alias);

    return AliasClassMapperElement._(
        parent, alias, element, options, annotation, constructor);
  }

  @override
  late final String uniqueClassName = alias.name;

  @override
  final bool generateMixin = false;
}
