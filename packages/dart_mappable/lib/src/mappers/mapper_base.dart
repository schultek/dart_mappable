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
  bool includeTypeId<V>(dynamic v) => false;

  /// The mapping method to decode [value] to an instance of this mappers type.
  T decoder(Object value, DecodingContext context) {
    throw MapperException.unsupportedMethod(MapperMethod.decode, type);
  }

  V decodeValue<V>(Object? value,
      [DecodingOptions? options, MapperContainer? container]) {
    if (value == null || (options?.type == null && value is V)) {
      return value as V;
    }
    var type = options?.type ?? V;
    try {
      return decoder(
        value,
        DecodingContext(
          container: container,
          args: type.args,
          options: options,
        ),
      ) as V;
    } catch (e, stacktrace) {
      Error.throwWithStackTrace(
        MapperException.chain(MapperMethod.decode, '($type)', e),
        stacktrace,
      );
    }
  }

  Object? encodeValue<V>(T value,
      [EncodingOptions? options, MapperContainer? container]) {
    try {
      Type type = V;

      var includeTypeId = options?.includeTypeId;
      includeTypeId ??= this.includeTypeId<V>(value);

      if (includeTypeId) {
        type = value.runtimeType;
      }

      var typeArgs = type.args.map((t) => t == UnresolvedType ? dynamic : t);

      var fallback = this.type.base.args;
      if (typeArgs.length != fallback.length) {
        typeArgs = fallback;
      }

      var result = this.encoder(
        value,
        EncodingContext(
          container: container,
          options: options?.inheritOptions ?? false ? options : null,
          args: typeArgs.toList(),
        ),
      );

      if (includeTypeId && result is Map<String, dynamic>) {
        result['__type'] = value.runtimeType.id;
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

  /// The mapping method to calculate the hash of [value].
  int hash(T value, MappingContext context) {
    throw MapperException.unsupportedMethod(MapperMethod.hash, type);
  }

  /// The mapping method to get the string representation of [value].
  String stringify(T value, MappingContext context) {
    throw MapperException.unsupportedMethod(MapperMethod.stringify, type);
  }

  /// Checks if the static type [V] matches the dynamic runtime type of [v].
  ///
  /// Returns `true` if types are different and resolvable.
  static bool checkStaticType<V>(dynamic v) {
    return v.runtimeType != V.nonNull && v.runtimeType.base != UnresolvedType;
  }

  /// Registers an additional type [T] to be identifiable by the package.
  static void addType<T>() {
    TypePlus.add<T>();
  }
}
