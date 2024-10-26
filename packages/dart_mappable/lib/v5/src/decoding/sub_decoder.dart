import '../mapper.dart';
import 'decoding.dart';

mixin SuperDecoderMixin<T> on Decoder<T> {
  /// The fallback subclass mapper for this class.
  SubDecoderMixin? getDefaultSubDecoder() => null;

  /// The set of subclass mappers for this class.
  List<SubDecoderMixin> getSubDecoders() => [];

  List<SubDecoderMixin> _collectDecodersOrCached() {
    final cached =
        MapperContainer.current.getCached<List<SubDecoderMixin>>(this);
    if (cached != null) {
      return cached;
    }

    final decoders = [
      ...getSubDecoders(),
      ...findSubDecodersFor<T>(),
    ];
    MapperContainer.current.setCached(this, decoders);
    return decoders;
  }

  Decoder<T>? getSubDecoder(Decoding decoding, [Object? key]) {
    var decoders = _collectDecodersOrCached();

    for (var d in decoders) {
      if (d is SubDecoderMixin<T> &&
          d.canDecode(decoding) &&
          (key == null || key == d.discriminatorKey)) {
        return d;
      }
    }

    var defaultDecoder = getDefaultSubDecoder();
    if (defaultDecoder != null &&
        defaultDecoder is SubDecoderMixin<T> &&
        (key == null || key == defaultDecoder.discriminatorKey)) {
      return defaultDecoder;
    }
    return null;
  }

  bool isBounded<Type, Bound>() => _Type<Type>() is _Type<Bound>;
  SubDecoderMixin boundedDecoder1<A>(Function callback) {
    return callback<A>() as SubDecoderMixin;
  }

  SubDecoderMixin boundedDecoder2<A, B>(Function callback) {
    return callback<A, B>() as SubDecoderMixin;
  }
}

mixin SubDecoderMixin<T> on Decoder<T> {
  String? get discriminatorKey;
  dynamic get discriminatorValue;

  bool canDecode(Decoding decoding) {
    var discriminator = discriminatorValue;
    if (identical(discriminator, 'use_as_default')) {
      return true;
    }

    if (discriminator is Function) {
      if (discriminator is bool Function(Decoding)) {
        return discriminator(decoding.clone());
      } else {
        throw AssertionError(
            'Discriminator function must be of type "bool Function(Map<String, dynamic>)".');
      }
    }

    var key = discriminatorKey;
    if (key == null) {
      return false;
    }

    var decodedKey = decoding.clone().decodeKeyed().decodeStringOrNull(key);
    if (decodedKey == discriminator) {
      return true;
    }

    if (this case SuperDecoderMixin<T> d) {
      return d.getSubDecoder(decoding, key) != null;
    }

    return false;
  }
}

class _Type<T> {}

abstract class GenericDecoderBase1<T, A> implements Decoder<T> {
  const GenericDecoderBase1([this.decoderA]);

  final Decoder<A>? decoderA;

  R extract<R>(R Function<A>(Decoder<A>? decoderA) fn) {
    return fn<A>(decoderA);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenericDecoderBase1<T, A> &&
          runtimeType == other.runtimeType &&
          decoderA == other.decoderA;

  @override
  int get hashCode => Object.hash(T, decoderA);
}

abstract class GenericDecoderBase2<T, A, B> implements Decoder<T> {
  const GenericDecoderBase2([this.decoderA, this.decoderB]);

  final Decoder<A>? decoderA;
  final Decoder<B>? decoderB;

  R extract<R>(
      R Function<A, B>(Decoder<A>? decoderA, Decoder<B>? decoderB) fn) {
    return fn<A, B>(decoderA, decoderB);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenericDecoderBase2<T, A, B> &&
          runtimeType == other.runtimeType &&
          decoderA == other.decoderA &&
          decoderB == other.decoderB;

  @override
  int get hashCode => Object.hash(T, decoderA, decoderB);
}
