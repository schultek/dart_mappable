import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import '../../records_group.dart';
import '../param/mapper_field_element.dart';
import '../param/mapper_param_element.dart';
import 'record_mapper_element.dart';

class AnonymousRecordMapperElement extends RecordMapperElement<Element> {
  final String id;
  @override
  final RecordType type;
  final int index;
  final RecordsGroup group;

  AnonymousRecordMapperElement(this.id, this.type, this.index, this.group)
      : super(group.parent, group.parent.library, group.parent.options);

  late String name = '_R$index';

  @override
  String get className => '_t\$$name';

  String argAt(int index) {
    return String.fromCharCode('A'.codeUnitAt(0) + index);
  }

  @override
  late List<MapperFieldElement> fields = () {
    var fields = <MapperFieldElement>[];

    for (var (i, f) in type.positionalFields.indexed) {
      fields.add(MapperFieldElement(
          RecordMapperParamElement('\$$i', f.type, [], argAt(i)), null, this));
    }

    for (var (i, f) in type.namedFields.indexed) {
      fields.add(MapperFieldElement(
          RecordMapperParamElement(
              f.name, f.type, [], argAt(type.positionalFields.length + i)),
          null,
          this));
    }

    return fields;
  }();

  @override
  DartObject? getAnnotation() => null;

  @override
  late String typeParamsDeclaration = genericTypeParamsDeclaration;

  @override
  String get typeParams => typeParamsDeclaration;

  @override
  bool get needsTypeDef => true;
}
