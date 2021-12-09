import '../config/class_mapper_config.dart';
import 'copywith_generator.dart';
import 'decoder_generator.dart';
import 'encoder_generator.dart';
import 'equals_generator.dart';
import 'tostring_generator.dart';

/// Generates code for a specific class
class ClassMapperGenerator {
  ClassMapperConfig config;
  ClassMapperGenerator(this.config);

  String generate(GetConfig getConfig) {
    var classSnippets = [
      DecoderGenerator().generateDecoderMethods(config),
      EncoderGenerator().generateEncoderMethods(config),
      ToStringGenerator().generateToStringMethods(config),
      EqualsGenerator().generateEqualsMethods(config),
      DecoderGenerator().generateTypeFactory(config),
    ];

    var extensionSnippets = [
      EncoderGenerator().generateEncoderExtensions(config),
      CopyWithGenerator().generateCopyWithExtension(config),
    ];

    var additionSnippets = [
      CopyWithGenerator().generateCopyWithClasses(config, getConfig),
    ];

    return ''
        'class ${config.mapperName} extends BaseMapper<${config.className}> {\n'
        '  ${config.mapperName}._();\n'
        '${classSnippets.join()}'
        '}\n\n'
        'extension ${config.mapperName}Extension ${config.typeParamsDeclaration} on ${config.className}${config.typeParams} {\n'
        '${extensionSnippets.join()}'
        '}'
        '${additionSnippets.join()}';
  }
}
