import 'dart:async';

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';

import '../builder_options.dart';
import '../generators/class_mapper_generator.dart';
import '../mapper_resource.dart';
import '../utils.dart';

abstract class MapperElement<T extends InterfaceElement> {

  MapperElementGroup parent;
  T element;
  MappableOptions options;
  int nameIndex;

  MapperElement(this.parent, this.element, this.options, this.nameIndex);

  Element get annotatedElement => element;

  late DartObject? annotation = getAnnotation();
  DartObject? getAnnotation();

  late AstNode? annotatedNode;

  late Future<void> finalize = () async {
    annotatedNode = await annotatedElement.getResolvedNode();
  }();

  MapperGenerator get generator;
}
