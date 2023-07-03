import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../utils.dart';

abstract class MapperParamElement {
  String get name;

  DartType get type;

  String get superName => name;

  bool get isCovariant => false;

  bool get isOptional => false;

  ParameterElement? get parameter => null;

  Future<String?> getHook();

  PropertyInducingElement? get accessor => null;

  String? get key => annotation?.read('key')?.toStringValue();

  DartObject? get annotation;
}

abstract class ClassMapperParamElement extends MapperParamElement {
  @override
  final ParameterElement parameter;

  ClassMapperParamElement(this.parameter);

  @override
  String get name => parameter.name;

  @override
  DartType get type => parameter.type;

  @override
  bool get isOptional => parameter.isOptional;

  @override
  Future<String?> getHook() {
    return _hookFor(parameter);
  }

  @override
  DartObject? get annotation => fieldChecker.firstAnnotationOf(parameter);
}

class FieldParamElement extends ClassMapperParamElement {
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
  DartObject? get annotation =>
      super.annotation ?? fieldChecker.firstAnnotationOf(field);
}

class SuperParamElement extends ClassMapperParamElement {
  final ClassMapperParamElement superParameter;

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
  String? get key => super.key ?? superParameter.key;

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

class UnresolvedParamElement extends ClassMapperParamElement {
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

class RecordMapperParamElement extends MapperParamElement {
  final RecordTypeAnnotationField field;
  @override
  final String name;

  RecordMapperParamElement(this.field, this.name);

  @override
  Future<String?> getHook() async {
    return null;
  }

  @override
  DartType get type => field.type.type!;

  @override
  DartObject? get annotation {
    for (var e in field.metadata) {
      var o = e.elementAnnotation?.computeConstantValue();
      if (o != null &&
          o.type != null &&
          fieldChecker.isAssignableFromType(o.type!)) {
        return o;
      }
    }
    return null;
  }
}
