import 'package:analyzer/dart/element/element.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../builder_options.dart';
import '../../mapper_group.dart';
import '../constructor/constructor_mapper_element.dart';
import '../mapper_element.dart';
import 'target_class_mapper_element.dart';

/// Element interface for an annotated factory constructor in the target
/// library of [parent].
class FactoryConstructorMapperElement extends TargetClassMapperElement {
  ConstructorElement factoryConstructor;

  FactoryConstructorMapperElement._(super.parent, super.element, super.options,
      super.annotation, super.constructor, this.factoryConstructor);

  static Future<FactoryConstructorMapperElement> from(MapperElementGroup parent,
      ConstructorElement factoryConstructor, MappableOptions options) async {
    var constructor = await ConstructorMapperElement.from(
        factoryConstructor.redirectedConstructor!);
    var annotation =
        await MapperAnnotation.from<MappableClass>(factoryConstructor);

    return FactoryConstructorMapperElement._(
        parent,
        factoryConstructor.redirectedConstructor!.returnType.element
            as ClassElement,
        options,
        annotation,
        constructor,
        factoryConstructor);
  }

  @override
  final bool generateMixin = false;
}
