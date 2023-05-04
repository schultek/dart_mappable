import 'package:dart_mappable/dart_mappable.dart';

part 'school.mapper.dart';

@MappableClass()
class School with SchoolMappable {
  final String university;

  const School({required this.university});
}
