import 'package:dart_mappable/dart_mappable.dart';

import '../elements/class/target_class_mapper_element.dart';

class EqualsGenerator {
  EqualsGenerator(this.element);

  final TargetClassMapperElement element;

  String generateEqualsMixin() {
    if (!element.shouldGenerate(GenerateMethods.equals) || element.isAbstract) {
      return '';
    }

    return '''
      @override
      bool operator ==(Object other) {
        return identical(this, other) || (
          runtimeType == other.runtimeType && 
          ${element.mapperName}.ensureInitialized().isValueEqual(this as ${element.selfTypeParam}, other)
        );
      }
      
      @override
      int get hashCode {
        return ${element.mapperName}.ensureInitialized().hashValue(this as ${element.selfTypeParam});
      }
    ''';
  }
}
