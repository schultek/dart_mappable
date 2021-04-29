import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:indent/indent.dart';

import 'builder_options.dart';
import 'builder_snippets.dart';
import 'class_mapper.dart';
import 'enum_mapper.dart';

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
    Set<Uri> imports = {};

    Map<String, ClassMapper> classMappers = {};
    Map<String, EnumMapper> enumMappers = {};

    for (var library in libraries) {
      if (library.isInSdk ||
          !library.identifier
              .startsWith('package:${buildStep.inputId.package}/')) {
        continue;
      }

      var libraryOptions = options.forLibrary(library);

      var elements = elementsOf(library);
      bool hasMappedType = false;

      void addRecursive(ClassElement element) {
        if (element.isEnum) {
          if (enumMappers.containsKey(element.name)) {
            return;
          }

          enumMappers[element.name] =
              EnumMapper(element, libraryOptions.forEnum(element));
        } else {
          if (classMappers.containsKey(element.name)) {
            return;
          }

          var classMapper =
              ClassMapper(element, libraryOptions.forClass(element));

          if (element.isPrivate || !classMapper.hasValidConstructor()) {
            return;
          }

          classMappers[element.name] = classMapper;

          if (element.supertype != null &&
              !element.supertype!.isDartCoreObject) {
            addRecursive(element.supertype!.element);
          }
        }
      }

      for (var element in elements) {
        if (libraryOptions.shouldGenerateFor(element)) {
          addRecursive(element);
          hasMappedType = true;
        }
      }

      if (hasMappedType) {
        var lib = library.source.uri;
        imports.add(lib);
      }
    }

    return <String>[
      '// ignore_for_file: unnecessary_cast, prefer_relative_imports, unused_element',
      "import 'dart:convert';",
      imports.map((i) => "import '$i';").join('\n'),
      '',
      '// === GENERATED MAPPER CLASSES AND EXTENSIONS ===',
      '',
      classMappers.values
          .map((om) => om.generateExtensionCode(
              classMappers.keys.toSet(), enumMappers.keys.toSet()))
          .join(),
      enumMappers.values.map((em) => em.generateExtensionCode()).join(),
      '',
      '// === ALL STATICALLY REGISTERED MAPPERS ===',
      '',
      'var _mappers = <String, Mapper>{',
      defaultMappers,
      classMappers.values
          .map((om) => "'${om.className}': ${om.mapperName}._(),")
          .join('\n')
          .indent(2),
      enumMappers.values
          .map((em) =>
              "'${em.className}': _EnumMapper<${em.className}>(${em.mapperName}.fromString, (${em.className} ${em.paramName}) => ${em.paramName}.toStringValue()),")
          .join('\n')
          .indent(2),
      '};',
      '',
      '// === GENERATED UTILITY CLASSES ===',
      '',
      mapperCode,
    ].join('\n');
  }

  /// All of the declared classes and enums in this library.
  Iterable<ClassElement> elementsOf(LibraryElement element) sync* {
    for (var cu in element.units) {
      yield* cu.enums;
      yield* cu.types;
    }
  }
}
