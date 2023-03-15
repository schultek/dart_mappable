import 'package:collection/collection.dart';

import '../mapper_container.dart';
import 'mapper_base.dart';

mixin PrimitiveMethodsMixin<T extends Object> implements MapperBase<T> {
  @override
  bool equals(T value, T other, MappingContext context) => value == other;
  @override
  int hash(T value, MappingContext context) => value.hashCode;
  @override
  String stringify(T value, MappingContext context) => value.toString();
}

mixin MapperEqualityMixin<T extends Object> implements MapperBase<T> {
  Equality equality(Equality child);

  @override
  bool equals(T value, T other, MappingContext context) =>
      equality(MapperEquality(context.container)).equals(value, other);
  @override
  int hash(T value, MappingContext context) =>
      equality(MapperEquality(context.container)).hash(value);
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
