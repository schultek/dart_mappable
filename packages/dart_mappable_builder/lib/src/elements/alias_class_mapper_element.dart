import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../builder_options.dart';
import '../generators/class_mapper_generator.dart';
import '../mapper_group.dart';
import '../utils.dart';
import 'class_mapper_element.dart';
import 'linked_elements_mixin.dart';
import 'mapper_element.dart';
import 'mapper_param_element.dart';
import 'none_class_mapper_element.dart';
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
  late String? customId = prefixedClassName;

  @override
  late List<String> typesConfigs = () {

    var types = super.typesConfigs;

    types.add("'$className': $typeParamsDeclaration(f) => f<$className$typeParams>()");

    return types;
  }();
}
