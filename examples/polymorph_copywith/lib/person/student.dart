import 'package:dart_mappable/dart_mappable.dart';

import 'clothes.dart';
import 'person.dart';
import 'school.dart';
import 'student_clothes.dart';

part 'student.mapper.dart';

@MappableClass()
class Student extends Person with StudentMappable implements School {
// class Student with StudentMappable implements School, Person {
  // @override
  // final String name;s
  @override
  final List<StudentClothes>? clothes;
  @override
  final String university;

  const Student({
    // required this.name,
    // required this.clothes,
    required super.name,
    this.clothes,
    required this.university,
  });
}
