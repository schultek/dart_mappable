import 'package:analyzer/dart/ast/ast.dart';
import 'package:ansicolor/ansicolor.dart';

import '../elements/class/target_class_mapper_element.dart';
import '../utils.dart';
import 'extensions/fields_extension.dart';
import 'extensions/initializer_extension.dart';
import 'generator.dart';
import 'mixins/copywith_mixin.dart';
import 'mixins/decoding_mixin.dart';
import 'mixins/encoding_mixin.dart';
import 'mixins/equals_mixin.dart';
import 'mixins/tostring_mixin.dart';

/// Generates code for a specific class
class ClassMapperGenerator extends MapperGenerator<TargetClassMapperElement>
    with
        DecodingMixin,
        EncodingMixin,
        CopyWithMixin,
        EqualsMixin,
        ToStringMixin {
  ClassMapperGenerator(super.element);

  @override
  Future<String> generate() async {
    var output = StringBuffer();

    output.write('''
      class ${element.mapperName} extends ${element.isDiscriminatingSubclass ? 'Sub' : ''}ClassMapperBase<${element.prefixedClassName}> {
        ${element.mapperName}._();
        
    ''');

    generateInitializer(output);

    output.write('\n'
        '  @override\n'
        "  final String id = '${element.uniqueId}';\n");

    if (element.typeParamsList.isNotEmpty) {
      generateTypeFactory(output);
    }

    output.write('\n');

    await generateFields(output);

    if (element.ignoreNull) {
      output.write('  @override\n  final bool ignoreNull = true;\n');
    }

    if (element.isDiscriminatingSubclass) {
      await generateDiscriminatorFields(output);
      generateInheritOverride(output);
    }

    await generateInstantiateMethod(output);

    generateStaticDecoders(output);
    output.write('}\n\n');

    if (element.generateAsMixin) {
      await _generateMixin(output);
    } else {
      _generateExtension(output);
    }

    output.writeAll([
      generateCopyWithClasses(),
    ]);

    return output.toString();
  }

  Future<void> _generateMixin(StringBuffer output) async {
    await _checkMixinUsed();

    output.write(
        'mixin ${element.uniqueClassName}Mappable${element.typeParamsDeclaration} {\n');

    generateEncoderMixin(output);
    output.writeAll([
      generateCopyWithMixin(),
      generateToStringMixin(),
      generateEqualsMixin(),
    ]);
    output.write('}');
  }

  void _generateExtension(StringBuffer output) {
    output.write(
        'extension ${element.mapperName}Extension${element.typeParamsDeclaration} on ${element.prefixedClassName}${element.typeParams} {\n');
    generateEncoderExtensions(output);
    output.writeAll([
      generateCopyWithExtension(),
    ]);
    output.write('}');
  }

  Future<void> _checkMixinUsed() async {
    var className = element.className;
    var mixinName = '${element.uniqueClassName}Mappable';

    void warnUnusedMixin(String classCode) {
      var pen = AnsiPen()..xterm(3);
      var pen2 = AnsiPen()..xterm(2);
      print(pen('\nClass \'$className\' is configured to generate a mixin '
          '\'$mixinName\'.\nIt is required that you use this mixin on this class.\n'
          'Otherwise your code might behave faulty or won\'t compile.\n\n'
          'To solve this, change your class signature to:\n'));
      print('${pen2(classCode)}\n');
    }

    var node = await element.element.getNode();
    if (node is ClassDeclaration) {
      var hasCopyWithMixin =
          node.withClause?.mixinTypes.any((t) => t.name2.lexeme == mixinName) ??
              false;

      if (!hasCopyWithMixin) {
        var classDeclarationSource = 'class $className';
        if (node.abstractKeyword != null) {
          classDeclarationSource = 'abstract $classDeclarationSource';
        }
        if (node.extendsClause != null) {
          classDeclarationSource += ' ${node.extendsClause!.toSource()}';
        }
        if (node.withClause != null) {
          classDeclarationSource +=
              ' ${node.withClause!.toSource().replaceFirst('with', 'with $mixinName,')}';
        } else {
          classDeclarationSource += ' with $mixinName';
        }
        if (node.implementsClause != null) {
          classDeclarationSource += ' ${node.implementsClause!.toSource()}';
        }
        warnUnusedMixin(classDeclarationSource);
      }
    } else if (node is ClassTypeAlias) {
      var hasCopyWithMixin =
          node.withClause.mixinTypes.any((t) => t.name2.lexeme == mixinName);

      if (!hasCopyWithMixin) {
        var classDeclarationSource = 'class $className';
        if (node.abstractKeyword != null) {
          classDeclarationSource = 'abstract $classDeclarationSource';
        }
        classDeclarationSource +=
            ' ${node.withClause.toSource().replaceFirst('with', 'with $mixinName,')}';

        if (node.implementsClause != null) {
          classDeclarationSource += ' ${node.implementsClause!.toSource()}';
        }
        warnUnusedMixin(classDeclarationSource);
      }
    }
  }
}
