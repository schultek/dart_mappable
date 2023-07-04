import '../elements/mapper_element.dart';

abstract class MapperGenerator<T> {
  final T element;

  MapperGenerator(this.element);

  Future<String> generate();
}

abstract class InterfaceMapperGenerator<T extends InterfaceMapperElement>
    extends MapperGenerator<T> {
  InterfaceMapperGenerator(super.element);

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
        '\n  @override\n  final Map<Symbol, Field<${element.prefixedClassName}, dynamic>> fields = const {\n');

    for (var f in fields) {
      output.write('    #${f.name}: _f\$${f.name},\n');
    }

    output.write('  };\n');
  }
}
