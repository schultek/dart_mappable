import 'package:dart_mappable/dart_mappable.dart';

import 'json_schema.dart';

export 'src/json_schema.dart';
export 'src/mapper_to_schema.dart';

extension MapperToSchema<T extends Object> on ClassMapperBase<T> {
  JsonSchema toJsonSchema() {
    return buildJsonSchemaFor<T>();
  }
}
