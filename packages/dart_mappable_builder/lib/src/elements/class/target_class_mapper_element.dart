import 'package:analyzer/dart/element/type.dart';

import '../../utils.dart';
import 'class_mapper_element.dart';
import 'linked_elements_mixin.dart';
import 'none_class_mapper_element.dart';

class TargetClassMapperElement extends ClassMapperElement
    with LinkedElementsMixin {
  TargetClassMapperElement(super.parent, super.element, super.options);

  late String prefixedDecodingClassName = prefixedClassName;

  late List<DartType> customMappers = () {
    var mappers =
        annotation?.getField('includeCustomMappers')?.toTypeList() ?? [];
    for (var mapper in mappers) {
      var mapperIndex = mapper is InterfaceType
          ? mapper.allSupertypes
              .indexWhere((t) => mapperChecker.isExactlyType(t))
          : -1;
      if (mapperIndex == -1) {
        throw UnsupportedError(
            'Classes supplied to invludeCustomMappers must extend the MapperBase class');
      }
    }
    return mappers;
  }();

  late List<String> typesConfigs = () {
    var types = <String>[];

    for (var param in element.typeParameters) {
      if (param.bound != null) {
        var e = param.bound!.element;
        var m = parent.getMapperForElement(e);
        if (e != null && (m == null || m is NoneClassMapperElement)) {
          types.add("'${e.name}': (f) => f<${e.name}>()");
        }
      }
    }

    return types;
  }();
}
