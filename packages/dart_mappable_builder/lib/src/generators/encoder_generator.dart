import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../elements/class/class_mapper_element.dart';
import '../elements/mapper_param_element.dart';
import '../elements/class/target_class_mapper_element.dart';

class EncoderGenerator {
  final TargetClassMapperElement target;

  EncoderGenerator(this.target);

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

    var discriminatorValueCode = await target.discriminatorValueCode;

    if (target.superTarget != null &&
        target.superTarget!.discriminatorKey != null &&
        discriminatorValueCode != null &&
        discriminatorValueCode != 'default') {
      if (!params.any(
          (p) => p.contains("'${target.superTarget!.discriminatorKey}':"))) {
        if (discriminatorValueCode.startsWith('[') &&
            discriminatorValueCode.endsWith(']')) {
          var value = discriminatorValueCode
              .substring(1, discriminatorValueCode.length - 1)
              .split(',')
              .first
              .trim();
          params.add("'${target.superTarget!.discriminatorKey}': $value");
        } else {
          params.add(
              "'${target.superTarget!.discriminatorKey}': $discriminatorValueCode");
        }
      }
    }

    return params.join(', ');
  }
}
