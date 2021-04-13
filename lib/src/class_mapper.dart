import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:indent/indent.dart';

import 'case_style.dart';
import 'generator_options.dart';

/// Generates code for a specific class
class ClassMapper {
  String get className => element.name;
  String get mapperName => '${className}Mapper';
  String get paramName => className[0].toLowerCase();

  ClassElement element;
  ClassOptions options;

  ClassMapper(this.element, this.options);

  String generateExtensionCode(Set<String> classes, Set<String> enums) {
    ConstructorElement? constructor;

    if (options.constructor != null) {
      constructor =
          element.constructors.firstWhere((c) => c.name == options.constructor);
    } else {
      constructor = element.constructors.firstWhere((c) => !c.isPrivate);
    }

    return '''
      extension $mapperName on $className {
        static $className fromMap(Map<String, dynamic> map) => ${element.name}${constructor.name != '' ? '.${constructor.name}' : ''}(${_generateConstructorParams(constructor)});
        Map<String, dynamic> toMap() => {${_generateMappingEntries(constructor, classes, enums)}};
        $className copy${constructor.parameters.isNotEmpty ? 'With' : ''}(${_generateCopyWithParams(constructor)}) => ${element.name}${constructor.name != '' ? '.${constructor.name}' : ''}(${_generateCopyWithConstructorParams(constructor)});
      }
    '''
        .unindent();
  }

  String _generateConstructorParams(ConstructorElement constructor) {
    List<String> params = [];
    for (var param in constructor.parameters) {
      var str = '';

      if (param.isNamed) {
        str = '${param.name}: ';
      }

      str += 'map.get';

      if (param.type.isDartCoreList) {
        str += 'List';
      } else if (param.type.isDartCoreMap) {
        str += 'Map';
      }
      if (param.isOptional) {
        str += 'Opt';
      }

      str += "('${jsonKey(param.name)}')";

      if (param.hasDefaultValue) {
        str += ' ?? ${param.defaultValueCode}';
      }

      params.add(str);
    }
    return params.join(', ');
  }

  String jsonKey(String fieldName) {
    if (options.fields[fieldName] != null) {
      return options.fields[fieldName]!;
    } else {
      return toCaseStyle(fieldName, options.caseStyle);
    }
  }

  String _generateMappingEntries(
    ConstructorElement constructor,
    Set<String> classes,
    Set<String> enums,
  ) {
    List<String> params = [];

    var supertype = constructor.enclosingElement.supertype;
    if (supertype != null &&
        !supertype.isPrimitive &&
        classes.contains(supertype.element.name)) {
      var superName = supertype.getDisplayString(withNullability: false);
      params.add('...(this as $superName).toMap()');
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
          var nullSuffix =
              type.nullabilitySuffix == NullabilitySuffix.question ? '?' : '';
          if (type.isDartCoreList) {
            var tag = key[0].toLowerCase();
            return '$key$nullSuffix.map(($tag) => ${toMappedType(tag, (type as InterfaceType).typeArguments[0])}).toList()';
          } else if (type.isDartCoreMap) {
            var types = (type as InterfaceType).typeArguments;
            return '$key$nullSuffix.map((key, value) => MapEntry(${toMappedType('key', types[0])}, ${toMappedType('value', types[1])}))';
          } else if (classes.contains(type.element?.name)) {
            return '$key$nullSuffix.toMap()';
          } else if (enums.contains(type.element?.name)) {
            return '$key$nullSuffix.toStringValue()';
          } else {
            return 'Mapper.encode($key)';
          }
        }
      }

      if (type != null) {
        var key = jsonKey(name);

        if (options.ignoreNull == true) {
          var exp = toMappedType(name, type);
          params.add("if ($exp != null) '$key': $exp");
        } else {
          params.add("'$key': ${toMappedType(name, type)}");
        }
      }
    }

    return params.join(', ');
  }

  String _generateCopyWithParams(ConstructorElement constructor) {
    if (constructor.parameters.isEmpty) return '';
    List<String> params = [];
    for (var param in constructor.parameters) {
      var type = param.type.getDisplayString(withNullability: false);
      params.add('$type? ${param.name}');
    }
    return '{${params.join(', ')}}';
  }

  String _generateCopyWithConstructorParams(ConstructorElement constructor) {
    List<String> params = [];
    for (var param in constructor.parameters) {
      var str = '';

      if (param.isNamed) {
        str = '${param.name}: ';
      }

      str += '${param.name} ?? this.${param.name}';
      params.add(str);
    }
    return params.join(', ');
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
