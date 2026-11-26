import 'package:type_plus/type_plus.dart';

import '../mapper_container.dart';
import '../mapper_exception.dart';
import 'mapping_context.dart';

/// The common super class for all mappers.
///
/// Subclasses can choose to override a mapping method.
/// It defaults to throwing unsupported exceptions for all methods.
///
/// {@category Custom Mappers}
abstract class MapperBase<T extends Object> {
  const MapperBase();

  /// A unique id for this type, defaults to the name of the type.
  ///
  /// Override this if you have two types with the same name.
  String get id => T.name;

  /// A type factory is what makes generic types work.
  Function get typeFactory => (f) => f<T>();

  /// A getter for the type of this mapper.
  Type get type => T;

  bool isFor(dynamic v) => v is T;
  bool isForType(Type type) => type.base == T;
  bool includeTypeId<V>(dynamic v) => false;

  /// The mapping method to decode [value] to an instance of this mappers type.
  T decoder(Object value, DecodingContext context) {
    throw MapperException.unsupportedMethod(MapperMethod.decode, type);
  }

  V decodeValue<V>(
    Object? value, [
    DecodingOptions? options,
    MapperContainer? container,
  ]) {
    if (value == null || (options?.type == null && value is V)) {
      return value as V;
    }
    var type = options?.type ?? V;
    try {
      return decoder(
            value,
            DecodingContext(
              container: container,
              args: () => type.args,
              options: options,
            ),
          )
          as V;
    } catch (e, stacktrace) {
      Error.throwWithStackTrace(
        MapperException.chain(MapperMethod.decode, '($type)', e),
        stacktrace,
      );
    }
  }

  Object? encodeValue<V>(
    V value, [
    EncodingOptions? options,
    MapperContainer? container,
  ]) {
    try {
      var includeTypeId = options?.includeTypeId;
      includeTypeId ??= this.includeTypeId<V>(value);

      var result = encoder(
        value as T,
        EncodingContext(
          container: container,
          options: options?.inheritOptions ?? false ? options : null,
          args: () {
            Type type = V;
            if (includeTypeId ?? false) {
              type = value.runtimeType;
            }

            var typeArgs = type.args.map(
              (t) => t == UnresolvedType ? dynamic : t,
            );

            var fallback = this.type.base.args;
            if (typeArgs.length != fallback.length) {
              typeArgs = fallback;
            }
            return typeArgs.toList();
          },
        ),
      );

      if (includeTypeId && result is Map<String, dynamic>) {
        result[MapperContainer.typeIdKey] = value.runtimeType.id;
      }

      return result;
    } catch (e, stacktrace) {
      Error.throwWithStackTrace(
        MapperException.chain(MapperMethod.encode, '(${value.runtimeType})', e),
        stacktrace,
      );
    }
  }

  /// The mapping method to encode [value] to a serializable value.
  Object? encoder(T value, EncodingContext context) {
    throw MapperException.unsupportedMethod(MapperMethod.encode, type);
  }

  /// The mapping method to compare [value] and [other] for equality.
  bool equals(T value, T other, MappingContext context) {
    throw MapperException.unsupportedMethod(MapperMethod.equals, type);
  }

  @Deprecated('Upgrade to dart_mappable_builder >= 4.2.2')
  bool isValueEqual(T value, Object? other, [MapperContainer? container]) {
    return equalsValue(value, other, container);
  }

  bool equalsValue(T value, Object? other, [MapperContainer? container]) {
    if (identical(value, other)) {
      return true;
    }
    try {
      if (!isFor(other)) return false;
      var context = MappingContext(
        container: container,
        args:
            () =>
                value.runtimeType.args
                    .map((t) => t == UnresolvedType ? dynamic : t)
                    .toList(),
      );
      return equals(value, other as T, context);
    } catch (e, stacktrace) {
      Error.throwWithStackTrace(
        MapperException.chain(MapperMethod.equals, '[$value]', e),
        stacktrace,
      );
    }
  }

  /// The mapping method to calculate the hash of [value].
  int hash(T value, MappingContext context) {
    throw MapperException.unsupportedMethod(MapperMethod.hash, type);
  }

  int hashValue(T value, [MapperContainer? container]) {
    try {
      var context = MappingContext(
        container: container,
        args:
            () =>
                value.runtimeType.args
                    .map((t) => t == UnresolvedType ? dynamic : t)
                    .toList(),
      );
      return hash(value, context);
    } catch (e, stacktrace) {
      Error.throwWithStackTrace(
        MapperException.chain(MapperMethod.hash, '[$value]', e),
        stacktrace,
      );
    }
  }

  /// The mapping method to get the string representation of [value].
  String stringify(T value, MappingContext context) {
    throw MapperException.unsupportedMethod(MapperMethod.stringify, type);
  }

  String stringifyValue(T value, [MapperContainer? container]) {
    try {
      var context = MappingContext(
        container: container,
        args:
            () =>
                value.runtimeType.args
                    .map((t) => t == UnresolvedType ? dynamic : t)
                    .toList(),
      );
      return stringify(value, context);
    } catch (e, stacktrace) {
      Error.throwWithStackTrace(
        MapperException.chain(
          MapperMethod.stringify,
          '(Instance of \'${value.runtimeType}\')',
          e,
        ),
        stacktrace,
      );
    }
  }

  /// Checks if the static type [V] matches the dynamic runtime type of [v].
  ///
  /// Returns `true` if types are different (ignoring nullability) and resolvable.
  static bool checkStaticType<V>(dynamic v) {
    // This is optimized to short-circuit when types are equal.
    return v.runtimeType != V && _checkTypesDiff(v.runtimeType, V);
  }

  static bool _checkTypesDiff(Type dynamic, Type static) {
    return dynamic != static.nonNull &&
        dynamic.base != UnresolvedType &&
        (dynamic.base != static.base ||
            dynamic.args.length != static.args.length ||
            dynamic.args.any(
              (t) => _checkTypesDiff(t, static.args[dynamic.args.indexOf(t)]),
            ));
  }

  /// Registers an additional type [T] to be identifiable by the package.
  static void addType<T>([Function? factory]) {
    if (factory != null) {
      return TypePlus.addFactory(factory);
    }
    TypePlus.add<T>();
  }
}
