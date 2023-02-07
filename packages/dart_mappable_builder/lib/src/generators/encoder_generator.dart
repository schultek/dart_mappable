import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../elements/class/class_mapper_element.dart';
import '../elements/mapper_param_element.dart';
import '../elements/class/target_class_mapper_element.dart';

class EncoderGenerator {
  final TargetClassMapperElement target;

  EncoderGenerator(this.target);

  String generateEncoderMixin() {
    if (!target.shouldGenerate(GenerateMethods.encode)) {
      return '';
    }
    if (target.isAbstract) {
      return '  String toJson();\n'
          '  Map<String, dynamic> toMap();\n';
    }
    return '  String toJson() {\n'
        '    ${target.mapperName}.ensureInitialized();\n'
        '    return MapperContainer.globals.toJson(this as ${target.selfTypeParam});\n'
        '  }\n'
        '  Map<String, dynamic> toMap() {\n'
        '    ${target.mapperName}.ensureInitialized();\n'
        '    return MapperContainer.globals.toMap(this as ${target.selfTypeParam});\n'
        '  }\n';
  }

  String generateEncoderExtensions() {
    if (!target.shouldGenerate(GenerateMethods.encode)) {
      return '';
    }
    return '  String toJson() {\n'
        '    ${target.mapperName}.ensureInitialized();\n'
        '    MapperContainer.globals.toJson(this);\n'
        '  }\n'
        '  Map<String, dynamic> toMap() {\n'
        '    ${target.mapperName}.ensureInitialized();\n'
        '    MapperContainer.globals.toMap(this);\n'
        '  }\n';
  }
}
