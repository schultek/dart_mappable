import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../utils.dart';
import '../class/class_mapper_element.dart';

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
  final ClassMapperElement parent;

  MapperFieldElement(this.param, this.field, this.parent)
      : assert(param != null || field != null);

  late String name = field?.name ?? param!.parameter.name;

  late String getter = field != null ? '_\$$name' : 'null';

  late bool generic = () {
    return resolvedType.accept(IsGenericTypeVisitor());
  }();

  late String arg = () {
    if (!generic) return '';

    return ', arg: _arg\$$name';
  }();

  late DartType resolvedType = () {
    if (field?.enclosingElement is InterfaceElement) {
      var it = parent.element.thisType;
      it = it.asInstanceOf(field!.enclosingElement as InterfaceElement)!;
      var getter = it.getGetter(field!.name);
      return getter!.type.returnType;
    }
    return field?.type ?? param!.parameter.type;
  }();

  late String staticGetterType = () {
    return parent.parent.prefixedType(resolvedType, resolveBounds: true);
  }();

  late String argType = () {
    return parent.parent.prefixedType(param?.parameter.type ?? resolvedType,
        withNullability: false);
  }();

  late String staticArgType = () {
    return parent.parent.prefixedType(param?.parameter.type ?? resolvedType,
        withNullability: false, resolveBounds: true);
  }();

  late String mode = () {
    if (param == null &&
        field != null &&
        !fieldChecker.hasAnnotationOf(field!)) {
      return ', mode: FieldMode.member';
    } else if (param != null && param!.accessor is! FieldElement) {
      return ', mode: FieldMode.param';
    } else {
      return '';
    }
  }();

  late String key = () {
    var key = param?.jsonKey(parent.caseStyle) ?? name;
    if (key != name) {
      return ", key: '$key'";
    } else {
      return '';
    }
  }();

  late String opt = (param?.parameter.isOptional ?? false) ? ', opt: true' : '';

  late Future<String> def = () async {
    if (param == null) return '';

    var p = param!.parameter;

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
}

abstract class MapperParamElement {
  final ParameterElement parameter;

  MapperParamElement(this.parameter);

  String get superName => parameter.name;

  bool get isCovariant => false;

  Future<String?> getHook() {
    return _hookFor(parameter);
  }

  PropertyInducingElement? get accessor;

  String? _keyFor(Element element) {
    return fieldChecker
        .firstAnnotationOf(element)
        ?.getField('key')!
        .toStringValue();
  }

  String? get _paramKey => _keyFor(parameter);

  String jsonKey(CaseStyle? caseStyle) {
    return _paramKey ?? caseStyle.transform(parameter.name);
  }
}

class FieldParamElement extends MapperParamElement {
  final PropertyInducingElement field;
  final PropertyInducingElement? superField;

  FieldParamElement(ParameterElement parameter, this.field, [this.superField])
      : super(parameter);

  @override
  bool get isCovariant =>
      superField != null &&
      !parameter.library!.typeSystem
          .isAssignableTo(superField!.type, field.type);

  @override
  Future<String?> getHook() async {
    return (await _hookFor(field)) ?? await super.getHook();
  }

  @override
  PropertyInducingElement get accessor => field;

  @override
  String? get _paramKey => _keyFor(field) ?? super._paramKey;
}

class SuperParamElement extends MapperParamElement {
  final MapperParamElement superParameter;

  SuperParamElement(ParameterElement parameter, this.superParameter)
      : super(parameter);

  @override
  String get superName => superParameter.superName;

  @override
  bool get isCovariant {
    var isCov = !parameter.library!.typeSystem
        .isAssignableTo(superParameter.parameter.type, parameter.type);
    return isCov || superParameter.isCovariant;
  }

  @override
  PropertyInducingElement? get accessor => superParameter.accessor;

  @override
  String? get _paramKey => super._paramKey ?? superParameter._paramKey;

  @override
  Future<String?> getHook() async {
    var thisHook = await super.getHook();
    var superHook = await superParameter.getHook();
    if (thisHook != null && superHook != null) {
      var childHooks = <String>[];

      var multiRegex = RegExp(r'^ChainedHook\(\s*\[(.*)\]\s*\)$');

      if (multiRegex.hasMatch(superHook)) {
        var match = multiRegex.firstMatch(superHook)!.group(1)!;
        childHooks.addAll(match.split(', '));
      } else {
        childHooks.add(superHook);
      }

      if (multiRegex.hasMatch(thisHook)) {
        var match = multiRegex.firstMatch(thisHook)!.group(1)!;
        childHooks.addAll(match.split(', '));
      } else {
        childHooks.add(thisHook);
      }

      return 'ChainedHook([${childHooks.join(', ')}])';
    } else {
      return thisHook ?? superHook;
    }
  }
}

class UnresolvedParamElement extends MapperParamElement {
  final String message;

  UnresolvedParamElement(ParameterElement parameter, this.message)
      : super(parameter);

  @override
  PropertyInducingElement? get accessor => null;
}

Future<String?> _hookFor(Element element) async {
  if (fieldChecker.hasAnnotationOf(element)) {
    var node = await getResolvedAnnotationNode(element, MappableField, 'hook');
    if (node != null) {
      return node.toSource();
    }
  }
  return null;
}
