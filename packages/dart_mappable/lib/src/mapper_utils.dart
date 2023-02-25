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
    decode(value) {
      if (value != null) {
        return fromValue<T>(value);
      } else if (value is T) {
        return value;
      } else {
        throw MapperException.missingParameter(key);
      }
    }

    return guard(MapperMethod.decode, '.$key', () {
      return hook != null
          ? hook.wrapDecode(value, decode, this)
          : decode(value);
    });
  }

  dynamic $enc<T>(T value, String key, [MappingHook? hook]) {
    return guard(MapperMethod.encode, '.$key', () {
      if (hook != null) {
        return hook.wrapEncode(value, toValue<T>, this);
      }
      return toValue<T>(value);
    });
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
