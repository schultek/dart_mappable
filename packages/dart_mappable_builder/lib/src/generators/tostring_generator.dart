import 'package:dart_mappable/dart_mappable.dart';

import '../elements/class/target_class_mapper_element.dart';

class ToStringGenerator {
  ToStringGenerator(this.target);

  final TargetClassMapperElement target;

  String generateToStringMixin() {
    if (!target.shouldGenerate(GenerateMethods.stringify) ||
        target.isAbstract) {
      return '';
    }
    return '  @override\n'
        '  String toString() {\n'
        '    ${target.mapperName}.ensureInitialized();\n'
        '    return MapperContainer.globals.asString(this);\n'
        '  }\n';
  }
}
