import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../config/class_mapper_config.dart';
import '../config/parameter_config.dart';

class EncoderGenerator {
  String generateEncoderMethods(ClassMapperConfig config) {
    if (config.shouldGenerate(GenerateMethods.encode)) {
      var paramName = config.className[0].toLowerCase();
      return '\n'
          '  @override Function get encoder => (${config.prefixedClassName} v) => ${_generateEncodeCall(config, 'encode(v)')};\n'
          '  dynamic encode(${config.prefixedClassName} v) ${_generateEncode(config)}\n'
          '  Map<String, dynamic> toMap(${config.prefixedClassName} $paramName) => {${_generateMappingEntries(config)}};\n'
          '';
    } else {
      return '';
    }
  }

  String generateEncoderExtensions(ClassMapperConfig config) {
    return config.shouldGenerate(GenerateMethods.encode)
        ? '  String toJson() => Mapper.toJson(this);\n'
            '  Map<String, dynamic> toMap() => Mapper.toMap(this);\n'
        : '';
  }

  String _generateEncodeCall(ClassMapperConfig config, String encode,
      [String? name]) {
    var wrapped = encode;
    if (config.superConfig != null &&
        config.superConfig!.hookForClass != null) {
      wrapped =
          'const ${config.superConfig!.hookForClass}.encode<${name ?? config.prefixedClassName}>(v, (v) => $wrapped)';
    }
    if (config.superConfig != null) {
      wrapped = _generateEncodeCall(
          config.superConfig!, wrapped, name ?? config.prefixedClassName);
    }
    return wrapped;
  }

  String _generateEncode(ClassMapperConfig config) {
    String call;
    if (config.subConfigs.isEmpty) {
      call = '=> toMap(v)';
    } else {
      var subEncode = [];

      for (var subMapper in config.subConfigs) {
        subEncode.add(
            'if (v is ${subMapper.prefixedClassName}) { return ${subMapper.mapperName}._().encode(v); }\n');
      }

      call = '{\n'
          '    ${subEncode.join('    else ')}'
          '    else { return toMap(v); }\n'
          '  }';
    }

    if (config.hookForClass != null) {
      call =
          '=> const ${config.hookForClass}.encode<${config.prefixedClassName}>(v, (v) $call)';
    }
    return call + (call.endsWith('}') ? '' : ';');
  }

  String _generateMappingEntries(ClassMapperConfig config) {
    List<String> params = [];

    for (var param in config.params) {
      if (param is UnresolvedParameterConfig) continue;

      var name = param.accessor.name;
      var type = param.accessor.type;

      var key = param.jsonKey(config.caseStyle);

      params.removeWhere((p) => p.startsWith("'$key':"));

      String exp;
      var paramName = config.className[0].toLowerCase();

      var hook = param.hook;
      if (hook != null) {
        exp = 'Mapper.i.\$enc($paramName.$name, \'$name\', const $hook)';
      } else {
        exp = 'Mapper.i.\$enc($paramName.$name, \'$name\')';
      }

      if (config.ignoreNull &&
          type.nullabilitySuffix != NullabilitySuffix.none) {
        params.add("if ($exp != null) '$key': $exp");
      } else {
        params.add("'$key': $exp");
      }
    }

    if (config.superConfig != null &&
        config.superConfig!.discriminatorKey != null &&
        config.discriminatorValueCode != null &&
        config.discriminatorValueCode != 'default') {
      if (!params.any(
          (p) => p.contains("'${config.superConfig!.discriminatorKey}':"))) {
        if (config.discriminatorValueCode!.startsWith('[') &&
            config.discriminatorValueCode!.endsWith(']')) {
          var value = config.discriminatorValueCode!
              .substring(1, config.discriminatorValueCode!.length - 1)
              .split(',')
              .first
              .trim();
          params.add("'${config.superConfig!.discriminatorKey}': $value");
        } else {
          params.add(
              "'${config.superConfig!.discriminatorKey}': ${config.discriminatorValueCode}");
        }
      }
    }

    return params.join(', ');
  }
}
