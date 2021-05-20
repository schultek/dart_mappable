import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:indent/indent.dart';
import 'package:path/path.dart' as path;
import 'package:source_gen/source_gen.dart';

import '../annotations.dart';
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

    var classChecker = const TypeChecker.fromRuntime(MappableClass);
    var enumChecker = const TypeChecker.fromRuntime(MappableEnum);

    for (var library in libraries) {
      if (library.isInSdk) {
        continue;
      } else if (library.identifier.startsWith('package:') &&
          !library.identifier
              .startsWith('package:${buildStep.inputId.package}/')) {
        continue;
      }

      var libraryOptions = options.forLibrary(library);

      var elements = elementsOf(library);
      bool hasMappedType = false;

      ClassMapper? addRecursive(
        ClassElement element, {
        bool isSuperClass = false,
      }) {
        if (element.isEnum) {
          if (enumMappers.containsKey(element.name)) {
            return null;
          }

          enumMappers[element.name] = EnumMapper(
              element,
              libraryOptions.forEnum(
                element,
                enumChecker.firstAnnotationOf(element),
              ));
        } else {
          if (classMappers.containsKey(element.name)) {
            classMappers[element.name]!.isSuperMapper = isSuperClass;
            return classMappers[element.name];
          }

          var classMapper = ClassMapper(
            element,
            libraryOptions.forClass(
              element,
              classChecker.firstAnnotationOf(element),
            ),
            isSuperMapper: isSuperClass,
          );

          if (element.isPrivate || !classMapper.hasValidConstructor()) {
            return classMapper;
          }

          classMappers[element.name] = classMapper;

          if (element.supertype != null &&
              !element.supertype!.isDartCoreObject) {
            var superMapper =
                addRecursive(element.supertype!.element, isSuperClass: true);
            classMapper.superMapper = superMapper;
          }
        }
      }

      for (var element in elements) {
        if (libraryOptions.shouldGenerateFor(element) ||
            (!element.isEnum && classChecker.hasAnnotationOf(element)) ||
            (element.isEnum && enumChecker.hasAnnotationOf(element))) {
          addRecursive(element);
          hasMappedType = true;
        }
      }

      if (hasMappedType) {
        var lib = library.source.uri;
        if (lib.isScheme('package')) {
          imports.add(lib);
        } else {
          var relativePath = path.relative(lib.path,
              from: path.dirname(buildStep.inputId.uri.path));
          imports.add(Uri.parse(relativePath));
        }
      }
    }

    return ''
        '// ignore_for_file: unnecessary_cast, prefer_relative_imports, unused_element\n'
        "import 'dart:convert';\n"
        '${imports.map((i) => "import '$i';").join('\n')}\n'
        '\n// === GENERATED MAPPER CLASSES AND EXTENSIONS ===\n\n'
        '${classMappers.values.map((om) => om.generateExtensionCode()).join()}\n'
        '${enumMappers.values.map((em) => em.generateExtensionCode()).join()}\n'
        '\n// === ALL STATICALLY REGISTERED MAPPERS ===\n\n'
        'var _mappers = <String, Mapper>{\n$defaultMappers\n'
        '${classMappers.values.map((om) => 'typeOf<${om.className}>(): ${om.mapperName}._(),').join('\n').indent(2)}\n'
        '${enumMappers.values.map((em) => 'typeOf<${em.className}>(): _EnumMapper<${em.className}>(${em.mapperName}.fromString, (${em.className} ${em.paramName}) => ${em.paramName}.toStringValue()),').join('\n').indent(2)}\n'
        '};\n'
        '\n// === GENERATED UTILITY CLASSES ===\n\n'
        '$mapperCode';
  }

  /// All of the declared classes and enums in this library.
  Iterable<ClassElement> elementsOf(LibraryElement element) sync* {
    for (var cu in element.units) {
      yield* cu.enums;
      yield* cu.types;
    }
  }
}
