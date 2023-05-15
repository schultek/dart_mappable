import 'dart:async';

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';

import '../builder_options.dart';
import '../mapper_group.dart';
import '../utils.dart';

abstract class MapperElement<T extends Element> {
  MapperElementGroup parent;
  T element;
  MappableOptions options;

  MapperElement(this.parent, this.element, this.options);

  Future<void> init() async {
    annotatedNode = await annotatedElement.getResolvedNode();
  }

  late String uniqueClassName = className;
  String get className;

  late String prefixedClassName = parent.prefixOfElement(element) + className;

  late String mapperName = '${uniqueClassName}Mapper';

  Element get annotatedElement => element;

  late DartObject? annotation = () {
    var a = getAnnotation();
    return a;
  }();
  DartObject? getAnnotation();

  late AstNode? annotatedNode;
}
