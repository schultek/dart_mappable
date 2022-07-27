import 'package:analyzer/dart/element/element.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../imports_builder.dart';
import '../utils.dart';

abstract class ParameterConfig {
  final ParameterElement parameter;
  final String? hook;

  ParameterConfig(this.parameter, this.hook);

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
  FieldParameterConfig(ParameterElement parameter, this.field, String? hook)
      : super(parameter, hook);

  factory FieldParameterConfig.from(ParameterElement parameter,
      PropertyInducingElement field, ImportsBuilder imports) {
    return FieldParameterConfig(
      parameter,
      field,
      _hookFor(field, imports) ?? _hookFor(parameter, imports),
    );
  }

  @override
  PropertyInducingElement get accessor => field;

  @override
  String? get _paramKey => _keyFor(field) ?? super._paramKey;
}

class SuperParameterConfig extends ParameterConfig {
  final ParameterConfig superParameter;

  SuperParameterConfig(
      ParameterElement parameter, this.superParameter, String? hook)
      : super(parameter, hook);

  factory SuperParameterConfig.from(ParameterElement parameter,
      ParameterConfig superParameter, ImportsBuilder imports) {
    return SuperParameterConfig(
      parameter,
      superParameter,
      _hookFor(parameter, imports),
    );
  }

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
      : super(parameter, null);

  @override
  PropertyInducingElement get accessor => throw UnimplementedError(
      'Tried to call .accessor on unresolved parameter.');
}

String? _hookFor(Element element, ImportsBuilder imports) {
  if (fieldChecker.hasAnnotationOf(element)) {
    var hook = getAnnotationCode(element, MappableField, 'hooks');

    if (hook != null) {
      var hooks = fieldChecker.firstAnnotationOf(element)?.getField('hooks');
      if (hooks != null && !hooks.isNull) {
        var uri = hooks.type?.element?.library?.source.uri;
        var prefix = imports.add(uri);

        if (prefix != null) {
          hook = 'p$prefix.$hook';
        }
      }
    }
    return hook;
  }
  return null;
}
