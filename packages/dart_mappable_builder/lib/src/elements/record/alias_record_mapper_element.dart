import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import '../../utils.dart';
import '../param/mapper_field_element.dart';
import '../param/mapper_param_element.dart';
import 'record_mapper_element.dart';

abstract class AliasRecordMapperElement
    extends RecordMapperElement<TypeAliasElement> {
  AliasRecordMapperElement(super.parent, super.element, super.options);

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

  @override
  late List<RecordMapperFieldElement> fields = () {
    var fields = <RecordMapperFieldElement>[];

    for (var (i, f) in node.positionalFields.indexed) {
      fields.add(RecordMapperFieldElement(
        RecordMapperParamElement('\$${i + 1}', f.type.type!, f.metadata),
        this,
      ));
    }

    if (node.namedFields != null) {
      for (var f in node.namedFields!.fields) {
        fields.add(RecordMapperFieldElement(
          RecordMapperParamElement(f.name.lexeme, f.type.type!, f.metadata),
          this,
        ));
      }
    }

    return fields;
  }();

  late List<String> typeParamsList = element.typeParameters
      .map((p) =>
          '${p.displayName}${p.bound != null ? ' extends ${parent.prefixedType(p.bound!)}' : ''}')
      .toList();

  @override
  late String typeParams = element.typeParameters.isNotEmpty
      ? '<${element.typeParameters.map((p) => p.name).join(', ')}>'
      : '';

  @override
  late String typeParamsDeclaration =
      typeParamsList.isNotEmpty ? '<${typeParamsList.join(', ')}>' : '';

  @override
  bool get needsTypeDef => false;

  @override
  RecordType get type => element.aliasedType as RecordType;
}
