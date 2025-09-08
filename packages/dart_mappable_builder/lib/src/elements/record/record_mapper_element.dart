import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';

import '../../utils.dart';
import '../mapper_element.dart';

abstract class RecordMapperElement<T extends Element2>
    extends InterfaceMapperElement<T> {
  RecordMapperElement(
    super.parent,
    super.element,
    super.options,
    super.annotation,
  );

  RecordType get type;

  String get typeParams;

  bool get needsTypeDef;

  List<String>? get inheritedTypeArgs => null;

  late String genericRecordDeclaration = () {
    var t = type.positionalFields
        .mapIndexed((i, f) => genericArgAt(i))
        .join(', ');

    if (type.namedFields.isNotEmpty) {
      var i = type.positionalFields.length;
      if (i != 0) {
        t += ', ';
      }
      t +=
          '{${type.namedFields.mapIndexed((j, e) => '${genericArgAt(i + j)} ${e.name}').join(', ')}}';
    }

    t = '($t)';

    return t;
  }();

  late String genericTypeParamsDeclaration = () {
    var l = type.positionalFields.length + type.namedFields.length;
    return l == 0 ? '' : '<${List.generate(l, genericArgAt).join(', ')}>';
  }();

  String genericArgAt(int index) {
    return String.fromCharCode('A'.codeUnitAt(0) + index);
  }

  late final String? hookForRecord = () {
    var hook = annotation.value?.read('hook');
    if (hook != null && !hook.isNull) {
      var node = annotation.getPropertyNode('hook');
      if (node != null) {
        var hook = node.toSource();
        if (node is InstanceCreationExpression) {
          hook = 'const $hook';
        }
        return hook;
      }
    }
    return null;
  }();
}
