import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../builder_options.dart';
import '../../mapper_group.dart';
import '../../utils.dart';
import '../mapper_element.dart';
import 'enum_mapper_element.dart';

class TargetEnumMapperElement extends EnumMapperElement {
  TargetEnumMapperElement._(super.parent, super.element, super.options,
      super.annotation, this.valueNodes);

  static Future<TargetEnumMapperElement> from(MapperElementGroup parent,
      EnumElement element, MappableOptions options) async {
    var annotation = await MapperAnnotation.from<MappableEnum>(element);
    var valueNodes = await _getValues(element);

    return TargetEnumMapperElement._(
        parent, element, options, annotation, valueNodes);
  }

  final List<(FieldElement, AstNode?)> valueNodes;

  late final String paramName = className[0].toLowerCase();

  late final ValuesMode mode = ValuesMode.values[
      annotation.value?.read('mode')?.read('index')?.toIntValue() ??
          ValuesMode.named.index];

  late final CaseStyle? caseStyle =
      annotation.value != null && !annotation.value!.read('caseStyle')!.isNull
          ? caseStyleFromAnnotation(annotation.value!.read('caseStyle')!)
          : options.enumCaseStyle;

  late final int? defaultValue =
      annotation.value?.read('defaultValue')!.read('index')?.toIntValue();

  late final List<FieldElement> fields =
      element.fields.where((f) => f.isEnumConstant).toList();

  late final bool hasAllStringValues = mode == ValuesMode.named &&
      fields.every((f) => !enumValueChecker.hasAnnotationOf(f));

  late final List<({String name, dynamic value})> values =
      valueNodes.mapIndexed((i, v) {
    var name = v.$1.name;
    if (v.$2 != null) {
      return (name: name, value: v.$2!.toSource());
    } else if (mode == ValuesMode.named) {
      return (name: name, value: "'${caseStyle.transform(name)}'");
    } else {
      return (name: name, value: i);
    }
  }).toList();

  static Future<List<(FieldElement, AstNode?)>> _getValues(
      EnumElement element) async {
    var fields = element.fields.where((f) => f.isEnumConstant).toList();
    return Future.wait(fields.mapIndexed((i, f) async {
      if (enumValueChecker.hasAnnotationOf(f)) {
        var node = await getResolvedAnnotationNode(f, MappableValue, 0);
        return (f, node);
      } else {
        return (f, null);
      }
    }));
  }
}
