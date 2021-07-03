import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:path/path.dart' as path;

import '../builder_options.dart';
import '../builder_snippets.dart';
import '../utils.dart';
import 'class_mapper_builder.dart';
import 'enum_mapper_builder.dart';

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
    Set<String> imports = {
      'dart:convert',
      'package:dart_mappable/dart_mappable.dart',
    };

    Map<String, ClassMapperBuilder> classMappers = {};
    Map<String, EnumMapperBuilder> enumMappers = {};

    Map<String, ClassElement> customMappers = {};

    void addImport(LibraryElement library) {
      var lib = library.source.uri;
      if (lib.isScheme('package')) {
        imports.add(lib.toString());
      } else {
        var relativePath = path.relative(lib.path,
            from: path.dirname(buildStep.inputId.uri.path));
        imports.add(relativePath);
      }
    }

    for (var library in libraries) {
      if (library.isInSdk) {
        continue;
      }

      var libraryOptions = options.forLibrary(library);

      var elements = elementsOf(library);

      ClassMapperBuilder? addRecursive(
        ClassElement element, {
        ClassMapperBuilder? subMapper,
      }) {
        if (element.isEnum) {
          if (enumMappers.containsKey(element.name)) {
            return null;
          }

          enumMappers[element.name] =
              EnumMapperBuilder(element, libraryOptions);
        } else {
          if (classMappers.containsKey(element.name)) {
            if (subMapper != null) {
              classMappers[element.name]!.subMappers.add(subMapper);
            }
            return classMappers[element.name];
          }

          var classMapper = ClassMapperBuilder(element, libraryOptions);

          if (subMapper != null) {
            classMapper.subMappers.add(subMapper);
          }

          if (element.isPrivate || !classMapper.hasValidConstructor()) {
            return classMapper;
          }

          classMappers[element.name] = classMapper;

          if (element.supertype != null &&
              !element.supertype!.isDartCoreObject) {
            var superMapper = addRecursive(element.supertype!.element,
                subMapper: classMapper);

            if (superMapper != null) {
              classMapper.setSuperMapper(superMapper);
            }
          }

          return classMapper;
        }
      }

      for (var element in elements) {
        if (customMapperChecker.hasAnnotationOf(element)) {
          var mapperIndex = element.allSupertypes
              .indexWhere((t) => mapperChecker.isExactlyType(t));
          if (mapperIndex == -1) {
            throw UnsupportedError(
                'Classes marked with @CustomMapper must extend the BaseMapper class');
          }
          var type = element.allSupertypes[mapperIndex].typeArguments[0];
          customMappers[type.element!.name!] = element;
          addImport(library);
          addImport(type.element!.library!);
        } else if (libraryOptions.shouldGenerateFor(element) ||
            (!element.isEnum && classChecker.hasAnnotationOf(element)) ||
            (element.isEnum && enumChecker.hasAnnotationOf(element))) {
          addRecursive(element);
          addImport(library);
        }
      }
    }

    return ''
        '${organizeImports(imports)}\n'
        '// === ALL STATICALLY REGISTERED MAPPERS ===\n\n'
        'var _mappers = <String, BaseMapper>{\n'
        '  // primitive mappers\n'
        '$defaultMappers'
        '  // class mappers\n'
        '${classMappers.values.map((om) => '  _typeOf<${om.className}>(): ${om.mapperName}._(),\n').join()}'
        '  // enum mappers\n'
        '${enumMappers.values.map((em) => '  _typeOf<${em.className}>(): EnumMapper<${em.className}>(${em.mapperName}.fromString, (${em.className} ${em.paramName}) => ${em.paramName}.toStringValue()),\n').join()}'
        '  // custom mappers\n'
        '${customMappers.entries.map((e) => '  _typeOf<${e.key}>(): ${e.value.name}(),\n').join()}'
        '};\n'
        '\n\n'
        '// === GENERATED CLASS MAPPERS AND EXTENSIONS ===\n\n'
        '${classMappers.values.map((om) => om.generateExtensionCode()).join('\n\n')}\n'
        '\n\n'
        '// === GENERATED ENUM MAPPERS AND EXTENSIONS ===\n\n'
        '${enumMappers.values.map((em) => em.generateExtensionCode()).join('\n\n')}\n'
        '\n\n'
        '// === GENERATED UTILITY CODE ===\n\n'
        '$mapperCode';
  }

  String organizeImports(Set<String> imports) {
    List<String> sdk = [], package = [], relative = [];

    for (var import in imports) {
      if (import.startsWith('dart:')) {
        sdk.add(import);
      } else if (import.startsWith('package:')) {
        package.add(import);
      } else {
        relative.add(import);
      }
    }

    sdk.sort();
    package.sort();
    relative.sort();

    String joined(List<String> s) =>
        s.isNotEmpty ? '${s.map((s) => "import '$s';").join('\n')}\n\n' : '';
    return joined(sdk) + joined(package) + joined(relative);
  }
}
