import 'annotations.dart';
import 'mapper_exception.dart';
import 'mapper_container.dart';

/// {@nodoc}
extension GuardedUtils on MapperContainer {
  T $get<T>(Map<String, dynamic> map, String key, [MappingHook? hooks]) {
    return $dec(map[key], key, hooks, (v) {
      if (v == null) {
        try {
          return v as T;
        } on TypeError catch (_) {
          throw MapperException.missingParameter(key);
        }
      }
      return fromValue<T>(v);
    });
  }

  T? $getOpt<T>(Map<String, dynamic> map, String key, [MappingHook? hooks]) {
    return $dec(map[key], key, hooks);
  }

  T $dec<T>(
    dynamic value,
    String key, [
    MappingHook? hooks,
    T Function(dynamic)? decoder,
  ]) {
    decoder ??= fromValue<T>;
    return guard(
      MapperMethod.decode,
      '.$key',
      () => hooks != null
          ? hooks.wrapDecode(value, decoder!, this)
          : decoder!(value),
    );
  }

  dynamic $enc<T>(T value, String key, [MappingHook? hooks]) {
    return guard(
      MapperMethod.encode,
      '.$key',
      () {
        if (hooks != null) {
          return hooks.wrapEncode(value, toValue<T>, this);
        }
        return toValue<T>(value);
      },
    );
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
  T decode<T>(
      dynamic value, T Function(dynamic value) fn, MapperContainer container) {
    if (this == null) return fn(value);
    return this!.wrapDecode(value, fn, container);
  }

  dynamic encode<T>(
      T value, dynamic Function(T value) fn, MapperContainer container) {
    if (this == null) return fn(value);
    return this!.wrapEncode(value, fn, container);
  }
}
