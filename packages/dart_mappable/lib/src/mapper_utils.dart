import 'annotations.dart';
import 'mapper_container.dart';
import 'mapper_exception.dart';

/// {@nodoc}
extension GuardedUtils on MapperContainer {
  T $dec<T>(
    Object? value,
    String key, [
    MappingHook? hook,
  ]) {
    T decode(value) {
      if (value != null) {
        return fromValue<T>(value);
      } else if (value is T) {
        return value;
      } else {
        throw MapperException.missingParameter(key);
      }
    }

    try {
      if (hook != null) {
        return hook.wrapDecode(value, decode);
      }
      return decode(value);
    } catch (e, stacktrace) {
      Error.throwWithStackTrace(
        MapperException.chain(MapperMethod.decode, '.$key', e),
        stacktrace,
      );
    }
  }

  dynamic $enc<T>(T value, String key,
      [EncodingOptions? options, MappingHook? hook]) {
    dynamic encode(T value) {
      return toValue<T>(value, options);
    }

    try {
      if (hook != null) {
        return hook.wrapEncode(value, encode);
      }
      return encode(value);
    } catch (e, stacktrace) {
      Error.throwWithStackTrace(
        MapperException.chain(MapperMethod.encode, '.$key', e),
        stacktrace,
      );
    }
  }
}

extension on MappingHook {
  T wrapDecode<T>(Object? value, T Function(Object? value) fn) {
    var v = beforeDecode(value);
    if (v is! T) v = fn(v);
    return afterDecode(v) as T;
  }

  Object? wrapEncode<T>(T value, Object? Function(T value) fn) {
    var v = beforeEncode(value);
    if (v is T) v = fn(v);
    return afterEncode(v);
  }
}

extension TypeCheck<T> on T {
  V checked<V extends Object?>() {
    if (this is V) {
      return this as V;
    } else {
      throw MapperException.unexpectedType(runtimeType, V.toString());
    }
  }
}
