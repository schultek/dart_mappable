import 'package:analyzer/dart/ast/ast.dart';
import 'package:ansicolor/ansicolor.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../elements/alias_class_mapper_element.dart';
import '../elements/linked_elements_mixin.dart';
import '../elements/mapper_element.dart';
import '../elements/target_class_mapper_element.dart';
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
class ClassMapperGenerator extends MapperGenerator<TargetClassMapperElement> {
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
      '${target.mapperName}()',
      ...target.customMappers
          .map((t) => '${t.getDisplayString(withNullability: false)}()'),
    ];

    var linked = target.linkedElements;

    var visited = <MapperElement>{};
    bool isCyclic(MapperElement e) {
      if (e == target) return true;
      if (visited.contains(e)) return false;
      visited.add(e);
      return e is LinkedElementsMixin
          ? e.linkedElements.keys.any(isCyclic)
          : false;
    }

    var hasCyclicLink = linked.keys.any(isCyclic);

    output.write(
        'class ${target.mapperName} extends MapperBase<${target.prefixedClassName}> {\n');

    if (hasCyclicLink) {
      output.write('  static MapperContainer? _c;\n'
          '  static MapperContainer container = _c ?? ((_c = MapperContainer(\n'
          '    mappers: {');
    } else {
      output.write('  static MapperContainer container = MapperContainer(\n'
          '    mappers: {');
    }

    if (mappers.length < 3) {
      output.write(mappers.join(', '));
    } else {
      output.write('\n${mappers.map((m) => '      $m,\n').join()}    ');
    }
    output.write('},\n');

    var types = target.typesConfigs;

    if (types.isNotEmpty) {
      output.write('    types: {');
      if (types.length < 3) {
        output.write(types.join(', '));
      } else {
        output.write('\n${types.map((c) => '      $c,\n').join()}    ');
      }
      output.write('},\n');
    }

    output.write('  )');

    if (hasCyclicLink) {
      output.write(')');
    }

    if (linked.isNotEmpty) {
      output.write('..linkAll({');
      var containers = linked.entries.map((e) => '${e.value}.container');

      if (linked.length < 3) {
        output.write(containers.join(', '));
      } else {
        output.write('\n${containers.map((c) => '      $c,\n').join()}    ');
      }
      output.write('})');
    }

    if (hasCyclicLink) {
      output.write(')');
    }

    output.write(';\n\n'
        '  @override\n'
        '  ${target.mapperName}Element createElement(MapperContainer container) {\n'
        '    return ${target.mapperName}Element._(this, container);\n'
        '  }\n\n');

    if (target.customId != null) {
      output.write("@override\nString get id => '${target.customId}';\n");
    }

    if (target.typeParamsList.isNotEmpty) {
      output.write(decoderGen.generateTypeFactory());
    }

    if (target is AliasClassMapperElement) {
      output.write(
          '@override\nType get implType => ${target.prefixedDecodingClassName};');
    }

    if (target.shouldGenerate(GenerateMethods.decode)) {
      if (target.typeParamsList.isNotEmpty) {
        output.write(
            '  static ${target.prefixedDecodingClassName}${target.typeParams} fromMap${target.typeParamsDeclaration}(Map<String, dynamic> map) => container.fromMap<${target.prefixedDecodingClassName}${target.typeParams}>(map);\n'
            '  static ${target.prefixedDecodingClassName}${target.typeParams} fromJson${target.typeParamsDeclaration}(String json) => container.fromJson<${target.prefixedDecodingClassName}${target.typeParams}>(json);\n'
        );
      } else {
        output.write(
            '  static final fromMap = container.fromMap<${target.prefixedDecodingClassName}>;\n'
            '  static final fromJson = container.fromJson<${target.prefixedDecodingClassName}>;\n');
      }
    }
    output.write('}\n\n'
        'class ${target.mapperName}Element extends MapperElementBase<${target.prefixedClassName}> {\n'
        '  ${target.mapperName}Element._(super.mapper, super.container);\n');

    output.writeAll([
      await decoderGen.generateDecoderMethods(),
      await encoderGen.generateEncoderMethods(),
      stringifyGen.generateToStringMethods(),
      equalsGen.generateEqualsMethods(),
    ]);

    output.write('}\n\n');

    if (target.generateAsMixin) {
      await _checkMixinUsed();

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
          'extension ${target.mapperName}Extension${target.typeParamsDeclaration} on ${target.prefixedClassName}${target.typeParams} {\n');
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

  Future<void> _checkMixinUsed() async {
    var className = target.className;
    var mixinName = '${target.uniqueClassName}Mappable';

    void warnUnusedMixin(String classCode) {
      var pen = AnsiPen()..xterm(3);
      var pen2 = AnsiPen()..xterm(2);
      print(pen('\nClass \'$className\' is configured to generate a mixin '
          '\'$mixinName\'.\nIt is required that you use this mixin on this class.\n'
          'Otherwise your code might behave faulty or won\'t compile.\n\n'
          'To solve this, change your class signature to:\n'));
      print('${pen2(classCode)}\n');
    }

    var node = await target.element.getNode();
    if (node is ClassDeclaration) {
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
        warnUnusedMixin(classDeclarationSource);
      }
    } else if (node is ClassTypeAlias) {
      var hasCopyWithMixin =
          node.withClause.mixinTypes.any((t) => t.name.name == mixinName);

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
