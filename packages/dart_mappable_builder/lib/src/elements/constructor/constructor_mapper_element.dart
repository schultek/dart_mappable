import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';

import '../../utils.dart';

class ConstructorMapperElement {
  const ConstructorMapperElement(this.element, this.node);

  final ConstructorElement? element;
  final AstNode? node;

  static Future<ConstructorMapperElement> fromClass(
      ClassElement element) async {
    var constructor = getConstructorFor(element);
    return ConstructorMapperElement.from(constructor);
  }

  static Future<ConstructorMapperElement> from(
      ConstructorElement? constructor) async {
    var node = await constructor?.getResolvedNode();
    return ConstructorMapperElement(constructor, node);
  }
}

ConstructorElement? getConstructorFor(ClassElement element) {
  var constructors = element.constructors.where((c) => !c.isPrivate);
  return constructors.where(constructorChecker.hasAnnotationOf).firstOrNull ??
      constructors.where((c) => !classChecker.hasAnnotationOf(c)).firstOrNull;
}
