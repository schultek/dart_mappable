import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../elements/class_mapper_element.dart';
import '../utils.dart';

class DecoderGenerator {
  final ClassMapperElement element;

  DecoderGenerator(this.element);

  Future<String> generateDecoderMethods() async {
    if (element.shouldGenerate(GenerateMethods.decode)) {
      return '\n'
          '  @override Function get decoder => ${_generateDecoder(element)};\n'
          '  ${element.prefixedClassName}${element.typeParams} decode${element.typeParamsDeclaration}(dynamic v) => ${_generateFromMapCall()};\n'
          '  ${element.prefixedClassName}${element.typeParams} fromMap${element.typeParamsDeclaration}(Map<String, dynamic> map) => ${await _generateFromMap()}\n';
    } else {
      return '';
    }
  }

  String generateTypeFactory() {
    if (element.shouldGenerate(GenerateMethods.decode)) {
      return '\n'
          '${element.className != element.uniqueClassName ? '  @override String get id => \'${element.uniqueClassName}\';\n' : ''}'
          '  @override Function get typeFactory => ${element.typeParamsDeclaration}(f) => f<${element.prefixedClassName}${element.typeParams}>();\n';
    } else {
      return '';
    }
  }

  String _generateDecoder(ClassMapperElement config, [String fn = 'decode']) {
    var wrapped = fn;
    if (config.superTarget != null &&
        config.superTarget!.hookForClass != null) {
      wrapped =
          '(v) => const ${config.superTarget!.hookForClass}.decode(v, $wrapped)';
    }
    if (config.superTarget != null) {
      wrapped = _generateDecoder(config.superTarget!, wrapped);
    }
    return wrapped;
  }

  String _generateFromMapCall() {
    var call = '';

    if (element.subTargets.isEmpty || element.discriminatorKey == null) {
      call = '=> fromMap${element.typeParams}(map)';
    } else {
      call = '{\n'
          "    switch(map['${element.discriminatorKey}']) {\n"
          '      ${_generateTypeCases().join('\n      ')}\n'
          '    }\n'
          '  }';
    }

    call = 'checkedType(v, (Map<String, dynamic> map) $call)';
    if (element.hookForClass != null) {
      call = 'const ${element.hookForClass}.decode(v, (v) => $call)';
    }
    return call;
  }

  List<String> _generateTypeCases() {
    var cases = _getDiscriminatorCases(element);

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

  List<MapEntry<List<String>, String>> _getDiscriminatorCases(
      ClassMapperElement element) {
    var cases = <MapEntry<List<String>, String>>[];

    for (var subConfig in element.subTargets) {
      var subConfigMapper =
          '${element.parent.prefixOfElement(subConfig.element)}${subConfig.uniqueClassName}Mapper';
      if (subConfig.discriminatorValueCode != null) {
        if (subConfig.discriminatorValueCode!.startsWith('[') &&
            subConfig.discriminatorValueCode!.endsWith(']')) {
          cases.add(MapEntry(
              subConfig.discriminatorValueCode!
                  .substring(1, subConfig.discriminatorValueCode!.length - 1)
                  .split(',')
                  .map((s) => s.trim())
                  .toList(),
              subConfigMapper));
        } else {
          cases.add(
              MapEntry([subConfig.discriminatorValueCode!], subConfigMapper));
        }
      } else {
        var subCases = _getDiscriminatorCases(subConfig);
        if (subCases.isNotEmpty) {
          cases.add(MapEntry(
              subCases.expand((e) => e.key).toList(), subConfigMapper));
        }
      }
    }

    return cases;
  }

  Future<String> _generateFromMap() async {
    if (!element.hasCallableConstructor) {
      if (element.subTargets.isNotEmpty && element.discriminatorKey != null) {
        return "throw MapperException.missingSubclass('${element.className}', '${element.discriminatorKey}', '\${map['${element.discriminatorKey}']}');";
      } else {
        return "throw MapperException.missingConstructor('${element.className}');";
      }
    } else {
      return '${element.prefixedClassName}${element.constructor!.name != '' ? '.${element.constructor!.name}' : ''}(${await _generateConstructorParams()});';
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
      str += 'container.\$get';
      if (p.type.isDynamic || p.isOptional || p.type.isNullable) {
        str += 'Opt';
      }

      var args = ['map', "'${param.jsonKey(element.caseStyle)}'"];

      var hook = await param.getHook();
      if (hook != null) {
        args.add('const $hook');
      }

      str += "(${args.join(', ')})";

      if (p.hasDefaultValue && p.defaultValueCode != 'null') {
        str += ' ?? ${await getPrefixedDefaultValue(p)}';
      } else {
        var node = p.getNode();
        if (node is DefaultFormalParameter &&
            node.defaultValue.toString() != 'null') {
          str += ' ?? ${node.defaultValue}';
        }
      }

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
