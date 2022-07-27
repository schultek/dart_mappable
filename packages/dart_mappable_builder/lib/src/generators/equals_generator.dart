import 'package:dart_mappable/dart_mappable.dart';

import '../config/class_mapper_config.dart';

class EqualsGenerator {
  String generateEqualsMethods(ClassMapperConfig config) {
    var generated = '';

    if (config.shouldGenerate(GenerateMethods.equals)) {
      if (!config.shouldGenerate(GenerateMethods.stringify)) {
        generated += '\n';
      }
      generated += ''
          '  @override int hash(${config.prefixedClassName} self) => ${_generateHashParams(config)};\n'
          '  @override bool equals(${config.prefixedClassName} self, ${config.prefixedClassName} other) => ${_generateEqualsParams(config)};\n'
          '';
    }
    return generated;
  }

  String _generateHashParams(ClassMapperConfig config) {
    List<String> params = [];

    for (var field in config.allPublicFields) {
      params.add('Mapper.hash(self.${field.name})');
    }

    if (params.isEmpty) {
      return '0';
    } else {
      return params.join(' ^ ');
    }
  }

  String _generateEqualsParams(ClassMapperConfig config) {
    List<String> params = [];

    for (var field in config.allPublicFields) {
      params.add('Mapper.isEqual(self.${field.name}, other.${field.name})');
    }

    if (params.isEmpty) {
      return 'true';
    } else {
      return params.join(' && ');
    }
  }
}
