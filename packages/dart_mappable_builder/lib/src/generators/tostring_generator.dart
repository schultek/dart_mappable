import 'package:dart_mappable/dart_mappable.dart';

import '../elements/class_mapper_element.dart';

class ToStringGenerator {
  ToStringGenerator(this.target);

  final ClassMapperElement target;

  String generateToStringMethods() {
    if (target.shouldGenerate(GenerateMethods.stringify)) {
      return '\n'
          "  @override String stringify(${target.prefixedClassName} self) => '${target.className}(${_generateStringParams()})';\n"
          '';
    } else {
      return '';
    }
  }

  String generateToStringMixin() {
    if (target.shouldGenerate(GenerateMethods.stringify) && !target.isAbstract) {
      return '  @override String toString() => ${target.uniqueClassName}Mapper.container.asString(this);\n';
    } else {
      return '';
    }
  }

  String _generateStringParams() {
    List<String> params = [];

    for (var field in target.allPublicFields) {
      params.add('${field.name}: \${container.asString(self.${field.name})}');
    }

    return params.join(', ');
  }
}
