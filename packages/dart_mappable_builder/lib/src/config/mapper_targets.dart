import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/dart/resolver/scope.dart';
import 'package:build/build.dart';

import '../builder_options.dart';
import '../utils.dart';
import 'class_mapper_target.dart';
import 'custom_mapper_config.dart';
import 'enum_mapper_target.dart';

class MapperTargets {
  MapperTargets(AssetId inputId);

  Map<EnumElement, EnumMapperTarget> enums = {};
  Map<ClassElement, ClassMapperTarget> classes = {};
  Map<Element, CustomMapperConfig> customMappers = {};

  Map<String, int> nameIndexes = {};

  void addElementsFromLibrary(LibraryElement library, MappableOptions options, Namespace namespace) {
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

          customMappers[type.element!] = CustomMapperConfig(
            element: element,
          );
        } else {
          if (element is ClassElement &&
              classChecker.hasAnnotationOf(element)) {
            addElement(element, options, namespace);
          } else if (element is EnumElement &&
              enumChecker.hasAnnotationOf(element)) {
            addElement(element, options, namespace);
          }
        }
      }
    } else {
      var types = options.include!;

      for (var type in types) {
        var e = type.element;
        if (e is InterfaceElement) {
          addElement(e, options, namespace);
        }
      }
    }
  }

  void addElement(InterfaceElement element, MappableOptions options, Namespace namespace) {
    if (element.isPrivate) return;
    if (element is EnumElement) {
      if (enums.containsKey(element)) {
        return;
      }

      var index = getNameIndex(element.name);
      enums[element] = EnumMapperTarget(element, options, index, namespace);
    } else if (element is ClassElement) {
      if (classes.containsKey(element)) {
        return;
      }

      var index = getNameIndex(element.name);
      addClassTarget(ClassMapperTarget(element, options, index, namespace));

      for (var c in element.constructors) {
        if (c.isFactory &&
            c.redirectedConstructor != null &&
            classChecker.hasAnnotationOf(c)) {
          var index = getNameIndex(c.name);
          addClassTarget(
              FactoryConstructorMapperTarget(c, options, index, namespace));
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
      } else {
        superTarget = ClassMapperTarget(
          superElement,
          target.options,
          target.nameIndex,
          target.namespace
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
  int nameIndex;
  Namespace namespace;

  MapperTarget(this.element, this.options, this.nameIndex, this.namespace);

  Element get annotatedElement => element;

  late DartObject? annotation = getAnnotation();
  DartObject? getAnnotation();
}
