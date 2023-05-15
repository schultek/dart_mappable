import 'package:dart_mappable/dart_mappable.dart';

import '../elements/class/target_class_mapper_element.dart';

class EncoderGenerator {
  EncoderGenerator(this.element);

  final TargetClassMapperElement element;

  late final toJsonName = element.options.renameMethods['toJson'] ?? 'toJson';
  late final toMapName = element.options.renameMethods['toMap'] ?? 'toMap';

  String generateEncoderMixin() {
    if (!element.shouldGenerate(GenerateMethods.encode)) {
      return '';
    }
    if (element.isAbstract) {
      return '''
        String $toJsonName();
        Map<String, dynamic> $toMapName();
      ''';
    }
    return '''
      String $toJsonName() {
        return ${element.mapperName}._guard((c) => c.toJson(this as ${element.selfTypeParam}));
      }
      Map<String, dynamic> $toMapName() {
        return ${element.mapperName}.ensureInitialized().encode(this as ${element.selfTypeParam}) as Map<String, dynamic>;
      }
    ''';
  }

  String generateEncoderExtensions() {
    if (!element.shouldGenerate(GenerateMethods.encode)) {
      return '';
    }
    return '''
      String $toJsonName() {
        return ${element.mapperName}._guard((c) => c.toJson(this));
      }
      Map<String, dynamic> $toMapName() {
        return ${element.mapperName}._guard((c) => c.toMap(this));
      }
    ''';
  }
}
