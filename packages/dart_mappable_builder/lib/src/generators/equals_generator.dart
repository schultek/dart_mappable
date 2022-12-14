import 'package:dart_mappable/dart_mappable.dart';

import '../config/class_mapper_config.dart';

class EqualsGenerator {

  EqualsGenerator(this.config);

  final ClassMapperConfig config;

  String generateEqualsMethods() {
    var generated = '';

    if (config.shouldGenerate(GenerateMethods.equals)) {
      if (!config.shouldGenerate(GenerateMethods.stringify)) {
        generated += '\n';
      }
      generated += ''
          '  @override int hash(${config.prefixedClassName} self) => ${_generateHashParams()};\n'
          '  @override bool equals(${config.prefixedClassName} self, ${config.prefixedClassName} other) => ${_generateEqualsParams()};\n'
          '';
    }
    return generated;
  }

  String generateEqualsMixin() {
    if (config.shouldGenerate(GenerateMethods.equals) && !config.isAbstract) {
      return '  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && ${config.uniqueClassName}Mapper.container.isEqual(this, other));\n'
          '  @override int get hashCode => ${config.uniqueClassName}Mapper.container.hash(this);\n';
    } else {
      return '';
    }
  }

  String _generateHashParams() {
    List<String> params = [];

    for (var field in config.allPublicFields) {
      params.add('container.hash(self.${field.name})');
    }

    if (params.isEmpty) {
      return '0';
    } else {
      return params.join(' ^ ');
    }
  }

  String _generateEqualsParams() {
    List<String> params = [];

    for (var field in config.allPublicFields) {
      params.add('container.isEqual(self.${field.name}, other.${field.name})');
    }

    if (params.isEmpty) {
      return 'true';
    } else {
      return params.join(' && ');
    }
  }
}
