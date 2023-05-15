class _None {
  const _None();
}

/// {@nodoc}
const $none = _None();

/// {@nodoc}
T $identity<T>(T value) => value;

/// {@nodoc}
T $cast<T>(Object value) => value as T;

/// {@nodoc}
typedef Then<$T, $R> = $R Function($T);

/// {@category Copy-With}
abstract class ObjectCopyWith<Result, In, Out> {
  const factory ObjectCopyWith(
      In value, Then<In, Out> then, Then<Out, Result> then2) = CopyWithBase;

  Result $update(Out Function(In) transform);
}

/// {@category Copy-With}
class CopyWithBase<Result, In, Out> implements ObjectCopyWith<Result, In, Out> {
  const CopyWithBase(this.$value, this.$then1, this.$then2);

  final In $value;
  final Then<In, Out> $then1;
  final Then<Out, Result> $then2;

  T or<T>(Object? v, T t) => v == $none ? t : v as T;

  $C as<$C>($C Function(In, Then<In, Out>, Then<Out, Result>) copy) =>
      copy($value, $then1, $then2);

  Result $then(In value) => $then2($then1(value));

  /// Applies any transformer function on the value
  @override
  Result $update(Then<In, Out> transform) => $then2(transform($value));
}

/// {@nodoc}
extension ChainedCopyWith<Result, In, Out> on ObjectCopyWith<Result, In, Out> {
  CopyWithBase<Result, In, Out> get $base =>
      this as CopyWithBase<Result, In, Out>;
}
