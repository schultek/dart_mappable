import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/annotations.dart';
import 'package:indent/indent.dart';
import 'package:source_gen/source_gen.dart';

import 'builder_options.dart';
import 'case_style.dart';

/// Generates code for a specific class
class ClassMapper {
  static const constructorChecker =
      TypeChecker.fromRuntime(MappableConstructor);
  static const fieldChecker = TypeChecker.fromRuntime(MappableField);

  String get className => element.name;
  String get mapperName => '${className}Mapper';
  String get extensionName => '${className}Extension';
  String get paramName => className[0].toLowerCase();

  ClassElement element;
  ClassOptions options;

  bool isSuperMapper;
  ClassMapper? superMapper;

  ClassMapper(this.element, this.options, {this.isSuperMapper = false});

  String jsonKey(ParameterElement param) {
    if (options.fields[param.name] != null) {
      return options.fields[param.name]!;
    } else if (fieldChecker.hasAnnotationOf(param)) {
      return fieldChecker
          .firstAnnotationOf(param)!
          .getField('key')!
          .toStringValue()!;
    } else if (param is FieldFormalParameterElement &&
        param.field != null &&
        fieldChecker.hasAnnotationOf(param.field!)) {
      return fieldChecker
          .firstAnnotationOf(param.field!)!
          .getField('key')!
          .toStringValue()!;
    } else {
      return toCaseStyle(param.name, options.caseStyle);
    }
  }

  ConstructorElement _chooseConstructor() {
    var explicitConstructor = element.constructors.where((c) =>
        !c.isPrivate &&
        (c.name == options.constructor ||
            constructorChecker.hasAnnotationOf(c)));
    return explicitConstructor.isNotEmpty
        ? explicitConstructor.first
        : element.constructors.firstWhere((c) => !c.isPrivate);
  }

  bool hasValidConstructor() {
    try {
      var _ = _chooseConstructor();
      return true;
    } catch (_) {
      return false;
    }
  }

  String generateExtensionCode() {
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
        
        @override Map<String, dynamic> encode($className $paramName) => {${_generateMappingEntries(constructor)}};
        @override String stringify($className self) => '$className(${_generateStringParams(constructor)})';
        @override int hash($className self) => ${_generateHashParams(constructor)};
        @override bool equals($className self, $className other) => ${_generateEqualsParams(constructor)};
        
        @override Function get decoder => fromValue;
        @override Function get typeFactory => $typeParams(f) => f<$className$typeParams>();
        @override Discriminator? get discriminator => ${_generateDiscriminator()};
      }
    
      extension $extensionName$typeParams on $className$typeParams {
        String toJson() => Mapper.toJson(this);
        Map<String, dynamic> toMap() => Mapper.toMap(this);
        ${_generateCopyWith(constructor, typeParams)}
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

      str += "('${jsonKey(param)}')";

      if (param.hasDefaultValue) {
        str += ' ?? ${param.defaultValueCode}';
      }

      params.add(str);
    }
    return params.join(', ');
  }

  String _generateMappingEntries(ConstructorElement constructor) {
    List<String> params = [];

    PropertyAccessorElement? findGetter(String name, ClassMapper mapper) {
      var g = mapper.element.getGetter(name);
      if (g != null) {
        return g;
      }
      if (mapper.superMapper != null) {
        return findGetter(name, mapper.superMapper!);
      }
    }

    for (var param in constructor.parameters) {
      var name = param.name;

      DartType? type;

      if (param is FieldFormalParameterElement) {
        type = param.field!.type;
      } else {
        var getter = findGetter(name, this);
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
          if (type.isDartCoreList || type.isDartCoreSet) {
            var tag = key[0].toLowerCase();
            return '$key$nullSuffix.map(($tag) => ${toMappedType(tag, (type as InterfaceType).typeArguments[0])}).toList()';
          } else if (type.isDartCoreMap) {
            var types = (type as InterfaceType).typeArguments;
            return '$key$nullSuffix.map((key, value) => MapEntry(${toMappedType('key', types[0])}, ${toMappedType('value', types[1])}))';
          } else {
            return 'Mapper.toValue($key)';
          }
        }
      }

      if (type != null) {
        var key = jsonKey(param);

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

  String _generateStringParams(ConstructorElement constructor) {
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

  bool hasField(String field) {
    bool _hasField(ClassMapper mapper) {
      if (mapper.element.getGetter(field) != null) {
        return true;
      } else {
        if (mapper.superMapper != null) {
          return _hasField(mapper.superMapper!);
        } else {
          return false;
        }
      }
    }

    return _hasField(this);
  }

  String _generateHashParams(ConstructorElement constructor) {
    List<String> params = [];
    for (var param in constructor.parameters) {
      if (param is FieldFormalParameterElement || hasField(param.name)) {
        params.add('self.${param.name}.hashCode');
      }
    }
    return params.join(' ^ ');
  }

  String _generateEqualsParams(ConstructorElement constructor) {
    List<String> params = [];
    for (var param in constructor.parameters) {
      if (param is FieldFormalParameterElement || hasField(param.name)) {
        params.add('self.${param.name} == other.${param.name}');
      }
    }
    return params.join(' && ');
  }

  String _generateCopyWith(ConstructorElement constructor, String typeParams) {
    if (element.isAbstract) {
      return '';
    } else {
      var method = 'copy${constructor.parameters.isNotEmpty ? 'With' : ''}';
      var params = _generateCopyWithParams(constructor);
      var body =
          '${element.name}${constructor.name != '' ? '.${constructor.name}' : ''}(${_generateCopyWithConstructorParams(constructor)})';
      return '$className$typeParams $method($params) => $body;';
    }
  }

  String _generateCopyWithParams(ConstructorElement constructor) {
    if (constructor.parameters.isEmpty) return '';
    List<String> params = [];
    for (var param in constructor.parameters) {
      if (param is FieldFormalParameterElement || hasField(param.name)) {
        var type = param.type.getDisplayString(withNullability: false);
        params.add('$type? ${param.name}');
      }
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

      if (param is FieldFormalParameterElement || hasField(param.name)) {
        str += '${param.name} ?? this.${param.name}';
      } else {
        str += param.name;
      }
      params.add(str);
    }
    return params.join(', ');
  }

  String _generateDiscriminator() {
    if (superMapper != null || isSuperMapper) {
      var args = <String>[];
      if (isSuperMapper) {
        args.add("key: '${options.discriminatorKey ?? '_type'}'");
      }
      if (superMapper != null) {
        args.add(
            "superKey: '${superMapper!.options.discriminatorKey ?? '_type'}'");
        args.add("value: '${options.discriminatorValue ?? element.name}'");
      }
      return 'Discriminator(${args.join(', ')})';
    } else {
      return 'null';
    }
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
