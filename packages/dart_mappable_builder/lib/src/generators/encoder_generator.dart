import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../elements/class_mapper_element.dart';
import '../elements/mapper_param_element.dart';

class EncoderGenerator {
  final ClassMapperElement target;

  EncoderGenerator(this.target);

  Future<String> generateEncoderMethods() async {
    if (target.shouldGenerate(GenerateMethods.encode)) {
      var paramName = target.className[0].toLowerCase();
      return '\n'
          '  @override Function get encoder => ${_generateEncoder(target)};\n'
          '  dynamic encode${target.typeParamsDeclaration}(${target.prefixedClassName}${target.typeParams} v) ${_generateEncode()}\n'
          '  Map<String, dynamic> toMap${target.typeParamsDeclaration}(${target.prefixedClassName}${target.typeParams} $paramName) => {${await _generateMappingEntries()}};\n'
          '';
    } else {
      return '';
    }
  }

  String generateEncoderMixin() {
    return target.shouldGenerate(GenerateMethods.encode)
        ? '  String toJson()${target.isAbstract ? '' : ' => ${target.uniqueClassName}Mapper.container.toJson(this as ${target.selfTypeParam})'};\n'
            '  Map<String, dynamic> toMap()${target.isAbstract ? '' : ' => ${target.uniqueClassName}Mapper.container.toMap(this as ${target.selfTypeParam})'};\n'
        : '';
  }

  String generateEncoderExtensions() {
    return target.shouldGenerate(GenerateMethods.encode)
        ? '  String toJson() => ${target.uniqueClassName}Mapper.container.toJson(this);\n'
            '  Map<String, dynamic> toMap() => ${target.uniqueClassName}Mapper.container.toMap(this);\n'
        : '';
  }

  String _generateEncoder(ClassMapperElement config,
      [String encode = 'encode', String? name]) {
    var wrapped = encode;
    if (config.superTarget != null &&
        config.superTarget!.hookForClass != null) {
      wrapped =
          '(${config.prefixedClassName}${config.typeParams} v) => const ${config.superTarget!.hookForClass}.encode<${name ?? config.prefixedClassName}>(v, (v) => $wrapped)';
    }
    if (config.superTarget != null) {
      wrapped = _generateEncoder(
          config.superTarget!, wrapped, name ?? config.prefixedClassName);
    }
    return wrapped;
  }

  String _generateEncode() {
    String call = '=> toMap${target.typeParams}(v)';

    if (target.hookForClass != null) {
      call =
          '=> const ${target.hookForClass}.encode<${target.prefixedClassName}${target.typeParams}>(v, (v) $call)';
    }
    return call + (call.endsWith('}') ? '' : ';');
  }

  Future<String> _generateMappingEntries() async {
    List<String> params = [];

    var paramName = target.className[0].toLowerCase();

    for (var param in target.params) {
      if (param is UnresolvedParamElement) continue;

      var name = param.accessor.name;
      var type = param.accessor.type;

      var key = param.jsonKey(target.caseStyle);

      params.removeWhere((p) => p.startsWith("'$key':"));

      String exp;
      var hook = await param.getHook();
      if (hook != null) {
        exp = 'container.\$enc($paramName.$name, \'$name\', const $hook)';
      } else {
        exp = 'container.\$enc($paramName.$name, \'$name\')';
      }

      if (target.ignoreNull &&
          type.nullabilitySuffix != NullabilitySuffix.none) {
        params.add("if ($exp != null) '$key': $exp");
      } else {
        params.add("'$key': $exp");
      }
    }

    if (target.superTarget != null &&
        target.superTarget!.discriminatorKey != null &&
        target.discriminatorValueCode != null &&
        target.discriminatorValueCode != 'default') {
      if (!params.any(
          (p) => p.contains("'${target.superTarget!.discriminatorKey}':"))) {
        if (target.discriminatorValueCode!.startsWith('[') &&
            target.discriminatorValueCode!.endsWith(']')) {
          var value = target.discriminatorValueCode!
              .substring(1, target.discriminatorValueCode!.length - 1)
              .split(',')
              .first
              .trim();
          params.add("'${target.superTarget!.discriminatorKey}': $value");
        } else {
          params.add(
              "'${target.superTarget!.discriminatorKey}': ${target.discriminatorValueCode}");
        }
      }
    }

    if (target.typeParams.isNotEmpty) {
      params.add(
          '...container.\$type<${target.prefixedClassName}${target.typeParams}>($paramName)');
    }

    return params.join(', ');
  }
}
