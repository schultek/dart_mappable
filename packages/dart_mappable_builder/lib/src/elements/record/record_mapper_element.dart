import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';

import '../mapper_element.dart';

abstract class RecordMapperElement<T extends Element>
    extends InterfaceMapperElement<T> {
  RecordMapperElement(
      super.parent, super.element, super.options, super.annotation);

  RecordType get type;

  String get typeParams;

  bool get needsTypeDef;

  List<String>? get inheritedTypeArgs => null;

  late String genericRecordDeclaration = () {
    var t =
        type.positionalFields.mapIndexed((i, f) => genericArgAt(i)).join(', ');

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
}
