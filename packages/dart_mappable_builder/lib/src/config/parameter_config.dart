import 'package:analyzer/dart/element/element.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../utils.dart';

abstract class ParameterConfig {
  final ParameterElement parameter;
  ParameterConfig(this.parameter);

  PropertyInducingElement get accessor;

  String? get hook => _hookFor(parameter);

  Iterable<Uri>? get imports => _importsFor(parameter);

  String? _hookFor(Element element) {
    if (fieldChecker.hasAnnotationOf(element)) {
      return getAnnotationCode(element, MappableField, 'hooks');
    }
    return null;
  }

  Iterable<Uri>? _importsFor(Element element) {
    if (fieldChecker.hasAnnotationOf(element)) {
      var hooks = fieldChecker.firstAnnotationOf(element)?.getField('hooks');
      if (hooks != null && !hooks.isNull) {
        var uri = hooks.type?.element?.library?.source.uri;
        return uri != null ? [uri] : null;
      }
    }
    return null;
  }

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
  PropertyInducingElement get accessor => field;

  @override
  String? get hook => _hookFor(field) ?? super.hook;

  @override
  Iterable<Uri>? get imports => _importsFor(field) ?? super.imports;

  @override
  String? get _paramKey => _keyFor(field) ?? super._paramKey;
}

class SuperParameterConfig extends ParameterConfig {
  final ParameterConfig superParameter;
  SuperParameterConfig(ParameterElement parameter, this.superParameter)
      : super(parameter);

  @override
  PropertyInducingElement get accessor => superParameter.accessor;

  @override
  String? get _paramKey => super._paramKey ?? superParameter._paramKey;

  @override
  String? get hook {
    var thisHook = super.hook;
    var superHook = superParameter.hook;
    if (thisHook != null && superHook != null) {
      var childHooks = <String>[];

      var multiRegex = RegExp(r'^ChainedHooks(\[(.*)\])$');

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
