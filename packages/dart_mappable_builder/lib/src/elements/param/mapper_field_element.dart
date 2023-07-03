import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../utils.dart';
import '../mapper_element.dart';
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

class MapperFieldElement {
  final MapperParamElement? param;
  final PropertyInducingElement? field;
  final InterfaceMapperElement parent;

  MapperFieldElement(this.param, this.field, this.parent)
      : assert(param != null || field != null);

  late String name = field?.name ?? param!.name;

  late bool needsGetter = field != null || param is RecordMapperParamElement;

  late String getter = needsGetter ? '_\$$name' : 'null';

  late bool needsArg = () {
    var isGeneric = resolvedType.accept(IsGenericTypeVisitor());
    return isGeneric || (staticArgType != staticArgGetterType);
  }();

  late String arg = () {
    if (!needsArg) return '';

    return ', arg: _arg\$$name';
  }();

  late DartType resolvedType = () {
    if (field?.enclosingElement is InterfaceElement) {
      var it = (parent.element as InterfaceElement).thisType;
      it = it.asInstanceOf(field!.enclosingElement as InterfaceElement)!;
      var getter = it.getGetter(field!.name);
      return getter!.type.returnType;
    }
    return field?.type ?? param!.type;
  }();

  late String staticGetterType = () {
    return parent.parent.prefixedType(resolvedType, resolveBounds: true);
  }();

  late String argType = () {
    return parent.parent.prefixedType(resolvedType, withNullability: false);
  }();

  late String staticArgType = () {
    return parent.parent.prefixedType(param?.type ?? resolvedType,
        withNullability: false, resolveBounds: true);
  }();

  late String staticArgGetterType = () {
    return parent.parent.prefixedType(resolvedType,
        withNullability: false, resolveBounds: true);
  }();

  late String mode = () {
    if (param == null &&
        field != null &&
        !fieldChecker.hasAnnotationOf(field!)) {
      return ', mode: FieldMode.member';
    } else if (param != null &&
        param!.accessor is! FieldElement &&
        param is! RecordMapperParamElement) {
      return ', mode: FieldMode.param';
    } else {
      return '';
    }
  }();

  late String key = () {
    String key = name;
    if (param case var p?) {
      key = p.key ?? parent.caseStyle?.transform(p.name) ?? name;
    }
    if (key != name) {
      return ", key: '$key'";
    } else {
      return '';
    }
  }();

  late String opt = (param?.isOptional ?? false) ? ', opt: true' : '';

  late Future<String> def = () async {
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

  late Future<String> hook = () async {
    var hook = await param?.getHook();
    return hook != null ? ', hook: $hook' : '';
  }();

  late String map = () {
    var type = param?.type ?? resolvedType;
    if (type is InterfaceType && type.element is EnumElement) {
      var e = parent.parent.getMapperForElement(type.element);
      if (e != null) {
        return ', map: ${e.prefixedClassName}Mapper.ensureInitialized';
      }
    } else if (type is RecordType && type.alias != null) {
      var e = parent.parent.getMapperForElement(type.alias!.element);
      if (e != null) {
        return ', map: ${e.prefixedClassName}Mapper.ensureInitialized';
      }
    }
    return '';
  }();
}
