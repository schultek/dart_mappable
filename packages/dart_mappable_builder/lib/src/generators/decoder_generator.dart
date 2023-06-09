import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../elements/class/class_mapper_element.dart';
import '../elements/class/target_class_mapper_element.dart';
import '../utils.dart';

class DecoderGenerator {
  final TargetClassMapperElement element;

  DecoderGenerator(this.element);

  Future<String> generateInstantiateMethod() async {
    var s = '\n';

    var hook = element.hookForClass;
    if (hook != null) {
      s += '''
        @override
        final MappingHook hook = const $hook;
      ''';
    }

    var superHooks = _getSuperHooks(element);
    if (superHooks.isNotEmpty) {
      s += '''
        @override
        final MappingHook superHook = const ${superHooks.length == 1 ? superHooks.first : 'ChainedHook([${superHooks.join(', ')}])'};
        
      ''';
    }

    s += '''
      static ${element.prefixedDecodingClassName}${element.typeParams} _instantiate${element.typeParamsDeclaration}(DecodingData data) {
        ${await _generateConstructorCall()}
      }
      @override
      final Function instantiate = _instantiate;
    ''';

    return s;
  }

  String generateTypeFactory() {
    return '''
      @override
      Function get typeFactory => ${element.typeParamsDeclaration}(f) => f<${element.prefixedClassName}${element.typeParams}>();
    ''';
  }

  List<String> _getSuperHooks(ClassMapperElement element) {
    if (element.superElement == null) {
      return [];
    } else {
      var hook = element.superElement!.hookForClass;
      return [if (hook != null) hook, ..._getSuperHooks(element.superElement!)];
    }
  }

  Future<String> generateDiscriminatorFields() async {
    var prefix =
        element.parent.prefixOfElement(element.superElement!.annotatedElement);

    return '''
    
      @override
      final String discriminatorKey = '${element.superElement!.discriminatorKey ?? 'type'}';
      @override
      final dynamic discriminatorValue = ${(element.discriminatorValueCode) ?? "'${element.className}'"};
      @override
      late final ClassMapperBase superMapper = $prefix${element.superElement!.mapperName}.ensureInitialized();
      
    ''';
  }

  String generateInheritOverride() {
    var args = element.inheritedTypeArgs;
    if (args == null) {
      return '';
    }
    return '''
      @override
      DecodingContext inherit(DecodingContext context) {
        return context.inherit(args: [${args.join(', ')}]);
      }
    ''';
  }

  Future<String> _generateConstructorCall() async {
    if (!element.hasCallableConstructor) {
      if (element.subElements.isNotEmpty && element.discriminatorKey != null) {
        return "throw MapperException.missingSubclass('${element.className}', '${element.discriminatorKey}', '\${data.value['${element.discriminatorKey}']}');";
      } else {
        return "throw MapperException.missingConstructor('${element.className}');";
      }
    } else {
      return 'return ${element.prefixedDecodingClassName}${element.constructor!.name != '' ? '.${element.constructor!.name}' : ''}(${await _generateConstructorParams()});';
    }
  }

  Future<String> _generateConstructorParams() async {
    List<String> params = [];
    for (var param in element.params) {
      var str = '';

      if (param.parameter.isNamed) {
        str = '${param.parameter.name}: ';
      }
      str += 'data.dec(_f\$${param.accessor?.name ?? param.parameter.name})';

      params.add(str);
    }
    return params.join(', ');
  }

  Future<String> getPrefixedDefaultValue(ParameterElement p) async {
    var node = await p.getResolvedNode();
    if (node is DefaultFormalParameter) {
      return node.defaultValue!.toSource();
    }

    return p.defaultValueCode!;
  }

  String generateStaticDecoders() {
    if (!element.shouldGenerate(GenerateMethods.decode)) {
      return '';
    }

    var fromJsonName = element.options.renameMethods['fromJson'] ?? 'fromJson';
    var fromMapName = element.options.renameMethods['fromMap'] ?? 'fromMap';

    return '\n'
        '  static ${element.prefixedDecodingClassName}${element.typeParams} $fromMapName${element.typeParamsDeclaration}(Map<String, dynamic> map) {\n'
        '    return ensureInitialized().decodeMap<${element.prefixedDecodingClassName}${element.typeParams}>(map);\n'
        '  }\n'
        '  static ${element.prefixedDecodingClassName}${element.typeParams} $fromJsonName${element.typeParamsDeclaration}(String json) {\n'
        '    return ensureInitialized().decodeJson<${element.prefixedDecodingClassName}${element.typeParams}>(json);\n'
        '  }\n';
  }
}
