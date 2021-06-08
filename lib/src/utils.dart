import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

import 'annotations.dart';

const enumChecker = TypeChecker.fromRuntime(MappableEnum);
const constructorChecker = TypeChecker.fromRuntime(MappableConstructor);
const classChecker = TypeChecker.fromRuntime(MappableClass);
const fieldChecker = TypeChecker.fromRuntime(MappableField);

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

Map<String, T> toMap<T>(dynamic value, T Function(Map m) fn) {
  if (value is Map) {
    return value.map((k, dynamic v) => MapEntry(k as String, fn(v as Map)));
  } else {
    return {};
  }
}

List<T>? toList<T>(dynamic value) {
  if (value is List) {
    return value.map((dynamic v) => v as T).toList();
  } else if (value is T) {
    return [value];
  } else {
    return null;
  }
}

/// All of the declared classes and enums in this library.
Iterable<ClassElement> elementsOf(LibraryElement element) sync* {
  for (var cu in element.units) {
    yield* cu.enums;
    yield* cu.types;
  }
}

class Computed<T> {
  T Function() computation;
  Computed(this.computation);

  bool _didCompute = false;
  T? _value;

  T get value {
    if (!_didCompute) {
      _value = computation();
      _didCompute = true;
    }
    return _value as T;
  }
}
