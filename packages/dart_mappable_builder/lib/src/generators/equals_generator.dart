import 'package:dart_mappable/dart_mappable.dart';

import '../elements/class/target_class_mapper_element.dart';

class EqualsGenerator {
  EqualsGenerator(this.target);

  final TargetClassMapperElement target;

  String generateEqualsMixin() {
    if (target.shouldGenerate(GenerateMethods.equals) && !target.isAbstract) {
      return '  @override bool operator ==(Object other) => identical(this, other) || (runtimeType == other.runtimeType && ${target.uniqueClassName}Mapper.container.isEqual(this, other));\n'
          '  @override int get hashCode => ${target.uniqueClassName}Mapper.container.hash(this);\n';
    } else {
      return '';
    }
  }
}
