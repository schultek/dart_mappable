import 'package:dart_mappable/dart_mappable.dart';
import 'package:polymorphic_copywith/models/abstract_base.dart';
import 'package:polymorphic_copywith/polymorphic_copywith.mapper.g.dart';

@MappableClass()
class Two extends AbstractIdBase with TwoMixin {
  Two({required super.id}) : super(name: 'two');
}
