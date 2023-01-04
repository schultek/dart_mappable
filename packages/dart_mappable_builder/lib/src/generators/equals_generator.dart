import 'package:dart_mappable/dart_mappable.dart';

import '../elements/target_class_mapper_element.dart';

class EqualsGenerator {
  EqualsGenerator(this.target);

  final TargetClassMapperElement target;

  String generateEqualsMethods() {
    var generated = '';

    if (target.shouldGenerate(GenerateMethods.equals)) {
      if (!target.shouldGenerate(GenerateMethods.stringify)) {
        generated += '\n';
      }
      generated += ''
          '  @override int hash(${target.prefixedClassName} self) => ${_generateHashParams()};\n'
          '  @override bool equals(${target.prefixedClassName} self, ${target.prefixedClassName} other) => ${_generateEqualsParams()};\n'
          '';
    }
    return generated;
  }

  String generateEqualsMixin() {
    if (target.shouldGenerate(GenerateMethods.equals) && !target.isAbstract) {
      return '  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && ${target.uniqueClassName}Mapper.container.isEqual(this, other));\n'
          '  @override int get hashCode => ${target.uniqueClassName}Mapper.container.hash(this);\n';
    } else {
      return '';
    }
  }

  String _generateHashParams() {
    List<String> params = [];

    for (var field in target.allPublicFields) {
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

    for (var field in target.allPublicFields) {
      params.add('container.isEqual(self.${field.name}, other.${field.name})');
    }

    if (params.isEmpty) {
      return 'true';
    } else {
      return params.join(' && ');
    }
  }
}
