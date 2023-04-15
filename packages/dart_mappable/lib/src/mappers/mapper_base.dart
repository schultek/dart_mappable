import 'package:collection/collection.dart';
import 'package:type_plus/type_plus.dart';

import '../mapper_container.dart';
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

  T decoder(Object value, DecodingContext context) =>
      throw MapperException.unsupportedMethod(MapperMethod.decode, type);
  Object? encoder(T value, EncodingContext context) =>
      throw MapperException.unsupportedMethod(MapperMethod.encode, type);

  bool equals(T value, T other, MappingContext context) =>
      throw MapperException.unsupportedMethod(MapperMethod.equals, type);
  int hash(T value, MappingContext context) =>
      throw MapperException.unsupportedMethod(MapperMethod.hash, type);
  String stringify(T value, MappingContext context) =>
      throw MapperException.unsupportedMethod(MapperMethod.stringify, type);

  static void addType<T>() {
    TypePlus.add<T>();
  }
}

typedef Decoder<V extends Object?, T> = T Function(DecodingContext context);

typedef Encoder<R, V extends Object> = R Function(EncodingContext context);

extension MappingOptionsCall<O extends MappingContext> on O {
  R callWith<R, U>(Function fn, U value) {
    if (args.isEmpty) {
      return fn(value) as R;
    } else if (args.length == 1) {
      return args.first.provideTo(<A>() => fn<A>(value) as R);
    } else if (args.length == 2) {
      return args.first
          .provideTo(<A>() => args[1].provideTo(<B>() => fn<A, B>(value) as R));
    } else if (args.length == 3) {
      return args.first.provideTo(<A>() => args[1].provideTo(
          <B>() => args[2].provideTo(<C>() => fn<A, B, C>(value) as R)));
    } else {
      throw AssertionError('Max args are 3');
    }
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

class MappingContext {
  final List<Type> args;
  final MapperContainer container;

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

class DecodingContext extends MappingContext {
  final bool inherited;

  DecodingContext({super.container, super.args, this.inherited = false});

  DecodingContext inherit({MapperContainer? container, List<Type>? args}) {
    return DecodingContext(
      container: container ?? this.container,
      args: args ?? this.args,
      inherited: true,
    );
  }
}

class EncodingContext extends MappingContext {
  EncodingContext({super.container, this.options, super.args});

  final EncodingOptions? options;
}

typedef TypeFactory0 = Object? Function(Object? Function<V>() f);
typedef TypeFactory1 = Object? Function<A>(Object? Function<V>() f);
typedef TypeFactory2 = Object? Function<A, B>(Object? Function<V>() f);
