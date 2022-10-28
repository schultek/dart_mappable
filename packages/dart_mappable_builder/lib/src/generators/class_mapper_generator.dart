import 'package:analyzer/dart/ast/ast.dart';
import 'package:ansicolor/ansicolor.dart';

import '../config/class_mapper_config.dart';
import '../config/copy_param_config.dart';
import '../imports_builder.dart';
import '../utils.dart';
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

  Future<String> generate(GetConfig getConfig) async {
    var output = StringBuffer();

    var encoderGen = EncoderGenerator(config, imports);
    var decoderGen = DecoderGenerator(config, imports);
    var stringifyGen = ToStringGenerator(config);
    var equalsGen = EqualsGenerator(config);
    var copyGen = CopyWithGenerator(config, imports);

    output.write(
        'class ${config.mapperName} extends BaseMapper<${config.prefixedClassName}> {\n'
        '  ${config.mapperName}._();\n');

    output.writeAll([
      await decoderGen.generateDecoderMethods(),
      await encoderGen.generateEncoderMethods(),
      stringifyGen.generateToStringMethods(),
      equalsGen.generateEqualsMethods(),
      decoderGen.generateTypeFactory(),
    ]);

    output.write('}\n\n');

    if (config.generateAsMixin) {
      _checkMixinUsed();

      output.write(
          'mixin ${config.uniqueClassName}Mappable${config.typeParamsDeclaration} '
          'implements MappableMixin {\n');
      output.writeAll([
        encoderGen.generateEncoderMixin(),
        copyGen.generateCopyWithMixin(getConfig),
        stringifyGen.generateToStringMixin(),
        equalsGen.generateEqualsMixin(),
      ]);
      output.write('}');
    } else {
      output.write(
          'extension ${config.mapperName}Extension${config.typeParamsDeclaration} on ${config.prefixedClassName}${config.typeParams} {\n');
      output.writeAll([
        encoderGen.generateEncoderExtensions(),
        copyGen.generateCopyWithExtension(),
      ]);
      output.write('}');
    }

    output.writeAll([
      copyGen.generateCopyWithClasses(getConfig),
    ]);

    return output.toString();
  }

  void _checkMixinUsed() {
    var node = config.element.getNode()! as ClassDeclaration;
    var className = config.className;
    var mixinName = '${config.uniqueClassName}Mappable';

    var hasCopyWithMixin =
        node.withClause?.mixinTypes.any((t) => t.name.name == mixinName) ??
            false;

    if (!hasCopyWithMixin) {
      var classDeclarationSource = 'class $className';
      if (node.abstractKeyword != null) {
        classDeclarationSource = 'abstract $classDeclarationSource';
      }
      if (node.extendsClause != null) {
        classDeclarationSource += ' ' + node.extendsClause!.toSource();
      }
      if (node.withClause != null) {
        classDeclarationSource += ' ' +
            node.withClause!
                .toSource()
                .replaceFirst('with', 'with $mixinName,');
      } else {
        classDeclarationSource += ' with $mixinName';
      }
      if (node.implementsClause != null) {
        classDeclarationSource += ' ' + node.implementsClause!.toSource();
      }

      var pen = AnsiPen()..xterm(3);
      var pen2 = AnsiPen()..xterm(2);
      print(pen('\nClass \'$className\' is configured to generate a mixin '
          '\'$mixinName\'.\nIt is required that you use this mixin on this class.\n'
          'Otherwise your code might behave faulty or won\'t compile.\n\n'
          'To solve this, change your class signature to:\n'));
      print(pen2(classDeclarationSource) + '\n');
    }
  }
}
