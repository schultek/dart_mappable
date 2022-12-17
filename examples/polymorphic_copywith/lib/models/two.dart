import 'package:dart_mappable/dart_mappable.dart';
import 'package:polymorphic_copywith/models/abstract_base.dart';

part 'two.mapper.dart';

@MappableClass()
class Two extends AbstractIdBase with TwoMappable {
  Two({required super.id}) : super(name: 'two');
}
