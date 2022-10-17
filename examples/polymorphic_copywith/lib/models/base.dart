import 'package:dart_mappable/dart_mappable.dart';
import 'package:polymorphic_copywith/models/abstract_base.dart';
import 'package:polymorphic_copywith/polymorphic_copywith.mapper.g.dart';

@MappableClass()
abstract class Base extends AbstractIdBase with BaseMixin {
  /// Template for macro device specifications
  const Base({
    required super.id,
    required super.name,
    required this.objects,
  });

  String get model;

  final Map<String, dynamic> objects;
}
