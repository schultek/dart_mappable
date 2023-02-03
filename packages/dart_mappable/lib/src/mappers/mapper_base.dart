import 'package:type_plus/type_plus.dart';

import '../annotations.dart';
import '../mapper_container.dart';
import '../mapper_exception.dart';

/// {@category Custom Mappers}
abstract class MapperBase<T extends Object> {
  const MapperBase();

  /// A unique id for this type, defaults to the name of the type.
  /// Override this if you have two types with the same name.
  String get id => T.name;

  /// A type factory is what makes generic types work.
  Function get typeFactory => (f) => f<T>();

  Type get type => T;

  /// Optional type of the implementations of [T] used for decoding.
  Type get implType => type;

  bool isFor(dynamic v) => v is T;

  MapperElementBase<MapperBase<T>, T> createElement(MapperContainer container);
}

/// This class needs to be implemented by all mappers.
/// It defaults to throwing unsupported exceptions for all methods.
///
/// {@category Custom Mappers}
abstract class MapperElementBase<M extends MapperBase<T>, T extends Object>
    implements MapperContext<M, T> {
  const MapperElementBase(this.mapper, this.container);

  @override
  final M mapper;
  @override
  final MapperContainer container;

  T decoder(DecodingOptions<Object> options) =>
      throw MapperException.unsupportedMethod(MapperMethod.decode, mapper.type);
  Object? encoder(EncodingOptions<Object> options) =>
      throw MapperException.unsupportedMethod(MapperMethod.encode, mapper.type);

  bool equals(T self, T other) =>
      throw MapperException.unsupportedMethod(MapperMethod.equals, mapper.type);
  int hash(T self) =>
      throw MapperException.unsupportedMethod(MapperMethod.hash, mapper.type);
  String stringify(T self) => throw MapperException.unsupportedMethod(
      MapperMethod.stringify, mapper.type);
}

abstract class MapperContext<M extends MapperBase<T>, T extends Object> {
  M get mapper;
  MapperContainer get container;
}

typedef Decoder<V extends Object?, M extends MapperBase<T>, T extends Object>
    = T Function(DecodingContext<V, M, T> options);

typedef Encoder<R, V extends Object, M extends MapperBase<T>, T extends Object>
    = R Function(EncodingContext<V, M, T> options);

extension MappingOptionsCall<O extends MappingOptions> on O {
  R call1<R>(R Function<A>(O) fn) {
    return callWith1(fn, _$identity);
  }

  R call2<R>(R Function<A, B>(O) fn) {
    return callWith2(fn, _$identity);
  }

  R call3<R>(R Function<A, B, C>(O) fn) {
    return callWith3(fn, _$identity);
  }

  R callWith<R, U>(Function fn, U value) {
    if (args.isEmpty) {
      return fn(value) as R;
    } else if (args.length == 1) {
      return args.first.provideTo(<A>() => fn<A>(value) as R);
    } else if (args.length == 2) {
      return args.first
          .provideTo(<A>() => args[1].provideTo(<B>() => fn<A, B>(value) as R));
    } else if (args.length == 3) {
      return args.first.provideTo(<A>() => args[1]
          .provideTo(<B>() => args[2].provideTo(<C>() => fn<A, B, C>(value) as R)));
    } else {
      throw AssertionError('Max args are 3');
    }
  }

  R callWith1<R, U>(R Function<A>(U) fn, U Function(O) cb) {
    assert(args.length == 1);
    return args.first.provideTo(<A>() => fn<A>(cb(this)));
  }

  R callWith2<R, U>(R Function<A, B>(U) fn, U Function(O) cb) {
    assert(args.length == 2);
    return args.first
        .provideTo(<A>() => args[1].provideTo(<B>() => fn<A, B>(cb(this))));
  }

  R callWith3<R, U>(R Function<A, B, C>(U) fn, U Function(O) cb) {
    assert(args.length == 3);
    return args.first.provideTo(<A>() => args[1]
        .provideTo(<B>() => args[2].provideTo(<C>() => fn<A, B, C>(cb(this)))));
  }

  T _$identity<T>(T value) => value;
}

abstract class MappingOptions<V extends Object?> {
  final V value;
  final List<Type> args;

  MappingOptions(this.value, {this.args = const []});
}

class DecodingOptions<V extends Object?> extends MappingOptions<V> {
  final bool inherited;

  DecodingOptions(super.value, {super.args, this.inherited = false});

  DecodingContext<V, $M, $T>
      apply<$M extends MapperBase<$T>, $T extends Object>(
          MapperContext<$M, $T> context) {
    return DecodingContext(value,
        context: context, args: args, inherited: inherited);
  }
}

class EncodingOptions<V extends Object?> extends MappingOptions<V> {
  EncodingOptions(super.value, {super.args});

  EncodingContext<V, $M, $T>
      apply<$M extends MapperBase<$T>, $T extends Object>(
          MapperContext<$M, $T> context) {
    return EncodingContext(value, context: context, args: args);
  }
}

class DecodingContext<V extends Object?, M extends MapperBase<T>,
    T extends Object> extends DecodingOptions<V> {
  final MapperContext<M, T> context;

  DecodingContext(super.value,
      {required this.context, super.args, super.inherited});

  DecodingContext<V, M, T> inherit() {
    return DecodingContext<V, M, T>(value,
        context: context, args: args, inherited: true);
  }

  T wrap(Decoder<Object?, M, T> decoder,
      {MappingHook? hook, bool skipInherited = false}) {
    if (hook == null || (inherited && skipInherited)) {
      return decoder(this);
    } else {
      return hook.wrapDecoder<M, T>(this, decoder);
    }
  }

  DecodingContext<U, M, T> checked<U extends Object?>() {
    if (value is U) {
      return change<U>(value as U);
    } else {
      throw MapperException.unexpectedType(value.runtimeType, V, U.toString());
    }
  }

  DecodingContext<$V, M, T> change<$V extends Object?>($V value) {
    if (identical(value, this.value) && $V == V) {
      return this as DecodingContext<$V, M, T>;
    }
    return DecodingContext<$V, M, T>(value,
        context: context, args: args, inherited: inherited);
  }
}

class EncodingContext<V extends Object?, M extends MapperBase<T>,
    T extends Object> extends EncodingOptions<V> {
  final MapperContext<M, T> context;

  EncodingContext(super.value, {required this.context, super.args});

  EncodingContext<U, M, T> checked<U extends Object?>() {
    if (value is U) {
      return change<U>(value as U);
    } else {
      throw MapperException.unexpectedType(value.runtimeType, V, U.toString());
    }
  }

  EncodingContext<$V, M, T> change<$V extends Object?>($V value) {
    if (identical(value, this.value) && $V == V) {
      return this as EncodingContext<$V, M, T>;
    }
    return EncodingContext<$V, M, T>(value, context: context, args: args);
  }
}

extension EncodingContextWrap<T extends Object, M extends MapperBase<T>>
    on EncodingContext<T, M, T> {
  Object? wrap(Encoder<Object?, T, M, T> encoder, {MappingHook? hook}) {
    if (hook == null) {
      return encoder(this);
    } else {
      return hook.wrapEncoder<M, T>(this, encoder);
    }
  }
}

typedef TypeFactory0 = Object? Function(Object? Function<V>() f);
typedef TypeFactory1 = Object? Function<A>(Object? Function<V>() f);
typedef TypeFactory2 = Object? Function<A, B>(Object? Function<V>() f);
