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
const enumValueChecker = TypeChecker.fromRuntime(MappableValue);
const constructorChecker = TypeChecker.fromRuntime(MappableConstructor);
const classChecker = TypeChecker.fromRuntime(MappableClass);
const fieldChecker = TypeChecker.fromRuntime(MappableField);
const libChecker = TypeChecker.fromRuntime(MappableLib);
const mapperChecker = TypeChecker.fromRuntime(MapperBase);
const recordChecker = TypeChecker.fromRuntime(MappableRecord);

late Resolver nodeResolver;

extension GetNode on Element {
  Future<AstNode?> getNode() {
    return nodeResolver.astNodeFor(this, resolve: false);
    //.catchError((_) => null);
  }

  Future<AstNode?> getResolvedNode() async {
    return nodeResolver.astNodeFor(this, resolve: true).catchError((_) => null);
  }
}

Annotation? getAnnotation(AstNode? node, Type annotationType) {
  if (node == null) {
    return null;
  }

  NodeList<Annotation>? annotations;

  if (node is VariableDeclaration) {
    var parent = node.parent?.parent;
    if (parent is FieldDeclaration) {
      annotations = parent.metadata;
    }
  } else if (node is AnnotatedNode) {
    annotations = node.metadata;
  } else if (node is FormalParameter) {
    annotations = node.metadata;
  } else if (node is RecordTypeAnnotationField) {
    annotations = node.metadata;
  }

  if (annotations == null) {
    print('Unknown node type: ${node.runtimeType} $node');
    return null;
  }

  var type = annotationType.toString();
  return annotations.where((a) => a.name.name == type).firstOrNull;
}

extension AnnotationProperty on Annotation {
  AstNode? getPropertyNode(dynamic property) {
    for (var i = 0; i < arguments!.arguments.length; i++) {
      var arg = arguments!.arguments[i];
      if (arg is NamedExpression && property is String) {
        if (arg.name.label.name == property) {
          return arg.expression;
        }
      } else if (property is int && i == property) {
        return arg;
      }
    }
    return null;
  }
}

AstNode? getAnnotationProperty(
    AstNode? node, Type annotationType, dynamic property) {
  var annotation = getAnnotation(node, annotationType);
  if (annotation != null) {
    for (var i = 0; i < annotation.arguments!.arguments.length; i++) {
      var arg = annotation.arguments!.arguments[i];
      if (arg is NamedExpression && property is String) {
        if (arg.name.label.name == property) {
          return arg.expression;
        }
      } else if (property is int && i == property) {
        return arg;
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

Map<String, T> toMap<T>(dynamic value) {
  if (value is Map) {
    return value.map((k, dynamic v) => MapEntry(k as String, v as T));
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
          head: textTransformFromAnnotation(obj.read('head')),
          tail: textTransformFromAnnotation(obj.read('tail')),
          separator: obj.read('separator')?.toStringValue() ?? '',
        )
      : null;
}

TextTransform? textTransformFromAnnotation(DartObject? obj) {
  var index = obj?.read('index')?.toIntValue();
  return index != null ? TextTransform.values.skip(index).firstOrNull : null;
}

extension NullableType on DartType {
  bool get isNullable => nullabilitySuffix == NullabilitySuffix.question;
}

extension TypeList on DartObject {
  List<DartType>? toTypeList() =>
      toListValue()?.map((o) => o.toTypeValue()).whereType<DartType>().toList();
}

extension ObjectReader on DartObject {
  /// Similar to [DartObject.getField], but traverses super classes.
  ///
  /// Returns `null` if ultimately [field] is never found.
  DartObject? read(String field) {
    if (isNull) {
      return null;
    }
    final result = getField(field);
    if (result == null) {
      return getField('(super)')?.read(field);
    }
    return result;
  }
}

Map<String, List<String>> validatedBuildExtensionsFrom(
  Map? optionsMap,
  Map<String, List<String>> defaultExtensions,
) {
  final extensionsOption = optionsMap?.remove('build_extensions');
  if (extensionsOption == null) {
    // defaultExtensions are provided by the builder author, not the end user.
    // It should be safe to skip validation.
    return defaultExtensions;
  }

  if (extensionsOption is! Map) {
    throw ArgumentError(
      'Configured build_extensions should be a map from inputs to outputs.',
    );
  }

  final result = <String, List<String>>{};

  for (final entry in extensionsOption.entries) {
    final input = entry.key;
    if (input is! String || !input.endsWith('.dart')) {
      throw ArgumentError(
        'Invalid key in build_extensions option: `$input` '
        'should be a string ending with `.dart`',
      );
    }

    final output = (entry.value is List) ? entry.value as List : [entry.value];

    for (var i = 0; i < output.length; i++) {
      final o = output[i];
      if (o is! String || (i == 0 && !o.endsWith('.dart'))) {
        throw ArgumentError(
          'Invalid output extension `${entry.value}`. It should be a string '
          'or a list of strings with the first ending with `.dart`',
        );
      }
    }

    result[input] = output.cast<String>().toList();
  }

  if (result.isEmpty) {
    throw ArgumentError('Configured build_extensions must not be empty.');
  }
  return result;
}
