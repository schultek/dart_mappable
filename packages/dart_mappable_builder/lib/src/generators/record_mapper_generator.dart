import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';

import '../elements/record/target_record_mapper_element.dart';
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

/// Generates code for a specific record.
class RecordMapperGenerator2
    extends MapperGenerator<TargetRecordMapperElement> {
  RecordMapperGenerator2(super.element);

  @override
  Future<String> generate() async {
    return '''
      class ${element.mapperName} extends RecordMapperBase<_R1> {
        static dynamic _$1(_R1 v) => v.$1;
        static const Field<_R1, dynamic> _f$1 = Field('1', _$1);
      
        @override
        final Map<Symbol, Field<_R1, dynamic>> fields = const {
          #$1: _f$1,
        };
      
        static _R1<A> _instantiate<A>(DecodingData data) {
          return (data.dec(_f$1));
        }
      
        @override
        final Function instantiate = _instantiate;
      
        @override
        Function get typeFactory => <A>(f) => f<_R1<A>>();
      } 
    ''';
  }
}
