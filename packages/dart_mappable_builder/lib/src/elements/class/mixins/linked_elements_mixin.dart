import 'package:analyzer/dart/element/type.dart';

import '../../mapper_element.dart';
import '../class_mapper_element.dart';
import '../none_class_mapper_element.dart';

mixin LinkedElementsMixin on ClassMapperElement {
  late Map<MapperElement, String> linkedElements = () {
    var linked = <MapperElement, String>{};

    for (var target in subElements) {
      if (target is! NoneClassMapperElement) {
        var prefix = parent.prefixOfElement(target.annotatedElement);
        linked[target] = '$prefix${target.mapperName}';
      }
    }

    void checkType(DartType t) {
      var e = t.element;
      var m = parent.getMapperForElement(e);
      if (m != null && m is! NoneClassMapperElement) {
        linked[m] =
            '${parent.prefixOfElement(m.annotatedElement)}${m.mapperName}';
      }

      if (t is ParameterizedType) {
        for (var arg in t.typeArguments) {
          checkType(arg);
        }
      }
    }

    for (var param in params) {
      checkType(param.parameter.type);
    }

    for (var param in element.typeParameters) {
      if (param.bound != null) {
        var m = parent.getMapperForElement(param.bound!.element);
        if (m is ClassMapperElement && m is! NoneClassMapperElement) {
          linked[m] =
              '${parent.prefixOfElement(m.annotatedElement)}${m.mapperName}';
        }
      }
    }

    return linked;
  }();
}
