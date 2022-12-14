import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';

import 'builder_options.dart';
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
    var outputId = inputId.changeExtension('.mapper.dart');

    try {
      var generatedSource = await generate(buildStep);
      if (generatedSource != null) {
        await buildStep.writeAsString(outputId, generatedSource);
      }
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
        '.dart': ['.mapper.dart']
      };

  /// Main generation handler
  /// Searches for mappable classes and enums recursively
  Future<String?> generate(BuildStep buildStep) async {
    var targets = MapperTargets(buildStep.inputId);
    var entryLib = await buildStep.inputLibrary;

    var options = this.options;
    if (libChecker.hasAnnotationOf(entryLib)) {
      var libOptions = MappableOptions.from(libChecker.firstAnnotationOf(entryLib)!);

      if (libOptions.include != null) {
        throw 'Cannot use "include" when @MappableLib() is applied to the library keyword.';
      }

      options = options.apply(libOptions);
    }

    targets.addElementsFromLibrary(entryLib, options, entryLib.publicNamespace);

    for (var import in entryLib.libraryImports) {
      if (import.importedLibrary == null) continue;

      if (libChecker.hasAnnotationOf(import)) {
        var libOptions =
        MappableOptions.from(libChecker.firstAnnotationOf(import)!);

        if (libOptions.include == null) {
          throw 'Have to use "include" when @MappableLib() is applied to an import statement.';
        }

        bool isInNamespace(DartType type) {
          var name = type.alias?.element.name ?? type.getDisplayString(withNullability: false);
          var elem = type.alias?.element ?? type.element;
          Element? imp;
          if (import.prefix != null) {
            imp = import.namespace.getPrefixed(import.prefix!.element.name, name);
          } else {
            imp = import.namespace.get(name);
          }
          return imp == elem;
        }

        for (var type in libOptions.include!) {
          if (!isInNamespace(type)) {
            throw 'Type ${type.getDisplayString(withNullability: false)} cannot be used in "include" list, '
                'since it is not exposed by the annotated import.';
          }
        }

        options = options.apply(libOptions, forceJoin: false);
        options = this.options.apply(options);

        targets.addElementsFromLibrary(entryLib, options, entryLib.publicNamespace);
      }
    }

    var classConfigs = Map.fromEntries(await Future.wait(targets.classes.entries
        .map((e) async =>
            MapEntry(e.key, await e.value.getConfig()))));

    var classMappers = targets.classes.keys
        .map((k) => ClassMapperGenerator(classConfigs[k]!))
        .toList();

    var enumMappers = targets.enums.values
        .map((c) => EnumMapperGenerator(c.config))
        .toList();

    var customMappers = targets.customMappers.values;

    var genClasses = await Future.wait(
        classMappers.map((om) => om.generate((e) => classConfigs[e])));

    var genEnums = await Future.wait(enumMappers.map((em) => em.generate()));

    return ''
        '// coverage:ignore-file\n'
        '// GENERATED CODE - DO NOT MODIFY BY HAND\n'
        '// ignore_for_file: type=lint\n'
        '// ignore_for_file: unused_element\n\n'
        'part of \'${buildStep.inputId.uri}\';\n\n'
        '// === GENERATED CLASS MAPPERS AND EXTENSIONS ===\n\n'
        '${genClasses.join('\n\n')}\n'
        '\n\n'
        '// === GENERATED ENUM MAPPERS AND EXTENSIONS ===\n\n'
        '${genEnums.join('\n\n')}\n';
  }
}
