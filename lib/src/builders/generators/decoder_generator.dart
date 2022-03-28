import 'package:analyzer/dart/ast/ast.dart';

import '../../../dart_mappable.dart';
import '../config/class_mapper_config.dart';
import '../utils.dart';

class DecoderGenerator {
  String generateDecoderMethods(ClassMapperConfig config) {
    if (config.shouldGenerate(GenerateMethods.decode)) {
      return '\n'
          '  @override Function get decoder => ${_generateDecoder(config)};\n'
          '  ${config.className}${config.typeParams} decode${config.typeParamsDeclaration}(dynamic v) => ${_generateFromMapCall(config)};\n'
          '  ${config.className}${config.typeParams} fromMap${config.typeParamsDeclaration}(Map<String, dynamic> map) => ${_generateFromMap(config)}\n';
    } else {
      return '';
    }
  }

  String generateTypeFactory(ClassMapperConfig config) {
    if (config.shouldGenerate(GenerateMethods.decode)) {
      return '\n'
          '  @override Function get typeFactory => ${config.typeParamsDeclaration}(f) => f<${config.className}${config.typeParams}>();\n';
    } else {
      return '';
    }
  }

  String _generateDecoder(ClassMapperConfig config, [String fn = 'decode']) {
    var wrapped = fn;
    if (config.superConfig != null &&
        config.superConfig!.hookForClass != null) {
      wrapped =
          '(v) => const ${config.superConfig!.hookForClass}.decode(v, $wrapped)';
    }
    if (config.superConfig != null) {
      wrapped = _generateDecoder(config.superConfig!, wrapped);
    }
    return wrapped;
  }

  String _generateFromMapCall(ClassMapperConfig config) {
    var call = '';

    if (config.subConfigs.isEmpty || config.discriminatorKey == null) {
      call = '=> fromMap${config.typeParams}(map)';
    } else {
      call = '{\n'
          "    switch(map['${config.discriminatorKey}']) {\n"
          '      ${_generateTypeCases(config).join('\n      ')}\n'
          '    }\n'
          '  }';
    }

    call = 'checked(v, (Map<String, dynamic> map) $call)';
    if (config.hookForClass != null) {
      call = 'const ${config.hookForClass}.decode(v, (v) => $call)';
    }
    return call;
  }

  List<String> _generateTypeCases(ClassMapperConfig config) {
    var cases = _getDiscriminatorCases(config);

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
          'case ${c.key.last}: return ${c.value}._().decode(map)${config.typeParams.isNotEmpty ? ' as ${config.className}${config.typeParams}' : ''};');
    }
    if (defaultCase != null) {
      statements.add(
          'default: return $defaultCase._().decode(map)${config.typeParams.isNotEmpty ? ' as ${config.className}${config.typeParams}' : ''};');
    } else {
      statements.add('default: return fromMap${config.typeParams}(map);');
    }

    return statements;
  }

  List<MapEntry<List<String>, String>> _getDiscriminatorCases(
      ClassMapperConfig config) {
    var cases = <MapEntry<List<String>, String>>[];

    for (var subConfig in config.subConfigs) {
      if (subConfig.discriminatorValueCode != null) {
        if (subConfig.discriminatorValueCode!.startsWith('[') &&
            subConfig.discriminatorValueCode!.endsWith(']')) {
          cases.add(MapEntry(
              subConfig.discriminatorValueCode!
                  .substring(1, subConfig.discriminatorValueCode!.length - 1)
                  .split(',')
                  .map((s) => s.trim())
                  .toList(),
              subConfig.mapperName));
        } else {
          cases.add(MapEntry(
              [subConfig.discriminatorValueCode!], subConfig.mapperName));
        }
      } else {
        var subCases = _getDiscriminatorCases(subConfig);
        if (subCases.isNotEmpty) {
          cases.add(MapEntry(
              subCases.expand((e) => e.key).toList(), subConfig.mapperName));
        }
      }
    }

    return cases;
  }

  String _generateFromMap(ClassMapperConfig config) {
    if (!config.hasCallableConstructor) {
      if (config.subConfigs.isNotEmpty && config.discriminatorKey != null) {
        return "throw MapperException.missingSubclass('${config.className}', '${config.discriminatorKey}', '\${map['${config.discriminatorKey}']}');";
      } else {
        return "throw const MapperException.missingConstructor('${config.className}');";
      }
    } else {
      return '${config.className}${config.constructor!.name != '' ? '.${config.constructor!.name}' : ''}(${_generateConstructorParams(config)});';
    }
  }

  String _generateConstructorParams(ClassMapperConfig config) {
    List<String> params = [];
    for (var param in config.constructor!.parameters) {
      var str = '';

      if (param.isNamed) {
        str = '${param.name}: ';
      }

      str += 'Mapper.i.\$get';

      if (param.type.isDynamic || param.isOptional || param.type.isNullable) {
        str += 'Opt';
      }

      var args = ['map', "'${config.jsonKey(param)}'"];

      var hook = config.hookForParam(param);

      if (hook != null) {
        args.add('const $hook');
      }

      str += "(${args.join(', ')})";

      if (param.hasDefaultValue && param.defaultValueCode != 'null') {
        str += ' ?? ${param.defaultValueCode}';
      } else {
        var node = param.getNode();
        if (node is DefaultFormalParameter &&
            node.defaultValue.toString() != 'null') {
          str += ' ?? ${node.defaultValue}';
        }
      }

      params.add(str);
    }
    return params.join(', ');
  }
}
