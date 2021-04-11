import 'dart:async';

import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:indent/indent.dart';

Builder objectMapper(BuilderOptions options) => ObjectMapperGenerator(options);

class ObjectMapperGenerator implements Builder {
  BuilderOptions options;
  ObjectMapperGenerator(this.options);

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    var resolver = buildStep.resolver;
    var inputId = buildStep.inputId;
    var outputId = inputId.changeExtension('.g.dart');
    var visibleLibraries = await resolver.libraries.toList();

    var generatedSource = generate(visibleLibraries, buildStep);

    await buildStep.writeAsString(outputId, generatedSource);
  }

  @override
  Map<String, List<String>> get buildExtensions => const {
        '.dart': ['.g.dart']
      };

  bool shouldGenerateFor(ClassElement element) {
    if (options.config["mode"] == "annotated") {
      return element.metadata.any((a) => a.toString().startsWith("@Mappable"));
    } else {
      var excluded = options.config["exclude"] ?? [];
      return !excluded.contains(element.name) && !element.isDartCoreObject;
    }
  }

  String generate(List<LibraryElement> libraries, BuildStep buildStep) {
    Set<Uri> imports = {
      Uri.parse("dart:convert"),
    };

    Map<String, ClassMapper> classMappers = {};
    Map<String, EnumMapper> enumMappers = {};

    for (var library in libraries) {
      if (library.isInSdk || !library.identifier.startsWith("package:${buildStep.inputId.package}/")) {
        continue;
      }

      var elements = elementsOf(library);
      bool hasMappedType = false;

      void addRecursive(ClassElement element) {

        if (element.isEnum) {

          if (enumMappers.containsKey(element.name)) {
            return;
          }

          var meta = element.metadata.where((a) => a.toString().startsWith("@Mappable"));
          enumMappers[element.name] =
              EnumMapper(element, meta.isNotEmpty ? meta.first.computeConstantValue() : null);

        } else {
          if (classMappers.containsKey(element.name)) {
            return;
          }

          var meta = element.metadata.where((a) => a.toString().startsWith("@Mappable"));
          classMappers[element.name] =
              ClassMapper(element, meta.isNotEmpty ? meta.first.computeConstantValue() : null);

          if (element.supertype != null && !element.supertype!.isDartCoreObject) {
            addRecursive(element.supertype!.element);
          }


        }
      }

      for (var element in elements) {
        if (shouldGenerateFor(element)) {
          addRecursive(element);
          hasMappedType = true;
        }
      }

      if (hasMappedType) {
        var lib = library.source.uri;
        imports.add(lib);
      }
    }

    return [
      imports.map((i) => "import '$i';").join("\n"),
      "",
      "// ignore_for_file: unnecessary_cast",
      "",
      classMappers.values.map((om) => om.generateExtensionCode(classMappers, enumMappers)).join(""),
      enumMappers.values.map((em) => em.generateExtensionCode()).join(""),
      "typedef ObjectFactory = dynamic Function(Map<String, dynamic> map);",
      "typedef EnumFactory = dynamic Function(String value);",
      "Type typeOf<T>() => T;",
      "",
      "var objectFactories = <Type, ObjectFactory>{",
      classMappers.values.map((om) => "typeOf<${om.className}>(): ${om.mapperName}.fromMap,").join("\n").indent(1) +
          "};",
      "",
      "var enumFactories = <Type, EnumFactory>{",
      enumMappers.values.map((em) => "typeOf<${em.className}>(): ${em.mapperName}.fromString,").join("\n").indent(1) + "};",
      "",
      mapperCode,
    ].join("\n");
  }

  /// All of the declarations in this library.
  Iterable<ClassElement> elementsOf(LibraryElement element) sync* {
    for (var cu in element.units) {
      yield* cu.enums;
      yield* cu.types;
    }
  }
}

class ClassMapper {
  String get className => element.name;
  String get mapperName => "${className}Mapper";

  ClassElement element;
  DartObject? annotation;

  ClassMapper(this.element, this.annotation);

  String generateExtensionCode(Map<String, ClassMapper> classMappers, Map<String, EnumMapper> enumMappers) {
    ConstructorElement? constructor;

    for (var con in element.constructors) {
      if (!con.isPrivate) {
        constructor = con;
      }
    }

    if (constructor == null) {
      throw Error();
    }

    return """
      extension $mapperName on $className {
        static $className fromMap(Map<String, dynamic> map) => ${element.name}${constructor.name != "" ? ".${constructor.name}" : ""}(${_generateConstructorParams(constructor)});
        Map<String, dynamic> toMap() => {${_generateMappingEntries(constructor, classMappers, enumMappers)}};
        $className copyWith({${_generateCopyWithParams(constructor)}}) => ${element.name}${constructor.name != "" ? ".${constructor.name}" : ""}(${_generateCopyWithConstructorParams(constructor)});
      }
    """
        .unindent();
  }

  String _generateConstructorParams(ConstructorElement constructor) {
    List<String> params = [];
    for (var param in constructor.parameters) {
      var str = "";

      if (param.isNamed) {
        str = "${param.name}: ";
      }

      str += "map.get";

      if (param.type.isDartCoreList) {
        str += "List";
      } else if (param.type.isDartCoreMap) {
        str += "Map";
      }
      if (param.isOptional) {
        str += "Opt";
      }

      str += "('${param.name}')";

      if (param.hasDefaultValue) {
        str += " ?? ${param.defaultValueCode}";
      }

      params.add(str);
    }
    return params.join(", ");
  }

  String _generateMappingEntries(ConstructorElement constructor, Map<String, ClassMapper> classMappers, Map<String, EnumMapper> enumMappers) {
    List<String> params = [];

    var supertype = constructor.enclosingElement.supertype;
    if (supertype != null && !supertype.isPrimitive && classMappers.containsKey(supertype.element.name)) {
      params.add('...(this as ${supertype.getDisplayString(withNullability: false)}).toMap()');
    }

    for (var param in constructor.parameters) {
      var name = param.name;

      DartType? type;

      if (param is FieldFormalParameterElement) {
        type = param.field!.type;
      } else {
        var getter = constructor.enclosingElement.getGetter(name);

        if (getter != null) {
          type = getter.type.returnType;
        }
        // TODO warn if no getter exists
      }

      String toMappedType(String key, DartType type) {
        if (type.isPrimitive) {
          return key;
        } else {
          var nullSuffix = type.nullabilitySuffix == NullabilitySuffix.question ? '?' : '';
          if (type.isDartCoreList) {
            var tag = key[0].toLowerCase();
            return "$key$nullSuffix.map(($tag) => ${toMappedType(tag, (type as InterfaceType).typeArguments[0])}).toList()";
          } else if (type.isDartCoreMap) {
            var types = (type as InterfaceType).typeArguments;
            return "$key$nullSuffix.map((key, value) => MapEntry(${toMappedType("key", types[0])}, ${toMappedType("value", types[1])}))";
          } else if (classMappers.containsKey(type.element?.name)) {
            return "$key$nullSuffix.toMap()";
          } else if (enumMappers.containsKey(type.element?.name)) {
            return "$key$nullSuffix.toStringValue()";
          } else {
            return key;
          }
        }
      }

      if (type != null) {
        params.add("'$name': ${toMappedType(name, type)}");
      }
    }

    return params.join(", ");
  }

  String _generateCopyWithParams(ConstructorElement constructor) {
    List<String> params = [];
    for (var param in constructor.parameters) {
      var type = param.type.getDisplayString(withNullability: false);
      params.add("$type? ${param.name}");
    }
    return params.join(", ");
  }

  String _generateCopyWithConstructorParams(ConstructorElement constructor) {
    List<String> params = [];
    for (var param in constructor.parameters) {
      var str = "";

      if (param.isNamed) {
        str = "${param.name}: ";
      }

      str += "${param.name} ?? this.${param.name}";
      params.add(str);
    }
    return params.join(", ");
  }
}

class EnumMapper {
  String get className => element.name;
  String get mapperName => "${className}Mapper";

  ClassElement element;
  DartObject? annotation;

  EnumMapper(this.element, this.annotation);

  String generateExtensionCode() {
    // TODO add letter case option
    return """
      extension $mapperName on $className {
        static $className fromString(String value) {
          int index = $className.values.indexWhere((e) => e.toString().toLowerCase() == "$className."+value.toLowerCase());
          if (index == -1) {
            throw MapperError("Enum $className does not contain value \$value, available values are \${$className.values.join(", ")}");
          }
          return $className.values[index];
        }
        String toStringValue() => toString().toLowerCase().split(".")[1];
      }
    """
        .unindent();
  }
}

extension on DartType {
  bool get isPrimitive {
    if (isDartCoreList) {
      return (this as InterfaceType).typeArguments[0].isPrimitive;
    } else if (isDartCoreMap) {
      return (this as InterfaceType).typeArguments[0].isPrimitive &&
          (this as InterfaceType).typeArguments[1].isPrimitive;
    } else {
      return isDynamic ||
          isDartCoreBool ||
          isDartCoreInt ||
          isDartCoreDouble ||
          isDartCoreNum ||
          isDartCoreString ||
          isDartCoreNull ||
          isDartCoreObject;
    }
  }
}

const mapperCode = r"""
class ObjectMapper {
  ObjectMapper._();

  static T fromMap<T>(Map<String, dynamic> map) {
    return objectFactories[T]!(map) as T;
  }
  static Map<String, dynamic> toMap(dynamic object) {
    return object.toMap();
  }
  static T fromJson<T>(String json) {
    return fromMap<T>(jsonDecode(json));
  }
  static String toJson(dynamic object) {
    return jsonEncode(toMap(object));
  }
}

extension MapMethods on Map<String, dynamic> {

  T get<T>(String key) {
    if (this[key] == null) {
      throw MapperError("Parameter $key is required.");
    }
    return _to<T>(this[key]!);
  }
  
  T? getOpt<T>(String key) {
    if (this[key] == null) {
      return null;
    }
    return get<T>(key);
  }
  
  List<T> getList<T>(String key) {
    if (this[key] == null) {
      throw MapperError("Parameter $key is required.");
    } else if (this[key] is! List) {
      throw MapperError("Parameter ${this[key]} with key $key is not a List");
    }
    List value = this[key] as List;
    return value.map((item) => _to<T>(item)).toList();
  }
  
  List<T>? getListOpt<T>(String key) {
    if (this[key] == null) {
      return null;
    }
    return getList<T>(key);
  }
  
  Map<K, V> getMap<K, V>(String key) {
    if (this[key] == null) {
      throw MapperError("Parameter $key is required.");
    } else if (this[key] is! Map) {
      throw MapperError("Parameter ${this[key]} with key $key is not a Map");
    }
    Map value = this[key] as Map;
    return value.map((key, value) => MapEntry(_to<K>(key), _to<V>(value)));
  }
  
  Map<K, V>? getMapOpt<K, V>(String key) {
    if (this[key] == null) {
      return null;
    }
    return getMap<K, V>(key);
  }
}

T _to<T>(dynamic value) {
  if (value is T) {
    return value;
  } else if (T == String) {
    return value.toString() as T;
  } else if (T == int) {
    return num.parse(value.toString()).round() as T;
  } else if (T == double) {
    return double.parse(value.toString()) as T;
  } else if (T == bool) {
    return (value is num ? value != 0 : value.toString() == "true") as T;
  } else if (objectFactories[T] != null) {
    if (value is Map<String, dynamic>) return ObjectMapper.fromMap(value);
    else return ObjectMapper.fromJson(value.toString());
  } else if (enumFactories[T] != null) {
    return enumFactories[T]!(value.toString()) as T;
  } else {
    throw MapperError("Cannot transform value $value of type ${value.runtimeType} to type $T");
  }
}

class MapperError {
  final String message;
  const MapperError(this.message);
  
  @override
  String toString() => "MapperError: $message";
}
""";
