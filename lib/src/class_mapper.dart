import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart';

import '../annotations.dart';
import 'annotation_visitor.dart';
import 'builder_options.dart';
import 'case_style.dart';
import 'flags.dart';

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

  ClassMapper? superMapper;
  List<ClassMapper> subMappers = [];

  bool usesFieldHooks = false;

  ClassMapper(this.element, this.options);

  bool get isSuperMapper => subMappers.isNotEmpty;

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
    var typeParams = '', typeParamsDeclaration = '';
    if (element.typeParameters.isNotEmpty) {
      typeParams = '<${element.typeParameters.map((p) => p.name).join(', ')}>';
      typeParamsDeclaration =
          '<${element.typeParameters.map((p) => p.getDisplayString(withNullability: false)).join(', ')}>';
    }

    return ''
        'class $mapperName implements Mapper<$className> {\n'
        '  $mapperName._();\n'
        '\n'
        '  @override Function get decoder => ${_generateDecoder()};\n'
        '  $className$typeParams decode$typeParamsDeclaration(dynamic v) => ${_generateFromMapCall(typeParams)};\n'
        '  $className$typeParams fromMap$typeParamsDeclaration(Map<String, dynamic> map) => ${_generateFromMap()}\n'
        '\n'
        '  @override dynamic encode($className v) => ${_generateToMapCall('toMap(v)')};\n'
        '  Map<String, dynamic> toMap($className $paramName) => {${_generateMappingEntries()}};\n'
        '\n'
        "  @override String stringify($className self) => '$className(${_generateStringParams()})';\n"
        '  @override int hash($className self) => ${_generateHashParams()};\n'
        '  @override bool equals($className self, $className other) => ${_generateEqualsParams()};\n'
        '\n'
        '  @override Function get typeFactory => $typeParamsDeclaration(f) => f<$className$typeParams>();\n'
        '}\n'
        '\n'
        'extension $extensionName$typeParamsDeclaration on $className$typeParams {\n'
        '  String toJson() => Mapper.toJson(this);\n'
        '  Map<String, dynamic> toMap() => Mapper.toMap(this);\n'
        '  ${_generateCopyWith(typeParams)}\n'
        '}';
  }

  String _generateDecoder([String fn = 'decode']) {
    var wrapped = fn;
    if (superMapper != null && superMapper!.hookForClass != null) {
      wrapped =
          '(v) => _hookedDecode(const ${superMapper!.hookForClass}, v, $wrapped)';
    }
    if (superMapper != null) {
      wrapped = superMapper!._generateDecoder(wrapped);
    }
    return wrapped;
  }

  String? get discriminatorKey =>
      options.discriminatorKey ?? superMapper?.discriminatorKey;

  String _generateFromMapCall(String typeParams) {
    var call = '';

    if (subMappers.isEmpty || discriminatorKey == null) {
      call = '=> fromMap$typeParams(map)';
    } else {
      call = '{\n'
          "    switch(map['$discriminatorKey']) {\n"
          '      ${_generateTypeCases(typeParams).join('\n      ')}\n'
          '    }\n'
          '  }';
    }

    call = '_checked(v, (Map<String, dynamic> map) $call)';
    if (hookForClass != null) {
      call = '_hookedDecode(const $hookForClass, v, (v) => $call)';
    }
    return call;
  }

  List<String> _generateTypeCases(String typeParams) {
    var cases = _getDiscriminatorCases();

    String? defaultCase;

    var sortedCases = <MapEntry<List<String>, String>>[];

    for (var c in cases) {
      if (c.key.contains('default')) {
        defaultCase = c.value;
      } else {
        sortedCases.add(MapEntry(c.key..sort(), c.value));
      }
    }
    sortedCases.sort((a, b) => a.key.first.compareTo(b.key.first));

    var statements = <String>[];

    for (var c in sortedCases) {
      c.key.take(c.key.length - 1).forEach((s) => statements.add('case $s:'));
      statements.add(
          'case ${c.key.last}: return ${c.value}._().decode(map)${typeParams.isNotEmpty ? ' as $className$typeParams' : ''};');
    }
    if (defaultCase != null) {
      statements.add(
          'default: return $defaultCase._().decode(map)${typeParams.isNotEmpty ? ' as $className$typeParams' : ''};');
    } else {
      statements.add('default: return fromMap$typeParams(map);');
    }

    return statements;
  }

  List<MapEntry<List<String>, String>> _getDiscriminatorCases() {
    var cases = <MapEntry<List<String>, String>>[];

    for (var mapper in subMappers) {
      if (mapper.discriminatorValueCode != null) {
        if (mapper.discriminatorValueCode!.startsWith('[') &&
            mapper.discriminatorValueCode!.endsWith(']')) {
          cases.add(MapEntry(
              mapper.discriminatorValueCode!
                  .substring(1, mapper.discriminatorValueCode!.length - 1)
                  .split(',')
                  .map((s) => s.trim())
                  .toList(),
              mapper.mapperName));
        } else {
          cases.add(
              MapEntry([mapper.discriminatorValueCode!], mapper.mapperName));
        }
      } else {
        var subCases = mapper._getDiscriminatorCases();
        if (subCases.isNotEmpty) {
          cases.add(MapEntry(
              subCases.expand((e) => e.key).toList(), mapper.mapperName));
        }
      }
    }

    return cases;
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
      if (isSuperMapper && discriminatorKey != null) {
        return 'throw MapperException("Cannot instantiate abstract class ${element.name}, did you forgot to specify a subclass for [ $discriminatorKey: \'\${map[\'$discriminatorKey\']}\' ] or a default subclass?");';
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
      if (param.type.isDynamic ||
          param.isOptional ||
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

        params.removeWhere((p) => p.startsWith("'$key':"));

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

    if (superMapper != null &&
        superMapper!.discriminatorKey != null &&
        discriminatorValueCode != null &&
        discriminatorValueCode != 'default') {
      if (!params
          .any((p) => p.contains("'${superMapper!.discriminatorKey}':"))) {
        if (discriminatorValueCode!.startsWith('[') &&
            discriminatorValueCode!.endsWith(']')) {
          var value = discriminatorValueCode!
              .substring(1, discriminatorValueCode!.length - 1)
              .split(',')
              .first
              .trim();
          params.add("'${superMapper!.discriminatorKey}': $value");
        } else {
          params.add(
              "'${superMapper!.discriminatorKey}': $discriminatorValueCode");
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

  String? _discriminatorValueCode;
  String? get discriminatorValueCode => _discriminatorValueCode != null
      ? _discriminatorValueCode!.isEmpty
          ? null
          : _discriminatorValueCode
      : _getDiscriminatorValueCode();
  String? _getDiscriminatorValueCode() {
    String? code;

    var field =
        classChecker.firstAnnotationOf(element)?.getField('discriminatorValue');

    if (options.discriminatorValue != null) {
      if (options.discriminatorValue == '__default__') {
        code = 'default';
      } else {
        code = "'${options.discriminatorValue}'";
      }
    } else if (field != null) {
      if (field.type?.element?.name ==
              MappingFlags.useAsDefault.runtimeType.toString() &&
          field.getField('index')!.toIntValue() == 0) {
        code = 'default';
      } else {
        code = getAnnotationCode(element, MappableClass, 'discriminatorValue');
      }
    }
    if (!element.isAbstract && superMapper != null && code == null) {
      code = "'${element.name}'";
    }
    _discriminatorValueCode = code ?? '';
    return code;
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
