import 'package:polymorphic_copywith/polymorphic_copywith.mapper.g.dart';

abstract class AbstractIdBase {
  const AbstractIdBase({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;
}
