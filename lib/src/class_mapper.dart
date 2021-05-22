import 'package:analyzer/dart/ast/ast.dart';
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
  static const classChecker = TypeChecker.fromRuntime(MappableClass);
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
  bool usesFieldHooks = false;

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
    if (field != null) return field;
    if (superMapper != null && superParams[param.name] != null) {
      return superMapper!.jsonKey(superParams[param.name]!);
    }
    return toCaseStyle(param.name, options.caseStyle);
  }

  String? hookForParam(ParameterElement param) {
    var annotation = fieldAnnotation(param);
    if (annotation != null && !annotation.getField('hooks')!.isNull) {
      var annotatedElement = fieldChecker.hasAnnotationOf(param)
          ? param
          : (param as FieldFormalParameterElement).field!;

      return getAnnotationCode(annotatedElement, MappableField, 'hooks');
    } else if (superMapper != null && superParams[param.name] != null) {
      return superMapper!.hookForParam(superParams[param.name]!);
    }
  }

  String? _hookForClass;
  String? get hookForClass => _hookForClass != null
      ? _hookForClass!.isEmpty
          ? null
          : _hookForClass
      : _getHookForClass();
  String? _getHookForClass() {
    var annotation = classChecker.firstAnnotationOf(element);
    String? hook;
    if (annotation != null && !annotation.getField('hooks')!.isNull) {
      hook = getAnnotationCode(element, MappableClass, 'hooks');
    }
    _hookForClass = hook ?? '';
    return hook;
  }

  ConstructorElement? _constructor;
  ConstructorElement get constructor => _constructor ??= _getConstructor();
  ConstructorElement _getConstructor() {
    var explicitConstructor = element.constructors.where((c) =>
        !c.isPrivate &&
        (c.name == options.constructor ||
            constructorChecker.hasAnnotationOf(c)));
    var constructor = explicitConstructor.isNotEmpty
        ? explicitConstructor.first
        : element.constructors.firstWhere((c) => !c.isPrivate);
    return constructor;
  }

  bool hasValidConstructor() {
    try {
      var _ = constructor;
      return true;
    } catch (_) {
      return false;
    }
  }

  String generateExtensionCode() {
    var typeParams = '';
    if (element.typeParameters.isNotEmpty) {
      typeParams = '<${element.typeParameters.map((p) => p.name).join(', ')}>';
    }

    return '''
      class $mapperName implements Mapper<$className> {
        $mapperName._();
        
        @override Function get decoder => decode;
        $className$typeParams decode$typeParams(dynamic v) => ${_generateFromMapCall('_checked(v, (Map<String, dynamic> map) => fromMap$typeParams(map))')};
        $className$typeParams fromMap$typeParams(Map<String, dynamic> map) => ${_generateFromMap()}
        
        @override dynamic encode($className v) => ${_generateToMapCall('toMap(v)')};
        Map<String, dynamic> toMap($className $paramName) => {${_generateMappingEntries()}};
        
        @override String stringify($className self) => '$className(${_generateStringParams()})';
        @override int hash($className self) => ${_generateHashParams()};
        @override bool equals($className self, $className other) => ${_generateEqualsParams()};
        
        @override Function get typeFactory => $typeParams(f) => f<$className$typeParams>();
        @override Discriminator? get discriminator => ${_generateDiscriminator()};
      }
    
      extension $extensionName$typeParams on $className$typeParams {
        String toJson() => Mapper.toJson(this);
        Map<String, dynamic> toMap() => Mapper.toMap(this);
        ${_generateCopyWith(typeParams)}
      }
    '''
        .unindent();
  }

  String _generateFromMapCall(String fromMap) {
    var wrapped = fromMap;
    if (hookForClass != null) {
      wrapped = '_hookedDecode(const $hookForClass, v, (v) => $wrapped)';
    }
    if (superMapper != null) {
      wrapped = superMapper!._generateFromMapCall(wrapped);
    }
    return wrapped;
  }

  String _generateToMapCall(String toMap, [String? name]) {
    var wrapped = toMap;
    if (hookForClass != null) {
      wrapped =
          '_hookedEncode<${name ?? className}>(const $hookForClass, v, (v) => $wrapped)';
    }
    if (superMapper != null) {
      wrapped = superMapper!._generateToMapCall(wrapped, name ?? className);
    }
    return wrapped;
  }

  String _generateFromMap() {
    if (element.isAbstract) {
      if (isSuperMapper) {
        if (defaultSubMapper != null) {
          return 'Mapper.fromMap<${defaultSubMapper!.className}>(map);';
        }
        var key = options.discriminatorKey ?? '_type';
        var value = "\${map['$key']}";
        return 'throw MapperException("Cannot instantiate abstract class ${element.name}, did you forgot to specify a subclass for [ $key: \'$value\' ] or a default subclass?");';
      } else {
        return "throw const MapperException('Cannot instantiate abstract class ${element.name}.');";
      }
    } else {
      return '${element.name}${constructor.name != '' ? '.${constructor.name}' : ''}(${_generateConstructorParams()});';
    }
  }

  String _generateConstructorParams() {
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
        usesFieldHooks = true;
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

  String _generateMappingEntries() {
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
          usesFieldHooks = true;
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

  String _generateStringParams() {
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
    if (element.getGetter(field) != null) {
      return true;
    } else {
      return superMapper?.hasField(field) ?? false;
    }
  }

  String _generateHashParams() {
    List<String> params = [];
    for (var param in constructor.parameters) {
      if (param is FieldFormalParameterElement || hasField(param.name)) {
        params.add('self.${param.name}.hashCode');
      } else if (superMapper != null && superParams[param.name] != null) {
        params.add('self.${superParams[param.name]!.name}.hashCode');
      }
    }

    if (params.isEmpty) {
      return '0';
    } else {
      return params.join(' ^ ');
    }
  }

  String _generateEqualsParams() {
    List<String> params = [];
    for (var param in constructor.parameters) {
      if (param is FieldFormalParameterElement || hasField(param.name)) {
        params.add('self.${param.name} == other.${param.name}');
      } else if (superMapper != null && superParams[param.name] != null) {
        params.add(
            'self.${superParams[param.name]!.name} == other.${superParams[param.name]!.name}');
      }
    }
    if (params.isEmpty) {
      return 'true';
    } else {
      return params.join(' && ');
    }
  }

  String _generateCopyWith(String typeParams) {
    if (element.isAbstract) {
      return '';
    } else {
      var method = 'copy${constructor.parameters.isNotEmpty ? 'With' : ''}';
      var params = _generateCopyWithParams();
      var body =
          '${element.name}${constructor.name != '' ? '.${constructor.name}' : ''}(${_generateCopyWithConstructorParams()})';
      return '$className$typeParams $method($params) => $body;';
    }
  }

  String _generateCopyWithParams() {
    if (constructor.parameters.isEmpty) return '';
    List<String> params = [];
    for (var param in constructor.parameters) {
      var type = param.type.getDisplayString(withNullability: false);
      if (param is FieldFormalParameterElement || hasField(param.name)) {
        params.add('$type? ${param.name}');
      } else if (superMapper != null && superParams[param.name] != null) {
        params.add('$type? ${superParams[param.name]!.name}');
      }
    }
    return '{${params.join(', ')}}';
  }

  String _generateCopyWithConstructorParams() {
    List<String> params = [];
    for (var param in constructor.parameters) {
      var str = '';

      if (param.isNamed) {
        str = '${param.name}: ';
      }

      if (param is FieldFormalParameterElement || hasField(param.name)) {
        str += '${param.name} ?? this.${param.name}';
      } else if (superMapper != null && superParams[param.name] != null) {
        str +=
            '${superParams[param.name]!.name} ?? this.${superParams[param.name]!.name}';
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

  Map<String, ParameterElement> superParams = {};

  void analyzeSuperConstructor() {
    if (superMapper == null) return;

    var node = constructor.session!
        .getParsedLibraryByElement(constructor.library)
        .getElementDeclaration(constructor)!
        .node;

    if (node is ConstructorDeclaration) {
      if (node.initializers.isNotEmpty) {
        var last = node.initializers.last;
        if (last is SuperConstructorInvocation) {
          var args = last.argumentList.arguments;
          var i = 0;
          for (var arg in args) {
            if (arg is SimpleIdentifier) {
              superParams[arg.name] = superMapper!.constructor.parameters[i];
            } else if (arg is NamedExpression &&
                arg.expression is SimpleIdentifier) {
              superParams[(arg.expression as SimpleIdentifier).name] =
                  superMapper!.constructor.parameters.firstWhere(
                      (p) => p.isNamed && p.name == arg.name.label.name);
            }
            i++;
          }
        }
      }
    }
  }
}
