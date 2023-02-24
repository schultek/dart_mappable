// ignore_for_file: overridden_fields

import 'package:analyzer/dart/element/element.dart';

import 'target_class_mapper_element.dart';

class AliasClassMapperElement extends TargetClassMapperElement {
  AliasClassMapperElement(
      super.parent, this.alias, super.element, super.options);

  final TypeAliasElement alias;

  @override
  String get uniqueClassName => alias.name;

  @override
  Element get annotatedElement => alias;

  @override
  bool get generateMixin => false;
}
