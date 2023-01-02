
import 'package:collection/collection.dart';

import 'mapper_base.dart';
import 'mapper_container.dart';

mixin MapperAs<B extends MapperBase<T>, T> on MapperElementBase<T> {
  @override
  B get mapper => super.mapper as B;
}

mixin PrimitiveMethodsMixin<T> implements MapperElementBase<T> {
  @override
  bool equals(T self, T other) => self == other;
  @override
  int hash(T self) => self.hashCode;
  @override
  String stringify(T self) => self.toString();
}

mixin MapperEqualityMixin<T> implements MapperElementBase<T> {
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
