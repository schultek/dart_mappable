import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../config/class_mapper_config.dart';
import '../config/parameter_config.dart';
import '../imports_builder.dart';

class EncoderGenerator {
  final ClassMapperConfig config;
  final ImportsBuilder imports;

  EncoderGenerator(this.config, this.imports);

  Future<String> generateEncoderMethods() async {
    if (config.shouldGenerate(GenerateMethods.encode)) {
      var paramName = config.className[0].toLowerCase();
      return '\n'
          '  @override Function get encoder => ${_generateEncoder(config)};\n'
          '  dynamic encode${config.typeParamsDeclaration}(${config.prefixedClassName}${config.typeParams} v) ${_generateEncode()}\n'
          '  Map<String, dynamic> toMap${config.typeParamsDeclaration}(${config.prefixedClassName}${config.typeParams} $paramName) => {${await _generateMappingEntries()}};\n'
          '';
    } else {
      return '';
    }
  }

  String generateEncoderExtensions() {
    return config.shouldGenerate(GenerateMethods.encode)
        ? '  String toJson() => Mapper.toJson(this);\n'
            '  Map<String, dynamic> toMap() => Mapper.toMap(this);\n'
        : '';
  }

  String _generateEncoder(ClassMapperConfig config, [String encode = 'encode',
      String? name]) {
    var wrapped = encode;
    if (config.superConfig != null &&
        config.superConfig!.hookForClass != null) {
      wrapped =
          '(${config.prefixedClassName}${config.typeParams} v) => const ${config.superConfig!.hookForClass}.encode<${name ?? config.prefixedClassName}>(v, (v) => $wrapped)';
    }
    if (config.superConfig != null) {
      wrapped = _generateEncoder(
          config.superConfig!, wrapped, name ?? config.prefixedClassName);
    }
    return wrapped;
  }

  String _generateEncode() {
    String call  = '=> toMap${config.typeParams}(v)';

    if (config.hookForClass != null) {
      call =
          '=> const ${config.hookForClass}.encode<${config.prefixedClassName}${config.typeParams}>(v, (v) $call)';
    }
    return call + (call.endsWith('}') ? '' : ';');
  }

  Future<String> _generateMappingEntries() async {
    List<String> params = [];

    var paramName = config.className[0].toLowerCase();

    for (var param in config.params) {
      if (param is UnresolvedParameterConfig) continue;

      var name = param.accessor.name;
      var type = param.accessor.type;

      var key = param.jsonKey(config.caseStyle);

      params.removeWhere((p) => p.startsWith("'$key':"));

      String exp;
      var hook = await param.getHook(imports);
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

    if (config.typeParams.isNotEmpty) {
      params.add('...Mapper.i.\$type<${config.prefixedClassName}${config.typeParams}>($paramName)');
    }

    return params.join(', ');
  }
}
