import 'package:type_plus/type_plus.dart';

import 'annotations.dart';
import 'mapper_exception.dart';
import 'mapper_container.dart';

extension GuardedUtils on MapperContainer {
  T $get<T>(Map<String, dynamic> map, String key, [MappingHooks? hooks]) {
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

  T? $getOpt<T>(Map<String, dynamic> map, String key, [MappingHooks? hooks]) {
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

  T $dec<T>(dynamic value, String key, [MappingHooks? hooks]) {
    return guard(
      MapperMethod.decode,
      '.$key',
      () => hooks.decode<T>(value, fromValue<T>, this),
    );
  }

  dynamic $enc<T>(T value, String key, [MappingHooks? hooks]) {
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

T guard<T>(MapperMethod method, String hint, T Function() fn) {
  try {
    return fn();
  } catch (e) {
    throw MapperException.chain(method, hint, e);
  }
}

void clearType(Map<String, dynamic> map) {
  map.removeWhere((key, _) => key == '__type');
  map.values.whereType<Map<String, dynamic>>().forEach(clearType);
  map.values
      .whereType<List>()
      .forEach((l) => l.whereType<Map<String, dynamic>>().forEach(clearType));
}

T checkedType<T, U>(dynamic v, T Function(U) fn) {
  if (v is U) {
    return fn(v);
  } else {
    throw MapperException.unexpectedType(v.runtimeType, T, U.toString());
  }
}

extension HooksMapping on MappingHooks? {
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

const $none = _None();

T $identity<T>(T value) => value;
T $cast<T>(Object value) => value as T;
typedef Then<$T, $R> = $R Function($T);

abstract class ObjectCopyWith<Result, In, Out> {
  const factory ObjectCopyWith(In value, Then<In, Out> then, Then<Out, Result> then2) = CopyWithBase;

  Result apply(Out Function(In) transform);
}

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

extension ChainedCopyWith<Result, In, Out> on ObjectCopyWith<Result, In, Out> {
  CopyWithBase<Result, In, Out> get base => this as CopyWithBase<Result, In, Out>;
}
