import 'package:collection/collection.dart';

import 'mapper_base.dart';
import '../mapper_container.dart';

mixin PrimitiveMethodsMixin<T extends Object> implements MapperBase<T> {
  @override
  bool equals(MappingOptions<Object> options, T other) => options.value == other;
  @override
  int hash(MappingOptions<Object> options) => options.value.hashCode;
  @override
  String stringify(MappingOptions<Object> options) => options.value.toString();
}

mixin MapperEqualityMixin<T extends Object> implements MapperBase<T> {
  Equality equality(Equality child);

  @override
  bool equals(MappingOptions<Object> options, T other) => equality(MapperEquality(options.container)).equals(options.value, other);
  @override
  int hash(MappingOptions<Object> options) => equality(MapperEquality(options.container)).hash(options.value);
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
