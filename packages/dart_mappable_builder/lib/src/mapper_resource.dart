import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:collection/collection.dart';

import 'builder_options.dart';
import 'elements/class_mapper_element.dart';
import 'elements/enum_mapper_element.dart';
import 'elements/mapper_element.dart';
import 'utils.dart';

final mapperResource = Resource<MapperData>(() => MapperData());

class MapperData {
  late MappableOptions globalOptions;
  final Map<LibraryElement, MapperElementGroup> groups = {};

  MapperElement? getTargetForElement(Element? element) {
    if (element == null) return null;
    var target = groups.values
        .map((g) => g.targets[element])
        .whereType<MapperElement>()
        .firstOrNull;
    if (target == null && element.library != null) {
      var g = getGroupForLibrary(element.library!);
      return g.targets[element];
    }
    return null;
  }

  MapperElementGroup getGroupForLibrary(LibraryElement lib) {
    if (groups.containsKey(lib)) {
      return groups[lib]!;
    }

    var group = MapperElementGroup(this, lib);
    var options = globalOptions;

    if (libChecker.hasAnnotationOf(lib)) {
      var libOptions = MappableOptions.from(libChecker.firstAnnotationOf(lib)!);

      if (libOptions.include != null) {
        throw 'Cannot use "include" when @MappableLib() is applied to the library keyword.';
      }

      options = options.apply(libOptions);
    }

    group.addElementsFromLibrary(lib, options, lib.publicNamespace);

    for (var import in lib.libraryImports) {
      if (import.importedLibrary == null) continue;

      if (libChecker.hasAnnotationOf(import)) {
        var libOptions =
            MappableOptions.from(libChecker.firstAnnotationOf(import)!);

        if (libOptions.include == null) {
          throw 'Have to use "include" when @MappableLib() is applied to an import statement.';
        }

        bool isInNamespace(DartType type) {
          var name = type.alias?.element.name ??
              type.getDisplayString(withNullability: false);
          var elem = type.alias?.element ?? type.element;
          Element? imp;
          if (import.prefix != null) {
            imp =
                import.namespace.getPrefixed(import.prefix!.element.name, name);
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

        var importOptions = options.apply(libOptions, forceJoin: false);
        group.addElementsFromLibrary(lib, importOptions, lib.publicNamespace);
      }
    }

    return group;
  }
}

class MapperElementGroup {
  MapperElementGroup(this.parent, LibraryElement lib)
      : namespace = lib.publicNamespace;

  final MapperData parent;
  final Namespace namespace;

  Map<InterfaceElement, MapperElement> targets = {};

  Map<String, int> nameIndexes = {};

  MapperElement? getTargetForElement(Element? element) {
    return targets[element] ?? parent.getTargetForElement(element);
  }

  void addElementsFromLibrary(
      LibraryElement library, MappableOptions options, Namespace namespace) {
    if (options.include == null) {
      var elements = elementsOf(library);

      for (var element in elements) {
        if (element is ClassElement && classChecker.hasAnnotationOf(element)) {
          addElement(element, options);
        } else if (element is EnumElement &&
            enumChecker.hasAnnotationOf(element)) {
          addElement(element, options);
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

  void addElement(
      InterfaceElement element, MappableOptions options) {
    if (element.isPrivate) return;
    if (targets.containsKey(element)) {
      return;
    }

    if (element is EnumElement) {
      var index = getNameIndex(element.name);
      targets[element] = EnumMapperElement(this, element, options, index);
    } else if (element is ClassElement) {
      var index = getNameIndex(element.name);
      addClassTarget(ClassMapperElement(this, element, options, index));

      for (var c in element.constructors) {
        if (c.isFactory &&
            c.redirectedConstructor != null &&
            classChecker.hasAnnotationOf(c)) {
          var index = getNameIndex(c.name);
          addClassTarget(
              FactoryConstructorMapperTarget(this, c, options, index));
        }
      }
    }
  }

  void addClassTarget(ClassMapperElement target) {
    targets[target.element] = target;

    var superElement = target.getSuperElement();
    if (superElement != null) {
      ClassMapperElement superTarget;
      if (targets.containsKey(superElement)) {
        superTarget = targets[superElement] as ClassMapperElement;
      } else {
        superTarget = ClassMapperElement(this,
            superElement, target.options, target.nameIndex);
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
