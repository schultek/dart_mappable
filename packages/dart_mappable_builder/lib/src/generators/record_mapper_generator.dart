import '../elements/record/record_mapper_element.dart';
import 'generator.dart';

/// Generates code for a specific record.
class RecordMapperGenerator
    extends InterfaceMapperGenerator<RecordMapperElement> {
  RecordMapperGenerator(super.element);

  @override
  Future<String> generate() async {
    var output = StringBuffer();

    output.write('''
      ${element.needsTypeDef ? 'typedef ${element.className}${element.typeParamsDeclaration} = ${element.genericRecordDeclaration};' : ''}
      class ${element.mapperName} extends RecordMapperBase<${element.className}> {
      
        static ${element.mapperName}? _instance;
        ${element.mapperName}._();
        
        static ${element.mapperName} ensureInitialized() {
          if (_instance == null) {
            MapperContainer.globals.use(_instance = ${element.mapperName}._());
            MapperBase.addType(${element.genericTypeParamsDeclaration}(f) => f<${element.genericRecordDeclaration}>());
          }
          return _instance!;
        }
    ''');

    await generateFields(output);

    generateApplyOverride(output);
    generateInstantiate(output);

    output.write('''
      } 
      
      extension ${element.className}Mappable${element.typeParamsDeclaration} on ${element.className}${element.typeParams} {
        Map<String, dynamic> toMap() {
          return ${element.mapperName}.ensureInitialized().encodeMap(this);
        }
        
        String toJson() {
          return ${element.mapperName}.ensureInitialized().encodeJson(this);
        }
      }
    ''');

    return output.toString();
  }

  void generateInstantiate(StringBuffer output) {
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

    output.write('''
      static ${element.className} _instantiate(DecodingData<${element.className}> data) {
        return (${params.join(', ')});
      }
      
      @override
      final Function instantiate = _instantiate;
    ''');
  }

  void generateApplyOverride(StringBuffer output) {
    var args = element.inheritedTypeArgs;
    if (args == null) {
      return;
    }
    output.write('''
      @override
      DecodingContext apply(DecodingContext context) {
        return context.change(args: [${args.join(', ')}]);
      }
    ''');
  }
}
