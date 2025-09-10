import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../elements/class/class_mapper_element.dart';
import '../../elements/class/target_class_mapper_element.dart';
import '../generator.dart';

mixin DecodingMixin on MapperGenerator<TargetClassMapperElement> {
  Future<void> generateInstantiateMethod(StringBuffer output) async {
    output.write('\n');

    var hook = element.hookForElement;
    if (hook != null) {
      output.write('''
        @override
        final MappingHook hook = $hook;
      ''');
    }

    var superHooks = _getSuperHooks(element);
    if (superHooks.isNotEmpty) {
      final hook =
          superHooks.length == 1
              ? superHooks.first
              : 'ChainedHook([${superHooks.map((h) => h.startsWith('const ') ? h.substring(6) : h).join(', ')}])';
      output.write('''
        @override
        final MappingHook superHook = $hook;
        
      ''');
    }

    output.write('''
      static ${element.prefixedDecodingClassName}${element.typeParams} _instantiate${element.typeParamsDeclaration}(DecodingData data) {
        ${await _generateConstructorCall()}
      }
      @override
      final Function instantiate = _instantiate;
    ''');
  }

  void generateTypeFactory(StringBuffer output) {
    final impl =
        '${element.typeParamsDeclaration}(f) => f<${element.prefixedClassName}${element.typeParams}>();';
    if (!element.hasRecursiveTypeParams) {
      output.write('''
      @override
      Function get typeFactory => $impl
    ''');
    } else {
      final deepBounds =
          element.element.typeParameters
              .map(
                (p) =>
                    p.bound != null
                        ? element.parent.prefixedType(p.bound!)
                        : null,
              )
              .toList();
      final flatBounds =
          element.element.typeParameters.map((p) {
            if (p.bound case InterfaceType bound) {
              return '${p.name} extends ${element.parent.prefixOfElement(bound.element)}${bound.element.name!}';
            } else if (p.bound != null) {
              return '${p.name} extends ${element.parent.prefixedType(p.bound!)}';
            } else {
              return '${p.name}';
            }
          }).toList();

      final flatDeclaration =
          flatBounds.isNotEmpty ? '<${flatBounds.join(', ')}>' : '';

      final condition = [
        for (final (i, bound) in deepBounds.indexed)
          if (bound != null)
            '<${element.element.typeParameters[i].name}>[] is List<$bound>',
      ].join(' && ');

      output.write('''
      @override
      Function get typeFactory => $flatDeclaration(f) => $condition ? _typeFactory${element.typeParams}(f) : f<${element.prefixedClassName}>();
      final Function _typeFactory = $impl
    ''');
    }
  }

  List<String> _getSuperHooks(ClassMapperElement element) {
    if (element.superElement == null) {
      return [];
    } else {
      var hook = element.superElement!.hookForElement;
      return [if (hook != null) hook, ..._getSuperHooks(element.superElement!)];
    }
  }

  Future<void> generateDiscriminatorFields(StringBuffer output) async {
    var prefix = element.parent.prefixOfElement(
      element.superElement!.annotation.element,
    );

    output.write('''
    
      @override
      final String discriminatorKey = '${element.superElement!.discriminatorKey ?? 'type'}';
      @override
      final dynamic discriminatorValue = ${(element.discriminatorValueCode) ?? "'${element.className}'"};
      @override
      late final ClassMapperBase superMapper = $prefix${element.superElement!.mapperName}.ensureInitialized();
      
    ''');
  }

  void generateInheritOverride(StringBuffer output) {
    var args = element.inheritedTypeArgs;
    if (args == null) {
      return;
    }
    output.write('''
      @override
      DecodingContext inherit(DecodingContext context) {
        return context.inherit(args: () => [${args.join(', ')}]);
      }
    ''');
  }

  Future<String> _generateConstructorCall() async {
    if (!element.hasCallableConstructor) {
      if (element.subElements.isNotEmpty && element.discriminatorKey != null) {
        return "throw MapperException.missingSubclass('${element.className}', '${element.discriminatorKey}', '\${data.value['${element.discriminatorKey}']}');";
      } else {
        return "throw MapperException.missingConstructor('${element.className}');";
      }
    } else {
      return 'return ${element.prefixedDecodingClassName}${element.constructor.element!.name != 'new' ? '.${element.constructor.element!.name}' : ''}(${await _generateConstructorParams()});';
    }
  }

  Future<String> _generateConstructorParams() async {
    List<String> params = [];
    for (var param in element.params) {
      var str = '';

      if (param.parameter.isNamed) {
        str = '${param.parameter.name ?? ''}: ';
      }
      str += 'data.dec(_f\$${param.accessor?.name ?? param.parameter.name})';

      params.add(str);
    }
    return params.join(', ');
  }

  void generateStaticDecoders(StringBuffer output) {
    if (!element.shouldGenerate(GenerateMethods.decode)) {
      return;
    }

    var fromJsonName = element.options.renameMethods['fromJson'] ?? 'fromJson';
    var fromMapName = element.options.renameMethods['fromMap'] ?? 'fromMap';

    output.write(
      '\n'
      '  static ${element.prefixedDecodingClassName}${element.typeParams} $fromMapName${element.typeParamsDeclaration}(Map<String, dynamic> map) {\n'
      '    return ensureInitialized().decodeMap<${element.prefixedDecodingClassName}${element.typeParams}>(map);\n'
      '  }\n'
      '  static ${element.prefixedDecodingClassName}${element.typeParams} $fromJsonName${element.typeParamsDeclaration}(String json) {\n'
      '    return ensureInitialized().decodeJson<${element.prefixedDecodingClassName}${element.typeParams}>(json);\n'
      '  }\n',
    );
  }
}
