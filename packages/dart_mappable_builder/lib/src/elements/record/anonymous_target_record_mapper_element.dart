import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/type_provider.dart';

import '../../records_group.dart';
import '../field/record_mapper_field_element.dart';
import '../mapper_element.dart';
import '../param/record_mapper_param_element.dart';
import 'record_mapper_element.dart';

class AnonymousRecordMapperElement extends RecordMapperElement<Element> {
  final String id;
  @override
  final RecordType type;
  final int index;
  final RecordsGroup group;

  AnonymousRecordMapperElement._(
      this.id, this.type, this.index, this.group, MapperAnnotation annotation)
      : super(group.parent, group.parent.library, group.parent.options,
            annotation);

  factory AnonymousRecordMapperElement.from(
      RecordsGroup group, RecordType type) {
    var id = RecordsGroup.idFor(type);
    var annotation = MapperAnnotation.empty(group.parent.library);
    return AnonymousRecordMapperElement._(
      id,
      type.getBase(group.parent.library.typeProvider),
      group.records.length,
      group,
      annotation,
    );
  }

  late String name = '_R$index';

  @override
  String get className => '_t\$$name';

  String argAt(int index) {
    return String.fromCharCode('A'.codeUnitAt(0) + index);
  }

  @override
  late List<RecordMapperFieldElement> fields = () {
    var fields = <RecordMapperFieldElement>[];

    for (var (i, f) in type.positionalFields.indexed) {
      fields.add(RecordMapperFieldElement(
        RecordMapperParamElement('\$${i + 1}', f.type, null, argAt(i)),
        this,
      ));
    }

    for (var (i, f) in type.namedFields.indexed) {
      fields.add(RecordMapperFieldElement(
        RecordMapperParamElement(
            f.name, f.type, null, argAt(type.positionalFields.length + i)),
        this,
      ));
    }

    return fields;
  }();

  @override
  late String typeParamsDeclaration = genericTypeParamsDeclaration;

  @override
  String get typeParams => typeParamsDeclaration;

  @override
  bool get needsTypeDef => true;
}

extension on RecordType {
  RecordType getBase(TypeProvider typeProvider) {
    return RecordType(
      positional:
          List.filled(positionalFields.length, typeProvider.dynamicType),
      named: Map.fromEntries(
          namedFields.map((f) => MapEntry(f.name, typeProvider.dynamicType))),
      nullabilitySuffix: NullabilitySuffix.none,
    );
  }
}
