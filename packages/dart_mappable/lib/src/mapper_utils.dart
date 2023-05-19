import 'dart:collection';

import 'package:type_plus/type_plus.dart';

import 'annotations.dart';
import 'mapper_container.dart';
import 'mapper_exception.dart';
import 'mappers/mapper_base.dart';
import 'mappers/mapping_context.dart';

/// {@nodoc}
extension DecodingUtil on DecodingContext {
  T $dec<T>(
    Object? value,
    String key, [
    MappingHook? hook,
    MapperBase? mapper,
  ]) {
    try {
      if (hook != null) {
        value = hook.beforeDecode(value);
      }

      if (value is! T) {
        if (value != null) {
          if (mapper != null) {
            value = mapper.decodeValue<T>(value);
          }
          value = container.fromValue<T>(value);
        } else {
          throw MapperException.missingParameter(key);
        }
      }

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

/// {@nodoc}
extension EncodingUtil on EncodingContext {
  dynamic $enc<T>(
    Object? value,
    String key, [
    EncodingOptions? options,
    MappingHook? hook,
    MapperBase? mapper,
  ]) {
    try {
      if (hook != null) {
        value = hook.beforeEncode(value);
      }
      if (value != null && value is T) {
        if (mapper != null) {
          value = mapper.encodeValue<T>(value as T, options);
        } else {
          value = container.toValue<T>(value as T, options);
        }
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

class LazyList<T> with ListMixin<T> {
  LazyList(this.create);

  final Iterable<T> Function() create;

  late final List<T> _list = create().toList();

  @override
  int get length => _list.length;
  @override
  set length(int newLength) => _list.length = newLength;

  @override
  T operator [](int index) => _list[index];

  @override
  void operator []=(int index, T value) => _list[index] = value;
}

extension MapperUtils<T extends Object> on MapperBase<T> {
  bool isValueEqual(T? value, Object? other, [MapperContainer? container]) {
    if (value == null) {
      return other == null;
    }
    try {
      if (!isFor(other)) return false;
      var context = MappingContext(
        container: container,
        args: LazyList(() => value.runtimeType.args
            .map((t) => t == UnresolvedType ? dynamic : t)),
      );
      return equals(value, other as T, context);
    } catch (e, stacktrace) {
      Error.throwWithStackTrace(
        MapperException.chain(MapperMethod.equals, '[$value]', e),
        stacktrace,
      );
    }
  }

  int hashValue(T? value, [MapperContainer? container]) {
    if (value == null) {
      return value.hashCode;
    }
    try {
      var context = MappingContext(
        container: container,
        args: LazyList(() => value.runtimeType.args
            .map((t) => t == UnresolvedType ? dynamic : t)),
      );
      return hash(value, context);
    } catch (e, stacktrace) {
      Error.throwWithStackTrace(
        MapperException.chain(MapperMethod.hash, '[$value]', e),
        stacktrace,
      );
    }
  }

  String stringifyValue(T? value, [MapperContainer? container]) {
    if (value == null) {
      return value.toString();
    }
    try {
      var context = MappingContext(
        container: container,
        args: LazyList(() => value.runtimeType.args
            .map((t) => t == UnresolvedType ? dynamic : t)),
      );
      return stringify(value, context);
    } catch (e, stacktrace) {
      Error.throwWithStackTrace(
        MapperException.chain(MapperMethod.stringify,
            '(Instance of \'${value.runtimeType}\')', e),
        stacktrace,
      );
    }
  }
}
