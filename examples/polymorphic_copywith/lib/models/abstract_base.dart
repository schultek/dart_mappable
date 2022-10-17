import 'package:polymorphic_copywith/polymorphic_copywith.mapper.g.dart';

abstract class AbstractIdBase with Mappable, AbstractIdBaseMixin {
  const AbstractIdBase({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;
}
