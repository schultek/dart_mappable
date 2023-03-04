import 'package:collection/collection.dart';

import '../internals/mapping_context.dart';
import '../mapper_container.dart';
import 'mapper_base.dart';

mixin PrimitiveMethodsMixin<T extends Object> implements MapperBase<T> {
  @override
  bool equals(MappingContext<Object> context, T other) =>
      context.value == other;
  @override
  int hash(MappingContext<Object> context) => context.value.hashCode;
  @override
  String stringify(MappingContext<Object> context) => context.value.toString();
}

mixin MapperEqualityMixin<T extends Object> implements MapperBase<T> {
  Equality equality(Equality child);

  @override
  bool equals(MappingContext<Object> context, T other) =>
      equality(MapperEquality(context.container)).equals(context.value, other);
  @override
  int hash(MappingContext<Object> context) =>
      equality(MapperEquality(context.container)).hash(context.value);
}

class MapperEquality implements Equality {
  final MapperContainer mapper;
  MapperEquality(this.mapper);

  @override
  bool equals(dynamic e1, dynamic e2) => mapper.isEqual(e1, e2);
  @override
  int hash(dynamic e) => mapper.hash(e);
  @override
  bool isValidKey(Object? o) => true;
}
