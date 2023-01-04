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
