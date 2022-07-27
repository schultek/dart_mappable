import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';

import '../builder_options.dart';
import '../imports_builder.dart';
import '../utils.dart';
import 'class_mapper_target.dart';
import 'custom_mapper_config.dart';
import 'enum_mapper_target.dart';

class MapperTargets {
  final ImportsBuilder imports;
  MapperTargets(AssetId inputId) : imports = ImportsBuilder(inputId);

  Map<ClassElement, EnumMapperTarget> enums = {};
  Map<ClassElement, ClassMapperTarget> classes = {};
  Map<Element, CustomMapperConfig> customMappers = {};

  void addElementsFromLibrary(LibraryElement library, MappableOptions options) {
    var elements = elementsOf(library);

    for (var element in elements) {
      if (customMapperChecker.hasAnnotationOf(element)) {
        var mapperIndex = element.allSupertypes
            .indexWhere((t) => mapperChecker.isExactlyType(t));
        if (mapperIndex == -1) {
          throw UnsupportedError(
              'Classes marked with @CustomMapper must extend the BaseMapper class');
        }
        var type = element.allSupertypes[mapperIndex].typeArguments[0];
        var libPrefix = imports.add(library.source.uri);

        customMappers[type.element!] = CustomMapperConfig(
          element: element,
          prefix: libPrefix,
        );
      } else {
        var shouldGenerate = options.shouldGenerateFor(element);
        if (!shouldGenerate && !options.ignoreAnnotated) {
          shouldGenerate =
              (!element.isEnum && classChecker.hasAnnotationOf(element)) ||
                  (element.isEnum && enumChecker.hasAnnotationOf(element));
        }
        if (shouldGenerate) {
          addElement(element, options);
        }
      }
    }
  }

  void addElement(ClassElement element, MappableOptions options) {
    if (element.isPrivate) return;
    if (element.isEnum) {
      if (enums.containsKey(element)) {
        return;
      }

      var prefix = imports.add(element.librarySource.uri);
      enums[element] = EnumMapperTarget(element, options, prefix);
    } else {
      if (classes.containsKey(element)) {
        return;
      }

      var prefix = imports.add(element.librarySource.uri);
      addClassTarget(ClassMapperTarget(element, options, prefix));

      for (var c in element.constructors) {
        if (c.isFactory &&
            c.redirectedConstructor != null &&
            classChecker.hasAnnotationOf(c)) {
          addClassTarget(FactoryConstructorMapperTarget(c, options, prefix));
        }
      }
    }
  }

  void addClassTarget(ClassMapperTarget target) {
    classes[target.element] = target;

    var superElement = target.getSuperElement();
    if (superElement != null) {
      ClassMapperTarget superTarget;
      if (classes.containsKey(superElement)) {
        superTarget = classes[superElement]!;
      } else if (!superElement.isPrivate) {
        addElement(superElement, target.options);
        superTarget = classes[superElement]!;
      } else {
        superTarget =
            ClassMapperTarget(superElement, target.options, target.prefix);
      }

      target.setSuperTarget(superTarget);
    }
  }

  /// All of the declared classes and enums in this library.
  Iterable<ClassElement> elementsOf(LibraryElement element) sync* {
    for (var cu in element.units) {
      yield* cu.enums;
      yield* cu.classes;
    }
  }
}

abstract class MapperTarget {
  ClassElement element;
  MappableOptions options;
  int? prefix;

  MapperTarget(this.element, this.options, this.prefix);

  Element get annotatedElement => element;

  late DartObject? annotation = getAnnotation();
  DartObject? getAnnotation();
}
