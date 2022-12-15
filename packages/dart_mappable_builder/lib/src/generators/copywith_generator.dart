import 'package:dart_mappable/dart_mappable.dart';

import '../elements/class_mapper_element.dart';
import '../elements/copy_param_element.dart';
import '../elements/mapper_param_element.dart';
import '../utils.dart';

class CopyWithGenerator {
  final ClassMapperElement element;

  CopyWithGenerator(this.element);

  late String classTypeParamsDef =
      element.typeParamsList.map((p) => ', $p').join();
  late String classTypeParams =
      element.element.typeParameters.map((p) => ', ${p.name}').join();

  late bool hasSubConfigs = element.subTargets.isNotEmpty;
  late bool hassuperTarget = element.superTarget != null;
  late bool hasSubOrsuperTargets = hasSubConfigs || hassuperTarget;

  late String selfTypeParam = element.selfTypeParam;
  late String superPrefixedClassName = element.superPrefixedClassName;

  late String selfSubTypeParam = hasSubConfigs ? ', $selfTypeParam' : '';
  late String selfSuperTypeParam =
      hasSubOrsuperTargets ? ', $selfTypeParam' : '';

  late String subTypeParamDef =
      hasSubConfigs ? ', \$In extends $selfTypeParam' : '';
  late String subTypeParam = hasSubConfigs ? ', \$In' : '';
  late String subOrSelfTypeParam =
      hasSubConfigs ? ', \$In' : ', $selfTypeParam';

  late String superTypeParamDef =
      hasSubOrsuperTargets ? ', \$Out extends $superPrefixedClassName' : '';
  late String superTypeParamDef2 =
      hasSubOrsuperTargets ? ', \$Out2 extends $superPrefixedClassName' : '';
  late String superTypeParam = hasSubOrsuperTargets ? ', \$Out' : '';
  late String superTypeParam2 = hasSubOrsuperTargets ? ', \$Out2' : '';
  late String superOrSelfTypeParam =
      hasSubOrsuperTargets ? ', \$Out' : ', $selfTypeParam';
  late String superOrSelfTypeParam2 =
      hasSubOrsuperTargets ? '\$Out2' : selfTypeParam;

  String generateCopyWithExtension() {
    if (!element.shouldGenerate(GenerateMethods.copy)) return '';
    if (element.hasCallableConstructor) {
      return '  ${_generateCopyWith()}\n';
    } else {
      return '';
    }
  }

  String generateCopyWithMixin() {
    if (!element.shouldGenerate(GenerateMethods.copy)) return '';
    return _generateCopyWithMixin();
  }

  String generateCopyWithClasses() {
    if (!element.shouldGenerate(GenerateMethods.copy)) return '';
    if (element.hasCallableConstructor || hasSubConfigs) {
      return '\n\n${_generateCopyWithClasses()}';
    } else {
      return '';
    }
  }

  String _generateCopyWith() {
    return '${element.uniqueClassName}CopyWith<$selfTypeParam$selfSubTypeParam$selfSuperTypeParam$classTypeParams> get copyWith => _${element.uniqueClassName}CopyWithImpl(this, \$identity, \$identity);';
  }

  String _generateCopyWithMixin() {
    var snippet =
        '  ${element.uniqueClassName}CopyWith<$selfTypeParam$selfSubTypeParam$selfSuperTypeParam$classTypeParams> get copyWith';

    if (element.hasCallableConstructor) {
      snippet +=
          ' => _${element.uniqueClassName}CopyWithImpl(this as $selfTypeParam, \$identity, \$identity);\n';
    } else {
      snippet += ';\n';
    }

    return snippet;
  }

  String _generateCopyWithClasses() {
    var snippets = <String>[];

    if (element.hasCallableConstructor) {
      snippets.add(
          'extension ${element.uniqueClassName}ValueCopy<\$R$superTypeParamDef$classTypeParamsDef> on ObjectCopyWith<\$R, $selfTypeParam$superOrSelfTypeParam> {\n'
          '  ${element.uniqueClassName}CopyWith<\$R$selfSubTypeParam$superTypeParam$classTypeParams> get as${element.className} => base.as((v, t, t2) => _${element.uniqueClassName}CopyWithImpl(v, t, t2));\n'
          '}\n\n');
    }

    var implementsStmt = '';

    if (hassuperTarget) {
      var superClassTypeParams = element.superTypeArgs.map((a) => ', $a').join();
      implementsStmt =
          ' implements ${element.superTarget!.uniqueClassName}CopyWith<\$R$subOrSelfTypeParam$superTypeParam$superClassTypeParams>';
    } else {
      implementsStmt =
          ' implements ObjectCopyWith<\$R$subOrSelfTypeParam$superOrSelfTypeParam>';
    }

    snippets.add(''
        'abstract class ${element.uniqueClassName}CopyWith<\$R$subTypeParamDef$superTypeParamDef$classTypeParamsDef>$implementsStmt {\n');

    snippets.add(
        '  ${element.uniqueClassName}CopyWith<\$R2$subTypeParam$superTypeParam2$classTypeParams> chain<\$R2$superTypeParamDef2>(Then<$selfTypeParam, $superOrSelfTypeParam2> t, Then<$superOrSelfTypeParam2, \$R2> t2);\n');

    var copyParams = CopyParamElement.collectFrom(element.params, element);

    for (var param in copyParams) {
      var isOverridden = hassuperTarget && param.param is SuperParamElement;
      snippets.add(
          '  ${isOverridden ? '@override ' : ''}${param.name}CopyWith<\$R${param.subTypeParam}${param.superTypeParam}${param.fieldTypeParams}>${param.a.type.isNullable ? '?' : ''} get ${param.a.name};\n');
    }

    snippets.add(
        '  ${hassuperTarget ? '@override ' : ''}\$R call(${_generateCopyWithParams()});\n');

    snippets.add('}\n');

    if (element.hasCallableConstructor) {
      snippets.add('\n'
          'class _${element.uniqueClassName}CopyWithImpl<\$R$superTypeParamDef$classTypeParamsDef> '
          'extends BaseCopyWith<\$R, $selfTypeParam$superOrSelfTypeParam> implements ${element.uniqueClassName}CopyWith'
          '<\$R$selfSubTypeParam$superTypeParam$classTypeParams> {\n'
          '  _${element.uniqueClassName}CopyWithImpl(super.value, super.then, super.then2);\n'
          '  @override ${element.uniqueClassName}CopyWith<\$R2$selfSubTypeParam$superTypeParam2$classTypeParams> '
          'chain<\$R2$superTypeParamDef2>(Then<$selfTypeParam, $superOrSelfTypeParam2> t, Then<$superOrSelfTypeParam2, \$R2> t2) '
          '=> _${element.uniqueClassName}CopyWithImpl(\$value, t, t2);\n'
          '\n');

      for (var param in copyParams) {
        snippets.add(
            '  @override ${param.name}CopyWith<\$R${param.subTypeParam}${param.superTypeParam}${param.fieldTypeParams}>${param.a.type.isNullable ? '?' : ''} get ${param.a.name} => ');
        snippets.add('${param.invocation};\n');
      }

      snippets.add(
          '  @override \$R call(${_generateCopyWithParams(implVersion: true)}) => \$then(${element.prefixedClassName}${element.constructor!.name != '' ? '.${element.constructor!.name}' : ''}(${_generateCopyWithConstructorParams()}));\n'
          '}');
    }

    return snippets.join();
  }

  String _generateCopyWithParams({bool implVersion = false}) {
    if (element.copySafeParams.isEmpty) return '';

    List<String> params = [];
    for (var param in element.copySafeParams) {
      var p = param.parameter;

      var type =
          element.parent.prefixedType(p.type, withNullability: false);

      if (param is UnresolvedParamElement) {
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
    for (var param in element.copySafeParams) {
      var p = param.parameter;
      var str = '';

      if (p.isNamed) {
        str = '${p.name}: ';
      }

      if (param is UnresolvedParamElement) {
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
