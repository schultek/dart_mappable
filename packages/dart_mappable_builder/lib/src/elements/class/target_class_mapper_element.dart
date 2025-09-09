import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../builder_options.dart';
import '../../mapper_group.dart';
import '../../utils.dart';
import '../constructor/constructor_mapper_element.dart';
import '../mapper_element.dart';
import 'class_mapper_element.dart';
import 'mixins/linked_elements_mixin.dart';

/// Element interface for an annotated class in the target library of [parent].
class TargetClassMapperElement extends ClassMapperElement
    with LinkedElementsMixin {
  TargetClassMapperElement(
    super.parent,
    super.element,
    super.options,
    super.annotation,
    super.constructor,
  );

  static Future<TargetClassMapperElement> from(
    MapperElementGroup parent,
    ClassElement element,
    MappableOptions options,
  ) async {
    var constructor = await ConstructorMapperElement.fromClass(element);
    var annotation = await MapperAnnotation.from<MappableClass>(element);

    return TargetClassMapperElement(
      parent,
      element,
      options,
      annotation,
      constructor,
    );
  }

  late final String prefixedDecodingClassName = prefixedClassName;

  late final String? customMappers =
      annotation.getPropertyNode('includeCustomMappers')?.toSource();

  late final List<(String, List<String>)> customTypes = () {
    var types = <(String, List<String>)>[];

    void addMissingType(DartType type) {
      if (type is InterfaceType) {
        var e = type.element;
        var m = parent.getMapperForElement(e);
        if (m == null) {
          types.add((
            e.name ?? '',
            e.typeParameters.map((p) => p.name ?? '').toList(),
          ));
        }

        for (var arg in type.typeArguments) {
          addMissingType(arg);
        }
      }
    }

    for (var param in element.typeParameters) {
      if (param.bound != null) {
        addMissingType(param.bound!);
      }
    }

    return types;
  }();

  late final bool shallowEncoding =
      annotation.value?.read('shallowEncoding')?.toBoolValue() ?? false;

  late final bool? includeTypeId =
      annotation.value?.read('includeTypeId')?.toBoolValue();
}
