import 'package:dart_mappable/dart_mappable.dart';
import 'package:polymorphic_copywith/models/abstract_base.dart';

part 'base.mapper.dart';

@MappableClass()
abstract class Base extends AbstractIdBase with BaseMappable {
  /// Template for macro device specifications
  const Base({
    required super.id,
    required super.name,
    required this.objects,
  });

  String get model;

  final Map<String, dynamic> objects;
}
