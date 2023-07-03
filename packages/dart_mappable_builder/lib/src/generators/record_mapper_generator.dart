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
      class ${element.mapperName} extends RecordMapperVariant<${element.className}> {
      
        static ${element.mapperName}? _instance;
        static ${element.mapperName} ensureInitialized() {
          if (_instance == null) {
            RecordMapper.variants[${element.mapperName}] = _instance = ${element.mapperName}();
            MapperBase.addType(<A, B>(f) => f<({A x, B y})>());
          }
          RecordMapper.variantByType[${element.className}] = ${element.mapperName};
          return _instance!;
        }
        
        ${await generateFields()}
        
        ${generateInstantiate()}
      } 
      
      extension ${element.className}Mappable on ${element.className} {
        Map<String, dynamic> toMap() {
          ${element.mapperName}.ensureInitialized();
          return RecordMapper().encodeMap(this, EncodingOptions(data: ${element.mapperName}));
        }
      }
    ''';
  }

  Future<String> generateFields() async {
    var output = StringBuffer();

    var fields = element.fields;

    for (var f in fields) {
      if (f.needsGetter) {
        output.write(
            '  static ${f.staticGetterType} _\$${f.name}(${element.prefixedClassName} v) => v.${f.name};\n');
      }
      if (f.needsArg) {
        output.write(
            '  static dynamic _arg\$${f.name}${element.typeParamsDeclaration}(f) => f<${f.argType}>();\n');
      }
      output.write(
          "  static const Field<${element.prefixedClassName}, ${f.staticArgType}> _f\$${f.name} = Field('${f.name}', ${f.getter}${f.key}${f.mode}${f.opt}${await f.def}${f.arg}${await f.hook}${f.map});\n");
    }

    output.write(
        '\n  @override\n  final Map<Symbol, Field<${element.prefixedClassName}, dynamic>> fields = const {\n');

    for (var f in fields) {
      output.write('    #${f.name}: _f\$${f.name},\n');
    }

    output.write('  };\n');

    return output.toString();
  }

  String generateInstantiate() {
    List<String> params = [];
    for (var f in element.fields) {
      var str = '';

      if (!f.param!.name.startsWith(r'$')) {
        str = '${f.param!.name}: ';
      }
      str += 'data.dec(_f\$${f.param!.name})';

      params.add(str);
    }
    params.join(', ');

    return '''
        @override
        ${element.className} instantiate(DecodingData<Record> data) {
          return (${params.join(', ')});
        }
      ''';
  }
}
