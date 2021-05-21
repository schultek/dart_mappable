import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:indent/indent.dart';
import 'package:source_gen/source_gen.dart';

import '../annotations.dart';
import 'annotation_visitor.dart';
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
  ClassMapper? defaultSubMapper;

  String? discriminatorValueCode;
  bool usesHooks = false;

  ClassMapper(this.element, this.options,
      {this.isSuperMapper = false, this.discriminatorValueCode});

  DartObject? fieldAnnotation(ParameterElement param) {
    return fieldChecker.firstAnnotationOf(param) ??
        (param is FieldFormalParameterElement && param.field != null
            ? fieldChecker.firstAnnotationOf(param.field!)
            : null);
  }

  String jsonKey(ParameterElement param) {
    if (options.fields[param.name] != null) {
      return options.fields[param.name]!;
    }
    String? field = fieldAnnotation(param)?.getField('key')!.toStringValue();
    return field ?? toCaseStyle(param.name, options.caseStyle);
  }

  String? hookForParam(ParameterElement param) {
    var annotation = fieldAnnotation(param);
    if (annotation != null && !annotation.getField('hooks')!.isNull) {
      var annotatedElement = fieldChecker.hasAnnotationOf(param)
          ? param
          : (param as FieldFormalParameterElement).field!;

      return getAnnotationCode(annotatedElement, MappableField, 'hooks');
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
        
        $className$typeParams fromValue$typeParams(dynamic v) => _checked(v, (Map<String, dynamic> map) => fromMap$typeParams(map));
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
      if (isSuperMapper) {
        if (defaultSubMapper != null) {
          return 'Mapper.fromMap<${defaultSubMapper!.className}>(map);';
        }
        var key = options.discriminatorKey ?? '_type';
        var value = "\${map['$key']}";
        return "throw MapperException('Cannot instantiate abstract class ${element.name}, did you forgot to specify a subclass for [ $key: \\'$value\\' ] or a default subclass?');";
      } else {
        return "throw const MapperException('Cannot instantiate abstract class ${element.name}.');";
      }
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

      var args = ["'${jsonKey(param)}'"];

      var hook = hookForParam(param);

      if (hook != null) {
        usesHooks = true;
        args.add('hooks: const $hook');
      }

      str += "(${args.join(', ')})";

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

      if (type != null) {
        var key = jsonKey(param);

        String exp;

        var hook = hookForParam(param);
        if (hook != null) {
          usesHooks = true;
          exp = '_toValue($paramName.$name, hooks: const $hook)';
        } else {
          exp = 'Mapper.toValue($paramName.$name)';
        }

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

    void addFieldsForMapper(ClassMapper mapper) {
      if (mapper.superMapper != null) {
        addFieldsForMapper(mapper.superMapper!);
      }

      for (var field in mapper.element.fields) {
        if (!field.isStatic &&
            !field.isPrivate &&
            (field.getter?.isSynthetic ?? false)) {
          var str = '';
          str = '${field.name}: ';
          str += '\${self.${field.name}}';
          params.add(str);
        }
      }
    }

    addFieldsForMapper(this);

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

    if (params.isEmpty) {
      return '0';
    } else {
      return params.join(' ^ ');
    }
  }

  String _generateEqualsParams(ConstructorElement constructor) {
    List<String> params = [];
    for (var param in constructor.parameters) {
      if (param is FieldFormalParameterElement || hasField(param.name)) {
        params.add('self.${param.name} == other.${param.name}');
      }
    }
    if (params.isEmpty) {
      return 'true';
    } else {
      return params.join(' && ');
    }
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
        args.add(
            "value: ${discriminatorValueCode ?? "'${options.discriminatorValue ?? element.name}'"}");
      }
      return 'Discriminator(${args.join(', ')})';
    } else {
      return 'null';
    }
  }
}
