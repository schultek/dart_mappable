import 'package:dart_mappable/dart_mappable.dart';

import '../field/mapper_field_element.dart';
import '../param/record_mapper_param_element.dart';
import '../record/record_mapper_element.dart';

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
  late final Future<String> hook = () async {
    var hook = await param.getHook();
    return hook != null ? ', hook: $hook' : '';
  }();
}
