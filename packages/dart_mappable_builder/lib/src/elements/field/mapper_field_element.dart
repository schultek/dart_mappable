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

  String get includeFromJson;

  String get includeToJson;

  String get includeIfNull;
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

Future<bool?> includeFromJsonFor(Element? element) async {
  if (element == null) {
    return null;
  }
  if (fieldChecker.hasAnnotationOf(element)) {
    var annotation = fieldChecker.firstAnnotationOf(element);
    if (annotation != null) {
      return annotation.read('includeFromJson')?.toBoolValue();
    }
  }
  return null;
}

Future<bool?> includeToJsonFor(Element? element) async {
  if (element == null) {
    return null;
  }
  if (fieldChecker.hasAnnotationOf(element)) {
    var annotation = fieldChecker.firstAnnotationOf(element);
    if (annotation != null) {
      return annotation.read('includeToJson')?.toBoolValue();
    }
  }
  return null;
}

Future<bool?> includeIfNullFor(Element? element) async {
  if (element == null) {
    return null;
  }
  if (fieldChecker.hasAnnotationOf(element)) {
    var annotation = fieldChecker.firstAnnotationOf(element);
    if (annotation != null) {
      return annotation.read('includeIfNull')?.toBoolValue();
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

  @override
  bool visitFunctionType(FunctionType type) {
    return type.returnType.accept(this) ||
        type.formalParameters.any((p) => p.type.accept(this));
  }
}
