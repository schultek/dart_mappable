import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';

import 'builder_options.dart';
import 'builder_snippets.dart';
import 'config/mapper_targets.dart';
import 'generators/class_mapper_generator.dart';
import 'generators/enum_mapper_generator.dart';

/// The main builder used for code generation
class MappableBuilder implements Builder {
  /// The global options defined in the 'build.yaml' file
  late GlobalOptions options;

  MappableBuilder(BuilderOptions options)
      : options = GlobalOptions.parse(options.config);

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    var resolver = buildStep.resolver;
    var inputId = buildStep.inputId;
    var outputId = inputId.changeExtension('.mapper.g.dart');
    var visibleLibraries = await resolver.libraries.toList();

    var generatedSource = generate(visibleLibraries, buildStep);
    await buildStep.writeAsString(outputId, generatedSource);
  }

  @override
  Map<String, List<String>> get buildExtensions => const {
        '.dart': ['.mapper.g.dart']
      };

  /// Main generation handler
  /// Searches for mappable classes and enums recursively
  String generate(List<LibraryElement> libraries, BuildStep buildStep) {
    var targets = MapperTargets(buildStep.inputId, options);
    for (var library in libraries) {
      targets.addElementsFromLibrary(library);
    }

    var classMappers =
        targets.classes.values.map((c) => ClassMapperGenerator(c.config));
    var enumMappers =
        targets.enums.values.map((c) => EnumMapperGenerator(c.config));
    var customMappers = targets.customMappers.values;

    return ''
        '${targets.imports.write()}\n'
        '// === ALL STATICALLY REGISTERED MAPPERS ===\n\n'
        'var _mappers = <BaseMapper>{\n'
        '  // class mappers\n'
        '${classMappers.map((om) => '  ${om.config.mapperName}._(),\n').join()}'
        '  // enum mappers\n'
        '${enumMappers.map((em) => '  ${em.instanceLiteral}').join()}'
        '  // custom mappers\n'
        '${customMappers.map((e) => '  ${e.name}(),\n').join()}'
        '};\n'
        '\n\n'
        '// === GENERATED CLASS MAPPERS AND EXTENSIONS ===\n\n'
        '${classMappers.map((om) => om.generate((e) => targets.classes[e]?.config)).join('\n\n')}\n'
        '\n\n'
        '// === GENERATED ENUM MAPPERS AND EXTENSIONS ===\n\n'
        '${enumMappers.map((em) => em.generate()).join('\n\n')}\n'
        '\n\n'
        '// === GENERATED UTILITY CODE ===\n\n'
        '$mapperCode';
  }
}
