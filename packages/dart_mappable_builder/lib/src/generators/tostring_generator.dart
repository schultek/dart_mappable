import 'package:dart_mappable/dart_mappable.dart';

import '../config/class_mapper_config.dart';

class ToStringGenerator {
  ToStringGenerator(this.config);

  final ClassMapperConfig config;

  String generateToStringMethods() {
    if (config.shouldGenerate(GenerateMethods.stringify)) {
      return '\n'
          "  @override String stringify(${config.prefixedClassName} self) => '${config.className}(${_generateStringParams()})';\n"
          '';
    } else {
      return '';
    }
  }

  String generateToStringMixin() {
    if (config.shouldGenerate(GenerateMethods.stringify) && !config.isAbstract) {
      return '  @override String toString() => Mapper.asString(this);\n';
    } else {
      return '';
    }
  }

  String _generateStringParams() {
    List<String> params = [];

    for (var field in config.allPublicFields) {
      params.add('${field.name}: \${Mapper.asString(self.${field.name})}');
    }

    return params.join(', ');
  }
}
