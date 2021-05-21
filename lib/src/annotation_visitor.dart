import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';

String? getAnnotationCode(
    Element annotatedElement, Type annotationType, String property) {
  var node = annotatedElement.session!
      .getParsedLibraryByElement(annotatedElement.library!)
      .getElementDeclaration(annotatedElement)!
      .node;

  NodeList<Annotation> annotations;

  if (node is VariableDeclaration) {
    var parent = node.parent?.parent;
    if (parent is FieldDeclaration) {
      annotations = parent.metadata;
    } else {
      return null;
    }
  } else if (node is ClassDeclaration) {
    annotations = node.metadata;
  } else {
    return null;
  }

  for (var annotation in annotations) {
    if (annotation.name.name == annotationType.toString()) {
      var props = annotation.arguments!.arguments
          .whereType<NamedExpression>()
          .where((e) => e.name.label.name == property);

      if (props.isNotEmpty) {
        return props.first.expression.toSource();
      }
    }
  }
}
