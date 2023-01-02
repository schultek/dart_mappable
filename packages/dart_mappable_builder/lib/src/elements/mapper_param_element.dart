import 'package:analyzer/dart/element/element.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../utils.dart';

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
  FieldParamElement(ParameterElement parameter, this.field)
      : super(parameter);

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
