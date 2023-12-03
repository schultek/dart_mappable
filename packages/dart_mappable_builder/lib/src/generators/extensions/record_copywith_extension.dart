import 'package:analyzer/dart/element/type.dart';

import '../../elements/param/class_mapper_param_element.dart';
import '../../elements/record/record_mapper_element.dart';
import '../../elements/record/target_record_mapper_element.dart';
import '../../utils.dart';
import '../generator.dart';

extension RecordCopyWithMixin on MapperGenerator<RecordMapperElement> {
  String get classTypeParamsDef =>
      element.typeParamsList.map((p) => ', $p').join();
  String get classTypeParams =>
      element.element.typeParameters.map((p) => ', ${p.name}').join();

  String get selfTypeParam => element.selfTypeParam;

  TargetRecordMapperElement get element =>
      this.element as TargetRecordMapperElement;

  void generateCopyWithExtension(StringBuffer output) {
    if (this.element is! TargetRecordMapperElement) return;

    output.write(
        '  ${element.uniqueClassName}CopyWith<$selfTypeParam$classTypeParams> get copyWith => '
        '_${element.uniqueClassName}CopyWithImpl(this, \$identity, \$identity);\n');
  }

  String generateCopyWithClasses() {
    if (this.element is! TargetRecordMapperElement) return '';
    return '\n\n${_generateCopyWithClasses()}';
  }

  String _generateCopyWithClasses() {
    var output = StringBuffer();

    output.write(
        'extension ${element.uniqueClassName}ValueCopy<\$R$classTypeParamsDef> on ObjectCopyWith<\$R, $selfTypeParam, $selfTypeParam> {\n'
        '  ${element.uniqueClassName}CopyWith<\$R$classTypeParams> get \$as${element.className} => \$base.as((v, t, t2) => _${element.uniqueClassName}CopyWithImpl(v, t, t2));\n'
        '}\n\n');

    var implements = <String>[];

    if (implements.isEmpty) {
      implements.add('RecordCopyWith<\$R, $selfTypeParam>');
    }

    var implementsStmt =
        implements.isEmpty ? '' : ' implements ${implements.join(', ')}';

    output.write(''
        'abstract class ${element.uniqueClassName}CopyWith<\$R$classTypeParamsDef>$implementsStmt {\n');

    // var copyParams = CopyParamElement.collectFrom(element.params, element);
    //
    // for (var param in copyParams) {
    //   output.write(
    //       '  ${param.name}CopyWith<\$R${param.subTypeParam}${param.superTypeParam}${param.fieldTypeParams}>${param.a.type.isNullable ? '?' : ''} get ${param.a.name};\n');
    // }

    output.write('  \$R call(${_generateCopyWithParams()});\n');

    output.write(
        '  ${element.uniqueClassName}CopyWith<\$R2$classTypeParams> \$chain<\$R2>(Then<$selfTypeParam, \$R2> t);\n');

    output.write('}\n');

    output.write('\n'
        'class _${element.uniqueClassName}CopyWithImpl<\$R$classTypeParamsDef> '
        'extends RecordCopyWithBase<\$R, $selfTypeParam> implements ${element.uniqueClassName}CopyWith'
        '<\$R$classTypeParams> {\n'
        '  _${element.uniqueClassName}CopyWithImpl(super.value, super.then, super.then2);\n'
        '\n');

    output.write('  @override\n'
        '  late final RecordMapperBase<${element.prefixedClassName}> \$mapper = ${element.mapperName}.ensureInitialized();\n');

    // for (var param in copyParams) {
    //   output.write(
    //       '  @override ${param.name}CopyWith<\$R${param.subTypeParam}${param.superTypeParam}${param.fieldTypeParams}>${param.a.type.isNullable ? '?' : ''} get ${param.a.name} => ');
    //   output.write('${param.invocation};\n');
    // }

    output.write(
        '  @override \$R call(${_generateCopyWithParams(implVersion: true)}) => \$apply(FieldCopyWithData({${_generateCopyWithFields()}}));\n');

    output.write(
        '  @override $selfTypeParam \$make(CopyWithData data) => (${_generateCopyWithConstructorParams()});\n');

    output.write('\n'
        '  @override ${element.uniqueClassName}CopyWith<\$R2$classTypeParams> '
        '\$chain<\$R2>(Then<$selfTypeParam, \$R2> t) '
        '=> _${element.uniqueClassName}CopyWithImpl(\$value, \$cast, t);\n');

    output.write('}');

    return output.toString();
  }

  String _generateCopyWithParams({bool implVersion = false}) {
    if (element.fields.isEmpty) return '';

    List<String> params = [];
    for (var param in element.fields) {
      var p = param.param;

      var type = element.parent.prefixedType(p.type, withNullability: false);

      if (param is UnresolvedParamElement) {
        if (p.type.isNullable) {
          var isDynamic = p.type is DynamicType;
          params.add('$type${isDynamic ? '' : '?'} ${p.name}');
        } else {
          params.add('required $type ${p.name}');
        }
      } else {
        var name = param.name;
        var isDynamic = p.type is DynamicType;
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
    for (var param in element.fields) {
      var str = '#${param.name}: ${param.name}';

      if (param is! UnresolvedParamElement) {
        var p = param.param;
        if (p.type.isNullable || p.type is DynamicType) {
          str = 'if (${param.name} != \$none) $str';
        } else {
          str = 'if (${param.name} != null) $str';
        }
      }

      params.add(str);
    }
    return params.join(', ');
  }

  String _generateCopyWithConstructorParams() {
    List<String> params = [];
    for (var param in element.fields) {
      var p = param.param;
      var str = '';

      if (p.isNamed) {
        str = '${p.name}: ';
      }

      if (param is UnresolvedParamElement) {
        str += 'data.get(#${p.name})';
      } else {
        var name = param.name;
        str += 'data.get(#$name, or: \$value.$name)';
      }

      params.add(str);
    }
    return params.join(', ');
  }
}
