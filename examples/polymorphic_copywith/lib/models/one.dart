import 'package:dart_mappable/dart_mappable.dart';
import 'package:polymorphic_copywith/models/base.dart';

part 'one.mapper.dart';

@MappableClass()
class One extends Base with OneMappable {
  One({
    required super.id,
    required super.name,
    required super.objects,
  });

  @override
  String get model => 'modelOne';
}
