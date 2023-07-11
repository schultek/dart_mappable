import '../elements/record/alias_record_mapper_element.dart';
import '../elements/record/record_mapper_element.dart';
import 'extensions/fields_extension.dart';
import 'extensions/record_copywith_extension.dart';
import 'generator.dart';

/// Generates code for a specific record.
class RecordMapperGenerator extends MapperGenerator<RecordMapperElement> {
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

    generateTypeFactory(output);
    generateApplyOverride(output);
    generateInstantiate(output);
    generateStaticDecoders(output);

    output.write('}');

    if (element is AliasRecordMapperElement) {
      output.write('''
      
      extension ${element.className}Mappable${element.typeParamsDeclaration} on ${element.className}${element.typeParams} {
        Map<String, dynamic> toMap() {
          return ${element.mapperName}.ensureInitialized().encodeMap(this);
        }
        
        String toJson() {
          return ${element.mapperName}.ensureInitialized().encodeJson(this);
        }
    ''');

      generateCopyWithExtension(output);
      output.write('}');

      output.write(generateCopyWithClasses());
    }

    return output.toString();
  }

  void generateInstantiate(StringBuffer output) {
    List<String> params = [];
    for (var f in element.fields) {
      var str = '';

      if (!f.name.startsWith(r'$')) {
        str = '${f.name}: ';
      }
      str += 'data.dec(_f\$${f.name})';

      params.add(str);
    }
    params.join(', ');

    output.write('''
    
      static ${element.className}${element.typeParams} _instantiate${element.typeParamsDeclaration}(DecodingData<${element.className}> data) {
        return (${params.join(', ')});
      }
      
      @override
      final Function instantiate = _instantiate;
    ''');
  }

  void generateTypeFactory(StringBuffer output) {
    output.write('''
    
      @override
      Function get typeFactory => ${element.typeParamsDeclaration}(f) => f<${element.prefixedClassName}${element.typeParams}>();
    ''');
  }

  void generateApplyOverride(StringBuffer output) {
    var args = element.inheritedTypeArgs;
    if (args == null) {
      return;
    }
    output.write('''
    
      @override
      List<Type> apply(MappingContext context) {
        return [${args.join(', ')}];
      }
    ''');
  }

  void generateStaticDecoders(StringBuffer output) {
    var fromJsonName = element.options.renameMethods['fromJson'] ?? 'fromJson';
    var fromMapName = element.options.renameMethods['fromMap'] ?? 'fromMap';

    output.write('\n'
        '  static ${element.className}${element.typeParams} $fromMapName${element.typeParamsDeclaration}(Map<String, dynamic> map) {\n'
        '    return ensureInitialized().decodeMap<${element.className}${element.typeParams}>(map);\n'
        '  }\n'
        '  static ${element.className}${element.typeParams} $fromJsonName${element.typeParamsDeclaration}(String json) {\n'
        '    return ensureInitialized().decodeJson<${element.className}${element.typeParams}>(json);\n'
        '  }\n');
  }
}
