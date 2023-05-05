import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_visitor.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../mapper_group.dart';
import '../../utils.dart';
import '../class/class_mapper_element.dart';

class RemoveParamsVisitor extends TypeVisitor<String> {
  final MapperElementGroup parent;

  RemoveParamsVisitor(this.parent);

  @override
  String visitDynamicType(DynamicType type) {
    return 'dynamic';
  }

  @override
  String visitFunctionType(FunctionType type) {
    // TODO
    return type.getDisplayString(withNullability: true);
  }

  @override
  String visitInterfaceType(InterfaceType type) {
    return '${parent.prefixOfElement(type.element)}${type.element.name}'
        '${type.typeArguments.isNotEmpty ? '<${type.typeArguments.map((t) => t.accept(this)).join(', ')}>' : ''}'
        '${type.nullabilitySuffix == NullabilitySuffix.question ? '?' : ''}';
  }

  @override
  String visitNeverType(NeverType type) {
    return 'Never';
  }

  @override
  String visitRecordType(RecordType type) {
    // TODO
    return type.getDisplayString(withNullability: true);
  }

  @override
  String visitTypeParameterType(TypeParameterType type) {
    return type.bound.accept(this);
  }

  @override
  String visitVoidType(VoidType type) {
    return 'void';
  }
}

class MapperFieldElement {
  final MapperParamElement? param;
  final PropertyInducingElement field;
  final ClassMapperElement parent;

  MapperFieldElement(this.param, this.field, this.parent);

  // TODO check nested generic types
  late bool generic = () {
    return staticType != type;
  }();
  late String arg = () {
    if (!generic) return '';

    return ', arg: _arg\$${field.name}';
  }();

  late DartType resolvedType = () {
    var type = field.type;

    if (field.enclosingElement is InterfaceElement) {
      var it = parent.element.thisType
          .asInstanceOf(field.enclosingElement as InterfaceElement)!;
      var getter = it.getGetter(field.name);
      type = getter!.type.returnType;
    }
    return type;
  }();

  late String staticType = () {
    return resolvedType.accept(RemoveParamsVisitor(parent.parent));
  }();

  late String type = () {
    return parent.parent.prefixedType(resolvedType);
  }();

  late String mode = () {
    if (param == null && !fieldChecker.hasAnnotationOf(field)) {
      return ', mode: FieldMode.member';
    } else if (param != null && param!.accessor is! FieldElement) {
      return ', mode: FieldMode.param';
    } else {
      return '';
    }
  }();

  late String key = () {
    var key = param?.jsonKey(parent.caseStyle) ?? field.name;
    if (key != field.name) {
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

  Future<String?> getHook() {
    return _hookFor(parameter);
  }

  PropertyInducingElement get accessor;

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
  FieldParamElement(ParameterElement parameter, this.field) : super(parameter);

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
  PropertyInducingElement get accessor => superParameter.accessor;

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
  PropertyInducingElement get accessor => throw UnimplementedError(
      'Tried to call .accessor on unresolved parameter.');
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
