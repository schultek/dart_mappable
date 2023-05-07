import 'package:collection/collection.dart';
import 'package:type_plus/type_plus.dart';

import '../mapper_container.dart';
import '../mapper_exception.dart';

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

/// The mapping context passed to all mapping methods of a mapper.
class MappingContext {
  /// The container that is used for this mapping call.
  final MapperContainer container;

  /// A list of type arguments to get the concrete type for a generic mapper.
  final List<Type> args;

  MappingContext({MapperContainer? container, this.args = const []})
      : container = container ?? MapperContainer.globals;

  Type arg(int index, [List<int> argIndices = const []]) {
    var a = args[index];
    if (argIndices.isNotEmpty) {
      a = argIndices.fold(a, (a, i) => a.args.elementAtOrNull(i) ?? dynamic);
    }
    return a;
  }
}

/// The decoding context passed to the [decoder] method of a mapper.
class DecodingContext extends MappingContext {
  DecodingContext(
      {super.container, super.args, this.options, this.inherited = false});

  final DecodingOptions? options;
  final bool inherited;

  DecodingContext inherit({MapperContainer? container, List<Type>? args}) {
    return DecodingContext(
      container: container ?? this.container,
      args: args ?? this.args,
      options: options,
      inherited: true,
    );
  }
}

/// The encoding context passed to the [encoder] method of a mapper.
class EncodingContext extends MappingContext {
  EncodingContext({super.container, this.options, super.args});

  final EncodingOptions? options;
}

/// Utility methods to call a generic function with the type argument of the
/// mapping context.
extension MappingContextCall<O extends MappingContext> on O {
  R callWith<R, U>(Function fn, U value) {
    return fn.callWith(parameters: [value], typeArguments: args) as R;
  }

  R callWith1<R, U>(R Function<A>(U) fn, [U? value]) {
    assert(args.length == 1);
    return args.first.provideTo(<A>() => fn<A>(value as U));
  }

  R callWith2<R, U>(R Function<A, B>(U) fn, [U? value]) {
    assert(args.length == 2);
    return args.first
        .provideTo(<A>() => args[1].provideTo(<B>() => fn<A, B>(value as U)));
  }

  R callWith3<R, U>(R Function<A, B, C>(U) fn, [U? value]) {
    assert(args.length == 3);
    return args.first.provideTo(<A>() => args[1].provideTo(
        <B>() => args[2].provideTo(<C>() => fn<A, B, C>(value as U))));
  }
}
