import 'package:type_plus/type_plus.dart';

import 'annotations.dart';
import 'mapper_exception.dart';
import 'mapper_container.dart';

/// {@nodoc}
extension GuardedUtils on MapperContainer {
  T $get<T>(Map<String, dynamic> map, String key, [MappingHook? hooks]) {
    return guard(
      MapperMethod.decode,
      '.$key',
      () => hooks.decode<T>(
        map[key],
        (v) => v == null
            ? throw MapperException.missingParameter(key)
            : fromValue<T>(v),
        this,
      ),
    );
  }

  T? $getOpt<T>(Map<String, dynamic> map, String key, [MappingHook? hooks]) {
    return guard(
      MapperMethod.decode,
      '.$key',
      () => hooks.decode<T?>(
        map[key],
        fromValue<T?>,
        this,
      ),
    );
  }

  T $dec<T>(dynamic value, String key, [MappingHook? hooks]) {
    return guard(
      MapperMethod.decode,
      '.$key',
      () => hooks.decode<T>(value, fromValue<T>, this),
    );
  }

  dynamic $enc<T>(T value, String key, [MappingHook? hooks]) {
    return guard(
      MapperMethod.encode,
      '.$key',
      () => hooks.encode<T>(value, toValue<T>, this),
    );
  }

  Map<String, dynamic> $type<T>(T value) {
    if (value.runtimeType == T) {
      return {};
    } else {
      return {'__type': value.runtimeType.id};
    }
  }

  $sub<T>(dynamic value) {

  }
}

/// {@nodoc}
T guard<T>(MapperMethod method, String hint, T Function() fn) {
  try {
    return fn();
  } catch (e) {
    throw MapperException.chain(method, hint, e);
  }
}

/// {@nodoc}
void clearType(Map<String, dynamic> map) {
  map.removeWhere((key, _) => key == '__type');
  map.values.whereType<Map<String, dynamic>>().forEach(clearType);
  map.values
      .whereType<List>()
      .forEach((l) => l.whereType<Map<String, dynamic>>().forEach(clearType));
}

/// {@nodoc}
T checkedType<T, U>(dynamic v, T Function(U) fn) {
  if (v is U) {
    return fn(v);
  } else {
    throw MapperException.unexpectedType(v.runtimeType, T, U.toString());
  }
}

/// {@nodoc}
extension HooksMapping on MappingHook? {
  T decode<T>(dynamic value, T Function(dynamic value) fn, MapperContainer container) {
    if (this == null) return fn(value);
    return this!.wrapDecode(value, fn, container);
  }

  dynamic encode<T>(T value, dynamic Function(T value) fn, MapperContainer container) {
    if (this == null) return fn(value);
    return this!.wrapEncode(value, fn, container);
  }
}

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
  const factory ObjectCopyWith(In value, Then<In, Out> then, Then<Out, Result> then2) = CopyWithBase;

  Result apply(Out Function(In) transform);
}

/// {@category Copy-With}
class CopyWithBase<Result, In, Out> implements ObjectCopyWith<Result, In, Out> {
  const CopyWithBase(this.$value, this.$then1, this.$then2);

  final In $value;
  final Then<In, Out> $then1;
  final Then<Out, Result> $then2;

  T or<T>(Object? v, T t) => v == $none ? t : v as T;

  $C as<$C>($C Function(In, Then<In, Out>, Then<Out, Result>) copy) => copy($value, $then1, $then2);

  Result $then(In value) => $then2($then1(value));

  /// Applies any transformer function on the value
  @override
  Result apply(Then<In, Out> transform) => $then2(transform($value));
}

/// {@nodoc}
extension ChainedCopyWith<Result, In, Out> on ObjectCopyWith<Result, In, Out> {
  CopyWithBase<Result, In, Out> get base => this as CopyWithBase<Result, In, Out>;
}
