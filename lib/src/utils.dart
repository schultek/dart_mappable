import 'dart:collection';

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

import 'core/annotations.dart';
import 'core/mappers.dart';

const enumChecker = TypeChecker.fromRuntime(MappableEnum);
const constructorChecker = TypeChecker.fromRuntime(MappableConstructor);
const classChecker = TypeChecker.fromRuntime(MappableClass);
const fieldChecker = TypeChecker.fromRuntime(MappableField);
const customMapperChecker = TypeChecker.fromRuntime(CustomMapper);
const mapperChecker = TypeChecker.fromRuntime(BaseMapper);

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

class UnusedPropertiesMap with MapMixin<String, dynamic> {
  Map<String, dynamic> wrapped;
  Map<String, dynamic> unused;

  String key;

  UnusedPropertiesMap.of(this.wrapped, {required this.key})
      : unused = {...wrapped};

  @override
  dynamic operator [](Object? key) {
    if (key == this.key) {
      return unused;
    } else {
      unused.remove(key);
      return wrapped[key];
    }
  }

  @override
  void operator []=(String key, dynamic value) {
    unused[key] = value;
    wrapped[key] = value;
  }

  @override
  void clear() {
    unused.clear();
    wrapped.clear();
  }

  @override
  Iterable<String> get keys => wrapped.keys;

  @override
  dynamic remove(Object? key) {
    unused.remove(key);
    wrapped.remove(key);
  }
}
