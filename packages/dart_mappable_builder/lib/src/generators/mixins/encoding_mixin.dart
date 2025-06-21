import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../elements/class/target_class_mapper_element.dart';
import '../../utils.dart';
import '../generator.dart';

mixin EncodingMixin on MapperGenerator<TargetClassMapperElement> {
  late final toJsonName = element.options.renameMethods['toJson'] ?? 'toJson';
  late final toMapName = element.options.renameMethods['toMap'] ?? 'toMap';
  late final toDeclaredFieldsMapName = element.options.renameMethods['toDeclaredFieldsMap'] ?? 'toDeclaredFieldsMap';

  void generateEncoderMixin(StringBuffer output) {
    if (!element.shouldGenerate(GenerateMethods.encode)) {
      return;
    }
    if (element.isAbstract) {
      output.write('''
        String $toJsonName();
        Map<String, dynamic> $toMapName();
      ''');
      return;
    }
    output.write('''
      String $toJsonName() {
        return ${element.mapperName}.ensureInitialized().encodeJson<${element.selfTypeParam}>(this as ${element.selfTypeParam});
      }
      Map<String, dynamic> $toMapName() {
        return ${element.mapperName}.ensureInitialized().encodeMap<${element.selfTypeParam}>(this as ${element.selfTypeParam});
      }
    ''');
  }

  void generateEncoderExtensions(StringBuffer output) {
    if (!element.shouldGenerate(GenerateMethods.encode)) {
      return;
    }
    output.write('''
      String $toJsonName() {
        return ${element.mapperName}.ensureInitialized().encodeJson<${element.selfTypeParam}>(this);
      }
      Map<String, dynamic> $toMapName() {
        return ${element.mapperName}.ensureInitialized().encodeMap<${element.selfTypeParam}>(this);
      }
    ''');
  }

  void generateDeclaredFieldEncoder(StringBuffer output){
    List<String> params = [];
    for (var param in element.params) {
      var str = '';

      if (param.parameter.isNamed) {
        str = '${param.parameter.runtimeType}: ';
      }
      if (param.parameter.isRequired) {
        str = 'required ';
      }
      str += param.accessor?.name ?? param.parameter.name;

      params.add(str);
    }
    
    output.write('''
      static Map<String, dynamic> $toDeclaredFieldsMapName(${_generateDeclaredFieldParams()}) {
        var mapper = ${element.mapperName}.ensureInitialized();
        return {
    ''');

    List<String> pairs = [];
    for(var param in element.params){
      if (param.parameter is FieldFormalParameterElement){
        pairs.add('_f\$${param.accessor?.name ?? param.parameter.name}.name: mapper.encodeValue(${param.accessor?.name ?? param.parameter.name})');
      }
    }
    output.write('''
        ${pairs.join((', '))}
      ''');

    output.write('''
        };
      }
    ''');
  }

  String _generateDeclaredFieldParams() {
    List<String> params = [];
    for (var param in element.copySafeParams) {
      var p = param.parameter;

      var type = element.parent.prefixedType(p.type, withNullability: false);

      if (param.parameter is FieldFormalParameterElement)
      {
        if (p.type.isNullableOrDynamic) {
          var isDynamic = p.type is DynamicType;
          params.add('$type${isDynamic ? '' : '?'} ${p.name}');
        } else {
          params.add('required $type ${p.name}');
        }
      }
    }

    return params.isNotEmpty ? '{${params.join(', ')}}' : '';
  }  
}
