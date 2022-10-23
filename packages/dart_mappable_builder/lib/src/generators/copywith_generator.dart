import 'package:analyzer/dart/ast/ast.dart';
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

  late String classTypeParamsDef =
      config.typeParamsList.map((p) => ', $p').join();
  late String classTypeParams =
      config.element.typeParameters.map((p) => ', ${p.name}').join();

  late bool hasSubConfigs = config.subConfigs.isNotEmpty;
  late bool hasSuperConfig = config.superConfig != null;
  late bool hasSubOrSuperConfigs = hasSubConfigs || hasSuperConfig;

  late String selfTypeParam = config.selfTypeParam;
  late String superPrefixedClassName = config.superPrefixedClassName;

  late String selfSubTypeParam = hasSubConfigs ? ', $selfTypeParam' : '';
  late String selfSuperTypeParam = hasSubOrSuperConfigs ? ', $selfTypeParam' : '';

  late String subTypeParamDef =
      hasSubConfigs ? ', \$T extends $selfTypeParam' : '';
  late String subTypeParam = hasSubConfigs ? ', \$T' : '';
  late String subOrSelfTypeParam = hasSubConfigs ? ', \$T' : ', $selfTypeParam';

  late String superTypeParamDef = hasSubOrSuperConfigs ? ', \$S extends $superPrefixedClassName' : '';
  late String superTypeParamDef2 = hasSubOrSuperConfigs ? ', \$S2 extends $superPrefixedClassName' : '';
  late String superTypeParam = hasSubOrSuperConfigs ? ', \$S' : '';
  late String superTypeParam2 = hasSubOrSuperConfigs ? ', \$S2' : '';
  late String superOrSelfTypeParam = hasSubOrSuperConfigs ? ', \$S' : ', $selfTypeParam';
  late String superOrSelfTypeParam2 = hasSubOrSuperConfigs ? '\$S2' : selfTypeParam;

  String generateCopyWithExtension() {
    if (!config.shouldGenerate(GenerateMethods.copy)) return '';
    if (config.hasCallableConstructor && !hasSubOrSuperConfigs) {
      return '  ${_generateCopyWith()}\n';
    } else {
      return '';
    }
  }

  String generateCopyWithMixin(GetConfig getConfig) {
    if (!config.shouldGenerate(GenerateMethods.copy)) return '';
    if (hasSubOrSuperConfigs) {
      _checkCopyWithMixinUsed();
      return '\n\n${_generateCopyWithMixin(getConfig)}';
    } else {
      return '';
    }
  }

  String generateCopyWithClasses(GetConfig getConfig) {
    if (!config.shouldGenerate(GenerateMethods.copy)) return '';
    if (config.hasCallableConstructor || hasSubConfigs) {
      return '\n\n${_generateCopyWithClasses(getConfig)}';
    } else {
      return '';
    }
  }

  String _generateCopyWith() {
    return '${config.uniqueClassName}CopyWith<$selfTypeParam$classTypeParams> get copyWith => _${config.uniqueClassName}CopyWithImpl(this, \$identity, \$identity);';
  }

  void _checkCopyWithMixinUsed() {
    var node = config.element.getNode()! as ClassDeclaration;
    var className = config.className;
    var mixinName = '${config.uniqueClassName}Mixin';

    var hasCopyWithMixin =
        node.withClause?.mixinTypes.any((t) => t.name.name == mixinName) ??
            false;

    if (!hasCopyWithMixin) {
      var classDeclarationSource = 'class $className';
      if (node.abstractKeyword != null) {
        classDeclarationSource = 'abstract $classDeclarationSource';
      }
      if (node.extendsClause != null) {
        classDeclarationSource += ' ' + node.extendsClause!.toSource();
      }
      if (node.withClause != null) {
        classDeclarationSource += ' ' +
            node.withClause!
                .toSource()
                .replaceFirst('with', 'with $mixinName,');
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
    var snippet =
        '${config.uniqueClassName}CopyWith<$selfTypeParam$selfSubTypeParam$selfSuperTypeParam$classTypeParams> get copyWith';

    if (config.hasCallableConstructor) {
      snippet +=
          ' => _${config.uniqueClassName}CopyWithImpl(this as $selfTypeParam, \$identity, \$identity);';
    } else {
      snippet += ';';
    }

    return 'mixin ${config.uniqueClassName}Mixin${config.typeParamsDeclaration} {\n'
        '  $snippet\n'
        '}';
  }

  String _generateCopyWithClasses(GetConfig getConfig) {
    var snippets = <String>[];

    if (config.hasCallableConstructor) {
      snippets.add(
          'extension ${config.uniqueClassName}ObjectCopy<\$R$superTypeParamDef$classTypeParamsDef> on ObjectCopyWith<\$R, $selfTypeParam$superOrSelfTypeParam> {\n'
          '  ${config.uniqueClassName}CopyWith<\$R$selfSubTypeParam$superTypeParam$classTypeParams> get as${config.className} => base.as((v, t, t2) => _${config.uniqueClassName}CopyWithImpl(v, t, t2));\n'
          '}\n\n');
    }

    var implementsStmt = '';

    if (hasSuperConfig) {
      var superClassTypeParams = config.superTypeArgs.map((a) => ', $a').join();
      implementsStmt =
          ' implements ${config.superConfig!.uniqueClassName}CopyWith<\$R$subOrSelfTypeParam$superTypeParam$superClassTypeParams>';
    } else {
      implementsStmt = ' implements ObjectCopyWith<\$R$subOrSelfTypeParam$superOrSelfTypeParam>';
    }

    snippets.add(''
        'abstract class ${config.uniqueClassName}CopyWith<\$R$subTypeParamDef$superTypeParamDef$classTypeParamsDef>$implementsStmt {\n');

    if (config.superConfig == null) {
      snippets.add(
          '  ${config.uniqueClassName}CopyWith<\$R2$subTypeParam$superTypeParam2$classTypeParams> _chain<\$R2$superTypeParamDef2>(Then<$superOrSelfTypeParam2, \$R2> then, Then<$selfTypeParam, $superOrSelfTypeParam2> then2);\n');
    }

    var copyParams =
        CopyParamConfig.collectFrom(config.params, config, imports, getConfig);

    for (var param in copyParams) {
      var isOverridden = hasSuperConfig && param.param is SuperParameterConfig;
      snippets.add(
          '  ${isOverridden ? '@override ' : ''}${param.name}CopyWith<\$R${param.subTypeParam}${param.superTypeParam}${param.fieldTypeParams}>${param.a.type.isNullable ? '?' : ''} get ${param.a.name};\n');
    }

    snippets.add(
        '  ${hasSuperConfig ? '@override ' : ''}\$R call(${_generateCopyWithParams()});\n');

    snippets.add('}\n');

    if (config.hasCallableConstructor) {
      snippets.add('\n'
          'class _${config.uniqueClassName}CopyWithImpl<\$R$superTypeParamDef$classTypeParamsDef> '
          'extends BaseCopyWith<\$R, $selfTypeParam$superOrSelfTypeParam> implements ${config.uniqueClassName}CopyWith'
          '<\$R$selfSubTypeParam$superTypeParam$classTypeParams> {\n'
          '  _${config.uniqueClassName}CopyWithImpl(super.value, super.then, super.then2);\n'
          '  @override ${config.uniqueClassName}CopyWith<\$R2$selfSubTypeParam$superTypeParam2$classTypeParams> '
          '_chain<\$R2$superTypeParamDef2>(Then<$superOrSelfTypeParam2, \$R2> then, Then<$selfTypeParam, $superOrSelfTypeParam2> then2) '
          '=> _${config.uniqueClassName}CopyWithImpl(\$value, then, then2);\n'
          '\n');

      for (var param in copyParams) {
        snippets.add(
            '  @override ${param.name}CopyWith<\$R${param.subTypeParam}${param.superTypeParam}${param.fieldTypeParams}>${param.a.type.isNullable ? '?' : ''} get ${param.a.name} => ');
        snippets.add('${param.invocation};\n');
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
