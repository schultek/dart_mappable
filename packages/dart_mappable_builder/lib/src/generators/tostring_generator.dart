import 'package:dart_mappable/dart_mappable.dart';

import '../config/class_mapper_config.dart';

class ToStringGenerator {
  String generateToStringMethods(ClassMapperConfig config) {
    if (config.shouldGenerate(GenerateMethods.stringify)) {
      return '\n'
          "  @override String stringify(${config.prefixedClassName} self) => '${config.className}(${_generateStringParams(config)})';\n"
          '';
    } else {
      return '';
    }
  }

  String _generateStringParams(ClassMapperConfig config) {
    List<String> params = [];

    for (var field in config.allPublicFields) {
      params.add('${field.name}: \${Mapper.asString(self.${field.name})}');
    }

    return params.join(', ');
  }
}
