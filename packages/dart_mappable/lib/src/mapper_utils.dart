import 'annotations.dart';
import 'mapper_container.dart';
import 'mapper_exception.dart';
import 'mappers/mapping_context.dart';

extension DecodingUtil on DecodingContext {
  T $dec<T>(
    Object? value,
    String key, [
    MappingHook? hook,
    DecodingOptions? options,
  ]) {
    try {
      if (hook != null) {
        value = hook.beforeDecode(value);
      }

      if (value == null && value is! T) {
        throw MapperException.missingParameter(key);
      }

      value = container.fromValue<T>(value, options);

      if (hook != null) {
        value = hook.afterDecode(value);
      }

      return value as T;
    } catch (e, stacktrace) {
      Error.throwWithStackTrace(
        MapperException.chain(MapperMethod.decode, '.$key', e),
        stacktrace,
      );
    }
  }
}

extension EncodingUtil on EncodingContext {
  dynamic $enc<T>(
    Object? value,
    String key, [
    EncodingOptions? options,
    MappingHook? hook,
  ]) {
    try {
      if (hook != null) {
        value = hook.beforeEncode(value);
      }
      if (value != null && value is T) {
        value = container.toValue<T>(value as T, options);
      }
      if (hook != null) {
        value = hook.afterEncode(value);
      }
      return value;
    } catch (e, stacktrace) {
      Error.throwWithStackTrace(
        MapperException.chain(MapperMethod.encode, '.$key', e),
        stacktrace,
      );
    }
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
