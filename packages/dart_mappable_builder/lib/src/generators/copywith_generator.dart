import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../config/class_mapper_config.dart';
import '../config/copy_param_config.dart';
import '../config/parameter_config.dart';
import '../imports_builder.dart';
import '../utils.dart';

class CopyWithGenerator {
  final ClassMapperConfig config;
  final ImportsBuilder imports;

  CopyWithGenerator(this.config, this.imports);

  String generateCopyWithExtension() {
    if (!config.shouldGenerate(GenerateMethods.copy)) return '';
    if (config.hasCallableConstructor &&
        config.superConfig == null &&
        config.subConfigs.isEmpty) {
      return '  ${_generateCopyWith()}\n';
    } else {
      return '';
    }
  }

  String generateCopyWithMixin(GetConfig getConfig) {
    if (!config.shouldGenerate(GenerateMethods.copy)) return '';
    if (config.superConfig != null || config.subConfigs.isNotEmpty) {
      _checkCopyWithMixinUsed();
      return '\n\n${_generateCopyWithMixin(getConfig)}';
    } else {
      return '';
    }
  }

  String generateCopyWithClasses(GetConfig getConfig) {
    if (!config.shouldGenerate(GenerateMethods.copy)) return '';
    if (config.hasCallableConstructor || config.subConfigs.isNotEmpty) {
      return '\n\n${_generateCopyWithClasses(getConfig)}';
    } else {
      return '';
    }
  }

  String _generateCopyWith() {
    var classTypeParams = config.element.typeParameters.isNotEmpty
        ? ', ${config.element.typeParameters.map((p) => p.name).join(', ')}'
        : '';

    return '${config.uniqueClassName}CopyWith<${config.prefixedClassName}${config.typeParams}$classTypeParams> get copyWith => _${config.uniqueClassName}CopyWithImpl(this, \$identity);';
  }

  void _checkCopyWithMixinUsed() {
    var node = config.element.getNode()! as ClassDeclaration;
    var className = config.className;
    var mixinName = '${config.uniqueClassName}Mixin';

    var hasCopyWithMixin = node.withClause?.mixinTypes.any((t) => t.name.name == mixinName) ?? false;

    if (!hasCopyWithMixin) {
      var classDeclarationSource = 'class $className';
      if (node.abstractKeyword != null) {
        classDeclarationSource = 'abstract $classDeclarationSource';
      }
      if (node.extendsClause != null) {
        classDeclarationSource += ' ' + node.extendsClause!.toSource();
      }
      if (node.withClause != null) {
        classDeclarationSource += ' ' + node.withClause!.toSource().replaceFirst('with', 'with $mixinName,');
      } else {
        classDeclarationSource += ' with $mixinName';
      }
      if (node.implementsClause != null) {
        classDeclarationSource += ' ' + node.implementsClause!.toSource();
      }

      print('\nClass $className is configured to generate a \'.copyWith()\' '
          ' extension while being part of a inherited class structure (either '
          'as superclass or as subclass).\nIn such a case it is required that '
          'you use the generated \'$mixinName\' on this class.\nOtherwise your '
          'code might behave faulty or won\'t compile.\n\n'
          'To solve this, change your class signature to:\n'
          '$classDeclarationSource\n\n'
          'Alternatively you can also disable the generation of a \'.copyWith()\' '
          'extension by using the \'generateMethods\' option\n'
          '(see https://pub.dev/packages/dart_mappable#generation-methods).\n');

    }
  }

  String _generateCopyWithMixin(GetConfig getConfig) {
    var classTypeParams = config.element.typeParameters.isNotEmpty
        ? ', ${config.element.typeParameters.map((p) => p.name).join(', ')}'
        : '';

    var valueTypeParam = config.subConfigs.isNotEmpty
        ? ', ${config.prefixedClassName}${config.typeParams}'
        : '';

    var snippet =
        '${config.uniqueClassName}CopyWith<${config.prefixedClassName}${config.typeParams}$valueTypeParam$classTypeParams> get copyWith';

    if (config.hasCallableConstructor) {
      snippet +=
          ' => _${config.uniqueClassName}CopyWithImpl(this as ${config.prefixedClassName}${config.typeParams}, \$identity);';
    } else {
      snippet += ';';
    }

    return 'mixin ${config.uniqueClassName}Mixin${config.typeParamsDeclaration} {\n'
        '  $snippet\n'
        '}';
  }

  String _generateCopyWithClasses(GetConfig getConfig) {
    var classTypeParamsDef = config.typeParamsList.map((p) => ', $p').join();
    var classTypeParams =
        config.element.typeParameters.map((p) => ', ${p.name}').join();

    var snippets = <String>[];

    var selfTypeParam = '${config.prefixedClassName}${config.typeParams}';
    var valueTypeParam = config.subConfigs.isNotEmpty ? ', $selfTypeParam' : '';

    if (config.hasCallableConstructor) {
      snippets.add(
          'extension ${config.uniqueClassName}ObjectCopy<\$R$classTypeParamsDef> on ObjectCopyWith<\$R, $selfTypeParam> {\n'
          '  ${config.uniqueClassName}CopyWith<\$R$valueTypeParam$classTypeParams> get ${CaseStyle.camelCase.transform(config.className)} => chain((v, t) => _${config.uniqueClassName}CopyWithImpl(v, t));\n'
          '}\n\n');
    }

    var implementsStmt = '';
    var objTypeParamDef = config.subConfigs.isNotEmpty ? ', \$V extends $selfTypeParam' : '';
    var objTypeParam =
    config.subConfigs.isNotEmpty ? ', \$V' : ', $selfTypeParam';

    if (config.superConfig != null) {
      var superClassTypeParams = config.superTypeArgs.map((a) => ', $a').join();
      implementsStmt =
          ' implements ${config.superConfig!.uniqueClassName}CopyWith<\$R$objTypeParam$superClassTypeParams>';
    } else {
      implementsStmt = ' implements ObjectCopyWith<\$R$objTypeParam>';
    }

    snippets.add(''
        'abstract class ${config.uniqueClassName}CopyWith<\$R$objTypeParamDef$classTypeParamsDef>$implementsStmt {\n');

    var copyParams = CopyParamConfig.collectFrom(config.params, config, imports, getConfig);

    for (var param in copyParams) {
      var isOverridden =
          config.superConfig != null && param.param is SuperParameterConfig;
      snippets.add(
          '  ${isOverridden ? '@override ' : ''}${param.name}CopyWith<\$R${param.fieldTypeParams}>${param.a.type.isNullable ? '?' : ''} get ${param.a.name};\n');
    }

    snippets.add(
        '  ${config.superConfig != null ? '@override ' : ''}\$R call(${_generateCopyWithParams()});\n');

    snippets.add('}\n');

    if (config.hasCallableConstructor) {
      snippets.add('\n'
          'class _${config.uniqueClassName}CopyWithImpl<\$R$classTypeParamsDef> '
          'extends BaseCopyWith<$selfTypeParam, \$R> implements ${config.uniqueClassName}CopyWith'
          '<\$R${config.subConfigs.isNotEmpty ? ', $selfTypeParam' : ''}$classTypeParams> {\n'
          '  _${config.uniqueClassName}CopyWithImpl(super.value, super.then);\n'
          '\n');

      for (var param in copyParams) {
        snippets.add(
            '  @override ${param.name}CopyWith<\$R${param.fieldTypeParams}>${param.a.type.isNullable ? '?' : ''} get ${param.a.name} => ');

        if (param.a.type.isNullable) {
          snippets.add(
              '\$value.${param.a.name} != null ? ${param.implName}(\$value.${param.a.name}!${param.invocation}) : null;\n');
        } else {
          snippets.add(
              '${param.implName}(\$value.${param.a.name}${param.invocation});\n');
        }
      }

      snippets.add(
          '  @override \$R call(${_generateCopyWithParams(implVersion: true)}) => \$then(${config.prefixedClassName}${config.constructor!.name != '' ? '.${config.constructor!.name}' : ''}(${_generateCopyWithConstructorParams()}));\n'
          '}');
    }

    return snippets.join();
  }

  String _generateCopyWithParams({bool implVersion = false}) {
    if (config.copySafeParams.isEmpty) return '';

    List<String> params = [];
    for (var param in config.copySafeParams) {
      var p = param.parameter;

      var type = imports.prefixedType(p.type, withNullability: false);

      if (param is UnresolvedParameterConfig) {
        if (p.type.isNullable) {
          var isDynamic = p.type.isDynamic;
          params.add('$type${isDynamic ? '' : '?'} ${p.name}');
        } else {
          params.add('required $type ${p.name}');
        }
      } else {
        var name = param.superName;
        var isDynamic = p.type.isDynamic;
        if (implVersion && (p.type.isNullable || isDynamic)) {
          params.add('Object? $name = \$none');
        } else {
          params.add('$type${isDynamic ? '' : '?'} $name');
        }
      }
    }

    return '{${params.join(', ')}}';
  }

  String _generateCopyWithConstructorParams() {
    List<String> params = [];
    for (var param in config.copySafeParams) {
      var p = param.parameter;
      var str = '';

      if (p.isNamed) {
        str = '${p.name}: ';
      }

      if (param is UnresolvedParameterConfig) {
        str += p.name;
      } else {
        var name = param.superName;
        var a = param.accessor;
        if (p.type.isNullable || p.type.isDynamic) {
          str += 'or($name, \$value.${a.name})';
        } else {
          str += '$name ?? \$value.${a.name}';
        }
      }

      params.add(str);
    }
    return params.join(', ');
  }
}
