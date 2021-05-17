import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:indent/indent.dart';

import 'builder_options.dart';
import 'case_style.dart';

/// Generates code for a specific class
class ClassMapper {
  String get className => element.name;
  String get mapperName => '${className}Mapper';
  String get extensionName => '${className}Extension';
  String get paramName => className[0].toLowerCase();

  ClassElement element;
  ClassOptions options;

  Set<Element> subElements = {};

  ClassMapper(this.element, this.options);

  String jsonKey(String fieldName) {
    if (options.fields[fieldName] != null) {
      return options.fields[fieldName]!;
    } else {
      return toCaseStyle(fieldName, options.caseStyle);
    }
  }

  ConstructorElement _chooseConstructor() {
    if (options.constructor != null) {
      return element.constructors
          .firstWhere((c) => c.name == options.constructor);
    } else {
      return element.constructors
          .firstWhere((c) => !c.isPrivate && c.parameters.isNotEmpty);
    }
  }

  bool hasValidConstructor() {
    try {
      var _ = _chooseConstructor();
      return true;
    } catch (_) {
      return false;
    }
  }

  String generateExtensionCode(Map<String, ClassMapper> classes) {
    ConstructorElement constructor = _chooseConstructor();

    var typeParams = '';
    if (element.typeParameters.isNotEmpty) {
      typeParams = '<${element.typeParameters.map((p) => p.name).join(', ')}>';
    }

    return '''
      class $mapperName implements Mapper<$className> {
        $mapperName._();
        
        $className$typeParams fromValue$typeParams(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap$typeParams(map));
        $className$typeParams fromMap$typeParams(Map<String, dynamic> map) => ${_generateFromMap(constructor)}
        
        @override Map<String, dynamic> encode($className $paramName) => {${_generateMappingEntries(constructor, classes)}};
        @override String stringify($className self) => '$className(${_generateStringParams(constructor, classes.keys.toSet())})';
        @override int hash($className self) => ${_generateHashParams(constructor, classes.keys.toSet())};
        @override bool equals($className self, $className other) => ${_generateEqualsParams(constructor, classes.keys.toSet())};
        
        @override Function get decoder => fromValue;
        @override Function get typeFactory => $typeParams(f) => f<$className$typeParams>();
        @override String? get discriminator => ${options.discriminator != null ? "'${options.discriminator}'" : 'null'};
      }
    
      extension $extensionName$typeParams on $className$typeParams {
        String toJson() => Mapper.toJson(this);
        Map<String, dynamic> toMap() => Mapper.toMap(this);
        ${_generateCopyWith(constructor, typeParams, classes)}
      }
    '''
        .unindent();
  }

  String _generateFromMap(ConstructorElement constructor) {
    if (element.isAbstract) {
      return "throw MapperException('Cannot instantiate abstract class ${element.name}, are you missing a type discriminator?');";
    } else {
      return '${element.name}${constructor.name != '' ? '.${constructor.name}' : ''}(${_generateConstructorParams(constructor)});';
    }
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
      if (param.isOptional ||
          param.type.nullabilitySuffix == NullabilitySuffix.question) {
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

  String _generateMappingEntries(
    ConstructorElement constructor,
    Map<String, ClassMapper> classes,
  ) {
    List<String> params = [];

    PropertyAccessorElement? findGetter(String name, ClassElement element) {
      var g = element.getGetter(name);
      if (g != null) {
        return g;
      }
      var supertype = element.supertype;
      if (supertype != null &&
          !supertype.isPrimitive &&
          classes.containsKey(supertype.element.name)) {
        return findGetter(name, supertype.element);
      }
    }

    for (var param in constructor.parameters) {
      var name = param.name;

      DartType? type;

      if (param is FieldFormalParameterElement) {
        type = param.field!.type;
      } else {
        var getter = findGetter(name, constructor.enclosingElement);
        if (getter != null) {
          type = getter.type.returnType;
        }
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
          } else {
            var args = [];
            if (classes[type.element?.name]?.subElements.isNotEmpty ?? false) {
              args.add(', withDiscriminator: true');
            }
            return 'Mapper.toValue($key${args.join()})';
          }
        }
      }

      if (type != null) {
        var key = jsonKey(name);

        var exp = toMappedType('$paramName.$name', type);

        if (options.ignoreNull == true &&
            param.type.nullabilitySuffix != NullabilitySuffix.none) {
          params.add("if ($exp != null) '$key': $exp");
        } else {
          params.add("'$key': $exp");
        }
      }
    }

    return params.join(', ');
  }

  String _generateStringParams(
      ConstructorElement constructor, Set<String> classes) {
    List<String> params = [];

    for (var field in element.fields) {
      if (field.getter?.isSynthetic ?? false) {
        var str = '';
        str = '${field.name}: ';
        str += '\${self.${field.name}}';
        params.add(str);
      }
    }
    return params.join(', ');
  }

  bool hasField(String field, Set<String> classes) {
    bool elemHasField(ClassElement elem) {
      if (elem.getGetter(field) != null) {
        return true;
      } else {
        if (elem.supertype != null &&
            !elem.supertype!.isPrimitive &&
            classes.contains(elem.supertype!.element.name)) {
          return elemHasField(elem.supertype!.element);
        } else {
          return false;
        }
      }
    }

    return elemHasField(element);
  }

  String _generateHashParams(
      ConstructorElement constructor, Set<String> classes) {
    List<String> params = [];
    for (var param in constructor.parameters) {
      if (param is FieldFormalParameterElement ||
          hasField(param.name, classes)) {
        params.add('self.${param.name}.hashCode');
      }
    }
    return params.join(' ^ ');
  }

  String _generateEqualsParams(
      ConstructorElement constructor, Set<String> classes) {
    List<String> params = [];
    for (var param in constructor.parameters) {
      if (param is FieldFormalParameterElement ||
          hasField(param.name, classes)) {
        params.add('self.${param.name} == other.${param.name}');
      }
    }
    return params.join(' && ');
  }

  String _generateCopyWith(ConstructorElement constructor, String typeParams,
      Map<String, ClassMapper> classes) {
    if (element.isAbstract) {
      return '';
    } else {
      var method = 'copy${constructor.parameters.isNotEmpty ? 'With' : ''}';
      var params = _generateCopyWithParams(constructor, classes.keys.toSet());
      var body =
          '${element.name}${constructor.name != '' ? '.${constructor.name}' : ''}(${_generateCopyWithConstructorParams(constructor, classes.keys.toSet())})';
      return '$className$typeParams $method($params) => $body;';
    }
  }

  String _generateCopyWithParams(
      ConstructorElement constructor, Set<String> classes) {
    if (constructor.parameters.isEmpty) return '';
    List<String> params = [];
    for (var param in constructor.parameters) {
      if (param is FieldFormalParameterElement ||
          hasField(param.name, classes)) {
        var type = param.type.getDisplayString(withNullability: false);
        params.add('$type? ${param.name}');
      }
    }
    return '{${params.join(', ')}}';
  }

  String _generateCopyWithConstructorParams(
      ConstructorElement constructor, Set<String> classes) {
    List<String> params = [];
    for (var param in constructor.parameters) {
      var str = '';

      if (param.isNamed) {
        str = '${param.name}: ';
      }

      if (param is FieldFormalParameterElement ||
          hasField(param.name, classes)) {
        str += '${param.name} ?? this.${param.name}';
      } else {
        str += param.name;
      }
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
