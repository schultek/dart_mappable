import 'package:collection/collection.dart';

import 'mapper_base.dart';
import '../mapper_container.dart';

mixin PrimitiveMethodsMixin<M extends MapperBase<T>, T extends Object> implements MapperElementBase<M, T> {
  @override
  bool equals(T self, T other) => self == other;
  @override
  int hash(T self) => self.hashCode;
  @override
  String stringify(T self) => self.toString();
}

mixin MapperEqualityMixin<M extends MapperBase<T>, T extends Object> implements MapperElementBase<M, T> {
  Equality get equality;

  @override
  bool equals(T self, T other) => equality.equals(self, other);
  @override
  int hash(T self) => equality.hash(self);
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
