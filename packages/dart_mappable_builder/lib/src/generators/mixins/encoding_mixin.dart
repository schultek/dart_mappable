import 'package:dart_mappable/dart_mappable.dart';

import '../../elements/class/target_class_mapper_element.dart';
import '../generator.dart';

mixin EncodingMixin on MapperGenerator<TargetClassMapperElement> {
  late final toJsonName = element.options.renameMethods['toJson'] ?? 'toJson';
  late final toMapName = element.options.renameMethods['toMap'] ?? 'toMap';

  void generateEncoderMixin(StringBuffer output) {
    if (!element.shouldGenerate(GenerateMethods.encode)) {
      return;
    }
    if (element.isAbstract) {
      output.write('''
        String $toJsonName();
        Map<String, dynamic> $toMapName();
      ''');
      return;
    }
    output.write('''
      String $toJsonName() {
        return ${element.mapperName}.ensureInitialized().encodeJson<${element.selfTypeParam}>(this as ${element.selfTypeParam});
      }
      Map<String, dynamic> $toMapName() {
        return ${element.mapperName}.ensureInitialized().encodeMap<${element.selfTypeParam}>(this as ${element.selfTypeParam});
      }
    ''');
  }

  void generateEncoderExtensions(StringBuffer output) {
    if (!element.shouldGenerate(GenerateMethods.encode)) {
      return;
    }
    output.write('''
      String $toJsonName() {
        return ${element.mapperName}.ensureInitialized().encodeJson<${element.selfTypeParam}>(this);
      }
      Map<String, dynamic> $toMapName() {
        return ${element.mapperName}.ensureInitialized().encodeMap<${element.selfTypeParam}>(this);
      }
    ''');
  }
}
