import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:source_gen/source_gen.dart';

import '../../utils.dart';
import '../field/record_mapper_field_element.dart';
import '../mapper_element.dart';
import '../param/record_mapper_param_element.dart';
import 'record_mapper_element.dart';

class RecordMapperAnnotation extends MapperAnnotation {
  RecordMapperAnnotation(super.element, RecordTypeAnnotation super.node,
      super.annotation, super.value);

  @override
  RecordTypeAnnotation get node => super.node as RecordTypeAnnotation;

  static Future<RecordMapperAnnotation> from(TypeAliasElement element) async {
    var n = await element.enclosingElement.getResolvedNode();
    var node = (n as CompilationUnit)
        .declarations
        .whereType<GenericTypeAlias>()
        .where((d) => d.name.lexeme == element.name)
        .first;

    var annotation = getAnnotation(node, MappableRecord);
    var value =
        TypeChecker.fromRuntime(MappableRecord).firstAnnotationOf(element);
    return RecordMapperAnnotation(
        element, node.type as RecordTypeAnnotation, annotation, value);
  }
}

abstract class AliasRecordMapperElement
    extends RecordMapperElement<TypeAliasElement> {
  AliasRecordMapperElement(super.parent, super.element, super.options,
      RecordMapperAnnotation super.annotation);

  @override
  late final String className = element.name;

  @override
  RecordMapperAnnotation get annotation =>
      super.annotation as RecordMapperAnnotation;

  @override
  late List<RecordMapperFieldElement> fields = () {
    var fields = <RecordMapperFieldElement>[];

    for (var (i, f) in annotation.node.positionalFields.indexed) {
      fields.add(RecordMapperFieldElement(
        RecordMapperParamElement('\$${i + 1}', f.type.type!, f),
        this,
      ));
    }

    if (annotation.node.namedFields != null) {
      for (var f in annotation.node.namedFields!.fields) {
        fields.add(RecordMapperFieldElement(
          RecordMapperParamElement(f.name.lexeme, f.type.type!, f),
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

  late String selfTypeParam = '$prefixedClassName$typeParams';

  @override
  bool get needsTypeDef => false;

  @override
  RecordType get type => element.aliasedType as RecordType;
}
