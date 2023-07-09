import 'package:analyzer/dart/element/element.dart';
import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../utils.dart';
import 'enum_mapper_element.dart';

class TargetEnumMapperElement extends EnumMapperElement {
  TargetEnumMapperElement(super.parent, super.element, super.options);

  @override
  Future<void> init() async {
    super.init();
    values = await _getValues();
  }

  late String paramName = className[0].toLowerCase();

  late ValuesMode mode = annotation != null
      ? ValuesMode
          .values[annotation?.read('mode')?.read('index')?.toIntValue() ?? 0]
      : ValuesMode.named;

  late CaseStyle? caseStyle =
      annotation != null && !annotation!.read('caseStyle')!.isNull
          ? caseStyleFromAnnotation(annotation!.read('caseStyle')!)
          : options.enumCaseStyle;

  late int? defaultValue =
      annotation?.read('defaultValue')!.read('index')?.toIntValue();

  late List<FieldElement> fields =
      element.fields.where((f) => f.isEnumConstant).toList();

  late bool hasAllStringValues = mode == ValuesMode.named &&
      fields.every((f) => !enumValueChecker.hasAnnotationOf(f));

  late List<MapEntry<String, dynamic>> values;

  Future<List<MapEntry<String, dynamic>>> _getValues() async {
    return Future.wait(fields.mapIndexed((i, f) async {
      if (enumValueChecker.hasAnnotationOf(f)) {
        return MapEntry(f.name, await getAnnotatedValue(f));
      } else {
        if (mode == ValuesMode.named) {
          return MapEntry(f.name, "'${caseStyle.transform(f.name)}'");
        } else {
          return MapEntry(f.name, i);
        }
      }
    }));
  }

  Future<String> getAnnotatedValue(FieldElement f) async {
    var node = await getResolvedAnnotationNode(f, MappableValue, 0);
    return node!.toSource();
  }
}
