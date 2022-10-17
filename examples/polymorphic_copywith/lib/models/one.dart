import 'package:dart_mappable/dart_mappable.dart';
import 'package:polymorphic_copywith/models/base.dart';
import 'package:polymorphic_copywith/polymorphic_copywith.mapper.g.dart';

@MappableClass()
class One extends Base with OneMixin {
  One({
    required super.id,
    required super.name,
    required super.objects,
  });

  @override
  String get model => 'modelOne';
}
