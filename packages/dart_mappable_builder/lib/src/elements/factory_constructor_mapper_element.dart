import 'package:analyzer/dart/element/element.dart';

import '../builder_options.dart';
import '../mapper_group.dart';
import 'target_class_mapper_element.dart';

class FactoryConstructorMapperElement extends TargetClassMapperElement {
  ConstructorElement factoryConstructor;

  FactoryConstructorMapperElement(MapperElementGroup parent,
      this.factoryConstructor, MappableOptions options)
      : super(
          parent,
          factoryConstructor.redirectedConstructor!.returnType.element
              as ClassElement,
          options,
        );

  @override
  Element get annotatedElement => factoryConstructor;

  @override
  ConstructorElement? get constructor =>
      factoryConstructor.redirectedConstructor!;
}
