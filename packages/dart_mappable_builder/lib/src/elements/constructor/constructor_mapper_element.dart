import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element2.dart';

import '../../utils.dart';

class ConstructorMapperElement {
  const ConstructorMapperElement(this.element, this.node);

  final ConstructorElement2? element;
  final AstNode? node;

  static Future<ConstructorMapperElement> fromClass(
      ClassElement2 element) async {
    var constructor = getConstructorFor(element);
    return ConstructorMapperElement.from(constructor);
  }

  static Future<ConstructorMapperElement> from(
      ConstructorElement2? constructor) async {
    var node = await constructor?.getResolvedNode();
    return ConstructorMapperElement(constructor, node);
  }
}

ConstructorElement2? getConstructorFor(ClassElement2 element) {
  var constructors = element.constructors2.where((c) => !c.isPrivate);
  return constructors.where(constructorChecker.hasAnnotationOf).firstOrNull ??
      constructors.where((c) => !classChecker.hasAnnotationOf(c)).firstOrNull;
}
