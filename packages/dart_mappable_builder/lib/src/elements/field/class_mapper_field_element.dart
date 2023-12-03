import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../utils.dart';
import '../field/mapper_field_element.dart';
import '../mapper_element.dart';
import '../param/mapper_param_element.dart';
import '../param/record_mapper_param_element.dart';

class ClassMapperFieldElement extends MapperFieldElement {
  final MapperParamElement? param;
  final PropertyInducingElement? field;
  final InterfaceMapperElement parent;

  ClassMapperFieldElement(this.param, this.field, this.parent)
      : assert(param != null || field != null);

  @override
  late final String name = field?.name ?? param!.name;

  @override
  late final bool needsGetter =
      field != null || param is RecordMapperParamElement;

  @override
  late final bool needsArg = () {
    var isGeneric = resolvedType.accept(IsGenericTypeVisitor());
    return isGeneric || (staticArgType != staticArgGetterType);
  }();

  @override
  late final String arg = () {
    if (!needsArg) return '';

    return ', arg: _arg\$$name';
  }();

  late final DartType resolvedType = () {
    if (field?.enclosingElement is InterfaceElement) {
      var it = (parent.element as InterfaceElement).thisType;
      it = it.asInstanceOf(field!.enclosingElement as InterfaceElement)!;
      var getter = it.getGetter(field!.name);
      return getter!.type.returnType;
    }
    return field?.type ?? param!.type;
  }();

  @override
  late final String staticGetterType = () {
    return parent.parent.prefixedType(resolvedType, resolveBounds: true);
  }();

  @override
  late final String argType = () {
    return parent.parent.prefixedType(resolvedType, withNullability: false);
  }();

  @override
  late final String staticArgType = () {
    return parent.parent.prefixedType(param?.type ?? resolvedType,
        withNullability: false, resolveBounds: true);
  }();

  late final String staticArgGetterType = () {
    return parent.parent.prefixedType(resolvedType,
        withNullability: false, resolveBounds: true);
  }();

  late bool isAnnotated = (field != null &&
          fieldChecker.hasAnnotationOf(field!)) ||
      (field?.getter != null && fieldChecker.hasAnnotationOf(field!.getter!));

  @override
  late String mode = () {
    if (param == null && field != null && !isAnnotated) {
      return ', mode: FieldMode.member';
    } else if (param != null && param!.accessor is! FieldElement) {
      return ', mode: FieldMode.param';
    } else {
      return '';
    }
  }();

  @override
  late final String key = () {
    String? key;
    if (param case var p?) {
      key = p.key ?? parent.caseStyle.transform(p.name);
    }
    key ??= _keyFor(field) ??
        _keyFor(field?.getter) ??
        parent.caseStyle.transform(name);
    if (key != name) {
      return ", key: '$key'";
    } else {
      return '';
    }
  }();

  @override
  late final String opt = (param?.isOptional ?? false) ? ', opt: true' : '';

  @override
  late final Future<String> def = () async {
    if (param == null) return '';

    var p = param!.parameter;
    if (p == null) {
      return '';
    }

    if (p.hasDefaultValue && p.defaultValueCode != 'null') {
      return ', def: ${p.defaultValueCode}';
    } else {
      var node = await p.getNode();
      if (node is DefaultFormalParameter &&
          node.defaultValue.toString() != 'null') {
        return ', def: ${node.defaultValue}';
      }
    }

    return '';
  }();

  @override
  late final Future<String> hook = () async {
    var hook = (await param?.getHook()) ??
        (await hookFor(field)) ??
        (await hookFor(field?.getter));
    return hook != null ? ', hook: $hook' : '';
  }();
}

String? _keyFor(Element? element) {
  if (element == null) {
    return null;
  }
  return fieldChecker
      .firstAnnotationOf(element)
      ?.getField('key')!
      .toStringValue();
}
