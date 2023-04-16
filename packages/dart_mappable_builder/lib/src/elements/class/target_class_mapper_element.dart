import 'package:analyzer/dart/ast/ast.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../utils.dart';
import 'class_mapper_element.dart';
import 'mixins/linked_elements_mixin.dart';
import 'none_class_mapper_element.dart';

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

  late List<String> customMappers;

  Future<List<String>> _getCustomMappers() async {
    var mappers =
        await getAnnotationNode(element, MappableClass, 'includeCustomMappers');
    if (mappers is ListLiteral) {
      assert(mappers.elements.every((e) => e is Expression));
      return mappers.elements.map((e) => e.toSource()).toList();
    }
    return <String>[];
  }

  late List<String> typesConfigs = () {
    var types = <String>[];

    for (var param in element.typeParameters) {
      if (param.bound != null) {
        var e = param.bound!.element;
        var m = parent.getMapperForElement(e);
        if (e != null && (m == null || m is NoneClassMapperElement)) {
          types.add(e.name!);
        }
      }
    }

    return types;
  }();
}
