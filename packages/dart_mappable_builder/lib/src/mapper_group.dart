import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart'
    show DiscoveryMode, GenerateMethods;
import 'package:path/path.dart';

import 'builder_options.dart';
import 'elements/alias_class_mapper_element.dart';
import 'elements/class_mapper_element.dart';
import 'elements/dependent_class_mapper_element.dart';
import 'elements/enum_mapper_element.dart';
import 'elements/factory_constructor_mapper_element.dart';
import 'elements/mapper_element.dart';
import 'elements/none_class_mapper_element.dart';
import 'elements/target_class_mapper_element.dart';
import 'utils.dart';
import 'package:glob/glob.dart';

class MapperElementGroup {
  MapperElementGroup(this.library, this.options) {
    var names = <String, Element>{};
    for (var i in library.libraryImports) {
      names.addAll(i.namespace.definedNames);
    }
    names.addAll(library.publicNamespace.definedNames);

    for (var name in names.entries) {
      if (name.key.contains('.')) {
        prefixes[name.value] = name.key.substring(0, name.key.indexOf('.') + 1);
      } else {
        prefixes[name.value] = '';
      }
    }
  }

  final LibraryElement library;
  final MappableOptions options;

  Map<Element, String> prefixes = {};
  Map<InterfaceElement, MapperElement> targets = {};
  Map<InterfaceElement, MapperElement> alias = {};

  late String packageName;
  bool isPackage(Uri lib) {
    if (lib.scheme == 'package' || lib.scheme == 'asset') {
      return lib.pathSegments.first == packageName;
    } else {
      return false;
    }
  }

  Future<T> addMapper<T extends MapperElement>(T mapper) async {
    await mapper.analyze;
    if (mapper is AliasClassMapperElement) {
      alias[mapper.targetElement] = mapper;
    }
    return targets[mapper.element] = mapper;
  }

  Future<void> analyze() async {
    var elements = elementsOf(library);

    for (var element in elements) {
      if (element.isPrivate || getMapperForElement(element) != null) {
        continue;
      }

      if (element is ClassElement && classChecker.hasAnnotationOf(element)) {
        var node = await element.getResolvedNode();
        if (node is ClassTypeAlias) {
          await addMapper(
              AliasClassMapperElement(this, element, node, options));
        } else {
          await addMapper(TargetClassMapperElement(this, element, options));
        }

        for (var c in element.constructors) {
          if (c.isFactory &&
              c.redirectedConstructor != null &&
              classChecker.hasAnnotationOf(c)) {
            // Disable copy methods for factory elements.
            var subOptions = options.apply(MappableOptions(
                generateMethods:
                    ~(~(options.generateMethods ?? GenerateMethods.all) |
                        GenerateMethods.copy)));

            await addMapper(
                FactoryConstructorMapperElement(this, c, subOptions));
          }
        }
      } else if (element is EnumElement &&
          enumChecker.hasAnnotationOf(element)) {
        await addMapper(EnumMapperElement(this, element, options));
      }
    }

    for (var target in targets.values.toList()) {
      await analyzeElement(target);
    }
  }

  Future<void> analyzeElement(MapperElement target) async {
    if (target is! ClassMapperElement) return;

    if (target.superTarget == null) {
      ClassElement? superElement;
      var supertype = target.targetElement.supertype;
      if (supertype == null || supertype.isDartCoreObject) {
        supertype = target.targetElement.interfaces.firstOrNull;
      }
      if (supertype != null && !supertype.isDartCoreObject) {
        var element = supertype.element;
        if (element is ClassElement) superElement = element;
      }

      if (superElement != null) {
        ClassMapperElement superTarget =
            await getOrAddMapperForElement(superElement, orNone: true)
                as ClassMapperElement;

        target.superTarget = superTarget;
        if (!superTarget.subTargets.contains(target)) {
          superTarget.subTargets.add(target);
        }
      }
    }

    for (var elem in target.getSubClasses()) {
      ClassMapperElement? subMapper =
          await getOrAddMapperForElement(elem) as ClassMapperElement?;

      if (subMapper == null) {
        throw 'Cannot include subclass ${elem.getDisplayString(withNullability: false)}, '
            'since it has no generated mapper.';
      }

      subMapper.superTarget = target;
      if (!target.subTargets.contains(subMapper)) {
        target.subTargets.add(subMapper);
      }
    }

    Future<void> checkType(DartType t) async {
      var e = t.element;
      await getOrAddMapperForElement(e);
      if (t is ParameterizedType) {
        for (var arg in t.typeArguments) {
          await checkType(arg);
        }
      }
    }

    for (var param in target.params) {
      await checkType(param.parameter.type);
    }

    for (var param in target.element.typeParameters) {
      if (param.bound != null) {
        await getOrAddMapperForElement(param.bound!.element);
      }
    }
  }

  MapperElement? getMapperForElement(Element? e) {
    return targets[e] ?? alias[e];
  }

  Future<MapperElement?> getOrAddMapperForElement(Element? e,
      {bool orNone = false}) async {
    var m = getMapperForElement(e);
    if (m != null) {
      return m;
    } else if (e is ClassElement && classChecker.hasAnnotationOf(e)) {
      var m = await addMapper(DependentClassMapperElement(this, e, options));
      await analyzeElement(m);
      return m;
    } else if (e is ClassElement && orNone) {
      var m = await addMapper(NoneClassMapperElement(this, e, options));
      await analyzeElement(m);
      return m;
    } else if (e is EnumElement && enumChecker.hasAnnotationOf(e)) {
      var m = await addMapper(EnumMapperElement(this, e, options));
      return m;
    } else {
      return null;
    }
  }

  String prefixOfElement(Element elem) {
    return prefixes[elem] ?? '';
  }

  String prefixedType(DartType t, {bool withNullability = true}) {
    if (t is TypeParameterType || t.element == null) {
      return t.getDisplayString(withNullability: withNullability);
    }

    var typeArgs = '';
    if (t is InterfaceType && t.typeArguments.isNotEmpty) {
      typeArgs = '<${t.typeArguments.map(prefixedType).join(', ')}>';
    }

    var type = '${t.element!.name}$typeArgs';

    if (withNullability && t.nullabilitySuffix == NullabilitySuffix.question) {
      type += '?';
    }

    return '${prefixOfElement(t.element!)}$type';
  }

  /// All of the declared classes and enums in this library.
  Iterable<InterfaceElement> elementsOf(LibraryElement element) sync* {
    for (var cu in element.units) {
      yield* cu.enums;
      yield* cu.classes;
    }
  }

  Future<List<MapEntry<LibraryElement, Iterable<Element>>>> discover(
      BuildStep buildStep) async {
    var mode = options.discoveryMode;

    bool isMapper(Element e) {
      return (e is ClassElement && classChecker.hasAnnotationOf(e)) ||
          (e is EnumElement && enumChecker.hasAnnotationOf(e));
    }

    if (mode == DiscoveryMode.package || mode == DiscoveryMode.directory) {
      var glob = mode == DiscoveryMode.package
          ? Glob('**.dart')
          : Glob('${dirname(buildStep.inputId.path)}/**.dart');
      return await buildStep
          .findAssets(glob)
          .asyncMap((id) async {
            if (await buildStep.resolver.isLibrary(id)) {
              return buildStep.resolver.libraryFor(id);
            }
            return null;
          })
          .where((l) => l != null)
          .map((lib) => MapEntry(lib!, lib.topLevelElements.where(isMapper)))
          .where((e) => e.value.isNotEmpty)
          .toList();
    } else if (mode == DiscoveryMode.library) {
      var lib = await buildStep.inputLibrary;

      return [MapEntry(lib, lib.topLevelElements.where(isMapper))];
    }

    return [];
  }
}
