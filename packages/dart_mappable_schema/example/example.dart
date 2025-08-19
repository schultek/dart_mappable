import 'package:json_schema_builder/json_schema.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'example.mapper.dart';

@MappableClass()
class User with UserMappable {
  final String name;
  final int age;
  final List<String> tags;
  User({required this.name, this.age = 10, required this.tags});
}

void main() {
  UserMapper.ensureInitialized();

  final schema = buildJsonSchemaFor<User>();
  print(schema.toMap());
}
