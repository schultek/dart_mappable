import 'package:dart_mappable_schema/json_schema.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'example.mapper.dart';

@MappableEnum()
enum UserType { user, admin }

@MappableClass()
class User with UserMappable {
  final String name;
  final int age;
  final List<String> tags;
  final UserType type;
  User({
    required this.name,
    this.age = 10,
    required this.tags,
    required this.type,
  });
}

void main() {
  UserMapper.ensureInitialized();

  final schema = buildJsonSchemaFor<User>();
  print(schema.toJson());
}
