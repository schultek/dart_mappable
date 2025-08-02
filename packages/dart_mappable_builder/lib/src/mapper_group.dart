import 'package:analyzer/dart/element/element2.dart';
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
    for (var i in library.firstFragment.libraryImports2) {
      if (i.prefix2?.name2 case String prefix) {
        for (final e in i.namespace.definedNames2.entries) {
          prefixes[e.value] = '$prefix.';
        }
      }
    }
  }

  final LibraryElement2 library;
  final MappableOptions options;

  Map<Element2, String> prefixes = {};
  Map<Element2, MapperElement> targets = {};
  late RecordsGroup records = RecordsGroup(this);

  Future<void> analyze() async {
    var elements = elementsOf(library);

    for (var element in elements) {
      await getOrAddMapperForElement(element);
    }
  }

  MapperElement? getMapperForElement(Element2? e) {
    return targets[e];
  }

  Future<MapperElement?> getOrAddMapperForElement(
    Element2? e, {
    bool orNone = false,
  }) async {
    if (e == null || e.isPrivate) {
      return null;
    }
    var m = getMapperForElement(e);
    if (m != null) {
      return m;
    }
    if (e is ClassElement2) {
      if (classChecker.hasAnnotationOf(e)) {
        if (e.library2 == library) {
          var m = await _addMapper(
            await TargetClassMapperElement.from(this, e, options),
          );

          for (var c in e.constructors2) {
            if (c.isFactory &&
                c.redirectedConstructor2 != null &&
                classChecker.hasAnnotationOf(c)) {
              // Disable copy methods for factory elements.
              var subOptions = options.apply(
                MappableOptions(
                  generateMethods:
                      ~(~(options.generateMethods ?? GenerateMethods.all) |
                          GenerateMethods.copy),
                ),
              );

              await _addMapper(
                await FactoryConstructorMapperElement.from(this, c, subOptions),
              );
            }
          }

          return m;
        } else {
          return await _addMapper(
            await DependentClassMapperElement.from(this, e, options),
          );
        }
      }
    } else if (e is EnumElement2) {
      if (enumChecker.hasAnnotationOf(e)) {
        if (e.library2 == library) {
          return await _addMapper(
            await TargetEnumMapperElement.from(this, e, options),
          );
        } else {
          return await _addMapper(
            await DependentEnumMapperElement.from(this, e, options),
          );
        }
      }
    } else if (e is TypeAliasElement2) {
      if (classChecker.hasAnnotationOf(e) &&
          e.aliasedType.element3 is ClassElement2) {
        if (e.library2 == library) {
          return await _addMapper(
            await AliasClassMapperElement.from(this, e, options),
          );
        }
      } else if (recordChecker.hasAnnotationOf(e) &&
          e.aliasedType is RecordType) {
        if (e.library2 == library) {
          return await _addMapper(
            await TargetRecordMapperElement.from(this, e, options),
          );
        } else {
          return await _addMapper(
            await DependentRecordMapperElement.from(this, e, options),
          );
        }
      }
    }
    return null;
  }

  Future<T> _addMapper<T extends MapperElement>(T mapper) async {
    targets[mapper.element] = mapper;

    if (mapper is ClassMapperElement) {
      var element = mapper;

      ClassElement2? getElementFor(InterfaceType? t) {
        if (t != null && !t.isDartCoreObject && t.element3 is ClassElement2) {
          return t.element3 as ClassElement2;
        }
        return null;
      }

      if (element.extendsElement == null) {
        var superElement = getElementFor(element.element.supertype);
        if (superElement != null) {
          var superTarget =
              await getOrAddMapperForElement(superElement)
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
          throw 'Cannot include subclass ${elem.displayName} '
              'since it has no generated mapper.';
        }

        if (subMapper.element.supertype?.element3 == element.element) {
          subMapper.extendsElement = element;
        } else if (subMapper.element.interfaces
            .map((i) => i.element3)
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
        var e = t.element3;
        await getOrAddMapperForElement(e);
        if (t is ParameterizedType) {
          for (var arg in t.typeArguments) {
            await checkType(arg);
          }
        }
        if (t is RecordType) {
          if (t.alias case var alias?) {
            var m = await getOrAddMapperForElement(alias.element2);
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

      for (var param in element.element.typeParameters2) {
        if (param.bound != null) {
          await getOrAddMapperForElement(param.bound!.element3);
        }
      }
    }

    return mapper;
  }

  String prefixOfElement(Element2 elem) {
    return prefixes[elem] ?? '';
  }

  String prefixedType(
    DartType t, {
    bool withNullability = true,
    bool resolveBounds = false,
    bool resolveBoundsDeep = true,
    Set<TypeParameterType> visited = const {},
  }) {
    if (t is TypeParameterType) {
      if (visited.contains(t)) {
        return 'Object?';
      }
      var type = t.element3.name3 ?? '';
      if (resolveBounds) {
        type = prefixedType(
          t.bound,
          withNullability: withNullability,
          resolveBounds: resolveBounds,
          resolveBoundsDeep: resolveBoundsDeep,
          visited: {...visited, t},
        );
      }
      if (withNullability &&
          t.isNullable &&
          !type.endsWith('?') &&
          type != 'dynamic') {
        type += '?';
      }
      return type;
    }

    resolveBounds &= resolveBoundsDeep;

    if (t is InterfaceType) {
      var typeArgs = '';
      if (t.typeArguments.isNotEmpty) {
        typeArgs =
            '<${t.typeArguments.map((t) => prefixedType(t, resolveBounds: resolveBounds, visited: visited)).join(', ')}>';
      }

      var type = '${t.element3.name3 ?? ''}$typeArgs';

      if (withNullability && t.isNullable) {
        type += '?';
      }

      return '${prefixOfElement(t.element3)}$type';
    }

    if (t is RecordType) {
      if (t.alias case var alias?) {
        var type = alias.element2.name3 ?? '';

        if (alias.typeArguments.isNotEmpty) {
          type +=
              '<${alias.typeArguments.map((t) => prefixedType(t, resolveBounds: resolveBounds, visited: visited)).join(', ')}>';
        }

        if (withNullability && t.isNullable) {
          type += '?';
        }

        return '${prefixOfElement(alias.element2)}$type';
      }
      var type = '';
      var r = records.get(t);

      if (r != null) {
        type = '${r.className}<';
        type += [...t.positionalFields, ...t.namedFields]
            .map(
              (f) => prefixedType(
                f.type,
                resolveBounds: resolveBounds,
                visited: visited,
              ),
            )
            .join(', ');
        type += '>';
      } else {
        type = t.positionalFields
            .map(
              (f) => prefixedType(
                f.type,
                resolveBounds: resolveBounds,
                visited: visited,
              ),
            )
            .join(', ');

        if (t.namedFields.isNotEmpty) {
          if (t.positionalFields.isNotEmpty) {
            type += ', ';
          }
          type +=
              '{${t.namedFields.map((f) => '${prefixedType(f.type, resolveBounds: resolveBounds, visited: visited)} ${f.name}').join(', ')}}';
        }

        type = '($type)';
      }

      if (withNullability && t.isNullable) {
        type += '?';
      }

      return type;
    }

    if (t is FunctionType) {
      var returnType = prefixedType(
        t.returnType,
        resolveBounds: resolveBounds,
        visited: visited,
      );

      var typeArgs = '';
      if (t.typeParameters.isNotEmpty) {
        typeArgs =
            '<${t.typeParameters.map((t) => (t.name3 ?? '') + (t.bound != null ? ' extends ${prefixedType(t.bound!, resolveBounds: resolveBounds, visited: visited)}' : '')).join(', ')}>';
      }

      var args = t.normalParameterTypes
          .map(
            (t) =>
                prefixedType(t, resolveBounds: resolveBounds, visited: visited),
          )
          .join(', ');
      if (t.optionalParameterTypes.isNotEmpty) {
        if (args.isNotEmpty) args += ', ';
        args +=
            '[${t.optionalParameterTypes.map((t) => prefixedType(t, resolveBounds: resolveBounds, visited: visited)).join(', ')}]';
      }
      if (t.namedParameterTypes.isNotEmpty) {
        if (args.isNotEmpty) args += ', ';
        args +=
            '{${t.namedParameterTypes.entries.map((e) => '${e.key}: ${prefixedType(e.value, resolveBounds: resolveBounds, visited: visited)}').join(', ')}}';
      }

      var type = '$returnType Function$typeArgs($args)';
      if (withNullability && t.isNullable) {
        type += '?';
      }

      return type;
    }

    return t.getDisplayString();
  }

  /// All of the declared classes and enums in this library.
  Iterable<Element2> elementsOf(LibraryElement2 element) sync* {
    yield* element.enums;
    yield* element.classes;
    yield* element.typeAliases;
  }

  Future<List<MapEntry<LibraryElement2, Iterable<Element2>>>> discover(
    BuildStep buildStep,
  ) async {
    var scope = options.initializerScope;

    bool isMapper(Element2 e) {
      return (e is ClassElement2 && classChecker.hasAnnotationOf(e)) ||
          (e is EnumElement2 && enumChecker.hasAnnotationOf(e));
    }

    if (scope == InitializerScope.package ||
        scope == InitializerScope.directory) {
      var glob =
          scope == InitializerScope.package
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
          .map(
            (lib) =>
                MapEntry(lib!, [...lib.classes, ...lib.enums].where(isMapper)),
          )
          .where((e) => e.value.isNotEmpty)
          .toList();
    } else if (scope == InitializerScope.library) {
      var lib = await buildStep.inputLibrary;

      return [
        MapEntry(lib, [...lib.classes, ...lib.enums].where(isMapper)),
      ];
    }

    return [];
  }
}
