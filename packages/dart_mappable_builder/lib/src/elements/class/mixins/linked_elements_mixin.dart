import 'package:analyzer/dart/element/type.dart';

import '../../record/target_record_mapper_element.dart';
import '../class_mapper_element.dart';
import '../none_class_mapper_element.dart';

mixin LinkedElementsMixin on ClassMapperElement {
  late List<String> linkedElements = () {
    var linked = <String>{};

    for (var target in subElements) {
      if (target is! NoneClassMapperElement) {
        var prefix = parent.prefixOfElement(target.annotatedElement);
        linked.add('$prefix${target.mapperName}');
      }
    }

    void checkType(DartType t) {
      var e = t.element;
      var m = parent.getMapperForElement(e);
      if (m != null && m is! NoneClassMapperElement) {
        linked.add(
            '${parent.prefixOfElement(m.annotatedElement)}${m.mapperName}');
      }

      if (t is ParameterizedType) {
        for (var arg in t.typeArguments) {
          checkType(arg);
        }
      }

      r:
      if (t is RecordType) {
        if (t.alias != null) {
          var m = parent.getMapperForElement(t.alias!.element);
          if (m != null && m is TargetRecordMapperElement) {
            linked.add(
                '${parent.prefixOfElement(m.annotatedElement)}${m.mapperName}');
            break r;
          }
        }
        var e = parent.records.get(t);
        if (e != null) {
          linked.add(e.mapperName);
        }
        for (var f in [...t.positionalFields, ...t.namedFields]) {
          checkType(f.type);
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
          linked.add(
              '${parent.prefixOfElement(m.annotatedElement)}${m.mapperName}');
        }
      }
    }

    return linked.toList();
  }();
}
