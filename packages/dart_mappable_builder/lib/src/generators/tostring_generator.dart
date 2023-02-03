import 'package:dart_mappable/dart_mappable.dart';

import '../elements/class/target_class_mapper_element.dart';

class ToStringGenerator {
  ToStringGenerator(this.target);

  final TargetClassMapperElement target;

  String generateToStringMixin() {
    if (target.shouldGenerate(GenerateMethods.stringify) &&
        !target.isAbstract) {
      return '  @override String toString() => ${target.uniqueClassName}Mapper.container.asString(this);\n';
    } else {
      return '';
    }
  }
}
