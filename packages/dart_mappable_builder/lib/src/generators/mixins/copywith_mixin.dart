import 'package:analyzer/dart/element/type.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../elements/class/target_class_mapper_element.dart';
import '../../elements/param/class_mapper_param_element.dart';
import '../../elements/param/copy_param_element.dart';
import '../../utils.dart';
import '../generator.dart';

mixin CopyWithMixin on MapperGenerator<TargetClassMapperElement> {
  late String classTypeParamsDef =
      element.typeParamsList.map((p) => ', $p').join();
  late String classTypeParams =
      element.element.typeParameters.map((p) => ', ${p.name}').join();

  late bool hasExtendsTarget = element.extendsElement != null &&
      element.extendsElement!.shouldGenerate(GenerateMethods.copy);
  late bool hasSuperTarget = element.superElement != null &&
      element.superElement!.shouldGenerate(GenerateMethods.copy);

  late String selfTypeParam = element.selfTypeParam;

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
    return '${element.uniqueClassName}CopyWith<$selfTypeParam, $selfTypeParam, $selfTypeParam$classTypeParams> get copyWith => _${element.uniqueClassName}CopyWithImpl(this, \$identity, \$identity);';
  }

  String _generateCopyWithMixin() {
    var snippet =
        '  ${element.uniqueClassName}CopyWith<$selfTypeParam, $selfTypeParam, $selfTypeParam$classTypeParams> get copyWith';

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
          'extension ${element.uniqueClassName}ValueCopy<\$R, \$Out$classTypeParamsDef> on ObjectCopyWith<\$R, $selfTypeParam, \$Out> {\n'
          '  ${element.uniqueClassName}CopyWith<\$R, $selfTypeParam, \$Out$classTypeParams> get \$as${element.className} => \$base.as((v, t, t2) => _${element.uniqueClassName}CopyWithImpl(v, t, t2));\n'
          '}\n\n');
    }

    var implements = <String>[];

    if (hasExtendsTarget) {
      var superClassTypeParams =
          element.superTypeArgs.map((a) => ', $a').join();
      implements.add(
          '${element.extendsElement!.uniqueClassName}CopyWith<\$R, \$In, \$Out$superClassTypeParams>');
    }

    for (var interface in element.interfaceElements) {
      if (interface.shouldGenerate(GenerateMethods.copy)) {
        var interfaceTypeParams = element.element.interfaces
            .firstWhere((t) => t.element == interface.element)
            .typeArguments
            .map((a) => ', ${element.parent.prefixedType(a)}')
            .join();
        implements.add(
            '${interface.uniqueClassName}CopyWith<\$R, \$In, \$Out$interfaceTypeParams>');
      }
    }

    if (implements.isEmpty) {
      implements.add('ClassCopyWith<\$R, \$In, \$Out>');
    }

    var implementsStmt =
        implements.isEmpty ? '' : ' implements ${implements.join(', ')}';

    output.write(''
        'abstract class ${element.uniqueClassName}CopyWith<\$R, \$In extends $selfTypeParam, \$Out$classTypeParamsDef>$implementsStmt {\n');

    var copyParams = CopyParamElement.collectFrom(element.params, element);

    for (var param in copyParams) {
      var isOverridden = hasSuperTarget && param.param is SuperParamElement;
      output.write(
          '  ${isOverridden ? '@override ' : ''}${param.name}CopyWith<\$R${param.subTypeParam}${param.superTypeParam}${param.fieldTypeParams}>${param.a.type.isNullable ? '?' : ''} get ${param.a.name};\n');
    }

    output.write(
        '  ${hasSuperTarget ? '@override ' : ''}\$R call(${_generateCopyWithParams()});\n');

    output.write(
        '  ${element.uniqueClassName}CopyWith<\$R2, \$In, \$Out2$classTypeParams> \$chain<\$R2, \$Out2>(Then<\$Out2, \$R2> t);\n');

    output.write('}\n');

    if (element.hasCallableConstructor) {
      output.write('\n'
          'class _${element.uniqueClassName}CopyWithImpl<\$R, \$Out$classTypeParamsDef> '
          'extends ClassCopyWithBase<\$R, $selfTypeParam, \$Out> implements ${element.uniqueClassName}CopyWith'
          '<\$R, $selfTypeParam, \$Out$classTypeParams> {\n'
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
          '  @override $selfTypeParam \$make(CopyWithData data) => ${element.prefixedDecodingClassName}${element.constructor.element!.name != '' ? '.${element.constructor.element!.name}' : ''}(${_generateCopyWithConstructorParams()});\n');

      output.write('\n'
          '  @override ${element.uniqueClassName}CopyWith<\$R2, $selfTypeParam, \$Out2$classTypeParams> '
          '\$chain<\$R2, \$Out2>(Then<\$Out2, \$R2> t) '
          '=> _${element.uniqueClassName}CopyWithImpl(\$value, \$cast, t);\n');

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
          var isDynamic = p.type is DynamicType;
          params.add('$type${isDynamic ? '' : '?'} ${p.name}');
        } else {
          params.add('required $type ${p.name}');
        }
      } else {
        var name = param.superName;
        var isDynamic = p.type is DynamicType;
        if (implVersion && (p.type.isNullable || isDynamic)) {
          params.add('Object? $name = \$none');
        } else {
          params.add(
              '${param.isCovariant && !implVersion ? 'covariant ' : ''}$type${isDynamic ? '' : '?'} $name');
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
        if (p.type.isNullable || p.type is DynamicType) {
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
        var a = param.accessor!;
        str += 'data.get(#$name, or: \$value.${a.name})';
      }

      params.add(str);
    }
    return params.join(', ');
  }
}
