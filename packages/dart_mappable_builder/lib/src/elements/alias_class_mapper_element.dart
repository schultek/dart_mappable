// ignore_for_file: overridden_fields

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';

import 'target_class_mapper_element.dart';

class AliasClassMapperElement extends TargetClassMapperElement {
  AliasClassMapperElement(super.parent, super.element, this.node, super.options) {
    assert(targetElement == element.supertype!.element);
  }

  final ClassTypeAlias node;

  @override
  late ClassElement targetElement = node.superclass.name.staticElement as ClassElement;

  @override
  late String prefixedDecodingClassName = parent.prefixOfElement(element)+className;

  @override
  late String selfTypeParam = '$uniqueClassName$typeParams';

  @override
  late List<String> typesConfigs = () {

    var types = super.typesConfigs;

    types.add("'$className': $typeParamsDeclaration(f) => f<$className$typeParams>()");

    return types;
  }();
}
