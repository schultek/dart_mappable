import 'package:type_plus/type_plus.dart';

import '../internals/mapping_context.dart';
import '../mapper_exception.dart';

/// The common super class for all mappers.
/// It defaults to throwing unsupported exceptions for all methods.
///
/// {@category Custom Mappers}
abstract class MapperBase<T extends Object> {
  const MapperBase();

  /// A unique id for this type, defaults to the name of the type.
  /// Override this if you have two types with the same name.
  String get id => T.name;

  /// A type factory is what makes generic types work.
  Function get typeFactory => (f) => f<T>();

  Type get type => T;

  bool isFor(dynamic v) => v is T;
  bool includeTypeId<V>(dynamic v) => false;

  static bool matchesStaticType<V>(dynamic v) {
    return v.runtimeType != V.nonNull && v.runtimeType.base != UnresolvedType;
  }

  T decoder(DecodingContext<Object> context) =>
      throw MapperException.unsupportedMethod(MapperMethod.decode, type);
  Object? encoder(EncodingContext<Object> context) =>
      throw MapperException.unsupportedMethod(MapperMethod.encode, type);

  bool equals(MappingContext<Object> context, T other) =>
      throw MapperException.unsupportedMethod(MapperMethod.equals, type);
  int hash(MappingContext<Object> context) =>
      throw MapperException.unsupportedMethod(MapperMethod.hash, type);
  String stringify(MappingContext<Object> context) =>
      throw MapperException.unsupportedMethod(MapperMethod.stringify, type);

  static void addType<T>() {
    TypePlus.add<T>();
  }
}
