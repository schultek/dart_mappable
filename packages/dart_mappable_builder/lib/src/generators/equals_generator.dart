import 'package:dart_mappable/dart_mappable.dart';

import '../elements/class/target_class_mapper_element.dart';

class EqualsGenerator {
  EqualsGenerator(this.target);

  final TargetClassMapperElement target;

  String generateEqualsMixin() {
    if (!target.shouldGenerate(GenerateMethods.equals) || target.isAbstract) {
      return '';
    }
    return '  @override\n'
        '  bool operator ==(Object other) {\n'
        '    ${target.mapperName}.ensureInitialized();\n'
        '    return identical(this, other) || (runtimeType == other.runtimeType && MapperContainer.globals.isEqual(this, other));\n'
        '  }\n'
        '  @override\n'
        '  int get hashCode {\n'
        '    ${target.mapperName}.ensureInitialized();\n'
        '    return MapperContainer.globals.hash(this);\n'
        '  }\n';
  }
}
