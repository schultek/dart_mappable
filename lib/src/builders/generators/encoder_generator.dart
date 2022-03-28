import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';

import '../../../dart_mappable.dart';
import '../config/class_mapper_config.dart';

class EncoderGenerator {
  String generateEncoderMethods(ClassMapperConfig config) {
    if (config.shouldGenerate(GenerateMethods.encode)) {
      var paramName = config.className[0].toLowerCase();
      return '\n'
          '  @override Function get encoder => (${config.className} v) => ${_generateEncodeCall(config, 'encode(v)')};\n'
          '  dynamic encode(${config.className} v) ${_generateEncode(config)}\n'
          '  Map<String, dynamic> toMap(${config.className} $paramName) => {${_generateMappingEntries(config)}};\n'
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
          'const ${config.superConfig!.hookForClass}.encode<${name ?? config.className}>(v, (v) => $wrapped)';
    }
    if (config.superConfig != null) {
      wrapped = _generateEncodeCall(
          config.superConfig!, wrapped, name ?? config.className);
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
            'if (v is ${subMapper.className}) { return ${subMapper.mapperName}._().encode(v); }\n');
      }

      call = '{\n'
          '    ${subEncode.join('    else ')}'
          '    else { return toMap(v); }\n'
          '  }';
    }

    if (config.hookForClass != null) {
      call =
          '=> const ${config.hookForClass}.encode<${config.className}>(v, (v) $call)';
    }
    return call + (call.endsWith('}') ? '' : ';');
  }

  String _generateMappingEntries(ClassMapperConfig config) {
    List<String> params = [];

    PropertyAccessorElement? findGetter(String name, ClassMapperConfig mapper) {
      var g = mapper.element.getGetter(name);
      if (g != null) {
        return g;
      }
      if (mapper.superConfig != null) {
        return findGetter(name, mapper.superConfig!);
      }
      return null;
    }

    for (ParameterElement param in config.constructor?.parameters ?? []) {
      var name = param.name;

      DartType? type;

      if (param is FieldFormalParameterElement) {
        type = param.field!.type;
      } else {
        var getter = findGetter(name, config);
        if (getter != null) {
          type = getter.type.returnType;
        }
      }

      if (type != null) {
        var key = config.jsonKey(param);

        params.removeWhere((p) => p.startsWith("'$key':"));

        String exp;
        var paramName = config.className[0].toLowerCase();

        var hook = config.hookForParam(param);
        if (hook != null) {
          exp = 'Mapper.i.\$enc($paramName.$name, \'$name\', const $hook)';
        } else {
          exp = 'Mapper.i.\$enc($paramName.$name, \'$name\')';
        }

        if (config.ignoreNull &&
            param.type.nullabilitySuffix != NullabilitySuffix.none) {
          params.add("if ($exp != null) '$key': $exp");
        } else {
          params.add("'$key': $exp");
        }
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
