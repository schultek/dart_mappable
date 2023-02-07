import 'package:type_plus/type_plus.dart';

import '../annotations.dart';
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

  /// Optional type of the implementations of [T] used for decoding.
  Type get implType => type;

  bool isFor(dynamic v) => v is T;

  T decoder(DecodingOptions<Object> options) =>
      throw MapperException.unsupportedMethod(MapperMethod.decode, type);
  Object? encoder(EncodingOptions<Object> options) =>
      throw MapperException.unsupportedMethod(MapperMethod.encode, type);

  bool equals(MappingOptions<Object> options, T other) =>
      throw MapperException.unsupportedMethod(MapperMethod.equals, type);
  int hash(MappingOptions<Object> options) =>
      throw MapperException.unsupportedMethod(MapperMethod.hash, type);
  String stringify(MappingOptions<Object> options) =>
      throw MapperException.unsupportedMethod(MapperMethod.stringify, type);

  static void addType<T>() {
    TypePlus.add<T>();
  }
}

typedef Decoder<V extends Object?, T> = T Function(DecodingOptions<V> options);

typedef Encoder<R, V extends Object> = R Function(EncodingOptions<V> options);

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
      return args.first.provideTo(<A>() => args[1].provideTo(
          <B>() => args[2].provideTo(<C>() => fn<A, B, C>(value) as R)));
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

class MappingOptions<V extends Object?> {
  final V value;
  final List<Type> args;
  final MapperContainer container;

  MappingOptions(this.value, {MapperContainer? container, this.args = const []})
  : container = container ?? MapperContainer.globals;

  MappingOptions<U> checked<U extends Object?>() {
    if (value is U) {
      return change<U>(value as U);
    } else {
      throw MapperException.unexpectedType(value.runtimeType, V, U.toString());
    }
  }

  MappingOptions<$V> change<$V extends Object?>($V value) {
    if (identical(value, this.value) && $V == V) {
      return this as EncodingOptions<$V>;
    }
    return MappingOptions<$V>(value, container: container, args: args);
  }
}

class DecodingOptions<V extends Object?> extends MappingOptions<V> {
  final bool inherited;

  DecodingOptions(super.value,
      {super.container, super.args, this.inherited = false});

  DecodingOptions<V> inherit({MapperContainer? container}) {
    return DecodingOptions<V>(value, container: container ?? this.container, args: args, inherited: true);
  }

  T wrap<T>(Decoder<Object?, T> decoder,
      {MappingHook? hook, bool skipInherited = false}) {
    if (hook == null || (inherited && skipInherited)) {
      return decoder(this);
    } else {
      return hook.wrapDecoder<T>(this, decoder);
    }
  }

  @override
  DecodingOptions<U> checked<U extends Object?>() {
    return super.checked<U>() as DecodingOptions<U>;
  }

  @override
  DecodingOptions<$V> change<$V extends Object?>($V value) {
    if (identical(value, this.value) && $V == V) {
      return this as DecodingOptions<$V>;
    }
    return DecodingOptions<$V>(value, container: container,
        args: args, inherited: inherited);
  }
}

class EncodingOptions<V extends Object?> extends MappingOptions<V> {
  EncodingOptions(super.value, {super.container, super.args});

  @override
  EncodingOptions<U> checked<U extends Object?>() {
    return super.checked<U>() as EncodingOptions<U>;
  }

  @override
  EncodingOptions<$V> change<$V extends Object?>($V value) {
    if (identical(value, this.value) && $V == V) {
      return this as EncodingOptions<$V>;
    }
    return EncodingOptions<$V>(value, container: container, args: args);
  }
}

extension EncodingOptionsWrap<T extends Object, M extends MapperBase<T>>
    on EncodingOptions<T> {
  Object? wrap(Encoder<Object?, T> encoder, {MappingHook? hook}) {
    if (hook == null) {
      return encoder(this);
    } else {
      return hook.wrapEncoder<T>(this, encoder);
    }
  }
}

typedef TypeFactory0 = Object? Function(Object? Function<V>() f);
typedef TypeFactory1 = Object? Function<A>(Object? Function<V>() f);
typedef TypeFactory2 = Object? Function<A, B>(Object? Function<V>() f);
