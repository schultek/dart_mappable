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
      element.element.typeParameters2.map((p) => ', ${p.name3}').join();

  late bool hasExtendsTarget =
      element.extendsElement != null &&
      element.extendsElement!.shouldGenerate(GenerateMethods.copy);
  late bool hasSuperTarget =
      element.superElement != null &&
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
          ' => _${element.uniqueClassName}CopyWithImpl<$selfTypeParam, $selfTypeParam$classTypeParams>(this as $selfTypeParam, \$identity, \$identity);\n';
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
        '  ${element.uniqueClassName}CopyWith<\$R, $selfTypeParam, \$Out$classTypeParams> get \$as${element.className} => \$base.as((v, t, t2) => _${element.uniqueClassName}CopyWithImpl<\$R, \$Out$classTypeParams>(v, t, t2));\n'
        '}\n\n',
      );
    }

    var implements = <String>[];

    if (hasExtendsTarget) {
      var superClassTypeParams =
          element.superTypeArgs.map((a) => ', $a').join();
      implements.add(
        '${element.extendsElement!.uniqueClassName}CopyWith<\$R, \$In, \$Out$superClassTypeParams>',
      );
    }

    for (var interface in element.interfaceElements) {
      if (interface.shouldGenerate(GenerateMethods.copy)) {
        var interfaceTypeParams =
            element.element.interfaces
                .firstWhere((t) => t.element3 == interface.element)
                .typeArguments
                .map((a) => ', ${element.parent.prefixedType(a)}')
                .join();
        implements.add(
          '${interface.uniqueClassName}CopyWith<\$R, \$In, \$Out$interfaceTypeParams>',
        );
      }
    }

    if (implements.isEmpty) {
      implements.add('ClassCopyWith<\$R, \$In, \$Out>');
    }

    var implementsStmt =
        implements.isEmpty ? '' : ' implements ${implements.join(', ')}';

    output.write(
      ''
      'abstract class ${element.uniqueClassName}CopyWith<\$R, \$In extends $selfTypeParam, \$Out$classTypeParamsDef>$implementsStmt {\n',
    );

    var copyParams = CopyParamElement.collectFrom(element.params, element);

    for (var param in copyParams) {
      var isOverridden = hasSuperTarget && param.param is SuperParamElement;
      output.write(
        '  ${isOverridden ? '@override ' : ''}${param.name}CopyWith<\$R${param.subTypeParam}${param.superTypeParam}${param.fieldTypeParams}>${param.a.type.isNullable ? '?' : ''} get ${param.a.name3 ?? ''};\n',
      );
    }

    output.write(
      '  ${hasSuperTarget ? '@override ' : ''}\$R call(${_generateCopyWithParams()});\n',
    );

    output.write(
      '  ${element.uniqueClassName}CopyWith<\$R2, \$In, \$Out2$classTypeParams> \$chain<\$R2, \$Out2>(Then<\$Out2, \$R2> t);\n',
    );

    output.write('}\n');

    if (element.hasCallableConstructor) {
      output.write(
        '\n'
        'class _${element.uniqueClassName}CopyWithImpl<\$R, \$Out$classTypeParamsDef> '
        'extends ClassCopyWithBase<\$R, $selfTypeParam, \$Out> implements ${element.uniqueClassName}CopyWith'
        '<\$R, $selfTypeParam, \$Out$classTypeParams> {\n'
        '  _${element.uniqueClassName}CopyWithImpl(super.value, super.then, super.then2);\n'
        '\n',
      );

      output.write(
        '  @override\n'
        '  late final ClassMapperBase<${element.prefixedClassName}> \$mapper = ${element.mapperName}.ensureInitialized();\n',
      );

      for (var param in copyParams) {
        output.write(
          '  @override ${param.name}CopyWith<\$R${param.subTypeParam}${param.superTypeParam}${param.fieldTypeParams}>${param.a.type.isNullable ? '?' : ''} get ${param.a.name3 ?? ''} => ',
        );
        output.write('${param.invocation};\n');
      }

      output.write(
        '  @override \$R call(${_generateCopyWithParams(implVersion: true)}) => \$apply(FieldCopyWithData({${_generateCopyWithFields()}}));\n',
      );

      output.write(
        '  @override $selfTypeParam \$make(CopyWithData data) => ${element.prefixedDecodingClassName}${element.constructor.element!.name3 != 'new' ? '.${element.constructor.element!.name3}' : ''}(${_generateCopyWithConstructorParams()});\n',
      );

      output.write(
        '\n'
        '  @override ${element.uniqueClassName}CopyWith<\$R2, $selfTypeParam, \$Out2$classTypeParams> '
        '\$chain<\$R2, \$Out2>(Then<\$Out2, \$R2> t) '
        '=> _${element.uniqueClassName}CopyWithImpl<\$R2, \$Out2$classTypeParams>(\$value, \$cast, t);\n',
      );

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
        if (p.type.isNullableOrDynamic) {
          var isDynamic = p.type is DynamicType;
          params.add('$type${isDynamic ? '' : '?'} ${p.name3 ?? ''}');
        } else {
          params.add('required $type ${p.name3 ?? ''}');
        }
      } else {
        var name = param.superName;
        if (implVersion && p.type.isNullableOrDynamic) {
          params.add('Object? $name = \$none');
        } else {
          var isDynamic = p.type is DynamicType;
          params.add(
            '${param.isCovariant && !implVersion ? 'covariant ' : ''}$type${isDynamic ? '' : '?'} $name',
          );
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
        if (p.type.isNullableOrDynamic) {
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
        str = '${p.name3 ?? ''}: ';
      }

      if (param is UnresolvedParamElement) {
        str += 'data.get(#${p.name3 ?? ''})';
      } else {
        var name = param.superName;
        var a = param.accessor!;
        str += 'data.get(#$name, or: \$value.${a.name3 ?? ''})';
      }

      params.add(str);
    }
    return params.join(', ');
  }
}
