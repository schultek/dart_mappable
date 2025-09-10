import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import '../../../mapper_group.dart';
import '../../record/target_record_mapper_element.dart';
import '../class_mapper_element.dart';

mixin LinkedElementsMixin on ClassMapperElement {
  late List<String> linkedElements = () {
    var linked = <String>{};

    for (var target in subElements) {
      var prefix = parent.prefixOfElement(target.annotation.element);
      linked.add('$prefix${target.mapperName}');
    }

    linked.addAll(
      findLinkedElements(
        params.map((p) => p.parameter.type),
        element.typeParameters,
        parent,
      ),
    );

    return linked.toList();
  }();
}

List<String> findLinkedElements(
  Iterable<DartType> types,
  List<TypeParameterElement> typeParams,
  MapperElementGroup parent,
) {
  var linked = <String>{};

  void checkType(DartType t) {
    var e = t.element;
    var m = parent.getMapperForElement(e);
    if (m != null) {
      linked.add(
        '${parent.prefixOfElement(m.annotation.element)}${m.mapperName}',
      );
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
            '${parent.prefixOfElement(m.annotation.element)}${m.mapperName}',
          );
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

  for (var type in types) {
    checkType(type);
  }

  for (var param in typeParams) {
    if (param.bound != null) {
      var m = parent.getMapperForElement(param.bound!.element);
      if (m is ClassMapperElement) {
        linked.add(
          '${parent.prefixOfElement(m.annotation.element)}${m.mapperName}',
        );
      }
    }
  }

  return linked.toList();
}
