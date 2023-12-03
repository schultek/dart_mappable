import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:dart_mappable/dart_mappable.dart'
    show GenerateMethods, InitializerScope;
import 'package:glob/glob.dart';
import 'package:path/path.dart';

import 'builder_options.dart';
import 'elements/class/alias_class_mapper_element.dart';
import 'elements/class/class_mapper_element.dart';
import 'elements/class/dependent_class_mapper_element.dart';
import 'elements/class/factory_constructor_mapper_element.dart';
import 'elements/class/target_class_mapper_element.dart';
import 'elements/enum/dependent_enum_mapper_element.dart';
import 'elements/enum/target_enum_mapper_element.dart';
import 'elements/mapper_element.dart';
import 'elements/record/dependent_record_mapper_element.dart';
import 'elements/record/target_record_mapper_element.dart';
import 'records_group.dart';
import 'utils.dart';

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
  Map<Element, MapperElement> targets = {};
  late RecordsGroup records = RecordsGroup(this);

  Future<void> analyze() async {
    var elements = elementsOf(library);

    for (var element in elements) {
      await getOrAddMapperForElement(element);
    }
  }

  MapperElement? getMapperForElement(Element? e) {
    return targets[e];
  }

  Future<MapperElement?> getOrAddMapperForElement(Element? e,
      {bool orNone = false}) async {
    if (e == null || e.isPrivate) {
      return null;
    }
    var m = getMapperForElement(e);
    if (m != null) {
      return m;
    }
    if (e is ClassElement) {
      if (classChecker.hasAnnotationOf(e)) {
        if (e.library == library) {
          var m = await _addMapper(
              await TargetClassMapperElement.from(this, e, options));

          for (var c in e.constructors) {
            if (c.isFactory &&
                c.redirectedConstructor != null &&
                classChecker.hasAnnotationOf(c)) {
              // Disable copy methods for factory elements.
              var subOptions = options.apply(MappableOptions(
                  generateMethods:
                      ~(~(options.generateMethods ?? GenerateMethods.all) |
                          GenerateMethods.copy)));

              await _addMapper(await FactoryConstructorMapperElement.from(
                  this, c, subOptions));
            }
          }

          return m;
        } else {
          return await _addMapper(
              await DependentClassMapperElement.from(this, e, options));
        }
      }
    } else if (e is EnumElement) {
      if (enumChecker.hasAnnotationOf(e)) {
        if (e.library == library) {
          return await _addMapper(
              await TargetEnumMapperElement.from(this, e, options));
        } else {
          return await _addMapper(
              await DependentEnumMapperElement.from(this, e, options));
        }
      }
    } else if (e is TypeAliasElement) {
      if (classChecker.hasAnnotationOf(e) &&
          e.aliasedType.element is ClassElement) {
        if (e.library == library) {
          return await _addMapper(
              await AliasClassMapperElement.from(this, e, options));
        }
      } else if (recordChecker.hasAnnotationOf(e) &&
          e.aliasedType is RecordType) {
        if (e.library == library) {
          return await _addMapper(
              await TargetRecordMapperElement.from(this, e, options));
        } else {
          return await _addMapper(
              await DependentRecordMapperElement.from(this, e, options));
        }
      }
    }
    return null;
  }

  Future<T> _addMapper<T extends MapperElement>(T mapper) async {
    targets[mapper.element] = mapper;

    if (mapper is ClassMapperElement) {
      var element = mapper;

      ClassElement? getElementFor(InterfaceType? t) {
        if (t != null && !t.isDartCoreObject && t.element is ClassElement) {
          return t.element as ClassElement;
        }
        return null;
      }

      if (element.extendsElement == null) {
        var superElement = getElementFor(element.element.supertype);
        if (superElement != null) {
          var superTarget = await getOrAddMapperForElement(superElement)
              as ClassMapperElement?;

          if (superTarget != null) {
            element.extendsElement = superTarget;
            if (!superTarget.subElements.contains(element)) {
              superTarget.subElements.add(element);
            }
          }
        }
      }
      if (element.interfaceElements.isEmpty) {
        for (var interface in element.element.interfaces) {
          var interfaceElement = getElementFor(interface);
          if (interfaceElement != null) {
            var interfaceTarget =
                await getOrAddMapperForElement(interfaceElement)
                    as ClassMapperElement?;
            if (interfaceTarget != null) {
              element.interfaceElements.add(interfaceTarget);
              if (!interfaceTarget.subElements.contains(element)) {
                interfaceTarget.subElements.add(element);
              }
            }
          }
        }
      }

      for (var elem in element.getSubClasses()) {
        ClassMapperElement? subMapper =
            await getOrAddMapperForElement(elem) as ClassMapperElement?;

        if (subMapper == null) {
          throw 'Cannot include subclass ${elem.getDisplayString(withNullability: false)}, '
              'since it has no generated mapper.';
        }

        if (subMapper.element.supertype?.element == element.element) {
          subMapper.extendsElement = element;
        } else if (subMapper.element.interfaces
            .map((i) => i.element)
            .contains(element.element)) {
          if (!subMapper.interfaceElements.contains(element)) {
            subMapper.interfaceElements.add(element);
          }
        } else {
          throw 'Cannot determine supertype ${element.className} of ${subMapper.className}.';
        }
        if (!element.subElements.contains(subMapper)) {
          element.subElements.add(subMapper);
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
        if (t is RecordType) {
          if (t.alias case var alias?) {
            var m = await getOrAddMapperForElement(alias.element);
            if (m != null) {
              for (var arg in alias.typeArguments) {
                await checkType(arg);
              }
              return;
            }
          }
          records.add(t);
          for (var f in [...t.positionalFields, ...t.namedFields]) {
            await checkType(f.type);
          }
        }
      }

      for (var param in element.params) {
        await checkType(param.parameter.type);
      }

      for (var param in element.element.typeParameters) {
        if (param.bound != null) {
          await getOrAddMapperForElement(param.bound!.element);
        }
      }
    }

    return mapper;
  }

  String prefixOfElement(Element elem) {
    return prefixes[elem] ?? '';
  }

  String prefixedType(DartType t,
      {bool withNullability = true, bool resolveBounds = false}) {
    if (t is TypeParameterType) {
      if (resolveBounds) {
        return prefixedType(t.bound, resolveBounds: resolveBounds);
      }
      return t.element.name;
    }

    if (t is InterfaceType) {
      var typeArgs = '';
      if (t.typeArguments.isNotEmpty) {
        typeArgs =
            '<${t.typeArguments.map((t) => prefixedType(t, resolveBounds: resolveBounds)).join(', ')}>';
      }

      var type = '${t.element.name}$typeArgs';

      if (withNullability && t.isNullable) {
        type += '?';
      }

      return '${prefixOfElement(t.element)}$type';
    }

    if (t is RecordType) {
      if (t.alias case var alias?) {
        var type = alias.element.name;

        if (alias.typeArguments.isNotEmpty) {
          type +=
              '<${alias.typeArguments.map((t) => prefixedType(t, resolveBounds: resolveBounds)).join(', ')}>';
        }

        if (withNullability && t.isNullable) {
          type += '?';
        }

        return '${prefixOfElement(alias.element)}$type';
      }
      var type = '';
      var r = records.get(t);

      if (r != null) {
        type = '${r.className}<';
        type += [...t.positionalFields, ...t.namedFields]
            .map((f) => prefixedType(f.type, resolveBounds: resolveBounds))
            .join(', ');
        type += '>';
      } else {
        type = t.positionalFields
            .map((f) => prefixedType(f.type, resolveBounds: resolveBounds))
            .join(', ');

        if (t.namedFields.isNotEmpty) {
          if (t.positionalFields.isNotEmpty) {
            type += ', ';
          }
          type +=
              '{${t.namedFields.map((f) => '${prefixedType(f.type, resolveBounds: resolveBounds)} ${f.name}').join(', ')}}';
        }

        type = '($type)';
      }

      if (withNullability && t.isNullable) {
        type += '?';
      }

      return type;
    }

    return t.getDisplayString(withNullability: withNullability);
  }

  /// All of the declared classes and enums in this library.
  Iterable<Element> elementsOf(LibraryElement element) sync* {
    for (var cu in element.units) {
      yield* cu.enums;
      yield* cu.classes;
      yield* cu.typeAliases;
    }
  }

  Future<List<MapEntry<LibraryElement, Iterable<Element>>>> discover(
      BuildStep buildStep) async {
    var scope = options.initializerScope;

    bool isMapper(Element e) {
      return (e is ClassElement && classChecker.hasAnnotationOf(e)) ||
          (e is EnumElement && enumChecker.hasAnnotationOf(e));
    }

    if (scope == InitializerScope.package ||
        scope == InitializerScope.directory) {
      var glob = scope == InitializerScope.package
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
    } else if (scope == InitializerScope.library) {
      var lib = await buildStep.inputLibrary;

      return [MapEntry(lib, lib.topLevelElements.where(isMapper))];
    }

    return [];
  }
}
