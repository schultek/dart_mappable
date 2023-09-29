import '../elements/enum/target_enum_mapper_element.dart';
import 'generator.dart';

/// Generates code for a specific enum.
class EnumMapperGenerator extends MapperGenerator<TargetEnumMapperElement> {
  EnumMapperGenerator(super.element);

  @override
  Future<String> generate() async {
    final extensionReturnType = element.hasAllStringValues ? 'String' : 'dynamic';
    
    return '''
        class ${element.mapperName} extends EnumMapper<${element.prefixedClassName}> {
          ${element.mapperName}._();
          
          static ${element.mapperName}? _instance;
          static ${element.mapperName} ensureInitialized() {
            if (_instance == null) {
              MapperContainer.globals.use(_instance = ${element.mapperName}._());
            }
            return _instance!;
          }
          
          static ${element.prefixedClassName} fromValue(dynamic value) {
            ensureInitialized();
            return MapperContainer.globals.fromValue(value);
          }
          
          @override
          ${element.prefixedClassName} decode(dynamic value) {
            switch (value) {
              ${element.values.map((v) => "case ${v.value}: return ${element.prefixedClassName}.${v.key};").join("\n      ")}
              default: ${_generateDefaultCase()}
            }
          }
          
          @override
          dynamic encode(${element.prefixedClassName} self) {
            switch (self) {
              ${element.values.map((v) => "case ${element.prefixedClassName}.${v.key}: return ${v.value};").join("\n      ")}
            }
          }
        }
        
        extension ${element.mapperName}Extension on ${element.prefixedClassName} {
          ${extensionReturnType} toValue() {
            ${element.mapperName}.ensureInitialized();
            return MapperContainer.globals.toValue<${extensionReturnType}>(this)${element.hasAllStringValues ? ' as String' : ''};
          }
        }
      ''';
  }

  String _generateDefaultCase() {
    if (element.defaultValue != null) {
      return 'return ${element.prefixedClassName}.values[${element.defaultValue}];';
    }
    return 'throw MapperException.unknownEnumValue(value);';
  }
}
