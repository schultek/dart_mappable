import '../../../dart_mappable.dart';
import '../config/class_mapper_config.dart';

class ToStringGenerator {
  String generateToStringMethods(ClassMapperConfig config) {
    if (config.shouldGenerate(GenerateMethods.stringify)) {
      return '\n'
          "  @override String? stringify(${config.className} self) => '${config.className}(${_generateStringParams(config)})';\n"
          '';
    } else {
      return '';
    }
  }

  String _generateStringParams(ClassMapperConfig config) {
    List<String> params = [];

    void addFieldsForMapper(ClassMapperConfig config) {
      if (config.superConfig != null) {
        addFieldsForMapper(config.superConfig!);
      }

      for (var field in config.element.fields) {
        if (!field.isStatic &&
            !field.isPrivate &&
            (field.getter?.isSynthetic ?? false)) {
          var str = '';
          str = '${field.name}: ';
          str += '\${Mapper.asString(self.${field.name})}';
          params.add(str);
        }
      }
    }

    addFieldsForMapper(config);

    return params.join(', ');
  }
}
