import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element2.dart';
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

extension GetNode on Element2 {
  Future<AstNode?> getNode() {
    return nodeResolver.astNodeFor(firstFragment, resolve: false);
  }

  Future<AstNode?> getResolvedNode() async {
    return nodeResolver
        .astNodeFor(firstFragment, resolve: true)
        .catchError((_) => null);
  }
}

Future<ArgumentList?> getAnnotationArguments(
    AstNode? node, Type annotationType) async {
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

  var checker = TypeChecker.fromRuntime(annotationType);
  var annotation = annotations.where((a) {
    var type = a.elementAnnotation?.computeConstantValue()?.type;
    return type != null && checker.isAssignableFromType(type);
  }).firstOrNull;
  var arguments = annotation?.arguments;
  if (arguments != null) {
    return arguments;
  } else {
    return getArgumentsFromElement(annotation?.element2);
  }
}

Future<ArgumentList?> getArgumentsFromElement(Element2? element) async {
  if (element case PropertyAccessorElement2 elem) {
    var node = await elem.variable3!.getResolvedNode();
    if (node is VariableDeclaration) {
      var exp = node.initializer;
      if (exp is InstanceCreationExpression) {
        return exp.argumentList;
      } else if (exp is SimpleIdentifier) {
        return getArgumentsFromElement(exp.element);
      }
    }
  }
  return null;
}

extension ArgumentProperty on ArgumentList {
  AstNode? getArgument(dynamic property) {
    for (var i = 0; i < arguments.length; i++) {
      var arg = arguments[i];
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

Future<AstNode?> getAnnotationProperty(
    AstNode? node, Type annotationType, dynamic property) async {
  var arguments = await getAnnotationArguments(node, annotationType);
  return arguments?.getArgument(property);
}

Future<AstNode?> getAnnotationNode(
    Element2 annotatedElement, Type annotationType, dynamic property) async {
  var node = await annotatedElement.getNode();
  return getAnnotationProperty(node, annotationType, property);
}

Future<AstNode?> getResolvedAnnotationNode(
    Element2 annotatedElement, Type annotationType, dynamic property) async {
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

DartObject? fieldAnnotation(FormalParameterElement param) {
  return fieldChecker.firstAnnotationOf(param) ??
      (param is FieldFormalParameterElement2 && param.field2 != null
          ? fieldChecker.firstAnnotationOf(param.field2!)
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
  bool get isNullable =>
      nullabilitySuffix == NullabilitySuffix.question ||
      (this is TypeParameterType &&
          (this as TypeParameterType).bound.isNullable);
  bool get isNullableOrDynamic =>
      isNullable ||
      this is DynamicType ||
      (this is TypeParameterType &&
          (this as TypeParameterType).bound.isNullableOrDynamic);
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
