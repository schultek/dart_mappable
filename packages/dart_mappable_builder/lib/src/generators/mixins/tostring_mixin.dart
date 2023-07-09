import 'package:dart_mappable/dart_mappable.dart';

import '../../elements/class/target_class_mapper_element.dart';
import '../generator.dart';

mixin ToStringMixin on MapperGenerator<TargetClassMapperElement> {
  String generateToStringMixin() {
    if (!element.shouldGenerate(GenerateMethods.stringify) ||
        element.isAbstract) {
      return '';
    }

    return '''
      @override
      String toString() {
        return ${element.mapperName}.ensureInitialized().stringifyValue(this as ${element.selfTypeParam});
      }
    ''';
  }
}
