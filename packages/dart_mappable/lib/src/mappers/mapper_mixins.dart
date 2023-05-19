import 'package:collection/collection.dart';

import '../mapper_container.dart';
import 'mapper_base.dart';
import 'mapping_context.dart';

/// Overrides for mapper methods based on the primitive implementations
/// of [operator ==], [hashCode] and [toString].
mixin PrimitiveMethodsMixin<T extends Object> implements MapperBase<T> {
  @override
  bool equals(T value, T other, MappingContext context) => value == other;
  @override
  int hash(T value, MappingContext context) => value.hashCode;
  @override
  String stringify(T value, MappingContext context) => value.toString();
}

/// Overrides for mapper methods using a collection [Equality].
mixin MapperEqualityMixin<T extends Object> implements MapperBase<T> {
  Equality equality(Equality child);

  @override
  bool equals(T value, T other, MappingContext context) =>
      equality(MapperEquality(context.container)).equals(value, other);
  @override
  int hash(T value, MappingContext context) =>
      equality(MapperEquality(context.container)).hash(value);
}

/// An [Equality] using a [MapperContainer] for its implementation.
class MapperEquality implements Equality {
  MapperEquality(this.container);

  final MapperContainer container;

  @override
  bool equals(dynamic e1, dynamic e2) => container.isEqual(e1, e2);
  @override
  int hash(dynamic e) => container.hash(e);
  @override
  bool isValidKey(Object? o) => true;
}
