import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart';

import '../core/annotations.dart';
import '../core/case_style.dart';
import '../core/mappers.dart';

const enumChecker = TypeChecker.fromRuntime(MappableEnum);
const constructorChecker = TypeChecker.fromRuntime(MappableConstructor);
const classChecker = TypeChecker.fromRuntime(MappableClass);
const fieldChecker = TypeChecker.fromRuntime(MappableField);
const customMapperChecker = TypeChecker.fromRuntime(CustomMapper);
const mapperChecker = TypeChecker.fromRuntime(BaseMapper);

extension GetNode on Element {
  AstNode? getNode() {
    return (session?.getParsedLibraryByElement2(library!)
            as ParsedLibraryResult?)
        ?.getElementDeclaration(this)
        ?.node;
  }
}

String? getAnnotationCode(
    Element annotatedElement, Type annotationType, String property) {
  var node = annotatedElement.getNode();

  NodeList<Annotation> annotations;

  if (node is VariableDeclaration) {
    var parent = node.parent?.parent;
    if (parent is FieldDeclaration) {
      annotations = parent.metadata;
    } else {
      return null;
    }
  } else if (node is Declaration) {
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
    yield* cu.classes;
  }
}

extension OptIter<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}

CaseStyle? caseStyleFromAnnotation(DartObject obj) {
  return CaseStyle(
    head: textTransformFromAnnotation(obj.getField('head')!),
    tail: textTransformFromAnnotation(obj.getField('tail')!),
    separator: obj.getField('separator')!.toStringValue() ?? '',
  );
}

TextTransform? textTransformFromAnnotation(DartObject obj) {
  var index = obj.getField('index')?.toIntValue();
  return index != null ? TextTransform.values.skip(index).firstOrNull : null;
}

extension NullableType on DartType {
  bool get isNullable => nullabilitySuffix == NullabilitySuffix.question;
}
