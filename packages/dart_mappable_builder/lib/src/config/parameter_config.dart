import 'package:analyzer/dart/element/element.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../utils.dart';

abstract class ParameterConfig {
  final ParameterElement parameter;

  ParameterConfig(this.parameter);

  String get superName => parameter.name;

  Future<String?> getHook(Namespace namespace) {
    return _hookFor(parameter, namespace);
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

class FieldParameterConfig extends ParameterConfig {
  final PropertyInducingElement field;
  FieldParameterConfig(ParameterElement parameter, this.field)
      : super(parameter);

  @override
  Future<String?> getHook(Namespace namespace) async {
    return (await _hookFor(field, namespace)) ?? await super.getHook(namespace);
  }

  @override
  PropertyInducingElement get accessor => field;

  @override
  String? get _paramKey => _keyFor(field) ?? super._paramKey;
}

class SuperParameterConfig extends ParameterConfig {
  final ParameterConfig superParameter;

  SuperParameterConfig(ParameterElement parameter, this.superParameter)
      : super(parameter);

  @override
  String get superName => superParameter.superName;

  @override
  PropertyInducingElement get accessor => superParameter.accessor;

  @override
  String? get _paramKey => super._paramKey ?? superParameter._paramKey;

  @override
  Future<String?> getHook(Namespace namespace) async {
    var thisHook = await super.getHook(namespace);
    var superHook = await superParameter.getHook(namespace);
    if (thisHook != null && superHook != null) {
      var childHooks = <String>[];

      var multiRegex = RegExp(r'^ChainedHooks\(\s*\[(.*)\]\s*\)$');

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

      return 'ChainedHooks([${childHooks.join(', ')}])';
    } else {
      return thisHook ?? superHook;
    }
  }
}

class UnresolvedParameterConfig extends ParameterConfig {
  final String message;

  UnresolvedParameterConfig(ParameterElement parameter, this.message)
      : super(parameter);

  @override
  PropertyInducingElement get accessor => throw UnimplementedError(
      'Tried to call .accessor on unresolved parameter.');
}

Future<String?> _hookFor(Element element, Namespace namespace) async {
  if (fieldChecker.hasAnnotationOf(element)) {
    var node = await getResolvedAnnotationNode(element, MappableField, 'hooks');
    if (node != null) {
      return getPrefixedNodeSource(node, namespace);
    }
  }
  return null;
}
