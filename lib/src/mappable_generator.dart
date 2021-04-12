import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:indent/indent.dart';

import 'class_mapper.dart';
import 'enum_mapper.dart';
import 'generation_snippets.dart';
import 'generator_options.dart';

class MappableBuilder implements Builder {
  late GlobalOptions options;

  MappableBuilder(BuilderOptions options) {
    this.options = GlobalOptions.parse(options.config);
  }

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

  String generate(List<LibraryElement> libraries, BuildStep buildStep) {
    Set<Uri> imports = {};

    Map<String, ClassMapper> classMappers = {};
    Map<String, EnumMapper> enumMappers = {};

    for (var library in libraries) {
      if (library.isInSdk || !library.identifier.startsWith('package:${buildStep.inputId.package}/')) {
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

          enumMappers[element.name] = EnumMapper(element, libraryOptions.forEnum(element));
        } else {
          if (classMappers.containsKey(element.name)) {
            return;
          }

          classMappers[element.name] = ClassMapper(element, libraryOptions.forClass(element));

          if (element.supertype != null && !element.supertype!.isDartCoreObject) {
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
      "import 'dart:convert';",
      imports.map((i) => "import '$i';").join('\n'),
      '',
      '// ignore_for_file: unnecessary_cast',
      '',
      classMappers.values.map((om) => om.generateExtensionCode(classMappers, enumMappers)).join(),
      enumMappers.values.map((em) => em.generateExtensionCode()).join(),
      declarationsCode,
      '',
      'var _typeConverters = <Type, TypeConverter>{',
      defaultTypeConverters,
      classMappers.values
          .map((om) =>
              'typeOf<${om.className}>(): _CheckedTypeConverter<${om.className}, Map<String, dynamic>>(decoder: ${om.mapperName}.fromMap, encoder: (${om.className} ${om.paramName}) => ${om.paramName}.toMap()),')
          .join('\n')
          .indent(2),
      enumMappers.values
          .map((em) =>
              'typeOf<${em.className}>(): _CheckedTypeConverter<${em.className}, String>(decoder: ${em.mapperName}.fromString, encoder: (${em.className} ${em.paramName}) => ${em.paramName}.toStringValue()),')
          .join('\n')
          .indent(2),
      '};',
      '',
      mapperCode,
    ].join('\n');
  }

  /// All of the declarations in this library.
  Iterable<ClassElement> elementsOf(LibraryElement element) sync* {
    for (var cu in element.units) {
      yield* cu.enums;
      yield* cu.types;
    }
  }
}
