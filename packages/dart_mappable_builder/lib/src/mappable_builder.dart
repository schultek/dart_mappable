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

    var classMappers = <ClassMapperGenerator>[];

    for (var target in targets.classes.values) {
      targets.imports.addAll(target.config.imports);
      classMappers.add(ClassMapperGenerator(target.config));
    }

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
        '${enumMappers.map((em) => '  ${em.config.mapperName}._(),\n').join()}'
        '  // custom mappers\n'
        '${customMappers.map((e) => '  ${targets.imports.prefix(e)}.${e.name}(),\n').join()}'
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

      for (var import in library.imports) {
        visitDirective(import, import.importedLibrary, parentOptions, options);
      }
      for (var export in library.exports) {
        visitDirective(export, export.exportedLibrary, parentOptions, options);
      }
    }

    return libraries;
  }
}
