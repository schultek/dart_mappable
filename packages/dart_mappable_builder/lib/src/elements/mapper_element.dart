import 'dart:async';

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:source_gen/source_gen.dart';

import '../builder_options.dart';
import '../mapper_group.dart';
import '../utils.dart';
import 'field/mapper_field_element.dart';

class MapperAnnotation {
  const MapperAnnotation.empty(this.element)
    : node = null,
      arguments = null,
      value = null;
  const MapperAnnotation(this.element, this.node, this.arguments, this.value);

  final Element element;
  final AstNode? node;
  final ArgumentList? arguments;
  final DartObject? value;

  static Future<MapperAnnotation> from<T>(Element element) async {
    var node = await element.getResolvedNode();
    var arguments = await getAnnotationArguments(node, T);
    var value = TypeChecker.typeNamed(T).firstAnnotationOf(element);
    return MapperAnnotation(element, node, arguments, value);
  }

  AstNode? getPropertyNode(dynamic /* String | int */ property) {
    return arguments?.getArgument(property);
  }
}

abstract class MapperElement<T extends Element> {
  MapperElementGroup parent;
  T element;
  MappableOptions options;
  MapperAnnotation annotation;

  MapperElement(this.parent, this.element, this.options, this.annotation);

  late String uniqueClassName = className;
  String get className;

  late String prefixedClassName = parent.prefixOfElement(element) + className;

  late String mapperName = '${uniqueClassName}Mapper';
}

abstract class InterfaceMapperElement<T extends Element>
    extends MapperElement<T> {
  InterfaceMapperElement(
    super.parent,
    super.element,
    super.options,
    super.annotation,
  );

  late final CaseStyle? caseStyle =
      caseStyleFromAnnotation(annotation.value?.read('caseStyle')) ??
      options.caseStyle;

  String get typeParamsDeclaration;

  List<MapperFieldElement> get fields;

  late final String? hookForElement = () {
    var hook = annotation.value?.read('hook');
    if (hook != null && !hook.isNull) {
      var node = annotation.getPropertyNode('hook');
      if (node != null) {
        var hook = node.toSource();
        if (node is InstanceCreationExpression) {
          hook = 'const $hook';
        }
        return hook;
      }
    }
    return null;
  }();
}
