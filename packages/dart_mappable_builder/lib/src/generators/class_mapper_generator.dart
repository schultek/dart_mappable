import 'package:analyzer/dart/ast/ast.dart';
import 'package:ansicolor/ansicolor.dart';

import '../elements/class_mapper_element.dart';
import '../elements/copy_param_element.dart';
import '../elements/mapper_element.dart';
import '../utils.dart';
import 'copywith_generator.dart';
import 'decoder_generator.dart';
import 'encoder_generator.dart';
import 'equals_generator.dart';
import 'tostring_generator.dart';

abstract class MapperGenerator<T extends MapperElement> {
  final T target;

  MapperGenerator(this.target);

  Future<String> generate();
}

/// Generates code for a specific class
class ClassMapperGenerator extends MapperGenerator<ClassMapperElement> {
  ClassMapperGenerator(super.target);

  @override
  Future<String> generate() async {
    var output = StringBuffer();

    var encoderGen = EncoderGenerator(target);
    var decoderGen = DecoderGenerator(target);
    var stringifyGen = ToStringGenerator(target);
    var equalsGen = EqualsGenerator(target);
    var copyGen = CopyWithGenerator(target);

    var mappers = [
      '${target.uniqueClassName}Mapper()',
      ...target.customMappers.map((t) => '${t.getDisplayString(withNullability: false)}()'),
    ];

    var joins = target.joinConfigs;

    output.write(
        'class ${target.uniqueClassName}Mapper with MapperBase<${target.prefixedClassName}> {\n'
        '  static MapperContainer container = MapperContainer(\n'
        '    mappers: {');

    if (mappers.length < 2) {
      output.write(mappers.join(', '));
    } else {
      output.write('\n${mappers.map((m) => '      $m,\n').join()}    ');
    }

    output.write('},\n');

    if (joins.isNotEmpty) {
      output.write('    join: {');
      if (joins.length < 2) {
        output.write(joins.map((c) => '$c.container').join(', '));
      } else {
        output.write('\n${joins.map((c) => '      $c.container,\n').join()}    ');
      }

      output.write('},\n');
    }

    output.write('  );\n\n'
        '  @override\n'
        '  ${target.uniqueClassName}MapperElement createElement(MapperContainer container) {\n'
        '    return ${target.uniqueClassName}MapperElement._(this, container);\n'
        '  }\n\n');

    if (target.typeParamsList.isNotEmpty) {
      output.write(decoderGen.generateTypeFactory());
    }

    output.write(
        '  static final fromMap = container.fromMap<${target.prefixedClassName}>;\n'
        '  static final fromJson = container.fromJson<${target.prefixedClassName}>;\n'
        '}\n\n'
        'class ${target.uniqueClassName}MapperElement extends MapperElementBase<${target.prefixedClassName}> {\n'
        '  ${target.uniqueClassName}MapperElement._(super.mapper, super.container);\n');

    output.writeAll([
      await decoderGen.generateDecoderMethods(),
      await encoderGen.generateEncoderMethods(),
      stringifyGen.generateToStringMethods(),
      equalsGen.generateEqualsMethods(),
    ]);

    output.write('}\n\n');

    if (target.generateAsMixin) {
      _checkMixinUsed();

      output.write(
          'mixin ${target.uniqueClassName}Mappable${target.typeParamsDeclaration} {\n');
      output.writeAll([
        encoderGen.generateEncoderMixin(),
        copyGen.generateCopyWithMixin(),
        stringifyGen.generateToStringMixin(),
        equalsGen.generateEqualsMixin(),
      ]);
      output.write('}');
    } else {
      output.write(
          'extension ${target.uniqueClassName}MapperExtension${target.typeParamsDeclaration} on ${target.prefixedClassName}${target.typeParams} {\n');
      output.writeAll([
        encoderGen.generateEncoderExtensions(),
        copyGen.generateCopyWithExtension(),
      ]);
      output.write('}');
    }

    output.writeAll([
      copyGen.generateCopyWithClasses(),
    ]);

    return output.toString();
  }

  void _checkMixinUsed() {
    var node = target.element.getNode()! as ClassDeclaration;
    var className = target.className;
    var mixinName = '${target.uniqueClassName}Mappable';

    var hasCopyWithMixin =
        node.withClause?.mixinTypes.any((t) => t.name.name == mixinName) ??
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

      var pen = AnsiPen()..xterm(3);
      var pen2 = AnsiPen()..xterm(2);
      print(pen('\nClass \'$className\' is configured to generate a mixin '
          '\'$mixinName\'.\nIt is required that you use this mixin on this class.\n'
          'Otherwise your code might behave faulty or won\'t compile.\n\n'
          'To solve this, change your class signature to:\n'));
      print('${pen2(classDeclarationSource)}\n');
    }
  }
}
