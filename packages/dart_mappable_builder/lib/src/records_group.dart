import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';

import 'elements/record/anonymous_target_record_mapper_element.dart';
import 'mapper_group.dart';

class RecordsGroup {
  RecordsGroup(this.parent);

  final MapperElementGroup parent;

  final Map<String, AnonymousRecordMapperElement> records = {};

  List<AnonymousRecordMapperElement> get sortedRecords =>
      records.values.sortedBy((r) => r.id);

  static String idFor(RecordType type) {
    var id =
        '${type.positionalFields.length}\$${type.namedFields.map((f) => f.name).sorted().join(r'$')}';
    return id;
  }

  AnonymousRecordMapperElement? get(RecordType type) {
    var id = idFor(type);
    return records[id];
  }

  void add(RecordType type) {
    var id = idFor(type);
    if (!records.containsKey(id)) {
      records[id] = AnonymousRecordMapperElement.from(this, type);
    }
  }

  String? typeAliasFor(RecordType t) {
    var id = idFor(t);
    return records[id]?.className;
  }
}
