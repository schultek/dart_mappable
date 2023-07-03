import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';

import '../../utils.dart';
import '../mapper_element.dart';
import '../param/mapper_field_element.dart';
import '../param/mapper_param_element.dart';

class TargetRecordMapperElement
    extends InterfaceMapperElement<TypeAliasElement> {
  TargetRecordMapperElement(super.parent, super.element, super.options);

  @override
  late final String className = element.name;

  late RecordTypeAnnotation node;

  @override
  Future<void> init() async {
    await super.init();
    var n = await element.enclosingElement.getResolvedNode();
    n = n as CompilationUnit;
    for (var d in n.declarations) {
      if (d is GenericTypeAlias && d.name.lexeme == element.name) {
        node = d.type as RecordTypeAnnotation;
      }
    }
  }

  @override
  DartObject? getAnnotation() =>
      recordChecker.firstAnnotationOf(annotatedElement);

  late List<MapperFieldElement> fields = () {
    var fields = <MapperFieldElement>[];

    for (var (i, f) in node.positionalFields.indexed) {
      fields.add(
          MapperFieldElement(RecordMapperParamElement(f, '\$$i'), null, this));
    }

    if (node.namedFields != null) {
      for (var f in node.namedFields!.fields) {
        fields.add(MapperFieldElement(
            RecordMapperParamElement(f, f.name.lexeme), null, this));
      }
    }

    return fields;
  }();

  late List<String> typeParamsList = element.typeParameters
      .map((p) =>
          '${p.displayName}${p.bound != null ? ' extends ${parent.prefixedType(p.bound!)}' : ''}')
      .toList();

  late String typeParams = element.typeParameters.isNotEmpty
      ? '<${element.typeParameters.map((p) => p.name).join(', ')}>'
      : '';

  late String typeParamsDeclaration =
      typeParamsList.isNotEmpty ? '<${typeParamsList.join(', ')}>' : '';
}
