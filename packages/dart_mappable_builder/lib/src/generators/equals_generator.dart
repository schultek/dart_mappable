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
        '    return identical(this, other) || ('
        '      runtimeType == other.runtimeType && '
        '      ${target.mapperName}._guard((c) => c.isEqual(this, other)));\n'
        '  }\n'
        '  @override\n'
        '  int get hashCode {\n'
        '    return ${target.mapperName}._guard((c) => c.hash(this));\n'
        '  }\n';
  }
}
