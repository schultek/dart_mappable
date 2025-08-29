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
  final (int, int, String) info;
  User({
    required this.name,
    this.age = 10,
    required this.tags,
    this.type = UserType.admin,
    required this.info
  });
}

void main() {
  UserMapper.ensureInitialized();

  final schema = buildJsonSchemaFor<User>();
  print(schema.toJson());
}
