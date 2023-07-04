import 'package:analyzer/dart/ast/ast.dart';
import 'package:ansicolor/ansicolor.dart';

import '../elements/class/target_class_mapper_element.dart';
import '../utils.dart';
import 'generator.dart';
import 'mixins/copywith_mixin.dart';
import 'mixins/decoding_mixin.dart';
import 'mixins/encoding_mixin.dart';
import 'mixins/equals_mixin.dart';
import 'mixins/tostring_mixin.dart';

/// Generates code for a specific class
class ClassMapperGenerator
    extends InterfaceMapperGenerator<TargetClassMapperElement>
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
        
        static ${element.mapperName}? _instance;
        static ${element.mapperName} ensureInitialized() {
          if (_instance == null) {   
    ''');

    var typesConfigs = element.typesConfigs;
    if (typesConfigs.isNotEmpty) {
      for (var t in typesConfigs) {
        output.write('      MapperBase.addType<$t>();\n');
      }
    }

    output.write(
        '      MapperContainer.globals.use(_instance = ${element.mapperName}._());\n');

    if (element.isDiscriminatingSubclass) {
      var s = element.superElement!;
      var prefix = element.parent.prefixOfElement(s.annotatedElement);
      output.write(
          '      $prefix${s.mapperName}.ensureInitialized().addSubMapper(_instance!);\n');
    } else if (element.isSubclass) {
      var s = element.superElement!;
      var prefix = element.parent.prefixOfElement(s.annotatedElement);
      output.write('      $prefix${s.mapperName}.ensureInitialized();\n');
    }

    var customMappers = element.customMappers;
    if (customMappers != null) {
      output.write('      MapperContainer.globals.useAll($customMappers);\n');
    }

    var linked = element.linkedElements;
    if (linked.isNotEmpty) {
      for (var l in linked) {
        output.write('      $l.ensureInitialized();\n');
      }
    }

    output.write('    }\n'
        '    return _instance!;\n'
        '  }\n'
        '  static T _guard<T>(T Function(MapperContainer) fn) {\n'
        '    ensureInitialized();\n'
        '    return fn(MapperContainer.globals);\n'
        '  }');

    output.write('\n'
        '  @override\n'
        "  final String id = '${element.uniqueId}';\n");

    if (element.typeParamsList.isNotEmpty) {
      output.write(generateTypeFactory());
    }

    output.write('\n');

    await generateFields(output);

    if (element.ignoreNull) {
      output.write('  @override\n  final bool ignoreNull = true;\n');
    }

    if (element.isDiscriminatingSubclass) {
      output.write(await generateDiscriminatorFields());
      output.write(generateInheritOverride());
    }

    output.write(await generateInstantiateMethod());

    output.write(generateStaticDecoders());
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
    output.writeAll([
      generateEncoderMixin(),
      generateCopyWithMixin(),
      generateToStringMixin(),
      generateEqualsMixin(),
    ]);
    output.write('}');
  }

  void _generateExtension(StringBuffer output) {
    output.write(
        'extension ${element.mapperName}Extension${element.typeParamsDeclaration} on ${element.prefixedClassName}${element.typeParams} {\n');
    output.writeAll([
      generateEncoderExtensions(),
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
      var hasCopyWithMixin = node.withClause?.mixinTypes.any((t) {
            // ignore: deprecated_member_use
            return t.name.name == mixinName;
          }) ??
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
      var hasCopyWithMixin = node.withClause.mixinTypes.any((t) {
        // ignore: deprecated_member_use
        return t.name.name == mixinName;
      });

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
