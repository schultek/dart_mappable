import 'package:analyzer/dart/element/element.dart';

import '../../../dart_mappable.dart';
import '../config/class_mapper_config.dart';

class EqualsGenerator {
  String generateEqualsMethods(ClassMapperConfig config) {
    var generated = '';

    if (config.shouldGenerate(GenerateMethods.equals)) {
      if (!config.shouldGenerate(GenerateMethods.stringify)) {
        generated += '\n';
      }
      generated += ''
          '  @override int hash(${config.className} self) => ${_generateHashParams(config)};\n'
          '  @override bool equals(${config.className} self, ${config.className} other) => ${_generateEqualsParams(config)};\n'
          '';
    }
    return generated;
  }

  String _generateHashParams(ClassMapperConfig config) {
    List<String> params = [];
    for (ParameterElement param in config.constructor?.parameters ?? []) {
      if (param is FieldFormalParameterElement || config.hasField(param.name)) {
        params.add('Mapper.hash(self.${param.name})');
      } else if (config.superConfig != null &&
          config.superParams[param.name] != null) {
        params.add('Mapper.hash(self.${config.superParams[param.name]!.name})');
      }
    }

    if (params.isEmpty) {
      return 'self.hashCode';
    } else {
      return params.join(' ^ ');
    }
  }

  String _generateEqualsParams(ClassMapperConfig config) {
    List<String> params = [];
    for (ParameterElement param in config.constructor?.parameters ?? []) {
      if (param is FieldFormalParameterElement || config.hasField(param.name)) {
        params.add('Mapper.isEqual(self.${param.name}, other.${param.name})');
      } else if (config.superConfig != null &&
          config.superParams[param.name] != null) {
        params.add(
            'Mapper.isEqual(self.${config.superParams[param.name]!.name}, other.${config.superParams[param.name]!.name})');
      }
    }
    if (params.isEmpty) {
      return 'true';
    } else {
      return params.join(' && ');
    }
  }
}
