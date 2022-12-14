import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:source_gen/source_gen.dart';

import 'imports_builder.dart';

const enumChecker = TypeChecker.fromRuntime(MappableEnum);
const valueChecker = TypeChecker.fromRuntime(MappableValue);
const constructorChecker = TypeChecker.fromRuntime(MappableConstructor);
const classChecker = TypeChecker.fromRuntime(MappableClass);
const fieldChecker = TypeChecker.fromRuntime(MappableField);
const libChecker = TypeChecker.fromRuntime(MappableLib);
const customMapperChecker = TypeChecker.fromRuntime(CustomMapper);
const mapperChecker = TypeChecker.fromRuntime(MapperElementBase);

extension GetNode on Element {
  AstNode? getNode() {
    var result = session?.getParsedLibraryByElement(library!);
    if (result is ParsedLibraryResult) {
      return result.getElementDeclaration(this)?.node;
    } else {
      return null;
    }
  }

  Future<AstNode?> getResolvedNode() async {
    var result = await session?.getResolvedLibraryByElement(library!);
    if (result is ResolvedLibraryResult) {
      return result.getElementDeclaration(this)?.node;
    } else {
      return null;
    }
  }
}

AstNode? _getAnnotationNode(
    AstNode? node, Type annotationType, dynamic property) {
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

AstNode? getAnnotationNode(
    Element annotatedElement, Type annotationType, dynamic property) {
  var node = annotatedElement.getNode();
  return _getAnnotationNode(node, annotationType, property);
}

Future<AstNode?> getResolvedAnnotationNode(
    Element annotatedElement, Type annotationType, dynamic property) async {
  var node = await annotatedElement.getResolvedNode();
  return _getAnnotationNode(node, annotationType, property);
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

Future<String> getPrefixedNodeSource(
    AstNode node, ImportsBuilder imports) async {
  var visitor = PrefixVisitor(imports);
  node.accept(visitor);

  var prefixOffsets = visitor.prefixes.entries
      // ignore: unnecessary_cast
      .sortedBy((i) => i.key as num)
      .fold<List<Prefix>>([Prefix(node.offset, 0, 0)],
          (l, i) => [...l, Prefix(i.key, i.key - l.last.offset, i.value)])
      .skip(1)
      .toList();

  var source = '';
  Token? token = node.beginToken;

  while (token != null && token.offset <= node.endToken.offset) {
    if (prefixOffsets.isNotEmpty && prefixOffsets.first.delta <= 0) {
      source += 'p${prefixOffsets.first.prefix}.';
      prefixOffsets.removeAt(0);
    }

    source += token.lexeme;
    prefixOffsets.firstOrNull?.delta -= token.length;

    var next = token.next;
    if (next != null && next.offset > token.end) {
      var delta = next.offset - token.end;
      source += ' ';
      prefixOffsets.firstOrNull?.delta -= delta;
    }
    token = next;
  }

  return source;
}

class PrefixVisitor extends RecursiveAstVisitor {
  final ImportsBuilder imports;
  Map<int, int> prefixes = {};

  PrefixVisitor(this.imports);

  @override
  visitSimpleIdentifier(SimpleIdentifier node) {
    if (node.staticElement is ClassElement) {
      addPrefixFor(node);
    } else if (node.staticElement is PropertyAccessorElement) {
      if ((node.staticElement as PropertyAccessorElement).enclosingElement
          is CompilationUnitElement) {
        addPrefixFor(node);
      }
    }

    return super.visitSimpleIdentifier(node);
  }

  void addPrefixFor(SimpleIdentifier node) {
    var prefix = imports.add(node.staticElement!.librarySource?.uri);
    if (prefix != null) {
      prefixes[node.offset] = prefix;
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
