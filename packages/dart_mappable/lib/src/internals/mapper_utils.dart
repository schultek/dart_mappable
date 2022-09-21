import '../core/annotations.dart';
import '../core/mapper_exception.dart';
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
      ),
    );
  }

  T? $getOpt<T>(Map<String, dynamic> map, String key, [MappingHooks? hooks]) {
    return guard(
      MapperMethod.decode,
      '.$key',
      () => hooks.decode<T?>(
        map[key],
        (v) => v == null ? null : fromValue<T>(v),
      ),
    );
  }

  T $dec<T>(dynamic value, String key, [MappingHooks? hooks]) {
    return guard(
      MapperMethod.decode,
      '.$key',
      () => hooks.decode<T>(value, fromValue),
    );
  }

  dynamic $enc<T>(T value, String key, [MappingHooks? hooks]) {
    return guard(
      MapperMethod.encode,
      '.$key',
      () => hooks.encode<T>(value, toValue),
    );
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

T checked<T, U>(dynamic v, T Function(U) fn) {
  if (v is U) {
    return fn(v);
  } else {
    throw MapperException.unexpectedType(v.runtimeType, T, U.toString());
  }
}

extension HooksMapping on MappingHooks? {
  T decode<T>(dynamic value, T Function(dynamic value) fn) {
    if (this == null) return fn(value);
    var v = this!.beforeDecode(value);
    if (v is! T) v = fn(v);
    return this!.afterDecode(v) as T;
  }

  dynamic encode<T>(T value, dynamic Function(T value) fn) {
    if (this == null) return fn(value);
    var v = this!.beforeEncode(value);
    if (v is T) v = fn(v);
    return this!.afterEncode(v);
  }
}

extension NullIterable<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}

class _None {
  const _None();
}

const $none = _None();

T $identity<T>(T value) => value;
typedef Then<$T, $R> = $R Function($T);


class BaseCopyWith<$T, $R> {
  BaseCopyWith(this.$value, this.$then);

  final $T $value;
  final Then<$T, $R> $then;

  T or<T>(Object? v, T t) => v == $none ? t : v as T;

  /// Applies any transformer function on the value
  $R apply($T Function($T) transform) => $then(transform($value));
}

abstract class MappableMixin {}
