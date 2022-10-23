import 'dart:async';
import 'dart:collection';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';

import 'builder_options.dart';
import 'builder_snippets.dart';
import 'config/mapper_targets.dart';
import 'generators/class_mapper_generator.dart';
import 'generators/enum_mapper_generator.dart';
import 'utils.dart';

/// The main builder used for code generation
class MappableBuilder implements Builder {
  /// The global options defined in the 'build.yaml' file
  late MappableOptions options;

  MappableBuilder(BuilderOptions options)
      : options = MappableOptions.parse(options.config);

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    var inputId = buildStep.inputId;
    var outputId = inputId.changeExtension('.mapper.g.dart');

    try {
      var generatedSource = generate(buildStep);
      await buildStep.writeAsString(outputId, generatedSource);
    } catch (e, st) {
      print('An unexpected error occurred.\n'
          'This is probably a bug in dart_mappable.\n'
          'Please report this here: '
          'https://github.com/schultek/dart_mappable/issues\n\n'
          'The error was:\n$e\n\n$st');
      rethrow;
    }
  }

  @override
  Map<String, List<String>> get buildExtensions => const {
        '.dart': ['.mapper.g.dart']
      };

  /// Main generation handler
  /// Searches for mappable classes and enums recursively
  Future<String> generate(BuildStep buildStep) async {
    var targets = MapperTargets(buildStep.inputId);
    var entryLib = await buildStep.inputLibrary;

    var libraries = resolveLibraries(entryLib);

    for (var entry in libraries.entries) {
      targets.addElementsFromLibrary(entry.key, entry.value);
    }

    var classConfigs = Map.fromEntries(await Future.wait(targets.classes.entries
        .map((e) async =>
            MapEntry(e.key, await e.value.getConfig(targets.imports)))));

    var classMappers = targets.classes.keys
        .map((k) => ClassMapperGenerator(classConfigs[k]!, targets.imports))
        .toList();

    var enumMappers = targets.enums.values
        .map((c) => EnumMapperGenerator(c.config, targets.imports))
        .toList();

    var customMappers = targets.customMappers.values;

    var genClasses = await Future.wait(
        classMappers.map((om) => om.generate((e) => classConfigs[e])));

    var genEnums = await Future.wait(enumMappers.map((em) => em.generate()));

    return ''
        '// ignore_for_file: unused_element\n'
        '${targets.imports.write()}\n'
        '// === ALL STATICALLY REGISTERED MAPPERS ===\n\n'
        'var _mappers = <BaseMapper>{\n'
        '  // class mappers\n'
        '${classMappers.map((om) => '  ${om.config.mapperName}._(),\n').join()}'
        '  // enum mappers\n'
        '${enumMappers.map((em) => '  ${em.config.mapperName}._(),\n').join()}'
        '  // custom mappers\n'
        '${customMappers.map((e) => '  ${e.prefixedMapperName}(),\n').join()}'
        '};\n'
        '\n\n'
        '// === GENERATED CLASS MAPPERS AND EXTENSIONS ===\n\n'
        '${genClasses.join('\n\n')}\n'
        '\n\n'
        '// === GENERATED ENUM MAPPERS AND EXTENSIONS ===\n\n'
        '${genEnums.join('\n\n')}\n'
        '\n\n'
        '// === GENERATED UTILITY CODE ===\n\n'
        '$mapperCode';
  }

  Map<LibraryElement, MappableOptions> resolveLibraries(
      LibraryElement entryLib) {
    var libraries = <LibraryElement, MappableOptions>{};

    final toVisit = Queue<MapEntry<LibraryElement, MappableOptions>>();

    toVisit.add(MapEntry(entryLib, options));

    void visitDirective(Element directive, LibraryElement? library,
        MappableOptions parentOptions, MappableOptions? options) {
      if (library == null) return;

      if (libChecker.hasAnnotationOf(directive)) {
        var libOptions =
            MappableOptions.from(libChecker.firstAnnotationOf(directive)!);
        options = options?.apply(libOptions, forceJoin: false) ?? libOptions;
      }

      options = parentOptions.apply(options);

      if (libraries.containsKey(library)) {
        libraries[library] = libraries[library]!.join(options);
      } else {
        toVisit.add(MapEntry(library, options));
      }
    }

    while (toVisit.isNotEmpty) {
      var entry = toVisit.removeFirst();
      var library = entry.key;
      var parentOptions = entry.value;

      MappableOptions? options;

      if (library.isInSdk) continue;

      if (libChecker.hasAnnotationOf(library)) {
        options = MappableOptions.from(libChecker.firstAnnotationOf(library)!);
      }

      libraries[library] = parentOptions.apply(options);

      for (var import in library.libraryImports) {
        visitDirective(import, import.importedLibrary, parentOptions, options);
      }
      for (var export in library.libraryExports) {
        visitDirective(export, export.exportedLibrary, parentOptions, options);
      }
    }

    return libraries;
  }
}
