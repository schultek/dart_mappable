import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../utils.dart';
import 'class_mapper_element.dart';
import 'mixins/linked_elements_mixin.dart';

/// Element interface for an annotated class in the target library of [parent].
class TargetClassMapperElement extends ClassMapperElement
    with LinkedElementsMixin {
  TargetClassMapperElement(super.parent, super.element, super.options);

  @override
  Future<void> init() async {
    await super.init();
    customMappers = await _getCustomMappers();
  }

  late String prefixedDecodingClassName = prefixedClassName;

  late String? customMappers;

  Future<String?> _getCustomMappers() async {
    var mappers =
        await getAnnotationNode(element, MappableClass, 'includeCustomMappers');
    return mappers?.toSource();
  }

  late List<String> typesConfigs = () {
    var types = <String>[];

    void addMissingType(DartType type) {
      if (type is InterfaceType) {
        var e = type.element;
        var m = parent.getMapperForElement(e);
        if (m == null) {
          types.add(e.name);
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
}
