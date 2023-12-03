import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../utils.dart';

abstract class MapperFieldElement {
  bool get needsGetter;

  String get staticGetterType;

  String get name;

  bool get needsArg;

  String get staticArgType;

  String get argType;

  late String getter = needsGetter ? '_\$$name' : 'null';

  String get key;

  String get mode;

  String get opt;

  Future<String> get def;

  String get arg;

  Future<String> get hook;
}

Future<String?> hookFor(Element? element) async {
  if (element == null) {
    return null;
  }
  if (fieldChecker.hasAnnotationOf(element)) {
    var node = await getResolvedAnnotationNode(element, MappableField, 'hook');
    if (node != null) {
      return node.toSource();
    }
  }
  return null;
}

class IsGenericTypeVisitor extends UnifyingTypeVisitor<bool> {
  @override
  bool visitDartType(DartType type) {
    return false;
  }

  @override
  bool visitTypeParameterType(TypeParameterType type) {
    return true;
  }

  @override
  bool visitInterfaceType(InterfaceType type) {
    return type.typeArguments.any((t) => t.accept(this));
  }

  @override
  bool visitRecordType(RecordType type) {
    return type.positionalFields.any((f) => f.type.accept(this)) ||
        type.namedFields.any((f) => f.type.accept(this));
  }
}
