import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
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
const mapperChecker = TypeChecker.fromRuntime(BaseMapper);

extension GetNode on Element {
  AstNode? getNode() {
    var result = session?.getParsedLibraryByElement(library!);
    if (result is ParsedLibraryResult) {
      return result.getElementDeclaration(this)?.node;
    } else {
      return null;
    }
  }
}

String? getAnnotationCode(
    Element annotatedElement, Type annotationType, dynamic property) {
  var node = annotatedElement.getNode();

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
            return arg.expression.toSource();
          }
        } else if (arg is Literal && property is int) {
          if (i == property) {
            return arg.toSource();
          }
        }
      }
    }
  }

  return null;
}

Future<String> getPrefixedDefaultValue(
    ParameterElement p, ImportsBuilder imports) async {
  var result = await p.session?.getResolvedLibraryByElement(p.library!);

  if (result is ResolvedLibraryResult) {
    var node = result.getElementDeclaration(p)?.node;

    if (node is DefaultFormalParameter) {
      var visitor = PrefixVisitor(imports);
      node.defaultValue!.accept(visitor);

      var str = node.defaultValue!.toSource();

      for (var e
          in visitor.prefixes.keys.cast<num>().sortedBy((i) => i).reversed) {
        var offset = e - node.defaultValue!.offset as int;

        str = str.substring(0, offset) +
            'p${visitor.prefixes[e]}.' +
            str.substring(offset);
      }

      return str;
    }
  }

  return p.defaultValueCode!;
}

class PrefixVisitor extends RecursiveAstVisitor {
  final ImportsBuilder imports;
  Map<int, int?> prefixes = {};

  PrefixVisitor(this.imports);

  @override
  visitSimpleIdentifier(SimpleIdentifier node) {
    if (node.staticElement is ClassElement) {
      prefixes[node.offset] =
          imports.add(node.staticElement!.librarySource?.uri);
    } else if (node.staticElement is PropertyAccessorElement) {
      if ((node.staticElement as PropertyAccessorElement).enclosingElement
          is CompilationUnitElement) {
        prefixes[node.offset] =
            imports.add(node.staticElement!.librarySource?.uri);
      }
    }

    return super.visitSimpleIdentifier(node);
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
