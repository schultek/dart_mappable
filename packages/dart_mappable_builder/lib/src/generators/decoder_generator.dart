import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';

import '../elements/class/class_mapper_element.dart';
import '../elements/class/target_class_mapper_element.dart';
import '../utils.dart';

class DecoderGenerator {
  final TargetClassMapperElement element;

  DecoderGenerator(this.element);

  Future<String> generateInstantiateMethod() async {
    var s = '\n';

    if (element.hookForClass != null) {
      s += '  @override\n'
          '  final MappingHook hook = const ${element.hookForClass};\n';
    }

    var superHooks = _getSuperHooks(element);
    if (superHooks.isNotEmpty) {
      s += '  @override\n'
          '  final MappingHook superHook = const ${superHooks.length == 1 ? superHooks.first : 'ChainedHook([${superHooks.join(', ')}])'};\n\n';
    }

    s +=
        '  static ${element.prefixedDecodingClassName}${element.typeParams} _instantiate${element.typeParamsDeclaration}(DecodingData data) {\n'
        '    ${await _generateConstructorCall()}\n'
        '  }\n'
        '  @override\n'
        '  final Function instantiate = _instantiate;\n';

    return s;
  }

  String generateTypeFactory() {
    return '  @override\n'
        '  Function get typeFactory => ${element.typeParamsDeclaration}(f) => f<${element.prefixedClassName}${element.typeParams}>();\n';
  }

  List<String> _getSuperHooks(ClassMapperElement element) {
    if (element.superTarget == null) {
      return [];
    } else {
      return [
        if (element.superTarget!.hookForClass != null)
          element.superTarget!.hookForClass!,
        ..._getSuperHooks(element.superTarget!)
      ];
    }
  }

  Future<String> generateDiscriminatorFields() async {
    return '\n'
        '  @override\n'
        "  final String discriminatorKey = '${element.superTarget!.discriminatorKey ?? 'type'}';\n"
        '  final dynamic discriminatorValue = ${(await element.discriminatorValueCode) ?? "'${element.className}'"};\n';
  }

  Future<String> _generateConstructorCall() async {
    if (!element.hasCallableConstructor) {
      if (element.subTargets.isNotEmpty && element.discriminatorKey != null) {
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

      var p = param.parameter;

      if (p.isNamed) {
        str = '${p.name}: ';
      }
      str += 'data.get(#${p.name})';

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
}
