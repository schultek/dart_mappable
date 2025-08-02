import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/type.dart';

import '../../utils.dart';
import '../field/mapper_field_element.dart';
import 'mapper_param_element.dart';

abstract class ClassMapperParamElement extends MapperParamElement {
  @override
  final FormalParameterElement parameter;

  ClassMapperParamElement(this.parameter);

  @override
  String get name => parameter.name3 ?? '';

  @override
  DartType get type => parameter.type;

  @override
  bool get isOptional => parameter.isOptional;

  @override
  Future<String?> getHook() {
    return hookFor(parameter);
  }

  @override
  DartObject? get annotation => fieldChecker.firstAnnotationOf(parameter);
}

class FieldParamElement extends ClassMapperParamElement {
  final PropertyInducingElement2 field;
  final PropertyInducingElement2? superField;

  FieldParamElement(super.parameter, this.field, [this.superField]);

  @override
  bool get isCovariant =>
      superField != null &&
      !parameter.library2!.typeSystem.isAssignableTo(
        superField!.type,
        field.type,
      );

  @override
  Future<String?> getHook() async {
    return (await hookFor(field)) ?? await super.getHook();
  }

  @override
  PropertyInducingElement2 get accessor => field;

  @override
  DartObject? get annotation =>
      super.annotation ?? fieldChecker.firstAnnotationOf(field);
}

class SuperParamElement extends ClassMapperParamElement {
  final ClassMapperParamElement superParameter;

  SuperParamElement(super.parameter, this.superParameter);

  @override
  String get superName => superParameter.superName;

  @override
  bool get isCovariant {
    var isCov =
        !parameter.library2!.typeSystem.isAssignableTo(
          superParameter.parameter.type,
          parameter.type,
        );
    return isCov || superParameter.isCovariant;
  }

  @override
  PropertyInducingElement2? get accessor => superParameter.accessor;

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

  UnresolvedParamElement(super.parameter, this.message);

  @override
  PropertyInducingElement2? get accessor => null;
}
