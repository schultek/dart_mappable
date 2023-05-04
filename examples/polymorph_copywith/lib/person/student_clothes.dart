import 'package:dart_mappable/dart_mappable.dart';

import 'clothes.dart';
import 'student_pants.dart';

part 'student_clothes.mapper.dart';

@MappableClass()
class StudentClothes with StudentClothesMappable implements Clothes {
  @override
  final String shirt;
  @override
  final List<StudentPants> pants;
  final String badge;

  const StudentClothes(
      {required this.shirt, required this.pants, required this.badge});
}
