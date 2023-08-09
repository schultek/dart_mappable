import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../utils.dart';
import '../mapper_element.dart';
import '../record/record_mapper_element.dart';
import 'mapper_param_element.dart';

class IsGenericTypeVisitor extends UnifyingTypeVisitor<bool> {
  @override
  bool visitDartType(DartType type) {
    return false;
  }

  @override
  bool visitTypeParameterType(TypeParameterType type) {
    return true;
  }

  @override
  bool visitInterfaceType(InterfaceType type) {
    return type.typeArguments.any((t) => t.accept(this));
  }

  @override
  bool visitRecordType(RecordType type) {
    return type.positionalFields.any((f) => f.type.accept(this)) ||
        type.namedFields.any((f) => f.type.accept(this));
  }
}

abstract class MapperFieldElement {
  bool get needsGetter;

  String get staticGetterType;

  String get name;

  bool get needsArg;

  String get staticArgType;

  String get argType;

  late String getter = needsGetter ? '_\$$name' : 'null';

  String get key;

  String get mode;

  String get opt;

  Future<String> get def;

  String get arg;

  Future<String> get hook;
}

class RecordMapperFieldElement extends MapperFieldElement {
  final RecordMapperParamElement param;
  final RecordMapperElement parent;

  RecordMapperFieldElement(this.param, this.parent);

  @override
  String get name => param.name;

  @override
  bool get needsGetter => true;

  @override
  late final bool needsArg = () {
    var isGeneric =
        param.isGeneric || param.type.accept(IsGenericTypeVisitor());
    return isGeneric || (staticArgType != staticArgGetterType);
  }();

  @override
  String get arg => () {
        if (!needsArg) return '';

        return ', arg: _arg\$$name';
      }();

  @override
  late final String staticGetterType = () {
    return parent.parent.prefixedType(param.type, resolveBounds: true);
  }();

  @override
  late final String argType = () {
    if (param.typeArg != null) {
      return param.typeArg!;
    }
    return parent.parent.prefixedType(param.type, withNullability: false);
  }();

  @override
  late final String staticArgType = () {
    return parent.parent
        .prefixedType(param.type, withNullability: false, resolveBounds: true);
  }();

  late final String staticArgGetterType = () {
    return parent.parent
        .prefixedType(param.type, withNullability: false, resolveBounds: true);
  }();

  @override
  final String mode = '';

  @override
  String get opt => '';

  @override
  late String key = () {
    String key = param.key ?? parent.caseStyle?.transform(param.name) ?? name;

    if (key != name) {
      return ", key: '$key'";
    } else {
      return '';
    }
  }();

  @override
  final Future<String> def = Future.value('');

  @override
  final Future<String> hook = Future.value('');
}

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
    String key = name;
    if (param case var p?) {
      key = p.key ?? parent.caseStyle.transform(p.name);
    }
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
    var hook = await param?.getHook();
    return hook != null ? ', hook: $hook' : '';
  }();
}
