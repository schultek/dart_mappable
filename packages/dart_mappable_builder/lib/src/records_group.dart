import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';

class RecordsGroup {
  final Map<String, RecordMapperElement> records = {};

  List<RecordMapperElement> get sortedRecords =>
      records.values.sortedBy((r) => r.id);

  static String idFor(RecordType type) {
    var id =
        '${type.positionalFields.length}\$${type.namedFields.map((f) => f.name).sorted().join(r'$')}';
    return id;
  }

  RecordMapperElement? get(RecordType type) {
    var id = idFor(type);
    return records[id];
  }

  void add(RecordType type) {
    var id = idFor(type);
    if (!records.containsKey(id)) {
      records[id] = RecordMapperElement(id, type, records.length, this);
    }
  }

  String? typeAliasFor(RecordType t) {
    var id = idFor(t);
    return records[id]?.typeAliasName;
  }
}

class RecordMapperElement {
  final String id;
  final RecordType type;
  final int index;
  final RecordsGroup parent;

  RecordMapperElement(this.id, this.type, this.index, this.parent);

  late String name = 'r$index';

  late String mapperName = '_m\$$name';

  late String typeAliasName = '_t\$$name';

  late String typeArgs = () {
    var l = type.positionalFields.length + type.namedFields.length;
    return List.generate(l, argAt).join(', ');
  }();

  late String typeDef = () {
    var t = type.positionalFields.mapIndexed((i, f) => argAt(i)).join(', ');

    if (type.namedFields.isNotEmpty) {
      var i = type.positionalFields.length;
      if (i != 0) {
        t += ', ';
      }
      t +=
          '{${type.namedFields.mapIndexed((j, e) => '${argAt(i + j)} ${e.name}').join(', ')}}';
    }

    t = '($t)';

    return t;
  }();

  late Iterable<RecordTypeField> fields = type.positionalFields
      .cast<RecordTypeField>()
      .followedBy(type.namedFields);

  String argAt(int index) {
    return String.fromCharCode('A'.codeUnitAt(0) + index);
  }
}
