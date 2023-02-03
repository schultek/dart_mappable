import 'annotations.dart';
import 'mapper_exception.dart';
import 'mapper_container.dart';

/// {@nodoc}
extension GuardedUtils on MapperContainer {
  T $dec<T>(
    dynamic value,
    String key, [
    MappingHook? hook,
  ]) {
    decode(value) {
      if (value != null) {
        return fromValue<T>(value);
      } else if (value is T) {
        return value;
      } else {
        throw MapperException.missingParameter(key);
      }
    }

    return guard(
      MapperMethod.decode,
      '.$key',
      () =>
          hook != null ? hook.wrapDecode(value, decode, this) : decode(value),
    );
  }

  dynamic $enc<T>(T value, String key, [MappingHook? hook]) {
    return guard(
      MapperMethod.encode,
      '.$key',
      () {
        if (hook != null) {
          return hook.wrapEncode(value, toValue<T>, this);
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
  } catch (e, stacktrace) {
    Error.throwWithStackTrace(
      MapperException.chain(method, hint, e),
      stacktrace,
    );
  }
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
