import '../config/class_mapper_config.dart';
import '../imports_builder.dart';
import 'copywith_generator.dart';
import 'decoder_generator.dart';
import 'encoder_generator.dart';
import 'equals_generator.dart';
import 'tostring_generator.dart';

/// Generates code for a specific class
class ClassMapperGenerator {
  ClassMapperConfig config;
  ImportsBuilder imports;
  ClassMapperGenerator(this.config, this.imports);

  String generate(GetConfig getConfig) {
    var classSnippets = [
      DecoderGenerator().generateDecoderMethods(config),
      EncoderGenerator().generateEncoderMethods(config),
      ToStringGenerator().generateToStringMethods(config),
      EqualsGenerator().generateEqualsMethods(config),
      DecoderGenerator().generateTypeFactory(config),
    ];

    var copyGen = CopyWithGenerator(config, imports);

    var extensionSnippets = [
      EncoderGenerator().generateEncoderExtensions(config),
      copyGen.generateCopyWithExtension(),
    ];

    var additionSnippets = [
      copyGen.generateCopyWithClasses(getConfig),
    ];

    return ''
        'class ${config.mapperName} extends BaseMapper<${config.prefixedClassName}> {\n'
        '  ${config.mapperName}._();\n'
        '${classSnippets.join()}'
        '}\n\n'
        'extension ${config.mapperName}Extension ${config.typeParamsDeclaration} on ${config.prefixedClassName}${config.typeParams} {\n'
        '${extensionSnippets.join()}'
        '}'
        '${additionSnippets.join()}';
  }
}
