import 'package:dart_mappable/dart_mappable.dart';

import '../elements/class/target_class_mapper_element.dart';
import '../elements/param/copy_param_element.dart';
import '../elements/param/mapper_param_element.dart';
import '../utils.dart';

class CopyWithGenerator {
  final TargetClassMapperElement element;

  CopyWithGenerator(this.element);

  late String classTypeParamsDef =
      element.typeParamsList.map((p) => ', $p').join();
  late String classTypeParams =
      element.element.typeParameters.map((p) => ', ${p.name}').join();

  late bool hasSuperTarget = element.superElement != null &&
      element.superElement!.shouldGenerate(GenerateMethods.copy);

  late String selfTypeParam = element.selfTypeParam;
  late String superPrefixedClassName = element.superPrefixedClassName;

  late String selfSubTypeParam = ', $selfTypeParam';
  late String selfSuperTypeParam = ', $selfTypeParam';

  late String subTypeParamDef = ', \$In extends $selfTypeParam';
  late String subTypeParam = ', \$In';
  late String subOrSelfTypeParam = ', \$In';

  late String superTypeParamDef = ', \$Out extends $superPrefixedClassName';
  late String superTypeParamDef2 = ', \$Out2 extends $superPrefixedClassName';
  late String superTypeParam = ', \$Out';
  late String superTypeParam2 = ', \$Out2';
  late String superOrSelfTypeParam = ', \$Out';
  late String superOrSelfTypeParam2 = '\$Out2';

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

    return '\n\n${_generateCopyWithClasses()}';
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
    var output = StringBuffer();

    if (element.hasCallableConstructor) {
      output.write(
          'extension ${element.uniqueClassName}ValueCopy<\$R$superTypeParamDef$classTypeParamsDef> on ObjectCopyWith<\$R, $selfTypeParam$superOrSelfTypeParam> {\n'
          '  ${element.uniqueClassName}CopyWith<\$R$selfSubTypeParam$superTypeParam$classTypeParams> get \$as${element.className} => \$base.as((v, t, t2) => _${element.uniqueClassName}CopyWithImpl(v, t, t2));\n'
          '}\n\n');
    }

    var implementsStmt = '';

    if (hasSuperTarget) {
      var superClassTypeParams =
          element.superTypeArgs.map((a) => ', $a').join();
      implementsStmt =
          ' implements ${element.superElement!.uniqueClassName}CopyWith<\$R$subOrSelfTypeParam$superTypeParam$superClassTypeParams>';
    } else {
      implementsStmt =
          ' implements ClassCopyWith<\$R$subOrSelfTypeParam$superOrSelfTypeParam>';
    }

    output.write(
        'typedef ${element.superPrefixedClassNameAlias} = $superPrefixedClassName;\n');

    output.write(''
        'abstract class ${element.uniqueClassName}CopyWith<\$R$subTypeParamDef$superTypeParamDef$classTypeParamsDef>$implementsStmt {\n');

    var copyParams = CopyParamElement.collectFrom(element.params, element);

    for (var param in copyParams) {
      var isOverridden = hasSuperTarget && param.param is SuperParamElement;
      output.write(
          '  ${isOverridden ? '@override ' : ''}${param.name}CopyWith<\$R${param.subTypeParam}${param.superTypeParam}${param.fieldTypeParams}>${param.a.type.isNullable ? '?' : ''} get ${param.a.name};\n');
    }

    output.write(
        '  ${hasSuperTarget ? '@override ' : ''}\$R call(${_generateCopyWithParams()});\n');

    output.write(
        '  ${element.uniqueClassName}CopyWith<\$R2$subTypeParam$superTypeParam2$classTypeParams> \$chain<\$R2$superTypeParamDef2>(Then<$selfTypeParam, $superOrSelfTypeParam2> t, Then<$superOrSelfTypeParam2, \$R2> t2);\n');

    output.write('}\n');

    if (element.hasCallableConstructor) {
      output.write('\n'
          'class _${element.uniqueClassName}CopyWithImpl<\$R$superTypeParamDef$classTypeParamsDef> '
          'extends ClassCopyWithBase<\$R, $selfTypeParam$superOrSelfTypeParam> implements ${element.uniqueClassName}CopyWith'
          '<\$R$selfSubTypeParam$superTypeParam$classTypeParams> {\n'
          '  _${element.uniqueClassName}CopyWithImpl(super.value, super.then, super.then2);\n'
          '\n');

      output.write('  @override\n'
          '  late final ClassMapperBase<${element.prefixedClassName}> \$mapper = ${element.mapperName}.ensureInitialized();\n');

      for (var param in copyParams) {
        output.write(
            '  @override ${param.name}CopyWith<\$R${param.subTypeParam}${param.superTypeParam}${param.fieldTypeParams}>${param.a.type.isNullable ? '?' : ''} get ${param.a.name} => ');
        output.write('${param.invocation};\n');
      }

      output.write(
          '  @override \$R call(${_generateCopyWithParams(implVersion: true)}) => \$apply(FieldCopyWithData({${_generateCopyWithFields()}}));\n');

      output.write(
          '  @override $selfTypeParam \$make(CopyWithData data) => ${element.prefixedDecodingClassName}${element.constructor!.name != '' ? '.${element.constructor!.name}' : ''}(${_generateCopyWithConstructorParams()});\n');

      output.write('\n'
          '  @override ${element.uniqueClassName}CopyWith<\$R2$selfSubTypeParam$superTypeParam2$classTypeParams> '
          '\$chain<\$R2$superTypeParamDef2>(Then<$selfTypeParam, $superOrSelfTypeParam2> t, Then<$superOrSelfTypeParam2, \$R2> t2) '
          '=> _${element.uniqueClassName}CopyWithImpl(\$value, t, t2);\n');

      output.write('}');
    }

    return output.toString();
  }

  String _generateCopyWithParams({bool implVersion = false}) {
    if (element.copySafeParams.isEmpty) return '';

    List<String> params = [];
    for (var param in element.copySafeParams) {
      var p = param.parameter;

      var type = element.parent.prefixedType(p.type, withNullability: false);

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

  String _generateCopyWithFields() {
    List<String> params = [];
    for (var param in element.copySafeParams) {
      var str = '#${param.superName}: ${param.superName}';

      if (param is! UnresolvedParamElement) {
        var p = param.parameter;
        if (p.type.isNullable || p.type.isDynamic) {
          str = 'if (${param.superName} != \$none) $str';
        } else {
          str = 'if (${param.superName} != null) $str';
        }
      }

      params.add(str);
    }
    return params.join(', ');
  }

  String _generateCopyWithConstructorParams() {
    List<String> params = [];
    for (var param in element.params) {
      var p = param.parameter;
      var str = '';

      if (p.isNamed) {
        str = '${p.name}: ';
      }

      if (param is UnresolvedParamElement) {
        str += 'data.get(#${p.name})';
      } else {
        var name = param.superName;
        var a = param.accessor;
        str += 'data.get(#$name, or: \$value.${a.name})';
      }

      params.add(str);
    }
    return params.join(', ');
  }
}
