import 'package:type_plus/type_plus.dart';

import '../mapper_container.dart';

/// The mapping context passed to all mapping methods of a mapper.
class MappingContext {
  /// The container that is used for this mapping call.
  final MapperContainer container;

  final List<Type> args;

  MappingContext({MapperContainer? container, this.args = const []})
      : container = container ?? MapperContainer.globals;

  Type arg(int index, [List<int> argIndices = const []]) {
    var a = args[index];
    if (argIndices.isNotEmpty) {
      a = argIndices.fold(a, (a, i) => a.args.skip(i).firstOrNull ?? dynamic);
    }
    return a;
  }

  Type type(Function factory, [List<Type> args = const []]) {
    return factory.callWith(typeArguments: args) as Type;
  }
}

/// The decoding context passed to the [decoder] method of a mapper.
class DecodingContext extends MappingContext {
  DecodingContext(
      {super.container, super.args, this.options, this.inherited = false});

  final DecodingOptions? options;
  final bool inherited;

  DecodingContext change(
      {MapperContainer? container, List<Type>? args, bool? inherited}) {
    return DecodingContext(
      container: container ?? this.container,
      args: args ?? this.args,
      options: options,
      inherited: inherited ?? this.inherited,
    );
  }

  DecodingContext inherit({MapperContainer? container, List<Type>? args}) {
    return change(container: container, args: args, inherited: true);
  }
}

/// The encoding context passed to the [encoder] method of a mapper.
class EncodingContext extends MappingContext {
  EncodingContext({super.container, this.options, super.args});

  final EncodingOptions? options;

  EncodingContext change({MapperContainer? container, List<Type>? args}) {
    return EncodingContext(
      container: container ?? this.container,
      args: args ?? this.args,
      options: options,
    );
  }
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
