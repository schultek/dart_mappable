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

  Future<String> generateCanDecodeMethod() async {
    return '\n'
        '  @override\n'
        '  bool canDecode(DecodingOptions<Map<String, dynamic>> options) {\n'
        '    ${await _generateDecodePredicateCall()};\n'
        '  }\n';
  }

  Future<String> _generateDecodePredicateCall() async {
    if (element.isDefaultDiscriminator) {
      return 'return true';
    }

    var value = await element.discriminatorValueCode;

    if (value != null) {
      var isList = value.startsWith('[') && value.endsWith(']');
      if (isList) {
        return "return $value.contains(options.value['${element.superTarget!.discriminatorKey}'])";
      } else {
        return "return options.value['${element.superTarget!.discriminatorKey}'] == $value";
      }
    } else {
      return 'throw "TODO"';
    }
  }

  /*

  if (element.subTargets.isNotEmpty && element.discriminatorKey != null) {
      "switch(map['${element.discriminatorKey}']) {\n"
      '      ${(await _generateTypeCases()).join('\n      ')}\n'
      '    }\n'

   */

  Future<List<String>> _generateTypeCases() async {
    var cases = await _getDiscriminatorCases(element);

    String? defaultCase;

    var sortedCases = <MapEntry<List<String>, String>>[];

    for (var c in cases) {
      if (c.key.contains('default')) {
        defaultCase = c.value;
      } else {
        sortedCases.add(MapEntry(c.key..sort(), c.value));
      }
    }
    sortedCases.sort((a, b) => a.key.first.compareTo(b.key.first));

    var statements = <String>[];

    for (var c in sortedCases) {
      c.key.take(c.key.length - 1).forEach((s) => statements.add('case $s:'));
      statements.add(
          'case ${c.key.last}: return ${c.value}().createElement(container).decode(map)${element.typeParams.isNotEmpty ? ' as ${element.prefixedClassName}${element.typeParams}' : ''};');
    }
    if (defaultCase != null) {
      statements.add(
          'default: return $defaultCase().createElement(container).decode(map)${element.typeParams.isNotEmpty ? ' as ${element.prefixedClassName}${element.typeParams}' : ''};');
    } else {
      statements.add('default: return fromMap${element.typeParams}(map);');
    }

    return statements;
  }

  Future<List<MapEntry<List<String>, String>>> _getDiscriminatorCases(
      ClassMapperElement element) async {
    var cases = <MapEntry<List<String>, String>>[];

    for (var subConfig in element.subTargets) {
      var subConfigMapper =
          '${element.parent.prefixOfElement(subConfig.element)}${subConfig.uniqueClassName}Mapper';
      var discriminatorValueCode = await subConfig.discriminatorValueCode;

      if (discriminatorValueCode != null) {
        if (discriminatorValueCode.startsWith('[') &&
            discriminatorValueCode.endsWith(']')) {
          cases.add(MapEntry(
              discriminatorValueCode
                  .substring(1, discriminatorValueCode.length - 1)
                  .split(',')
                  .map((s) => s.trim())
                  .toList(),
              subConfigMapper));
        } else {
          cases.add(MapEntry([discriminatorValueCode], subConfigMapper));
        }
      } else {
        var subCases = await _getDiscriminatorCases(subConfig);
        if (subCases.isNotEmpty) {
          cases.add(MapEntry(
              subCases.expand((e) => e.key).toList(), subConfigMapper));
        }
      }
    }

    return cases;
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
