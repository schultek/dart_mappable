import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';

import '../records_group.dart';
import 'generator.dart';

/// Generates code for a specific record.
class RecordMapperGenerator extends MapperGenerator<RecordMapperElement> {
  RecordMapperGenerator(super.element);

  @override
  Future<String> generate() async {
    return '''
      typedef ${element.typeAliasName}<${element.typeArgs}> = ${element.typeDef};
      final ${element.mapperName} = RecordMapper<${element.typeAliasName}>(
        <${element.typeArgs}>(RecordData<${element.typeAliasName}> d) => (
          ${element.fields.mapIndexed((i, f) {
      var name = f is RecordTypeNamedField ? f.name : null;
      return '${name != null ? '$name: ' : ''}d<${element.argAt(i)}>(\'${name ?? (i + 1)}\', (r) => r.${name ?? '\$${i + 1}'}),\n';
    }).join('')}
        ),
        <${element.typeArgs}>(f) => f<${element.typeAliasName}<${element.typeArgs}>>(),
      );
    ''';
  }
}
