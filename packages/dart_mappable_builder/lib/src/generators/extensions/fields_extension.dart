import '../../elements/mapper_element.dart';
import '../generator.dart';

extension FieldsExtension<T extends InterfaceMapperElement>
    on MapperGenerator<T> {
  Future<void> generateFields(StringBuffer output) async {
    var fields = element.fields;

    for (var f in fields) {
      if (f.needsGetter) {
        output.write(
            '  static ${f.staticGetterType} _\$${f.name}(${element.prefixedClassName} v) => v.${f.name};\n');
      }
      if (f.needsArg) {
        output.write(
            '  static dynamic _arg\$${f.name}${element.typeParamsDeclaration}(f) => f<${f.argType}>();\n');
      }
      output.write(
          "  static const Field<${element.prefixedClassName}, ${f.staticArgType}> _f\$${f.name} = Field('${f.name.replaceAll(r'$', r'\$')}', ${f.getter}${f.key}${f.mode}${f.opt}${await f.def}${f.arg}${await f.hook});\n");
    }

    output.write(
        '\n  @override\n  final MappableFields<${element.prefixedClassName}> fields = const {\n');

    for (var f in fields) {
      output.write('    #${f.name}: _f\$${f.name},\n');
    }

    output.write('  };\n');
  }
}
