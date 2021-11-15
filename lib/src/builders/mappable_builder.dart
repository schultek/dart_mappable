import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';

import 'builder_options.dart';
import 'builder_snippets.dart';
import 'class_mapper_builder.dart';
import 'enum_mapper_builder.dart';
import 'imports_builder.dart';
import 'utils.dart';

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
    var imports = ImportsBuilder(buildStep.inputId)
      ..add(Uri.parse('package:dart_mappable/internals.dart'));

    Map<String, ClassMapperBuilder> classMappers = {};
    Map<String, EnumMapperBuilder> enumMappers = {};

    Map<String, ClassElement> customMappers = {};

    for (var library in libraries) {
      if (library.isInSdk) {
        continue;
      }

      var libraryOptions = options.forLibrary(library);

      var elements = elementsOf(library);

      ClassMapperBuilder? addRecursive(
        ClassElement element, {
        ClassMapperBuilder? subMapper,
        ConstructorElement? annotatedFactory,
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

          var classMapper =
              ClassMapperBuilder(element, libraryOptions, annotatedFactory);

          if (subMapper != null) {
            classMapper.subMappers.add(subMapper);
          }

          if (element.isPrivate) {
            return classMapper;
          }

          classMappers[element.name] = classMapper;

          var supertype = element.supertype;
          if (supertype == null || supertype.isDartCoreObject) {
            supertype =
                element.interfaces.isNotEmpty ? element.interfaces.first : null;
          }

          if (supertype != null && !supertype.isDartCoreObject) {
            var superMapper =
                addRecursive(supertype.element, subMapper: classMapper);
            if (superMapper != null) {
              classMapper.setSuperMapper(superMapper);
            }
          }

          for (var c in element.constructors) {
            if (c.isFactory &&
                c.redirectedConstructor != null &&
                classChecker.hasAnnotationOf(c)) {
              var e = c.redirectedConstructor!.returnType.element;
              addRecursive(e, annotatedFactory: c);
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
          imports.addLibrary(library);
          imports.addLibrary(type.element!.library!);
        } else if (libraryOptions.shouldGenerateFor(element) ||
            (!element.isEnum && classChecker.hasAnnotationOf(element)) ||
            (element.isEnum && enumChecker.hasAnnotationOf(element))) {
          addRecursive(element);
          imports.addLibrary(library);
        }
      }
    }

    return ''
        '${imports.write()}\n'
        '// === ALL STATICALLY REGISTERED MAPPERS ===\n\n'
        'var _mappers = <BaseMapper>{\n'
        '  // class mappers\n'
        '${classMappers.values.map((om) => '  ${om.mapperName}._(),\n').join()}'
        '  // enum mappers\n'
        '${enumMappers.values.map((em) => '  EnumMapper<${em.className}>(${em.mapperName}.fromString, (${em.className} ${em.paramName}) => ${em.paramName}.toStringValue()),\n').join()}'
        '  // custom mappers\n'
        '${customMappers.entries.map((e) => '  ${e.value.name}(),\n').join()}'
        '};\n'
        '\n\n'
        '// === GENERATED CLASS MAPPERS AND EXTENSIONS ===\n\n'
        '${classMappers.values.map((om) => om.generateExtensionCode(classMappers)).join('\n\n')}\n'
        '\n\n'
        '// === GENERATED ENUM MAPPERS AND EXTENSIONS ===\n\n'
        '${enumMappers.values.map((em) => em.generateExtensionCode()).join('\n\n')}\n'
        '\n\n'
        '// === GENERATED UTILITY CODE ===\n\n'
        '$mapperCode';
  }
}
