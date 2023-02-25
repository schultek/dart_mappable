import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:source_gen/source_gen.dart';

export 'package:analyzer/src/dart/resolver/scope.dart' show Namespace;

const enumChecker = TypeChecker.fromRuntime(MappableEnum);
const valueChecker = TypeChecker.fromRuntime(MappableValue);
const constructorChecker = TypeChecker.fromRuntime(MappableConstructor);
const classChecker = TypeChecker.fromRuntime(MappableClass);
const fieldChecker = TypeChecker.fromRuntime(MappableField);
const libChecker = TypeChecker.fromRuntime(MappableLib);
const mapperChecker = TypeChecker.fromRuntime(MapperBase);

late Resolver nodeResolver;

extension GetNode on Element {
  Future<AstNode?> getNode() {
    return nodeResolver
        .astNodeFor(this, resolve: false)
        .catchError((_) => null);
  }

  Future<AstNode?> getResolvedNode() async {
    return nodeResolver.astNodeFor(this, resolve: true).catchError((_) => null);
  }
}

AstNode? getAnnotationProperty(
    AstNode? node, Type annotationType, dynamic property) {
  if (node == null) {
    return null;
  }

  NodeList<Annotation>? annotations;

  if (node is VariableDeclaration) {
    var parent = node.parent?.parent;
    if (parent is FieldDeclaration) {
      annotations = parent.metadata;
    }
  } else if (node is FormalParameter) {
    annotations = node.metadata;
  } else if (node is Declaration) {
    annotations = node.metadata;
  }

  if (annotations == null) {
    print('Unknown node type: ${node.runtimeType} $node');
    return null;
  }

  for (var annotation in annotations) {
    if (annotation.name.name == annotationType.toString()) {
      for (var i = 0; i < annotation.arguments!.arguments.length; i++) {
        var arg = annotation.arguments!.arguments[i];
        if (arg is NamedExpression && property is String) {
          if (arg.name.label.name == property) {
            return arg.expression;
          }
        } else if (arg is Literal && property is int) {
          if (i == property) {
            return arg;
          }
        }
      }
    }
  }

  return null;
}

Future<AstNode?> getAnnotationNode(
    Element annotatedElement, Type annotationType, dynamic property) async {
  var node = await annotatedElement.getNode();
  return getAnnotationProperty(node, annotationType, property);
}

Future<AstNode?> getResolvedAnnotationNode(
    Element annotatedElement, Type annotationType, dynamic property) async {
  var node = await annotatedElement.getResolvedNode();
  return getAnnotationProperty(node, annotationType, property);
}

class Prefix {
  int offset;
  int delta;
  int prefix;

  Prefix(this.offset, this.delta, this.prefix);

  @override
  String toString() {
    return 'Prefix{offset: $offset, delta: $delta, prefix: $prefix}';
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

DartObject? fieldAnnotation(ParameterElement param) {
  return fieldChecker.firstAnnotationOf(param) ??
      (param is FieldFormalParameterElement && param.field != null
          ? fieldChecker.firstAnnotationOf(param.field!)
          : null);
}

CaseStyle? caseStyleFromAnnotation(DartObject? obj) {
  return obj != null && !obj.isNull
      ? CaseStyle(
          head: textTransformFromAnnotation(obj.getField('head')!),
          tail: textTransformFromAnnotation(obj.getField('tail')!),
          separator: obj.getField('separator')!.toStringValue() ?? '',
        )
      : null;
}

TextTransform? textTransformFromAnnotation(DartObject obj) {
  var index = obj.getField('index')?.toIntValue();
  return index != null ? TextTransform.values.skip(index).firstOrNull : null;
}

extension NullableType on DartType {
  bool get isNullable => nullabilitySuffix == NullabilitySuffix.question;
}

extension TypeList on DartObject {
  List<DartType>? toTypeList() =>
      toListValue()?.map((o) => o.toTypeValue()).whereType<DartType>().toList();
}
