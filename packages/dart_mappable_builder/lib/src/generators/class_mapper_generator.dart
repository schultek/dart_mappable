import 'package:analyzer/dart/ast/ast.dart';
import 'package:ansicolor/ansicolor.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../elements/class/alias_class_mapper_element.dart';
import '../elements/class/linked_elements_mixin.dart';
import '../elements/class/none_class_mapper_element.dart';
import '../elements/mapper_element.dart';
import '../elements/class/target_class_mapper_element.dart';
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

    var isSubClass = target.superTarget != null &&
        target.superTarget! is! NoneClassMapperElement;

    output.write(
        'class ${target.mapperName} extends ${isSubClass ? 'Sub' : ''}ClassMapperBase<${target.prefixedClassName}> {\n'
        '  static final ${target.mapperName} instance = ${target.mapperName}();\n');

    var typesConfigs = target.typesConfigs;
    var types = '';

    if (typesConfigs.isNotEmpty) {
      types += 'types: {';
      if (typesConfigs.length < 3) {
        types += typesConfigs.join(', ');
      } else {
        types += '\n${typesConfigs.map((c) => '      $c,\n').join()}    ';
      }
      types += '}';
    }

    if (hasCyclicLink) {
      output.write('  static MapperContainer? _c;\n'
          '  static final MapperContainer container = _c ?? ((_c = MapperContainer($types))');
    } else {
      output.write(
          '  static final MapperContainer container = MapperContainer($types)');
    }

    if (target.customMappers.isEmpty) {
      output.write('\n  ..use(instance)');
    } else {
      var mappers = target.customMappers
          .map((t) => '${t.getDisplayString(withNullability: false)}()');
      output.write('\n  ..useAll([instance, ${mappers.join()}])');
    }

    if (linked.isNotEmpty) {
      output.write('\n  ..linkAll({');
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
        "  final String id = '${target.uniqueId}';\n");

    if (target.typeParamsList.isNotEmpty) {
      output.write(decoderGen.generateTypeFactory());
    }

    if (target is AliasClassMapperElement) {
      output.write('  @override\n'
          '  Type get implType => ${target.prefixedDecodingClassName};\n');
    }

    if (target.subTargets.isNotEmpty) {
      var subMappers = target.subTargets //
          .where((t) => t is! NoneClassMapperElement)
          .map((t) {
        var prefix = target.parent.prefixOfElement(t.element);
        return '    $prefix${t.mapperName}.instance,\n';
      });

      output.write(
          '\n  @override\n  final List<SubClassMapperBase<${target.prefixedClassName}>> subMappers = [\n'
          '${subMappers.join()}'
          '  ];\n');
    }

    output.write('\n');

    var fields = target.fields;

    for (var f in fields) {
      output.write(
          '  static ${f.staticType} _\$${f.field.name}(${target.prefixedClassName} v) => v.${f.field.name};\n');
      if (f.generic) {
        output.write(
            '  static dynamic _arg\$${f.field.name}${target.typeParamsDeclaration}(f) => f<${f.type}>();\n');
      }
    }

    output.write(
        '\n  @override\n  final Map<Symbol, Field<${target.prefixedClassName}, dynamic>> fields = const {\n');

    for (var f in fields) {
      output.write(
          "    #${f.field.name}: Field<${target.prefixedClassName}, ${f.staticType}>('${f.field.name}', _\$${f.field.name}${f.key}${f.mode}${f.opt}${await f.def}${f.arg}${await f.hook}),\n");
    }

    output.write('  };\n');

    if (target.ignoreNull) {
      output.write('  @override\n  final bool ignoreNull = true;\n');
    }

    if (isSubClass) {
      output.write(await decoderGen.generateCanDecodeMethod());
    }

    output.write(await decoderGen.generateInstantiateMethod());

    if (target.shouldGenerate(GenerateMethods.decode)) {
      output.write('\n');
      if (target.typeParamsList.isNotEmpty) {
        output.write(
            '  static ${target.prefixedDecodingClassName}${target.typeParams} fromMap${target.typeParamsDeclaration}(Map<String, dynamic> map) => container.fromMap<${target.prefixedDecodingClassName}${target.typeParams}>(map);\n'
            '  static ${target.prefixedDecodingClassName}${target.typeParams} fromJson${target.typeParamsDeclaration}(String json) => container.fromJson<${target.prefixedDecodingClassName}${target.typeParams}>(json);\n');
      } else {
        output.write(
            '  static final fromMap = container.fromMap<${target.prefixedDecodingClassName}>;\n'
            '  static final fromJson = container.fromJson<${target.prefixedDecodingClassName}>;\n');
      }
    }
    output.write('}\n\n');

    // output.writeAll([
    //   await encoderGen.generateEncoderMethods(),
    // ]);

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
