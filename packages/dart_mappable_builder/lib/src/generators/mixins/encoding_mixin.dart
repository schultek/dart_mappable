import 'package:dart_mappable/dart_mappable.dart';

import '../../elements/class/target_class_mapper_element.dart';
import '../generator.dart';

mixin EncodingMixin on MapperGenerator<TargetClassMapperElement> {
  late final toJsonName = element.options.renameMethods['toJson'] ?? 'toJson';
  late final toMapName = element.options.renameMethods['toMap'] ?? 'toMap';
  late final toShallowMapName = element.options.renameMethods['toShallowMap'] ?? 'toShallowMap';

  void generateEncoderMixin(StringBuffer output) {
    if (!element.shouldGenerate(GenerateMethods.encode)) {
      return;
    }
    if (element.isAbstract) {
      output.write('''
        String $toJsonName();
        Map<String, dynamic> $toMapName();
        Map<String, dynamic> $toShallowMapName();
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
      Map<String, dynamic> $toShallowMapName() {
        return ${element.mapperName}.ensureInitialized().encodeMap<${element.selfTypeParam}>(this as ${element.selfTypeParam}, EncodingOptions(shallow: true));
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
      Map<String, dynamic> $toShallowMapName() {
        return ${element.mapperName}.ensureInitialized().encodeMap<${element.selfTypeParam}>(this, EncodingOptions(shallow: true));
      }
    ''');
  }
}
