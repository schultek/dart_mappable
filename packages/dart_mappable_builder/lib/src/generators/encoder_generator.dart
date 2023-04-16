import 'package:dart_mappable/dart_mappable.dart';

import '../elements/class/target_class_mapper_element.dart';

class EncoderGenerator {
  EncoderGenerator(this.element);

  final TargetClassMapperElement element;

  String generateEncoderMixin() {
    if (!element.shouldGenerate(GenerateMethods.encode)) {
      return '';
    }
    if (element.isAbstract) {
      return '''
        String toJson();
        Map<String, dynamic> toMap();
      ''';
    }
    return '''
      String toJson() {
        return ${element.mapperName}._guard((c) => c.toJson(this as ${element.selfTypeParam}));
      }
      Map<String, dynamic> toMap() {
        return ${element.mapperName}._guard((c) => c.toMap(this as ${element.selfTypeParam}));
      }
    ''';
  }

  String generateEncoderExtensions() {
    if (!element.shouldGenerate(GenerateMethods.encode)) {
      return '';
    }
    return '''
      String toJson() {
        return ${element.mapperName}._guard((c) => c.toJson(this));
      }
      Map<String, dynamic> toMap() {
        return ${element.mapperName}._guard((c) => c.toMap(this));
      }
    ''';
  }
}
