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

  Map<EnumElement, EnumMapperTarget> enums = {};
  Map<ClassElement, ClassMapperTarget> classes = {};
  Map<Element, CustomMapperConfig> customMappers = {};

  Map<String, int> nameIndexes = {};

  void addElementsFromLibrary(LibraryElement library, MappableOptions options) {
    if (options.include == null) {
      var elements = elementsOf(library);

      for (var element in elements) {
        if (element is ClassElement &&
            customMapperChecker.hasAnnotationOf(element)) {
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
          if (element is ClassElement &&
              classChecker.hasAnnotationOf(element)) {
            addElement(element, options);
          } else if (element is EnumElement &&
              enumChecker.hasAnnotationOf(element)) {
            addElement(element, options);
          }
        }
      }
    } else {
      var types = options.include!;

      for (var type in types) {
        var e = type.element;
        if (e is InterfaceElement) {
          addElement(e, options);
        }
      }
    }
  }

  void addElement(InterfaceElement element, MappableOptions options) {
    if (element.isPrivate) return;
    if (element is EnumElement) {
      if (enums.containsKey(element)) {
        return;
      }

      var prefix = imports.add(element.librarySource.uri);
      var index = getNameIndex(element.name);
      enums[element] = EnumMapperTarget(element, options, prefix, index);
    } else if (element is ClassElement) {
      if (classes.containsKey(element)) {
        return;
      }

      var prefix = imports.add(element.librarySource.uri);
      var index = getNameIndex(element.name);
      addClassTarget(ClassMapperTarget(element, options, prefix, index));

      for (var c in element.constructors) {
        if (c.isFactory &&
            c.redirectedConstructor != null &&
            classChecker.hasAnnotationOf(c)) {
          var index = getNameIndex(c.name);
          addClassTarget(
              FactoryConstructorMapperTarget(c, options, prefix, index));
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
        superTarget = ClassMapperTarget(
          superElement,
          target.options,
          target.importPrefix,
          target.nameIndex,
        );
      }

      target.setSuperTarget(superTarget);
    }
  }

  /// All of the declared classes and enums in this library.
  Iterable<InterfaceElement> elementsOf(LibraryElement element) sync* {
    for (var cu in element.units) {
      yield* cu.enums;
      yield* cu.classes;
    }
  }

  int getNameIndex(String name) {
    var index = nameIndexes[name] ?? 0;
    nameIndexes[name] = index + 1;
    return index;
  }
}

abstract class MapperTarget<T extends InterfaceElement> {
  T element;
  MappableOptions options;
  int? importPrefix;
  int nameIndex;

  MapperTarget(this.element, this.options, this.importPrefix, this.nameIndex);

  Element get annotatedElement => element;

  late DartObject? annotation = getAnnotation();
  DartObject? getAnnotation();
}
